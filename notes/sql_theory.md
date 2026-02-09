# SQL Introduction

## 1. **Database Concepts**

A **database** is an organized collection of data that can be easily accessed, managed, and updated. Data is typically stored electronically in a structured format.

### **Database**:

A **database** refers to a structured collection of data that is stored and managed in a way that allows easy retrieval and manipulation. The data can range from text, numbers, images, or any other type of content that needs to be stored in a digital format.

#### Key Characteristics of a Database:

* **Consistency**: Ensures data integrity and follows rules (e.g., foreign key constraints).
* **Persistence**: Data remains stored even after the system shuts down.
* **Efficiency**: Allows for quick and easy access to data.
* **Scalability**: Can handle large volumes of data and traffic.

---

### **SQL (Structured Query Language)**:

SQL is a **domain-specific language** used for managing and manipulating databases. It is primarily used to interact with **relational databases**. SQL allows you to:

* Create and manage database structures (tables, views, indexes, etc.).
* Insert, update, delete, and query data.
* Enforce constraints to ensure data integrity.

#### Key SQL Operations:

* **SELECT**: Retrieve data from one or more tables.
* **INSERT**: Insert data into tables.
* **UPDATE**: Modify existing data in tables.
* **DELETE**: Remove data from tables.
* **CREATE**: Create new database objects (tables, views, procedures, etc.).
* **DROP**: Delete database objects.

#### Example SQL Query:

```sql
SELECT first_name, last_name FROM employees WHERE department = 'HR';
```

---

### **DBMS (Database Management System)**:

A **DBMS** is software used to store, manage, and interact with databases. It provides an interface between users/applications and the database to perform CRUD (Create, Read, Update, Delete) operations.

#### Types of DBMS:

1. **Hierarchical DBMS**: Data is stored in a tree-like structure (e.g., IBM's IMS).
2. **Network DBMS**: Data is stored in a graph format (e.g., Integrated Data Store).
3. **Relational DBMS (RDBMS)**: Data is stored in tables with rows and columns (e.g., Microsoft SQL Server, MySQL, PostgreSQL).
4. **Object-Oriented DBMS**: Data is stored in objects, similar to object-oriented programming concepts (e.g., db4o).

#### Features of DBMS:

* **Data Security**: Ensures the safety and security of data via user authentication and authorization.
* **Concurrency Control**: Manages simultaneous data access to ensure consistency and prevent data corruption.
* **Data Integrity**: Ensures data accuracy and consistency.
* **Backup and Recovery**: Provides mechanisms to back up data and recover it in case of failure.
* **Transaction Management**: Handles transactions to ensure data is updated reliably and consistently.

---

### **Server**:

A **server** is a physical or virtual machine where the database resides and where the DBMS operates. Servers can be hosted on-premises or in the cloud (cloud servers like AWS, Azure, etc.).

#### Types of Servers:

* **On-premises Servers**: Physical machines located within the organization’s premises.
* **Cloud Servers**: Virtual machines hosted on cloud platforms (e.g., AWS, Google Cloud, Azure).

---

## 2. **Types of Databases**

### **Relational Database (SQL Database)**:

A **Relational Database** stores data in tables (also called relations). Each table consists of rows (records) and columns (fields). The tables are related to one another via keys (Primary Key, Foreign Key).

#### Characteristics of Relational Databases:

* **Structured Data**: Data is organized into rows and columns.
* **ACID Properties**: Relational databases follow the ACID properties to ensure data reliability and consistency during transactions.

  * **Atomicity**: All operations within a transaction are completed; if one fails, the entire transaction fails.
  * **Consistency**: The database moves from one consistent state to another after a transaction.
  * **Isolation**: Transactions are isolated from each other; concurrent transactions do not affect each other.
  * **Durability**: Once a transaction is committed, it will persist even after a system crash.
* **SQL Queries**: Uses SQL for data manipulation and retrieval.

#### Examples:

* **Microsoft SQL Server**: A commercial RDBMS by Microsoft.
* **MySQL**: An open-source RDBMS, popular in web applications.
* **PostgreSQL**: An open-source, object-relational database system.
* **Oracle Database**: A commercial RDBMS that supports advanced features like clustering and partitioning.

#### Example Schema of Relational Database:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
```

---

### **Non-relational Database (NoSQL Database)**:

Non-relational (or **NoSQL**) databases store data differently than relational databases. They are designed to handle unstructured data and are more flexible in terms of schema.

#### Types of NoSQL Databases:

1. **Key-Value Stores**: Data is stored as key-value pairs. They are highly efficient for simple lookups.

   * **Examples**: Redis, Amazon DynamoDB
2. **Document-Based Stores**: Data is stored in documents (typically JSON format), allowing for hierarchical data storage.

   * **Examples**: MongoDB, CouchDB
3. **Column-Based Stores**: Data is stored in columns rather than rows, which is suitable for analytical workloads.

   * **Examples**: Apache Cassandra, HBase
4. **Graph Databases**: Data is stored as nodes and edges, which is ideal for representing relationships.

   * **Examples**: Neo4j, Amazon Neptune

#### Key Features of NoSQL:

* **Scalability**: NoSQL databases are typically designed to scale horizontally (across multiple machines).
* **Flexibility**: NoSQL databases can store structured, semi-structured, or unstructured data, and don't require a fixed schema.
* **High Availability**: NoSQL databases often use replication and sharding to provide high availability and fault tolerance.

#### Example of a Document-Based NoSQL Database (MongoDB):

```json
{
    "employee_id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "department": "HR"
}
```

---

## 3. **Key Differences Between SQL and NoSQL Databases**

| Feature            | SQL (Relational Databases)                           | NoSQL (Non-relational Databases)                                        |
| ------------------ | ---------------------------------------------------- | ----------------------------------------------------------------------- |
| **Data Model**     | Tables (Rows & Columns)                              | Key-Value, Document, Column, Graph                                      |
| **Schema**         | Fixed, predefined schema                             | Dynamic schema                                                          |
| **Query Language** | SQL (Structured Query Language)                      | Varies (e.g., MongoDB Query Language)                                   |
| **Scalability**    | Vertical scaling (scaling up by adding more CPU/RAM) | Horizontal scaling (scaling out by adding more nodes)                   |
| **Transactions**   | Supports ACID properties                             | Some databases support ACID, others support BASE (Eventual Consistency) |
| **Use Cases**      | Structured data, transactions, relational data       | Unstructured data, flexible schema, high scalability                    |

---

## 4. **Indexing in Databases**:

Indexes are used to speed up query performance by providing a fast way to look up data in a table. They work similarly to an index in a book.

* **Primary Index**: Automatically created on the primary key of a table.
* **Secondary Index**: Created on columns that are frequently queried but are not primary keys.
* **Full-Text Index**: Used for searching text in large text fields.

---

## 5. **Normalization and Denormalization**

* **Normalization**: The process of organizing data in a way that reduces redundancy and improves data integrity. It involves breaking a database into smaller tables and using foreign keys to relate them.
* **Denormalization**: The process of combining tables to reduce the complexity of joins in queries. It can improve read performance at the cost of increased redundancy and write performance.

---

### **Conclusion**

This is a broad overview of SQL theory, touching on fundamental concepts like the definition of databases, types of DBMS, key differences between SQL and NoSQL, and various performance-enhancing techniques like indexing and normalization. Understanding these concepts is essential for both working with databases and preparing for database-related interview questions.
