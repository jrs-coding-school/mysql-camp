[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/)
---

# INSERT Statements Add Rows to a Table

Use SQL statements to manipulate the data within tables.  The `INSERT` statement adds a row or rows of data into a table.  The statement begins with the keywords `INSERT INTO` followed by the name of the table followed by `VALUES` followed by a series of column names.  With this syntax, the values must contain a value for each column.  And the values should be in the order in which you created the table:  

```
INSERT INTO table_name VALUES (value1, value2,…);
```
Here's an example:

```
INSERT INTO Individual Values (’Hendrix’,’Jimi’,’1942-11-27’, DEFAULT);
```

Here’s another way to write an `INSERT` statement.  It lists the column names after the table name:

```
INSERT INTO table_name (Column1, Column2, Column3,…) Values (value1, value2, value3,…);
```

An example would be:

```
INSERT INTO individual (lastName, firstName, birthDate) VALUES ('White', 'Jack', '1975-07-09');
```

> Note the syntax above.  When a column is not used in the list of columns, a default is assigned such as `NULL`.  If a column does not allow `NULL`s and you don’t specify the column in the column list, and the column does not have a default declared when you created the table then you will get an error.

Here is a third syntax for `INSERT`ing rows into table.  This syntax allows you to add multiple rows at once:

```
INSERT INTO table_name VALUES (,,,),(,,,),(,,,),…;
```

And an example would be:

```
INSERT INTO individual VALUES
(‘Jagger’, ‘Mick’, ‘1943-07-26’)
, (‘Zimmerman’, ‘Robert’, ‘1942-05-25’)
, (‘Cobain’, ‘Kurt’, ‘1967-02-20’);
```

And here's a fourth way to insert into a table using `SET`.   

```
INSERT INTO individual SET lastName='Morrison', firstName='Jim', birthDate='1940-05-01';   
```

[Demo: DESCRIBE lists a Table’s Structure](/5-insert/demo)


[Home](/)  |  [Insert](/5-insert/)  |  [Next](/5-insert/1)
