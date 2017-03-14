[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distinct](/17-distinct/) | [Aliases](/18-aliases/) | [Operators](/19-operators/)
---

# MySQL Camp

## Learning Objectives

In this course we will:  

- Define how a database is organized using a relational model.  
- Discuss the advantages of a relational database management system (RDBMS).  
- Explain the basics behind using SQL to manipulate data.  
- Provide an overview of the various MySQL components including
  - MySQL database server
  - SQL Workbench client
  - mysql console application/client
- Use the mysql console application  to connect to the MySQL database server and immediately begin creating databases, building tables, and working with data types.

## Introduction

- MySQL is an open source SQL database management system, supported by Oracle. You can download it and use it for free.
- A MySQL database server contains many databases.  Each database contains many tables.  Each table contains many rows which hold the data for an application.
- A database contains structured data.  The data is stored in separate tables.  The data in one tables may have a formal relationship to some data in another table.
- You can establish the rules around the relationships between two tables. The database will enforce these rules to help prevent inconsistent, duplicate, missing information.
- Example:  A row of data within the **person** table can have 0, 1 or several corresponding phone numbers in the **phone** table. If you have a record in the **phone** table than you must have a corresponding record for the person in the **person** table.
- SQL stands for Structured Query Language. It's the language used to manage databases and their data. You can use SQL to create databases, tables, views.  Most importantly you can use SQL to insert, edit, delete and retrieve data within a database's tables.
- MySQL supports many different categories of data types from integers to floating numbers to characters to binary to dates and times, to name a few.  See [Data Types](http://dev.mysql.com/doc/refman/5.7/en/data-types.html).
- MySQL consists of the main database server/engine and includes clients and utility programs. We use the client utility programs to communicate with the database server/engine including **mysql** command line interface and **MySQL Workbench**, the graphical user interface to MySQL.  


## MySQL _Client_ Software Connects and interacts with the MySQL database _server_

### MySQL Workbench _Client_

MySQL Workbench is a visual database design tool that integrates SQL development, administration, database design, creation and maintenance into a single development environment.

![clients workbench](/static/assets/img/sql-clients-1workbench.png)

## mysql — The MySQL Command-Line Tool _client_

"mysql is a simple SQL shell with input line editing capabilities. It supports interactive and noninteractive use. When used interactively, query results are presented in an ASCII-table format. When used noninteractively (for example, as a filter), the result is presented in tab-separated format. The output format can be changed using command options." - mysql docs.

[mysql cli](https://dev.mysql.com/doc/refman/5.5/en/mysql.html)

#### mysql cli - Connecting to the MySql server and database

```
$ mysql --user=user_name --password=your_password db_name
```

#### mysql cli - Killing statements

Typing **Control+C** causes mysql to attempt to kill the current statement. If this cannot be done, or **Control+C** is typed again before the statement is killed, mysql exits.

## Installing MySQL engine/server

We will use [Docker](https://docs.docker.com/engine/understanding-docker/) as the mechanism to install the MySQL _database server engine_.  Docker is an open platform for developing, shipping, and running applications.

- Before you can install the MySQL database server, you will need to install the Docker engine.  Follow these instructions for your specific operating system:

  [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

- After you have installed the Docker engine, you will need to download and install the MySQL database server using Docker. At the command line, run the following command to install and run the database server in `--detach` mode (running in the background).  We are also using the `--publish` flag to expose the MySQL container to the outside world by mapping the container’s MySQL port to your host machine port.

  ```
  $ docker run --detach --name=test-mysql --env="MYSQL_ROOT_PASSWORD=mypassword" --publish 3306:3306 mysql
  ```
- You will get an output of the container ID, indicating the container is successfully running in the background. Let’s verify the status of the container via the `docker ps` command.  After running the command you should see a container id, such as the one displayed below:

  ```
  $ docker ps
  CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS                    NAMES
a53189227000        mysql               "docker-entrypoint.sh"   About a minute ago   Up About a minute   0.0.0.0:3306->3306/tcp   test-mysql
  ```

  MySQL container is now running. You can now access the MySQL container directly from the machine’s port 3306.

## Helpful docker commands

- `$ docker help` provides a list of docker commands and descriptions
- `$ docker images` lists images.  When you ran the `$ docker run` command earlier, you created an image with the name **test-mysql**.
- `$ docker start` starts one or more stopped running containers by name.  Run this if you reboot your computer.  Ex: `$ docker start test-mysql`
- `$ docker ps` lists containers running in the background.  You should see your container listed after running `$ docker start`.
-  `$ docker ps -a` to list all local containers.
- `$ docker stop` stops one or more running containers.

## Installing MySQL Workbench client

Workbench is graphical software for working with MySQL servers and databases.  To install, follow these instructions: [http://dev.mysql.com/doc/workbench/en/wb-installing.html](http://dev.mysql.com/doc/workbench/en/wb-installing.html)

- Once you have installed Workbench, run the following at the command line to add the path to Workbench to your system path:

```
export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
```


### Resources

- [http://dev.mysql.com/doc/workbench/en/](http://dev.mysql.com/doc/workbench/en/)
