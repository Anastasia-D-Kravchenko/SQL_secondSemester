-- 3 points - select statement that joins at least two tables and contains where clause (3 queries)
-- 1: Find users with a specific role
select u.Name, u.Surname, r.Role
from "User" u
         join User_Role_Access ura on u.id = ura.User_id
         join Role r on ura.Role_id = r.id
where r.Role = 'Administrator';

-- 2: Find transactions in a specific currency
select t.Timestamp, t.Amount, c.CurrencyCode, m.description
from Transaction t
         join Currency c on t.Currency_CurrencyCode = c.CurrencyCode
         join Message_Type m on m.id = t.Message_Types_id
where c.CurrencyCode = 'EUR';

-- 3: Find errors of high severity
select em.Message, s.Severity, e.SourceIP
from Error_Message em
         join Severity s on em.Severity_id = s.id
         join EventType e on em.Eventtype_id = e.id
where s.Severity = 'High';




-- 6 points - select statement that joins at least two tables and contains group by and having clauses (3 queries)
-- 4: Find the number of transactions and total amount for each message type
select c.Category, mt.MessageType, count(t.id) AS "Number of transactions", sum(t.Amount) as "On sum"
from Transaction t
         join Message_Type mt on t.Message_Types_id = mt.id
         join Category c on mt.category_id = c.id
group by mt.MessageType, c.Category
having count(t.id) > 1;

-- 5: Find the number of accounts for each account type with detailed permission information
select at.AccountType, count(i.id) AS "Number of accounts", case
                                                                when acl.permission = 7 then 'read-write-execute'
                                                                when acl.permission = 6 then 'read-write'
                                                                when acl.permission = 5 then 'read-execute'
                                                                when acl.permission = 4 then 'read-only'
                                                                when acl.permission = 3 then 'write-execute'
                                                                when acl.permission = 2 then 'write-only'
                                                                when acl.permission = 1 then 'execute-only'
                                                                else 'no specific access'
    end as "exists permission"
from IBAN i
         join AccountType at on i.accountType_id = at.id
         join User_Role_Access ura on i.id = ura.User_id
         join Access_control_List acl on acl.id = ura.User_id
group by at.AccountType, acl.permission
having acl.permission > 1;

-- 6: Find components with more than one error and their resolution status
select c.Name, count(em.Code) AS "Number of errors", case when a.resolved = 0 then 'Was not resolved' else 'Was resolved' end as "Resolved"
from Component c
         join Error_Message em on c.id = em.Component_id
         join Alert a on em.code = a.error_message_code
group by c.name, a.resolved
having count(em.Code) > 1;




-- 4 points - select statement with subquery (2 queries)
-- 7: Find middle log entries for each Error Message Code in Message_Validation_Log
select timestamp, error_message_code
from message_validation_log mvl
where timestamp > (select min(timestamp)
                   from message_validation_log
                   where error_message_code = mvl.error_message_code)
  and timestamp < (select max(timestamp)
                   from message_validation_log
                   where error_message_code = mvl.error_message_code);

-- 8: Find Error Messages associated with specific component types, excluding Security-Related Issues
select em.code, em.message, em.description
from error_message em
where em.component_id in (
    select c.id
    from component c
    where c.name like 'A%' or c.type = 'Hardware'
    minus
    select em_inner.component_id
    from error_message em_inner
             join eventtype et_inner on em_inner.eventtype_id = et_inner.id
    where et_inner.type = 'Security'
);


-- 4 points - select statement with correlated subquery (2 queries)
-- 9: Attempt to identify user log entries for each user's earliest login date
select u.username, ul.timestamp as "latest log in attempt timestamp"
from "User" u
         join userlog u_l on u.id = u_l.user_id
         join user_log ul on u_l.user_log_id = ul.id
where ul.timestamp = (
    select max(ul_inner.timestamp)
    from userlog ul_inner_link
             join user_log ul_inner on ul_inner_link.user_log_id = ul_inner.id
    where ul_inner_link.user_id = u.id
);

-- 10: Find transactions that occurred after any transaction of type 'MT300'.
select id, Timestamp
from Transaction
where Timestamp > ANY (select t2.Timestamp
                       from Transaction t2
                                join Message_Type mt on t2.Message_Types_id = mt.id
                       where mt.MessageType = 'MT300');