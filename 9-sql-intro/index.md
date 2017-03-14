[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distinct](/17-distinct/) | [Aliases](/18-aliases/) | [Operators](/19-operators/)
---

# SQL Data Manipulation Language (DML)

In our last session we spent a lot of time creating tables and relationships.  You could say we defined the data structures.  There is a technical name for this and it’s called the Data Definition Language (DDL).   We used the DDL portion of the Structured Query Language to define our data structures.  

There is more than just building tables.  Using SQL you can retrieve data and even change data within the database using SQL.  These types of SQL statement are called Data Manipulation Language statements (DML).  Since SQL is an ANSI standard language. You can use it on other relational database platforms like SQL Server, Oracle, Access, Sybase, DB2, and others.  Each database vendor adheres to most of the ANSI standards for SQL which can lead to SQL that is not completely portable across different systems.  

> Beware! When a vendor deviates from the standard, you run the risk of rewriting SQL code if you want to switch to a different platform.  

The `SELECT` statement is used to retrieve data from the database. Take the following `SELECT` statement as an example:

```
SELECT * FROM individual;
```

The statement above almost reads like English, doesn’t it?  It simply states, `SELECT` for me all the columns `FROM` the **individual** table.  This SQL statement will retrieve all the rows from the table and all the columns.  The * means return all the columns and since we are not restricting which rows to return, the statement will return all rows.

> Tip:  While table names _are_ case sensitive, clauses in a SQL statement are not.  This means the `SELECT` statement is not case sensitive.  So, `SELECT * from individual;` works too!

## The SELECT Clause

So, I guess you noticed the `SELECT` above.  The word ‘SELECT’ in SQL is called a clause and is used to specify the columns to be returned by your query.  Whenever you see the `SELECT` clause, you are retrieving data.  

You could also specify which columns to return.  For example, you could author the following:

```
SELECT ID, firstName, lastName, birthDate FROM individual;
```

The statement above will retrieve the **ID** column, **firstName** column, **lastName** column, and **birthDate** column `FROM` the **individual** table.

> For performance reasons, use only use the least amount of columns in your `SELECT` statement.  It is generally a good idea to refrain from using `*` as this will retrieve all the columns which wastes computing resources like CPU.    

[Home](/)  |  [SQL Intro](/9-sql-intro/)  |  [Next](/9-sql-intro/1)
