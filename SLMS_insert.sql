-- Category
insert into Category (Category) values ('MT1xx');
insert into Category (Category) values ('MT2xx');
insert into Category (Category) values ('MT3xx');
insert into Category (Category) values ('MT4xx');
insert into Category (Category) values ('MT5xx');

-- AccountType
insert into AccountType (AccountType) values ('Savings');
insert into AccountType (AccountType) values ('Checking');
insert into AccountType (AccountType) values ('Credit Card');
insert into AccountType (AccountType) values ('Investment');
insert into AccountType (AccountType) values ('Loan');

-- Severity
insert into Severity (Severity) values ('Low');
insert into Severity (Severity) values ('Medium');
insert into Severity (Severity) values ('High');
insert into Severity (Severity) values ('Critical');
insert into Severity (Severity) values ('Info');

-- Status
insert into Status (Status, Category) values ('Pending', 'Transaction');
insert into Status (Status, Category) values ('Completed', 'Transaction');
insert into Status (Status, Category) values ('Failed', 'Transaction');
insert into Status (Status, Category) values ('Authorized', 'Transaction');
insert into Status (Status, Category) values ('Cancelled', 'Transaction');

-- Role
insert into Role (Role) values ('Administrator');
insert into Role (Role) values ('Operator');
insert into Role (Role) values ('Auditor');
insert into Role (Role) values ('Manager');
insert into Role (Role) values ('Client');

-- Currency
insert into Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) values ('USD', 1.00000000, TO_TIMESTAMP('2025-03-30 11:50:09', 'YYYY-MM-DD HH24:MI:SS'), 1);
insert into Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) values ('EUR', 1.08000000, TO_TIMESTAMP('2025-02-28 22:00:50', 'YYYY-MM-DD HH24:MI:SS'), 1);
insert into Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) values ('GBP', 1.25000000, TO_TIMESTAMP('2025-01-30 23:46:32', 'YYYY-MM-DD HH24:MI:SS'), 1);
insert into Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) values ('JPY', 0.00750000, TO_TIMESTAMP('2024-03-30 14:04:59', 'YYYY-MM-DD HH24:MI:SS'), 1);
insert into Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) values ('CAD', 0.74000000, TO_TIMESTAMP('2020-03-30 16:20:40', 'YYYY-MM-DD HH24:MI:SS'), 1);

-- BIC_Directory
insert into BIC_Directory (BIC, InstitutionName, Country) values ('ABCDUSNYXXX', 'Bank of America', 'US');
insert into BIC_Directory (BIC, InstitutionName, Country) values ('BBBBGB2LXXX', 'Barclays Bank', 'GB');
insert into BIC_Directory (BIC, InstitutionName, Country) values ('CCCCFR21XXX', 'Credit Agricole', 'FR');
insert into BIC_Directory (BIC, InstitutionName, Country) values ('DDDEUTG2XXX', 'Deutsche Bank', 'DE');
insert into BIC_Directory (BIC, InstitutionName, Country) values ('EEEEJPJTXXX', 'Mizuho Bank', 'JP');

-- Component
insert into Component (Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) values ('Alliance Access', 'Software', 'SWIFT messaging interface', '7.4', 'SWIFT', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), XMLType('<config><interface>TCP/IP</interface></config>'));
insert into Component (Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) values ('HSM', 'Hardware', 'Hardware Security Module', 'v3.2', 'Thales', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), XMLType('<config><keyLength>2048</keyLength></config>'));
insert into Component (Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) values ('Messaging Gateway', 'Software', 'Message routing service', '1.5', 'In-house', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), XMLType('<config><routing>XML</routing></config>'));
insert into Component (Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) values ('Database Server', 'Hardware', 'Oracle Database Server', '19c', 'Oracle', TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), XMLType('<config><backup>weekly</backup></config>'));
insert into Component (Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) values ('Firewall', 'Hardware', 'Network Firewall', '6.0', 'Cisco', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), XMLType('<config><rules>strict</rules></config>'));

