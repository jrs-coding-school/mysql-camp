# INSERT INTO SELECT Statements

Let's start with a review of `INSERT INTO` statements:

To add a row or rows of data into a table use the `INSERT INTO` statement.  With `INSERT INTO` you provide the name of the table, the table columns, the `VALUES` keyword followed by a comma delimited list of values.  _The order of the values should correspond to the column names._  The syntax looks like this:

```
INSERT INTO tablename (Col1, Col2, Col3, ...)
VALUES (Value1, Value2, Value3, …).
```
