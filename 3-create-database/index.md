

# Creating Databases

## Creating a database (CLI)

The data for your application will live in tables.  These tables, in turn, live inside a database.  MySQL can house many databases, each containing many tables (among other things).  

Creating database is pretty simple. Let's connect to the MySQL server using the mysql client and create a database named `test_db`:

```
mysql> CREATE DATABASE test_db;
```

Before you can _use_ the database, you must select it using `use`.  Ha!:

```
mysql> USE test_db;
```

Deleting a database (and everything in it!) is also an easy thing to do:

```
mysql> DROP DATABASE test_db;
```

### Character set and collation

Every database has a database character set and a database collation. Optional clauses specify the character set and collation.

MySQL can store strings using a variety of character sets. Each letter (symbol) has a corresponding number or encoding.  A = 0, B = 2, a = 3, b = 4 as an overly simplistic example. A character set stores different characters that form entire alphabets.  There are different types of writing systems around the world, including eastern alphabets containing thousands of characters, special symbols and punctuation marks.  

A collation is a named set of rules on how to compare the encoding of characters in the character set.  This has a direct impact on sorting especially when you need to compare characters with accent marks, multiple character mappings, and letter case.  

> Within mysql can specify character sets at the server, database, table, and column level. When writing your application (client) to communicate with the database server, you can specify a different character set.  Quite flexible!  Collations affect how data is sorted and how strings are compared to each other. That means you should use the collation that most of your users expect.  Selecting the 'correct' collation depends on your expected user base and on how much you need correct sorting. For an English user base, `utf8_general_ci` or `utf8_unicode_ci` should suffice, for other languages, like Swedish, special collations have been created.

Here's an example of a SQL command to create a database named `people` and setting the character set and collation:

```
$ CREATE DATABASE `people` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
```

## DEMO: Creating a database using Workbench

## DEMO: Deleting a database using Workbench

Delete a database named **delete-me** using the `DROP DATABASE` SQL statement:

```
$ DROP DATABASE `delete-me`;
```

[Home](/)  |  [Create Database](/3-create-database/)  |  [Next](/3-create-database/1)  