-- EventType
insert into EventType (Type, ResourceAccessed, SourceIP) values ('System', 'Message Processing', '127.0.0.1');
insert into EventType (Type, ResourceAccessed, SourceIP) values ('Security', 'Account Data', '192.168.1.100');
insert into EventType (Type, ResourceAccessed, SourceIP) values ('Transaction', 'Transaction Queue', '10.0.0.5');
insert into EventType (Type, ResourceAccessed, SourceIP) values ('User Login', 'Authentication', '192.168.1.101');
insert into EventType (Type, ResourceAccessed, SourceIP) values ('Configuration Change', 'System Settings', '10.0.0.10');

-- Error_Message
insert into Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) values (101, 'System Error Encountered', 3, 1, 1, 'An unexpected system error occurred during message parsing.');
insert into Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) values (205, 'Unauthorized Access Attempt', 4, 5, 2, 'An attempt to access a protected resource was made without proper authorization.');
insert into Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) values (310, 'High Transaction Volume Detected', 2, 3, 3, 'The transaction volume exceeded predefined thresholds.');
insert into Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) values (404, 'Invalid User Credentials', 4, 5, 4, 'User login failed due to incorrect username or password.');
insert into Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) values (500, 'Configuration Update Failed', 3, 4, 5, 'Failed to update system configuration settings.');

-- Rule
insert into Rule (Type, Expression, Description) values ('Regex', '^MT103.*', 'Message type must start with MT103');
insert into Rule (Type, Expression, Description) values ('Length', '11', 'Sender BIC length must be 11 characters');
insert into Rule (Type, Expression, Description) values ('Presence', 'NOT NULL', 'Receiver BIC must be present');
insert into Rule (Type, Expression, Description) values ('Range', '>0', 'Transaction amount must be greater than zero');
insert into Rule (Type, Expression, Description) values ('CurrencyCode', 'USD,EUR,GBP', 'Currency code must be one of the allowed values');

-- Message_Type
insert into Message_Type (MessageType, Category_id, Description, StandardVersion, DocumentationLink) values ('MT103', 1, 'Single Customer Credit Transfer', '2023', 'https://www.swift.com/mt103'); -- won't work (link)
insert into Message_Type (MessageType, Category_id, Description, StandardVersion, DocumentationLink) values ('MT202', 2, 'General Financial Institution Transfer', '2023', 'https://www.swift.com/mt202');
insert into Message_Type (MessageType, Category_id, Description, StandardVersion, DocumentationLink) values ('MT300', 3, 'Foreign Exchange Confirmation', '2023', 'https://www.swift.com/mt300');
insert into Message_Type (MessageType, Category_id, Description, StandardVersion, DocumentationLink) values ('MT940', 1, 'Customer Statement Message', '2023', 'https://www.swift.com/mt940');
insert into Message_Type (MessageType, Category_id, Description, StandardVersion, DocumentationLink) values ('MT548', 5, 'Settlement Status Advice', '2023', 'https://www.swift.com/mt548');

