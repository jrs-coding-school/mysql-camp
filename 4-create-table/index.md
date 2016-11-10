[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/) 
---

# Relational Data Modeling

> “A data model is a precise description of the data stored for a real-world problem…. The data model is not a complete nor exact description of a real situation… it will always be based on definitions and assumptions ... When designing a data model, you should devote time to define the tables in your system.  Ensure the tables and their relationships reflect the reality of your problem.  Define the definitions of your tables.  Define the assumptions.   Assumptions and requirements will change over time, especially if your project is successful.  After all, software that does not change is not being used.   A data model that accurately reflects reality will be resilient to change.  “To develop software of lasting quality, you have to craft a solid architectural foundation that's resilient to change.”  (Churcher, 2007)

Define the requirements of what the system is going to accomplish. You may be trying to manage people attending an event, inventory for maintaining airplanes, or statistical results for a manufacturing process.

Begin tracking the types of users (actors) that interact with the system.  You begin by identifying the people and other things that interact with the software. Next, describe the objectives or goals that a user (actor) meeds to achieve with the system.    

![Use Case](/static/assets/img/use-case.png)

The next step is for each ellipsis in the Use Case Diagram is to write a good text-based user story.  A user story outlines the detailed steps to achieve the desired outcome or goal.  For example, for the **Enter New Person** use case, the person must be logged in. The system must provide a data entry screen for entering the last name, first name, address, email, and phone information, etc.  You will also want to describe the alternative paths that could occur.  Think about the contingency plan.  List the steps that should occur for the actor when things go wrong.  Using these steps, write a user story using concise, easy to understand language.

During the process of defining the user story, begin tracking the names of the things (logical entities) you are tracking For example, if you are building an event management system you start with a logical model containing a person, an event that people attend, and the person’s hotel room.  You should also begin mapping the attributes for each entity.  For the person entity this would be their name, address, phone, etc.  There are different ways and notations that you could use to model your system.  For simplicities sake, you could simply sketch a box with the name of the entity:

![Entities](/static/assets/img/simple-entities.png)

After you have established some basic entities and attributes, you should begin thinking through the relationships between the entities. Consider the person and hotel room.  We know that a person can ‘book’ a hotel room.  But we need more detail.  In real life can a person book more than one room?  Does a person have to book a room before they can attend an event?  For argument's sake, let's say a person can book more than one room.  We will also not require that person stay at our hotel to attend the event.

Let’s look at the nature of the relationship between person and hotel room from the room’s point of view.  Does a room have to be occupied by a person or can it be vacant? Over time can a room be booked by more than one person?  We know that it is very likely that a room will not be booked all the time, we can have a room without it being booked.  We also know that over time a room will be booked by different people. So a person can book many rooms and a room can be booked by many people over time.

When a room is booked, what do we want to track in the reservation?  The reservation dates?  The rate?  The lodging tax?  Which entity do we want to use to track the attributes for dates, rate, and tax?  Do these attributes belong with the Person entity or the Hotel Room entity or an entirely new table?   It seems we are uncovering a new entity:  Reservation.  It is within the Reservation entity that attributes such as the person booking, dates, rate, and tax should be kept.

![ERD](/static/assets/img/reservation-erd.png)

## Creating Tables and Data types

In a relational data model you describe data in the form of tables. Each table contains rows.  It’s very similar to a page in a spreadsheet with each spreadsheet page being similar to a single table.  Each row within the table represents a thing of interest or entity.  For example, a Customer table would hold rows of data with each row describing a single customer. The entity is described by its attributes which translate to columns in the table. Each column contains a single value. A **Customer** table may contain columns such as **CustomerID, LastName, FirstName, Gender, and BirthDate**.  

![Simple Table](/static/assets/img/simple-table.png)

A relational database allows you to formally relate tables to one another.  For example, an **Orders** table could be related to the **Customer** table.  We could express this relationship verbally by stating “One customer can place one to many Orders”.  Another way to say this would be “A single order is related to a single customer”.  

In order to relate the two tables together. we refer a column in a table to a column within the other table. Below we see the **Orders** table. See how we copy over the **CustomerID** from the **Customer** table to the **Orders** table?  This begins to establish the relationship between the two tables.

![Relationship](/static/assets/img/simple-table-relationship.png)

Below is some sample data from Customer and Orders.  Again, note the CustomerID column’s data within the Orders table.  Do you see how the values in this column match in the Customer table?

![Relationship](/static/assets/img/simple-table-relationship-data.png)

## All about the rows

A large portion of the Structured Query Language (SQL) deals with managing the information stored within the columns and rows of database tables.  You can `INSERT` rows using SQL.  You retrieve (`SELECT`) rows with SQL.  You edit (`UPDATE`) rows with SQL.  You `DELETE` rows with SQL.  Get the picture?  The values returned by a `SELECT` SQL statement are a set of columns and rows.  In the relational model you can think of these operations as operating on and returning rows of data.  You can create a query that consists of a `SELECT` SQL statement to count up all the customers by state.  You can give the query a name such as **vCustomerCountByState**.  We call this type of database object a _View_.  A view is virtual table in that it contains rows of data (relation).

In a relational database system, we will have to define the structure of our tables first.  This is known as defining a _schema_.  It is assumed the data structure is known ahead of time.  This is common across all different types of RDMBS like SQL Server, MySQL, Oracle, etc.  

