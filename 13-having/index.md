[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distict](/17-distinct/) | [Aliases](/18-aliases/) 
---

# HAVING Clause

The `HAVING` clause is used to filter the results of a `GROUP BY`.  After records have been aggregated with `GROUP BY` , you can use `HAVING` to filter the aggregated results.

Let’s say you wanted to list all the players from the **vteamRoster** view who bat left handed:

![1](/static/assets/img/having1.png)

Now let’s say you wanted to determine which team had the most lefties. You could `COUNT` the **playerID** column and `GROUP BY` the **teamName** column:

![2](/static/assets/img/having2.png)

Let’s take it one step further with the `HAVING` clause which acts like a `WHERE` clause for data that has been grouped and aggregated.  In the example below, we modified the query by aliasing the `COUNT(PLAYERID)` as `PLAYERCOUNT` and limiting the grouped rows to those who have a `PLAYERCOUNT` greater than 2.

![3](/static/assets/img/having3.png)


[Home](/)  |  [Having](/13-having/)  |  [Next](/13-having/1)
