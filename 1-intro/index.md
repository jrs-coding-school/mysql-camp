# Intro to MySQL

The first class will define how a database is organized using a relational model.  We will discuss the advantages of a relational database management system (RDBMS).  We will explain the basics behind using SQL to manipulate data.  An overview of the various MySQL components will be provided including the MySQL server, SQL Workbench, and the mysql console application. We will learn about how to use a terminal application to connect to the MySQL database server and immediately begin creating databases, building tables, and working with data types.


- MySQL is an open source SQL database management system, supported by Oracle. You can download it and use it for free.
- A database contains structured data.  The data is stored in separate tables.  The data in one tables may have a formal relationship to some data in another table.
- You can establish the rules around the relationships between two tables. The database will enforce these rules to help prevent inconsistent, duplicate, missing information.
- Example:  A row of data within the **person** table can have 0, 1 or several corresponding phone numbers in the **phone** table. If you have a record in the **phone** table than you must have a corresponding record for the person in the **person** table.
- SQL stands for Structured Query Language. Its the language used to manage databases and their data. You can use SQL to create databases, tables, views.  Most importantly you can use SQL to insert, edit, delete and retrieve data within a database's tables.
- MySQL supports many different categories of data types from integers to floating numbers to characters to binary to dates and times, to name a few.  See [Data Types](http://dev.mysql.com/doc/refman/5.7/en/data-types.html).
- MySQL consists of the main database server/engine and includes clients and utility programs. We'll use MySQL Workbench, the graphical user interface to MySQL.  

## Installing MySQL engine/server

- Follow these instructions for your specific operating system:

[http://dev.mysql.com/doc/refman/5.7/en/installing.html](http://dev.mysql.com/doc/refman/5.7/en/installing.html)

> For OSX/Mac, once the installation has been completed successfully, you will be provided with your temporary `root` password. **This cannot be recovered, so you must save this password.**  After logging into MySQL using this temporary password, MySQL will expire this password and require you to create a new password.

> On a windows based system, make sure the MySQL service is started using Services.  The service name will start with 'MySQL' and the version #.  Ex MySQL56L.  Using Services you can Start, Pause, Stop and Restart the MySQL server service.


## Installing MySQL Workbench

Workbench is graphical software for working with MySQL servers and databases.  

To install, follow these instructions:

- [http://dev.mysql.com/doc/workbench/en/wb-installing.html](http://dev.mysql.com/doc/workbench/en/wb-installing.html)

### Resources

- [http://dev.mysql.com/doc/workbench/en/](http://dev.mysql.com/doc/workbench/en/)
