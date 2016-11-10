[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/) 
---

# Connecting to MySQL

## Connecting to the database server

When you install MySQL you get a command line interface (CLI) called **mysql**.  Use it to issue commands and queries. [See mysql](http://dev.mysql.com/doc/refman/5.7/en/mysql.html)

To connect to the database server, you will usually need to provide a MySQL user name when you invoke mysql and, most likely, a password. You will also need to specify a host name:

```
$ mysql --user root --password --host 0.0.0.0 --port 3306
```
or

```
$ mysql -u root -p -h 0.0.0.0 -P 3306
```

Example:

```
$ mysql -uroot -p -h 0.0.0.0 -P 3306
Enter password: ********
```

- `--host`, `–h`  Connect to MySQL server on given host where the MySQL Server application is running.  In this course, the MySQL Database Server is your host (local) machine.  Since the host is running in Docker we need to provide a host value of `0.0.0.0`.

- `--user`, `–u` MySQL user name to use when connecting to server.  If using Unix this is the same as the Unix login name.  If you want to use the Unix login name as the user name, you can omit the `–u` option.  For now you will probably want to use the `root` superuser.  



    > Some accounts have the user name `root`. These are superuser accounts that have all privileges and can do anything. When you install MySQL you will be provided with a temporary password for the `root` user.

    > If using Unix, this is the same as the Unix login name.  If you want to use the Unix login name as the user name, you can omit the –u option.  

- `--password`, `–p` you could provide the password directly as part of the command (be careful! no spaces after –p) BUT for security purpose don’t do this.  By not providing the value for the password, **mysql** will prompt you for the password without echoing the password to the screen.

Once you are logged in, the `mysql>` prompt tells you that mysql is ready for you to enter SQL statements.

- Let's list all the databases on our MySQL database server:

```
$ show databases;
```

Quit the **mysql** application (not the mysql database server) by entering `quit` at the `mysql>` command prompt.

```
mysql> quit
```

## DEMO:  Issuing simple queries

Let's check out how we ask questions from the database server.  

We typically issue a SQL statement that is usually terminated with a semicolon.

```
mysql> SELECT VERSION();
mysql> SELECT 1+1;
mysql> select now();
```

Without a semicolon your SQL statement continues on the next line, as denoted by `->`.  The SQL is not executed until you provide the `;` followed by the enter key.

```
mysql> select
    -> now();
```

If you get in the middle of a sql statement and you want to cancel it, type  `\c` to return back to the `mysql>` prompt.

```
mysql> select
    -> now()
    -> \c
```

[Home](/)  |  [Connecting](/2-connecting/)  |  [Next](/2-connecting/1)