> Remember that NoSQL databases operate _without_ a schema, allowing you to freely add fields to database records without having to define a structure ahead of time.  This is helpful when you can’t assume the structure of your data ahead of time.  Many newer applications which are designed today use a mixture of both relational and NoSQL technologies.  

## Primary Key

Did you notice something interesting about the schemas for the **Customer** and **Orders** tables?  Each table has an identifying column such as `CustomerID` for the **Customer** table and `OrderID` for the **Orders** table.  These id columns are used to uniquely identify _each row of data_ in their respective table.  We call these types of columns a **Primary Key**.  A primary key is a column or combination of columns which uniquely specify a row . The values that make up the primary key must be unique, they cannot repeat in the table.

## Normalization

According to Wikipedia, “Database normalization is the process of organizing the fields and tables of a relational database to minimize redundancy and dependency. Normalization usually involves dividing large tables into smaller (and less redundant) tables and defining relationships between them. The objective is to isolate data so that additions, deletions, and modifications of a field can be made in just one table and then propagated through the rest of the database via the defined relationships…”

It’s important when you model a table that you only place values that directly relate to the entity. For example, you could track the individual’s favorite car in the Individual table but you would not want to track additional values about that car such as the car color, engine type, and body style.   Rather, these fields would belong within a separate Automobile table.

## Introducing Data Types

Databases manage data.  How’s that for profound? A database contains tables and a table contains column.  Each column of data is associated with a data type.  When you define the schema for a table you have to also define the columns in the table.  When you define a column you will provide a column name, a data type, and possibly some additional values depending on the data type. Let’s review a simple data type known as a `String` data type.

## String Data Type
For example, a person’s first name would be a string.  A person’s last name would be a string.  A person’s city of birth would be a string.  Their dog’s name would be a string. There are different data types of strings with the most common being `CHAR` and `VARCHAR`.   `CHAR` is short for character.  `VARCHAR` is short of variable length character.  With `CHAR` the length of the data type is fixed based upon a length of N.  Values with a length shorter than N are padded to the length of N with trailing spaces and stored in the table.  The padded spaces are removed when the data is retrieved.  So `CHAR(30)` translates to a data type that holds up to 30 characters.  

`VARCHAR` values are not padded when they are stored.  The basic rule of thumb is if your data length does not change in your column, it is more efficient to use `CHAR`.  If there is variation to the length of your characters in a column, consider using `VARCHAR`.  For example, a Zip code column would be CHAR(5) or CHAR(9) if you wanted to store those weird extra 4 digits at the end.

## Data Types and Performance

- 	Choosing the correct type to store your data is crucial to getting good performance (Schwartz, Zaitsev, & Tkachenko, 2012)
- 	Use the smallest data type that can correctly store and represent your data
- 	Choose the smallest one that you don’t think you’ll exceed
- 	Smaller data types are usually faster, because they use less space on the disk, in memory, and in the CPU cache.
- 	Fewer CPU cycles to process

[Demo: CREATE TABLE](/4-create-table/demo-create-table)

## NOT NULL

Sometimes it is ok to have an unknown or missing value within a column in a table.  Sometimes it isn’t.  When a column is marked at `NOT NULL`, we will not be able enter a `NULL` value into the column.  You test for `NULL` values within your tables by using the `IS NULL` and `IS NOT NULL` operators within a `SELECT` statement.

In the `CREATE TABLE` statement in the demo, notice that the `LastName` column was marked with the `NOT NULL` operator.  This means we have to enter a string into this column.  In contrast, the `FirstName` column will allow `NULL`.

> Go ahead and commit this concept to memory:  “Omitting a value for a column will cause a NULL value to be entered which then causes the default value to be placed into the column.“  

Consider the following SQL which creates a table and inserts a row into the table using a default.

```
CREATE TABLE RockStar.Individual
         (LastName varchar(50) NOT NULL
         , FirstName varchar(25)
         , BirthDate DATE NOT NULL
         , DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO Individual (LastName, FirstName, BirthDate) VALUES (‘Jagger’, ‘Mick’, ‘1943-07-26’);
```

> Note the syntax for the second example above.  When a column is not used in the list of columns, a default is assigned such as NULL.  If a column does not allow NULLs and you don’t specify the column in the column list, and the column does not have a default declared when you created the table then _you will get an error_!

## Date and Time Data Types

There are different kinds of date and time data types:  `DATE`, `TIME`, `DATETIME`, `TIMESTAMP`, and `YEAR`.  A date such as July 4, 1776 would be entered into a column with a `DATE` data type as 1776-07-04 or 1776-7-4.  MySQL might seem weird in how it portrays dates but it is in accordance with the ISO standard.  Below is a brief table showing the various Date and Time data types:

![Dates](/static/assets/img/dates.png)

For a birth date, you could use a data type of `DATE`.  If you wanted to just store the year, which is much more space efficient, use a data type of `YEAR(4)`.  This would return the year value back as a 4-digit year.

> When designing your tables, it is VERY important to use as small of a data type as possible for each of your columns.  Efficiently storing data into tables has a huge impact on the overall speed of your database system, especially as the number of records within your tables grow. Be sure to explore date data types further.  There is much more detail to learn for date data types, especially for TIMESTAMP and YEAR data types.

### Exercises 1 and 2

- [Exercise 1](/4-create-table/1)
- [Exercise 2](/4-create-table/2)

[Home](/)  |  [Create Table](/4-create-table/)  |  [Next](/4-create-table/1)
