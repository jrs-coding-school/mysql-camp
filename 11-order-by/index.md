[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distinct](/17-distinct/) | [Aliases](/18-aliases/) | [Operators](/19-operators/)
---

# Order By Clause

Use the `ORDER BY` clause to order the results of a query using a listing of columns. The syntax of the order by clause is:

```
ORDER BY column_name,column_name ASC|DESC;
```

`ORDER BY` will sort the rows in ascending order by default.  To sort in descending order use `DESC`.
Here is an example of using an order by clause within the **baseball** database.  This `SELECT` statement will list all the players by last name:

![Order By List Players desc](/static/assets/img/order-by1.png)

Here is another example.  This time we use DESC to sort the Birthdate column in descending order.  In this way we can view the youngest players first.

![Order By List Players birthdate desc](/static/assets/img/order-by2.png)

Let’s say we want to list the tallest players by team; but, the listing should be ordered by league, division, and team.  The following example will utilize the `ORDER BY` clause on a view named **vTeamRoster** to list players.  In the `ORDER BY` clause below, the **League**, **DivisionName**, and **TeamName** are ordered in _ascending_ order AND the **HeightInches** column is ordered in _descending_ order.

![Order By List Players height descending](/static/assets/img/order-by3.png)




[Home](/)  |  [Order By](/11-order-by/)  |  [Next](/11-order-by/1)
