/*  9-sql-intro/2 */

USE RockStarDay2;
SHOW COLUMNS FROM Band;

SELECT ID, Name, Genre
FROM Band;


/*  /9-sql-intro/3  */
USE RockStarDay2;

SELECT * FROM Individual WHERE LastName = 'Jennings';
SELECT ID, LASTNAME FROM Individual WHERE DeceasedDate IS NOT NULL;
SELECT ID, LastName, BirthDate FROM Individual WHERE Year(BirthDate) > 1940;
SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);

/* /9-sql-intro/4 */

/*Create a query that provides a list of alternative bands that have broken up.*/
SELECT *
FROM Band
WHERE isTogether = 0 and Genre = 'Alternative';

/*Create a query that provides the id and name of the band with an ID of 4*/
SELECT ID, Name
FROM Band
WHERE ID  = 4



/*
/9-sql-intro/5

Find all bands that have an ‘and’ in the middle of their band name like ‘Jason and the Scorchers’.
Find people who have a three letter first name that is like ‘Tim’ or ‘Kim’ or ‘Jim’.
Find all bands that end with ‘s’ like ‘The Beatles’ or ‘The Rolling Stones’ or ‘Pixies’.
*/

SELECT * FROM Band
WHERE Name LIKE '% and %'

SELECT * FROM Individual
WHERE FirstName LIKE '_im'

SELECT * FROM Individual
WHERE FirstName LIKE '%_im'

SELECT * FROM Band
WHERE Name LIKE '%s'