-- IBAN
insert into IBAN (IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) values ('GB82WEST12345698765432', 'Anastasiia Kravchenko', 'ACC123456', 'GBP', 2, 1, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
insert into IBAN (IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) values ('DE89370400440532013000', 'Misha Bernik', 'DE532013000', 'EUR', 1, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
insert into IBAN (IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) values ('FR7630004000061234567890189', 'Haruki Murakami', 'FR1234567890', 'EUR', 2, 1, TO_DATE('2024-03-22', 'YYYY-MM-DD'));
insert into IBAN (IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) values ('US64WFBK1234567890', 'James Williams', 'US12345678', 'USD', 1, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
insert into IBAN (IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) values ('JP2900050123456789', 'Akira Tanaka', 'JP1234567', 'JPY', 2, 1, TO_DATE('2024-04-05', 'YYYY-MM-DD'));

-- Access_Control_List
insert into Access_Control_List ("Resource", Permission) values ('User Management', 7);
insert into Access_Control_List ("Resource", Permission) values ('Account Access', 5);
insert into Access_Control_List ("Resource", Permission) values ('Transaction History', 3);
insert into Access_Control_List ("Resource", Permission) values ('Reporting', 1);
insert into Access_Control_List ("Resource", Permission) values ('System Configuration', 7);

-- Transaction
insert into Transaction (Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) values (TO_TIMESTAMP('2025-09-21 11:00:06', 'YYYY-MM-DD HH24:MI:SS'), 'USD', 150000.00, 2, 1, 'Payment for services');
insert into Transaction (Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) values (TO_TIMESTAMP('2024-05-28 22:05:30', 'YYYY-MM-DD HH24:MI:SS'), 'EUR', 75000.50, 2, 2, 'Interbank transfer');
insert into Transaction (Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) values (TO_TIMESTAMP('2024-03-30 14:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'GBP', 200000.00, 2, 3, 'FX trade confirmation');
insert into Transaction (Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) values (TO_TIMESTAMP('2023-07-22 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'USD', 10000.00, 2, 1, 'Salary payment');
insert into Transaction (Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) values (TO_TIMESTAMP('2022-01-17 14:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'JPY', 500000.00, 2, 5, 'Securities settlement');

-- Message_Validation_Log
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2024-04-20 12:50:59', 'YYYY-MM-DD HH24:MI:SS'), 101);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2023-03-06 12:55:30', 'YYYY-MM-DD HH24:MI:SS'), 205);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2022-02-07 13:00:40', 'YYYY-MM-DD HH24:MI:SS'), 310);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2021-01-01 13:05:07', 'YYYY-MM-DD HH24:MI:SS'), 404);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2021-12-01 13:10:08', 'YYYY-MM-DD HH24:MI:SS'), 500);
insert into Message_Validation_Log (Timestamp) values (TO_TIMESTAMP('2021-12-01 13:10:08', 'YYYY-MM-DD HH24:MI:SS'));
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2024-04-20 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 101);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2024-04-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 101);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2023-03-06 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 205);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2023-03-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 205);
insert into Message_Validation_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2023-03-06 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 205);

-- Transaction_Log
insert into Transaction_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-01-20 16:00:10', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into Transaction_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-01-10 18:05:15', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into Transaction_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2024-01-01 19:10:26', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into Transaction_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2024-01-02 20:15:25', 'YYYY-MM-DD HH24:MI:SS'), 101);
insert into Transaction_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2024-01-04 23:20:32', 'YYYY-MM-DD HH24:MI:SS'), NULL);

-- User_Log
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-15 23:45:51', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-15 23:23:10', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-15 23:22:13', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-14 22:37:41', 'YYYY-MM-DD HH24:MI:SS'), 404);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-13 21:35:39', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-12 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 205);
insert into User_Log (Timestamp, Error_Message_Code) values (TO_TIMESTAMP('2025-05-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);

-- User
insert into "User" (PESEL, Username, Name, Surname) values ('8001011234', 'akravchenko', 'Anastasiia', 'Kravchenko');
insert into "User" (PESEL, Username, Name, Surname) values ('8502025678', 'mbernik', 'Misha', 'Bernik');
insert into "User" (PESEL, Username, Name, Surname) values ('9003039876', 'kmiudzaki', 'Kiruki', 'Miudzaki');
insert into "User" (PESEL, Username, Name, Surname) values ('9504041234', 'awilson', 'Alice', 'Wilson');
insert into "User" (PESEL, Username, Name, Surname) values ('0005055678', 'ddarwin', 'David', 'Darwin');

-- Message_Validation_Rule
insert into Message_Validation_Rule (Message_Types_id, Rule_id) values (1, 1);
insert into Message_Validation_Rule (Message_Types_id, Rule_id) values (1, 2);
insert into Message_Validation_Rule (Message_Types_id, Rule_id) values (2, 3);
insert into Message_Validation_Rule (Message_Types_id, Rule_id) values (4, 4);
insert into Message_Validation_Rule (Message_Types_id, Rule_id) values (5, 5);

-- RuleLog
insert into RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) values (1, 1);
insert into RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) values (2, 1);
insert into RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) values (3, 2);
insert into RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) values (4, 4);
insert into RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) values (5, 5);

