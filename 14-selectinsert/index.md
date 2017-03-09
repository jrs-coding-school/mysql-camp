[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/) | [Operators](/19-operators/)
---

# INSERT INTO SELECT Statements

Let's start with a review of `INSERT INTO` statements:

To add a row or rows of data into a table use the `INSERT INTO` statement.  With `INSERT INTO` you provide the name of the table, the table columns, the `VALUES` keyword followed by a comma delimited list of values.  _The order of the values should correspond to the column names._  The syntax looks like this:

```
INSERT INTO tablename (Col1, Col2, Col3, ...)
VALUES (Value1, Value2, Value3, …).
```

[Home](/)  |  [SELECT INSERT](/14-selectinsert/)  |  [Next](/14-selectinsert/1)
