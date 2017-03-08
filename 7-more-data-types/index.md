[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/)
---

# More Data Types

## decimals and integers

The value 123.45 is a number, specifically it’s a fixed point number, and in MySQL it’s data type is called `DECIMAL`.  The value 56 is a number; more specifically it’s an integer.  Like t-shirts, integer data types in MySQL come in all sorts of sizes from extra small to extra-large such as `TINYINT`, `SMALLINT`, `MEDIUMINT`, `INT`, and `BIGINT`.

> We won’t cover all the different data types in this course.  Instead, I recommend you check out the MySQL reference manuals on the Oracle web site at [MySQL](http://dev.mysql.com/doc/) and [MySQL Data Types](http://dev.mysql.com/doc/refman/5.7/en/data-types.html) or get a good book on MySQL such as the [MySQL Developer’s Library](https://www.amazon.com/MySQL-Developers-Library-Paul-DuBois/dp/0321833872) by Paul DuBois.  

## YEAR data type

`YEAR` is a 1-byte type used to represent year values. It can be declared as `YEAR(4)` or `YEAR(2)` to specify a display width of four or two characters. The default is four characters if no width is given.  You can specify the value as either a number or a string.  So a string value like `‘1999’` will work just as well as a numerical value like `1999`.  

## ENUM data type

An `ENUM` is a string object with a numeric value chosen from a defined, static (unchanging) list of possible values.  The strings you specify as input values are translated by the database server as numbers.  The cool thing is the numbers are converted back to the corresponding strings in query results.  The elements listed in the column specification are assigned integer numbers, beginning with 1.  Here is an example:

```
CREATE TABLE drinkMenu (
    name VARCHAR(40),
    size ENUM(’12 oz’, '16 oz', '24 oz', '32 oz')
);
```

## True and False

There is not an exact way to represent True or False in MySQL.  You can get close, however.  The `BOOL`, `BOOLEAN`, `TINYINT(1)` data types are ways to implement a true/false value within a table column.  Each column can store a 0 for false or a 1 for true … well sort of.  `BOOL` and `BOOLEAN` get translated to `TINYINT(1)` which will store a very small integer value with a signed range is -128 to 127 . The unsigned range is 0 to 255.   So if you have a 0 in the column, your application can interpret this as `false` and anything else as `true`.  

[Home](/)  |  [More Data Types](/7-more-data-types/)  |  [Next](/7-more-data-types/1)
