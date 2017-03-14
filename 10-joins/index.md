[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/) | [Alter Table](/6-alter-table/) | [More Data Types](/7-more-data-types/) | [Relationships](/8-relationships/) | [SQL Intro](/9-sql-intro/) | [Joins](/10-joins/) | [Order By](/11-order-by/) | [Group By](/12-group-by/) | [Having](/13-having/)  | [Select Insert](/14-selectinsert/) | [Delete](/15-delete/) | [Updates](/16-updates/) | [Distinct](/17-distinct/) | [Aliases](/18-aliases/) | [Operators](/19-operators/)
---

# Joins

## INNER JOIN

An `INNER JOIN` clause is used to join two or more tables together based on a common field to produce a result set. An `INNER JOIN` outputs rows that match between tables.  Another way to say this is the query will return rows where the join condition is met.  

So, let’s say you have two tables:  **team** and **batting**.  The **team** table displays a listing of MLB teams while the **batting** table lists batting leaders.  Here is the **team** table.  Note the values in the **ID** column:

![Team query result](/static/assets/img/joins-team-query-result.png)

And here is the batting table.  Note the values in the **TeamID** column:

![Batting query result](/static/assets/img/joins-batting-query-result.png)

Did you notice that the values within the **batting** table's **TeamID** column match the columns within the **team** table's **ID** column?  You can join these two tables using a `SELECT` statement with an `INNER JOIN` clause to discover the teams for the batting leaders by joining the `team.ID` column with the `batting.TeamID` column.  The query will only return rows where the Team IDs match as represented by the overlap (green area) within the two circles.  If we were to draw a picture it would look like this.  

![Inner Join Venn Diagram](/static/assets/img/joins-inner-venn-diagram.png)

`INNER JOIN` produces only the set of records that match in both the team table and batting table.  The syntax for an `INNER JOIN (JOIN)` looks like this:

```
SELECT <Column List>
FROM <Table_A> INNER JOIN <TABLE_B> ON <Table_A>.<Column_Name> = <TableB>.<Column_Name>
```

Here is an example of an `INNER JOIN` in action.  

![Inner Join Example](/static/assets/img/joins-inner-example.png)

Here is the **batting** table again.  Note the **PlayerID** column:

![Inner Join Batting](/static/assets/img/joins-inner-batting-playerid.png)

The **PlayerID** column relates to the **ID** column of the **Player** table.  Here are a few columns from the **Player** table:

![Inner Join Player](/static/assets/img/joins-player.png)

We can add another `INNER JOIN` to relate the **player** table to the **batting** table.  We will need to join the `batting.PlayerID` column to the `player.ID` column like this:

```
SELECT batting.PlayerID, batting.Rank, player.FirstName, player.LastName,
batting.BattingAvg, batting.TeamID, team.TeamName
FROM team INNER JOIN batting on team.ID = batting.TeamID
INNER JOIN player ON batting.PlayerID = player.ID;
```

![Multi Inner Join](/static/assets/img/joins-inner-multitable.png)

## LEFT JOIN

`LEFT JOIN` (same as `LEFT OUTER JOIN`) produces a complete set of records from the **team** table, with the matching records (where available) in the **batting** table. If there is no match, the right side will contain `null`.  With a `LEFT JOIN`, the **team** table on the left hand side of the diagram below is dominant.  That is to say all the rows on the left side of the diagram will be returned.  

![Left Join](/static/assets/img/joins-left.png)

In the example below, the first table listed (team) is the left (dominant) table so all the team rows will be returned.

```
SELECT *
FROM team LEFT JOIN batting ON team.ID = batting.TeamID;
```

![Left Join](/static/assets/img/joins-left-query1.png)

What if we wanted to produce a listing of teams that did NOT have any batting leaders?  We would have to produce a result set (rows of data) that contained only teams that did not have related batting rows.  In other words we want to include records where the batting rows were null.  

![Left Join](/static/assets/img/joins-left-query-null.png)


We could use a where clause to only show `NULL` rows from the **batting** table:

```
SELECT *
FROM team
LEFT JOIN batting on team.ID = batting.TeamID
WHERE batting.ID IS NULL;
```

![Left Join](/static/assets/img/joins-left-query-null-example.png)

## RIGHT JOIN

While the `LEFT JOIN` is more popular, you can rewrite this `LEFT JOIN` query …

```
SELECT *
FROM Team
left join Batting on Team.ID = Batting.TeamID;
```

![Left Join](/static/assets/img/joins-left-query1.png)

... to behave in a similar fashion by swapping the order the tables and use a `RIGHT JOIN` instead...

```
SELECT *
FROM batting
RIGHT JOIN Team ON Team.ID = Batting.TeamID;
```

![Left Join](/static/assets/img/joins-right-query1.png)



[Home](/)  |  [Joins](/10-joins/)  |  [Next](/10-joins/1)
