# Project README: Relational Databases (RBD) and SQL Development

This project represents a comprehensive study and application of **Relational Database Management Systems (RDBMS)**, covering theoretical foundations, advanced SQL querying, and the design of a complex financial monitoring system.

---

## 🛠 Project Components

The work is divided into theoretical documentation, practical SQL implementation, and a final architectural design project.

### 1. Database Theory & Design Principles

* **Fundamental Concepts**: Documentation on the relational data model, client-server architecture, and the history of DBMS from network models to modern SQL standards.
* **Data Integrity**: In-depth analysis of constraints including `NOT NULL`, `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `CHECK` clauses to mirror real-world business rules.
* **Temporal Data**: Strategies for managing historical changes in attributes and relationships, such as `AssignmentHist` tables to track employee-department transitions over time.

### 2. Practical SQL Implementation

A collection of scripts demonstrating proficiency in Oracle SQL across various levels of complexity:

* **DML & Retrieval**: Basic selections, arithmetic operations on columns (e.g., annual salary calculations), and the use of `DISTINCT` and `ORDER BY`.
* **Relational Algebra (Joins)**: Extensive use of `INNER JOIN`, `LEFT/RIGHT OUTER JOIN`, and `CROSS JOIN` to aggregate data across multiple tables (e.g., matching employees to departments and salary grades).
* **Aggregation & Grouping**: Complex reporting using `GROUP BY` and `HAVING` to find averages, minimums, and counts (e.g., lowest earnings paid by managers to subordinates).
* **Advanced Subqueries**: Implementation of correlated subqueries, and set predicates like `EXISTS`, `ANY`, and `ALL` to identify specific data patterns like "top three earners" or "departments with no employees".

### 3. SWIFT Integration and Monitoring System

A high-level project design for a financial institution's transfer management system.

* **Objectives**: Real-time monitoring of financial transfers, compliance verification, and automated problem alerting.
* **Schema Design**: A robust ERD (Entity-Relationship Diagram) featuring tables for `Transactions`, `Currency`, `Users`, and `Audit Logs`.
* **Logic**: Integration of business rules to ensure transfers are only completed when all regulatory information (like PESEL or account numbers) is valid.

---

## 🚀 How to Use

### Environment Setup

1. **Platform**: These scripts are optimized for **Oracle Database**.
2. **Schema Creation**: Run the `Reservation.sql` script first to establish the base tables for the hotel and pet management examples.
3. **Data Loading**: Use the provided generation links in the documentation to populate the `EMP` and `DEPT` tables required for the `SQL1-5` series.

### Query Execution

* **Basic Reports**: Execute `SQL1.sql` to view employee lists and formatted earnings strings.
* **Financial Audits**: Use the logic in `SWIFT_project.docx` to understand how to structure logs that track error messages and timestamps for every transaction.
* **Analytics**: Run `SQL5.sql` to identify outliers, such as employees earning above their department average or the most recently hired staff members.

---

## 📂 File Manifest

* **`SQL1.sql` - `SQL5.sql**`: Incremental SQL labs covering everything from basics to advanced subqueries.
* **`Reservation.sql`**: Practical schema for hotel guest and room reservation management.
* **`SWIFT_project.docx`**: Technical specification and ERD for a financial monitoring database.
* **`RBD_L1.docx` / `RBD_l_2.docx` / `RBD_2.pdf**`: Theoretical guides on relational modeling and data integrity.
