## Ex 1 Solution

```
$ mysql -h host -u user -p
mysql> CREATE DATABASE vehicles;
mysql> use vehicles;
mysql> SELECT DATABASE();  
```

## Ex 2 Solution

```
/* German DIN-1 (dictionary order)*/
mysql> CREATE DATABASE prost CHARACTER SET latin1 COLLATE latin1_german1_ci;
/* German DIN-2 (phone book order)*/
mysql> CREATE DATABASE prost CHARACTER SET latin1 COLLATE latin1_german2_ci;
mysql> use prost;
mysql> SELECT @@character_set_database, @@collation_database;
```
