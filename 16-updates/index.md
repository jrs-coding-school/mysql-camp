# UPDATE

Use the `UPDATE` statement to update existing records within a table.  The `SET` clause allows you to indicate which columns to modify and the value used to update the columns.  

```
UPDATE <table_name>
SET <column_name> = {expression}
WHERE <where_condition>
```

Much like the `DELETE` statement, it is very important to use a `WHERE` clause to identify which records to update.  

> It is a best practice to use the ID (Key) column within the  `WHERE` clause to specifically indicate which rows are updated.  It is a common trap for developer to fail to determine whether sufficient criteria has been included to ensure the uniqueness of the rows in the output set.  The cure is to test your criteria with a SELECT statement to test selection of rows returned before attempting an UPDATE or DELETE statement.  For details on the hazards of the 'UPDATE' clause see  http://www.sqlservercentral.com/articles/T-SQL/101464/

You may find that you tried to update a table without a `WHERE` clause that utilizes a KEY column.  For example if safe mode is set to 1 and you tried the following statement:

![1](/static/assets/img/update1.png)

As you can see by the following SQL above, the developer has `SET SQL_SAFE_UPDATES = 1;`.  This basically says “don’t allow me to update data unless I use a `WHERE` clause that uses a KEY column to identify the rows to update.  If you receive `error 1175` then you are using safe update mode and you tried to update a table without a where that uses a key column.

To get around this limitation you can `set SQL_SAFE_UPDATES to 0;`:

![2](/static/assets/img/update2.png)




[Home](/)  |  [Update](/16-update/)  |  [Next](/16-update/1)
