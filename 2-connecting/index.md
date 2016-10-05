# Connecting to MySQL

## Connecting to the database server

When you install MySQL you get a command line interface (CLI) called **mysql**.  Use it to issue commands and queries. [See mysql](http://dev.mysql.com/doc/refman/5.7/en/mysql.html)

To connect to the database server, you will usually need to provide a MySQL user name when you invoke mysql and, most likely, a password. You will also need to specify a host name:

```
$ mysql -uroot -p -h 0.0.0.0 -P 3306
Enter password: ********
```

- `–h` this is the host where the MySQL Server application is running.  In this course, the MySQL Database Server is running in docker and is available on host `0.0.0.0` and port `3306`.  

- `–u` the MySQL user name of your MySQL account. Substitute appropriate values for your setup. The ******** represents your password; enter it when mysql displays the **Enter password:** prompt.  

    > Some accounts have the user name `root`. These are superuser accounts that have all privileges and can do anything. When you install MySQL you will be provided with a temporary password for the `root` user.

    > If using Unix, this is the same as the Unix login name.  If you want to use the Unix login name as the user name, you can omit the –u option.  

– `-p` you could provide the password directly as part of the command (be careful! no spaces after `–p`) BUT for security purpose _don’t do this_.  **By not providing the value for –p, mysql will prompt you for the password without echoing the password to the screen.**

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

Without a semicolon your SQL statement continues on the next line, as denoted by `->`.  The SQL is not executed until you provide the `;`.

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

## TODO: Creating a MySQL connection with Workbench
