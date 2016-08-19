
# Connecting to MySQL

## Connecting from the terminal

To connect to the server, you will usually need to provide a MySQL user name when you invoke `mysql` and, most likely, a password. If the server runs on a machine other than the one where you log in, you will also need to specify a `host` name:

```
$ mysql -h host -u user -p
Enter password: ********
```

`host` and `user` represent the host name where your MySQL server is running and the user name of your MySQL account. Substitute appropriate values for your setup. The ******** represents your password; enter it when mysql displays the Enter password: prompt.

The `mysql>` prompt tells you that mysql is ready for you to enter SQL statements.

If you are logging in on the same machine that MySQL is running on, you can omit the host, and simply use the following:

```
$ mysql -u user -p
```

> Some accounts have the user name `root`. These are superuser accounts that have all privileges and can do anything. When you install MySQL you will be provided with a temporary password for the `root` user.

### Resources

[http://dev.mysql.com/doc/refman/5.7/en/connecting-disconnecting.html](http://dev.mysql.com/doc/refman/5.7/en/connecting-disconnecting.html)

## Demo: Creating a MySQL connection with Workbench

- Open MySQL Workbench.  Navigate to the Home Window (tab)
- Add a connection the connection name, connection method, IP address of the server host and TCP/IP port, user name, password, and optional default schema to use.
-
