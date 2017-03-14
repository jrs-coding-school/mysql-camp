[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distinct](/17-distinct/) | [Aliases](/18-aliases/) | [Operators](/19-operators/)
---
# Modifying a Table's Schema (ALTER TABLE)

Unfortunately, some rock stars are no longer with us.  We need to model this fact by adding a **deceasedDate** to the **individual** table with a data type of `DATE`.  Since some rock stars will still be among living, we will include the `NULL` option on the new column. To modify a table we will use an `ALTER TABLE` statement.  The `ALTER TABLE `statement can do a lot of things, such as:  

- Create or drop new indexes  
- Rename the table.  
- Add or remove columns
- Modify column data types

> We can’t cover everything in this course with altering tables. I recommend you study the `ALTER TABLE` statement on your own time.  


The syntax for `ALTER TABLE` is:

```
ALTER TABLE table_name action [, action] …;
```

So, with `ALTER TABLE` you should include at least one action but have the option for additional actions.  Before using the `ALTER TABLE` statement, it’s a good idea to verify its current structure by issuing `SHOW CREATE TABLE` statement.

[Home](/)  |  [Alter Table](/6-alter-table/)  |  [Next](/6-alter-table/1)
