[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/) | [Operators](/19-operators/)
---

# Operators

## Comparison operators

Comparison operators will result in a value of `true`, `false`, or `null`.

- `SELECT 5 <> 3;`  -- this will evaluate to True (1).
- `SELECT 5 = 3;` -- this will evaluate to False (0).

## USING SOME Basic Comparison operators

Comparison operators can work on numbers and strings.  Below is a listing of some basic comparison operators:

-	greater than (`>`)
-	less than (`<`)
-	equals to (`=`)
-	not equal to (`<>`) (`!=`)
-	greater than or equal to (`>=`)
-	less than or equal to (`<=`)

## DEMO

```
mysql> SELECT ‘A’ < ‘B’;
mysql> SELECT ‘BA’ < ‘C’;
```

Strings are automatically converted to numbers and vice versa as necessary.

```
mysql> SELECT ‘2’ > 1;
mysql> SELECT 3 = (2+1);
mysql> SELECT ’3’ = (2+1);
```

## `IS NULL` and `IS NOT NULL` Comparison Operators

`IS NULL` tests whether a value is null.  It’s really useful to discover columns values that are `NULL`.  If something is NULL then a `1` (true) is returned.  

For example, the following will return a value of 1:

```
mysql> SELECT NULL IS NULL;
```

You can use `IS NULL` in a `WHERE` clause to determine a missing value.  It will return the rows if the expression in the `WHERE` clause evaluates to `true`.  For example:

```
mysql> SELECT * FROM Individual WHERE BIRTHDATE IS NULL;
```

You can `IS NOT NULL` to determine values that aren’t `NULL`.  For example:

```
mysql> SELECT * FROM Individual WHERE BirthDate IS NOT NULL;
```

## Using the `BETWEEN` comparison operator

Use `BETWEEN` to evaluate the value of something to see if its greater than or equal to a minimum value AND less than or equal to a maximum value.     If the value is `BETWEEN` then a `1` is returned, otherwise a `0` is returned.

The following expressions will evaluate to `true`:

```
mysql> SELECT ‘y’ BETWEEN ‘x’ and ‘z’;
mysql> SELECT ‘ABC’ BETWEEN ‘AAA’ and ‘BBB’;
mysql> SELECT 7 BETWEEN 7 and 10;
mysql> SELECT 1 BETWEEN .5 and 10;
```

You can use `BETWEEN` in the `WHERE` clause to restrict the rows returned where the expression in the where clause evaluates to `true`:

```
mysql> SELECT * FROM Individual WHERE LASTNAME BETWEEN ‘A’ AND ‘Cobain’ ORDER BY LASTNAME;
```

As you can see `BETWEEN ` is equivalent to the expression (`minimum value >= expr AND expr <= maximum value`)



[Home](/)  |  [Operators](/19-operators/)  |  [Next](/19-operators/1)
