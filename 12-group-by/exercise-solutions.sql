USE baseball;

Select * from vteamRoster

/* Query 1  Retrieve all the columns from the **vteamRoster** view for only the batting leaders. */
SELECT v.*
FROM vteamRoster v
INNER JOIN batting b on b.playerID = v.playerID


/*Query 2 average weight of the batting leaders by division */
SELECT v.DivisionName as Division, AVG(v.Weight) as 'averageWeight'
FROM vteamRoster v
INNER JOIN batting b on b.playerID = v.playerID
GROUP BY v.DivisionName


/*Query 3 -  returns all rows from just the **vteamRoster** view */
SELECT *
FROM vteamRoster;

/* Query 4 - count the number of players within the  view by position*/
SELECT Position, COUNT(playerID) as positionCount
FROM vteamRoster
GROUP BY Position;
