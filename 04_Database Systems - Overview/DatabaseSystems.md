## Database Systems - Overview
### _Homework_

#### Answer following questions in Markdown format (`.md` file)

1.  What database models do you know?
		A database model is a type of data model that determines the logical structure of a database and fundamentally determines in which manner data can be stored, organized, and manipulated. The most popular example of a database model is the relational model, which uses a table-based format.
	Common logical data models for databases include:
    - Hierarchical database model
    - Network model
    - Relational model
    - Entity–relationship model
    - Object model
    - Document model
    - Entity–attribute–value model
    - Star schema
---
1.  Which are the main functions performed by a Relational Database Management System (RDBMS)?
	A relational database management system (RDBMS) is a program that lets you create, update, and administer a relational database. Most commercial RDBMS's use the Structured Query Language (SQL) to access the database, although SQL was invented after the development of the relational model and is not necessary for its use.
---
1.  Define what is "table" in database terms.
	In a relational database, a table (sometimes called a file) organizes the information about a single topic into rows and columns. For example, a database for a business would typically contain a table for customer information, which would store customers' account numbers, addresses, phone numbers, and so on as a series of columns. Each single piece of data (such as the account number) is a field in the table. A column consists of all the entries in a single field, such as the telephone numbers of all the customers. Fields, in turn, are organized as records, which are complete sets of information (such as the set of information about a particular customer), each of which comprises a row. The process of normalization determines how data will be most effectively organized into tables.
---
1.  Explain the difference between a primary and a foreign key.
	Primary key uniquely identify a record in the table.
	Foreign key is a field in the table that is primary key in another table.
	Primary Key can't accept null values.
	Foreign key can accept multiple null value.
	By default, Primary key is clustered index and data in the database table is physically organized in the sequence of clustered index.
	Foreign key do not automatically create an index, clustered or non-clustered. You can manually create an index on foreign key.
	We can have only one Primary key in a table.
	We can have more than one foreign key in a table.
---
1.  Explain the different kinds of relationships between tables in relational databases.
There are 3 types of table relationships:
	1. One-to-one relationships
	1. One-to-many relationships
	1. Many-to-many relationships
---
1.  When is a certain database schema normalized?
  * What are the advantages of normalized databases?
		Normalization is basically to design a database schema such that duplicate and redundant data is avoided. If some piece of data is duplicated several places in the database, there is the risk that it is updated in one place but not the other, leading to data corruption.
---
1.  What are database integrity constraints and when are they used?
		Integrity constraints are used to ensure accuracy and consistency of data in a relational database. Data integrity is handled in a relational database through the concept of referential integrity. Many types of integrity constraints play a role in referential integrity (RI):
		*	Primary Key Constraints
		*	Unique Constraints
		*	Foreign Key Constraints
		*	NOT NULL Constraints
		*	Check Constraints
		*	Dropping Constraints
---
1.  Point out the pros and cons of using indexes in a database.
	Indexes are sort of a bookmark within a table or a record, to mark a record, such as a primary key.
	Indexes allow the database application to find data fast; without reading the whole table. Somewhat like using a bookmark in a book.
	Indexes have the following disadvantages - they increase the disk space requirements of the database, they slow down dml (inserts, updates and deletes), they increase the maintenance needs of your database, they may make your queries slower instead of faster.
	Pros would be the ability to retrieve records faster 
---
1.  What's the main purpose of the SQL language?
	SQL is a special-purpose programming language designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS).
---
1.  What are transactions used for?
  * Give an example.
		*	A transaction is a single unit of work. If a transaction is successful, all of the data modifications made during the transaction are committed and become a permanent part of the database. If a transaction encounters errors and must be canceled or rolled back, then all of the data modifications are erased.
		


1.  What is a NoSQL database?
When compared to relational databases, NoSQL databases are more scalable and provide superior performance, and their data model addresses several issues that the relational model is not designed to address:
	 Large volumes of structured, semi-structured, and unstructured data
	 Agile sprints, quick iteration, and frequent code pushes
	 Object-oriented programming that is easy to use and flexible
	 Efficient, scale-out architecture instead of expensive, monolithic architecture
1.  Explain the classical non-relational data models.
		A NoSQL (originally referring to "non SQL" or "non relational") database provides a mechanism for storage and retrieval of data that is modeled in means other than the tabular relations used in relational databases.
Since most NoSQL databases lack ability for joins in queries, the database schema generally needs to be designed differently. There are three main techniques for handling relational data in a NoSQL database: Multiple queries, Caching/replication/non-normalized data, Nesting data
1.  Give few examples of NoSQL databases and their pros and cons.
		There have been various approaches to classify NoSQL databases, each with different categories and subcategories, some of which overlap. A basic classification based on data model, with examples:

    Column: Accumulo, Cassandra, Druid, HBase, Vertica
    Document: Clusterpoint, Apache CouchDB, Couchbase, DocumentDB, HyperDex, Lotus Notes, MarkLogic, MongoDB, OrientDB, Qizx
    Key-value: CouchDB, Oracle NoSQL Database, Dynamo, FoundationDB, HyperDex, MemcacheDB, Redis, Riak, FairCom c-treeACE, Aerospike, OrientDB, MUMPS
    Graph: Allegro, Neo4J, InfiniteGraph, OrientDB, Virtuoso, Stardog
    Multi-model: OrientDB, FoundationDB, ArangoDB, Alchemy Database, CortexDB

[Pros & Cons]: (http://highscalability.com/blog/2011/6/20/35-use-cases-for-choosing-your-next-nosql-database.html "35+ Use Cases for Choosing Your Next NoSQL Database")