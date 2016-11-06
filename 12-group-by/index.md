[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/)  
---

# GROUP BY Clause

You can use the `GROUP BY` clause within a `SELECT` statement to group rows together by one or more columns or expressions. The `GROUP BY` clause should appear after the `FROM` clause and the `WHERE` clause but precede the `ORDER BY` clause.  

**You can perform row aggregations (sum, count, average, ...) on the grouped rows.**

The syntax of the `GROUP BY` clause is:

```
SELECT column1,column2,… <row aggregation function>(column or column expression)
FROM tableA
WHERE <where_conditions>
GROUP BY column1, column2, ...
```

For example, let’s say you wanted to list all the teams and their associated batting averages from the **batting** table.  You could author the following `SELECT` statement:

![1](/static/assets/img/group-by1.png)

Now let’s say you wanted to determine which teams had the most players on the list.  You could use the built-in SQL `COUNT()` function to count the rows and group the results by the **teamName** column.

![2](/static/assets/img/group-by2.png)

We can use the `AVG()` function   and a `GROUP BY` clause to determine the batting averages by team:

![3](/static/assets/img/group-by3.png)

The following query will group the rows by the team name, count the rows for each team, and average the batting averages for each team:

![4](/static/assets/img/group-by4.png)

The query below uses the `MIN()` aggregate function to determine which of the batting leaders had the least number of at bats from the **vbattingleaders** view:

![5](/static/assets/img/group-by5.png)

The following query will determine which teams had the most number of batting leaders.  Note how the `ORDER BY` clause is placed after the `GROUP BY` clause:

![6](/static/assets/img/group-by6.png)


[Home](/)  |  [Group By](/12-group-by/)  |  [Next](/12-group-by/1)