-- IBAN_BIC
insert into IBAN_BIC (IBAN_id, BIC_Directory_id) values (1, 2);
insert into IBAN_BIC (IBAN_id, BIC_Directory_id) values (2, 4);
insert into IBAN_BIC (IBAN_id, BIC_Directory_id) values (3, 3);
insert into IBAN_BIC (IBAN_id, BIC_Directory_id) values (4, 1);
insert into IBAN_BIC (IBAN_id, BIC_Directory_id) values (5, 5);

-- User_Role_Access
insert into User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) values (1, 1, 1, 1);
insert into User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) values (2, 2, 2, 2);
insert into User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) values (3, 3, 3, 3);
insert into User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) values (4, 4, 4, 4);
insert into User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) values (5, 5, 5, 5);

-- TransactionLog
insert into TransactionLog (Transaction_id, Transaction_Log_id) values (1, 1);
insert into TransactionLog (Transaction_id, Transaction_Log_id) values (2, 2);
insert into TransactionLog (Transaction_id, Transaction_Log_id) values (3, 3);
insert into TransactionLog (Transaction_id, Transaction_Log_id) values (4, 4);
insert into TransactionLog (Transaction_id, Transaction_Log_id) values (5, 5);

-- SenderBIC
insert into SenderBIC (Transactions_id, BIC_Directory_id) values (1, 1);
insert into SenderBIC (Transactions_id, BIC_Directory_id) values (2, 2);
insert into SenderBIC (Transactions_id, BIC_Directory_id) values (3, 3);
insert into SenderBIC (Transactions_id, BIC_Directory_id) values (4, 4);
insert into SenderBIC (Transactions_id, BIC_Directory_id) values (5, 5);

-- ReceiverBIC
insert into ReceiverBIC (Transactions_id, BIC_Directory_id) values (1, 2);
insert into ReceiverBIC (Transactions_id, BIC_Directory_id) values (2, 1);
insert into ReceiverBIC (Transactions_id, BIC_Directory_id) values (3, 4);
insert into ReceiverBIC (Transactions_id, BIC_Directory_id) values (4, 3);
insert into ReceiverBIC (Transactions_id, BIC_Directory_id) values (5, 5);

-- Alert
insert into Alert (Type, Timestamp, Error_Message_Code, Resolved, Status_id) values ('System', TO_TIMESTAMP('2021-07-11 19:15:50', 'YYYY-MM-DD HH24:MI:SS'), 101, 0, 1);
insert into Alert (Type, Timestamp, Error_Message_Code, Resolved, Status_id) values ('Security', TO_TIMESTAMP('2021-04-13 18:20:51', 'YYYY-MM-DD HH24:MI:SS'), 205, 0, 1);
insert into Alert (Type, Timestamp, Error_Message_Code, Resolved, Status_id) values ('Transaction', TO_TIMESTAMP('2020-09-30 17:25:21', 'YYYY-MM-DD HH24:MI:SS'), 310, 0, 1);
insert into Alert (Type, Timestamp, Error_Message_Code, Resolved, Status_id) values ('User', TO_TIMESTAMP('2019-11-23 16:30:23', 'YYYY-MM-DD HH24:MI:SS'), 404, 0, 1);
insert into Alert (Type, Timestamp, Error_Message_Code, Resolved, Status_id) values ('Configuration', TO_TIMESTAMP('2008-01-09 15:35:07', 'YYYY-MM-DD HH24:MI:SS'), 500, 0, 1);

-- UserLog
INSERT INTO UserLog (User_id, User_Log_id) VALUES (1, 1);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (2, 2);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (3, 3);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (4, 4);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (5, 5);
insert into UserLog (User_id, User_Log_id) values (1, 6);
insert into UserLog (User_id, User_Log_id) values (1, 7);
insert into UserLog (User_id, User_Log_id) values (2, 8);
insert into UserLog (User_id, User_Log_id) values (2, 9);











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