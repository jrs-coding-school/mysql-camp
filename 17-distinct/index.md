[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/) 
---

# DISTINCT

Use the `DISTINCT` clause with a `SELECT` statement to remove duplicate rows from a result set.

```
SELECT DISTINCT
    (column A, Column B, ...)
FROM
    table_name
WHERE
    where_conditions;
```

We will begin to demonstrate the `DISTINCT` clause by first selecting all the columns from our **Band** table within the **RockStarDay2** database.  Again, notice the repeating values within the **Genre** column.  

```
SELECT *
FROM Band;
```

![1](/static/assets/img/distinct1.png)

We can modify the query by only selecting the **Genre** column from the table.  Notice how the genres repeat in the result set:

```
SELECT Genre
FROM Band;
```
![2](/static/assets/img/distinct2.png)

We can use the `DISTINCT` clause to display a distinct list of musical genres.

```
SELECT DISTINCT Genre
FROM Band;
```

![3](/static/assets/img/distinct3.png)




[Home](/)  |  [Distinct](/17-distinct/)  |  [Next](/17-distinct/1)
