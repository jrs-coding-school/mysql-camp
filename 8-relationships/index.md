[Home](/) | [Connecting](/2-connecting/) | [Create Database](/3-create-database/) | [Create Tables](/4-create-table/) | [INSERT](/5-insert/)  
---

# Foreign Keys: Relating Tables Together

Foreign keys allow you to relate data together between two tables.  You create a foreign key by creating a foreign key constraint which helps prevent orphaning records.  Foreign keys are created using either the `CREATE TABLE` or `ALTER TABLE` statement.   Foreign keys have the following characteristics:

-	The foreign key references a parent table and a child table.
-	Creating a foreign key requires relating a column within a child table to a column within a parent table.  The values within the child table column must match the value within the parent table column.
-	The `FOREIGN KEY` clause must be placed on the child table.  
-	Both tables referenced by the foreign key must be stored within the INNODB database engine.
-	The two referenced columns must be of the same data type.
-	InnoDB database engine requires indexes on the columns within both tables referenced by the foreign key.
-	To prevent orphaning of records, creating a row in the child table will be rejected if there is not a matching value in the parent table.

In the example below, we are creating a table named **Automobile** that contains an **ID** column for the primary key and a **Name** column for the name of the car.  Notice also how we explicitly designate the storage engine for the table as InnoDB.  

```
CREATE TABLE Automobile (
ID INT NOT NULL
, NAME VARCHAR(25) NOT NULL
, PRIMARY KEY (ID)
) ENGINE=INNODB;
```

Next we create a child table named **Engine** which tracks the engine options available for the **Automobile**.  We use an **ID** column for the primary key, and an **AutomobileID** as the column that supports the foreign key which references the parent **Automobile** table’s **ID** column.   Note the index created on the **AutomobileID** column in the child **Engine** table.  Remember in both tables, the columns involved in the foreign key relationship in each table require coverage with an index.  The parent **Automobile** table received an index on its **ID** column when we designated this column as the primary key.  

```
CREATE TABLE Engine
(ID INT NOT NULL
, AutomobileID INT NOT NULL
, EngineSize DECIMAL (2,1) NOT NULL
,INDEX AutomobileID_idx (AutomobileID),
FOREIGN KEY (AutomobileID) REFERENCES Automobile(ID)
                      ON DELETE CASCADE
) ENGINE=INNODB;
```

Looking back at the `CREATE TABLE` statement for the **Engine** table we can see the following pieces involved with creating a foreign key.
-	Created a column in the child table with the same data type as the column in the parent table.  In the **Engine** table we created the **AutomobileID** column.
-	Created an index in the child table on the column that supports the foreign key.  In the statement above, we created an index named **AutomobileID_idx**.
-	Created a `FOREIGN KEY` clause that first references the column in the child table (**AutomobileID**) followed by `REFERENCES` statement followed by the parent table name (**Automobile**) followed by the column in the parent table (**ID**).  
-	Optionally, you can specify what happens when a row either deleted or updated on the parent table by specifying `ON DELETE` and `ON UPDATE`.  Use either `ON DELETE` or `ON UPDATE` with one of the following options:
  -	`CASCADE`: deleting or updating a parent id row on the parent cascades the action down to the matching rows within the child table.  Updating a parent id causes matching rows to be updated with the same value in the child table.  Deleting a parent row causes matching rows to be deleted in the child table.
  - `SET NULL`: set the foreign key child column to null.  If you use this option be sure that you have not designated the foreign key child column as `NOT NULL`.
  - `RESTRICT`: Rejects the update or deletion on the parent record.  In other words, you can’t orphan the children.

> Note:  The InnoDB storage engine supports foreign keys while other storage engines such as MyISAM, MEMORY, CSV, and ARCHIVE do not.  We will be building tables using the InnoDB storage engine within this course.

## Modeling foreign key relationships

In another example, a band could release many albums.  In the example below, an optional relationship is shown between band and albums; the symbols closest to the **Album** entity represents zero, one, or many whereas an **Album** has one and only one **Band**. The former is therefore read as, a band releases "zero, one, or many" album(s).

![One to many relationship](/static/assets/img/one-to-many.png)

[Exercise 1](/8-relationships/1)


## More relationship modeling

Let's model the relationship between rock stars (individuals) and the band that they belong to.   Let’s take a musician, say Paul McCartney, which band does he belong to?  The Beatles, right?  So we _could_ model this by adding a new column on the **Individual** table that tracks the **Band** table’s **ID** column.  To accomplish this we could add a column named **BandID** to the **Individual** table.  The **BandID** column would hold the **ID** value from the **Band** table.  In this way we relate a row from the **Band** table to a row within the **Individual** table.  The table would look something like this.  Don’t get too attached to this design because we are not done with it yet.

![Individual table](/static/assets/img/table-individ-step1.png)

And the sample data in both the **Band** and **Individual** tables would look like this:

![Band and Individual table](/static/assets/img/table-individ-band-step2.png)

Below we see a picture of this relationship between a **Band** and the **Individual**.  We call this type of picture an Entity Relationship Diagram or ERD.  An ERD is a way to describe the relationships between entities (Tables).  There are different types of notation for expressing an ERD.  The diagram below is in “Crow Foot” notation.  The symbols closest to the **Individual** entity represents zero, one, or many whereas an **Individual** has one and only one **Band**. The two vertical lines next to the **Band** entity represent the “one and only one” part of the relationship.  This diagram states a band is comprised of zero, one, or many individuals.  We call this a _One-to-Many_ relationship.  One band is comprised of many individuals.  You could flip the entities around and state an individual belongs to a single band.  

![one to many ERD](/static/assets/img/one-to-many2.png)

## Many to many relationships (logical model)

Up to this point we have talked about One-to-Many relationships.  One individual performs many songs.  One band is comprised of many individuals.  Let’s test the converse of the relationship between individuals and band in the real world.  Is it true to say that one individual belongs to one and only one band?  Back to Sir. Paul McCartney, Paul was a member of the Beatles and he was also a member of the band Wings.  So, the individual can belong to _many_ bands and a band is comprised of _many_ individuals.  We have ourselves a _Many-to-Many_ relationship.  We can _logically_ express a Many-to-Many relationship with a model that looks like this:

![one to many ERD](/static/assets/img/many-to-many.png)

## Many to many relationships (physical model)

But when it comes time to physically implement the logical model of a Many-to-Many relationship in the database, we will have a little more work to do.  We have to add a table that sits in between the two entities to form the Many-to-Many relationship. This table is often called a junction table or a cross-reference table. In the ERD below the junction table is called **IndividualBand**.   A junction or cross-reference table (**IndividualBand**) helps implement the Many-to-Many relationship between **Band** and **Individual**:

![one to many ERD](/static/assets/img/many-to-many-physical.png)

So now we have to create the **IndividualBand** table.  It will consist of a primary key named **ID**.  We will copy over the primary key columns from the **Band** and **Individual** tables and add them to the **IndividualBand** table as the **BandID** and **IndividualID** columns. We will use the **BandID** and **IndividualID** columns as foreign key fields which provide data integrity.  This will ensure we do not associate an **Individual** with a **Band** that does not exist or vice versa.  

![one to many ERD](/static/assets/img/many-to-many-example.png)

Let’s look at some sample data for the tables listed above.  Below, notice how Neil Young is now associated with two bands: CSNY and Crazy Horse:

![one to many ERD](/static/assets/img/many-to-many-example2.png)

[Exercise 2](/8-relationships/2)


[Home](/)  |  [Relationships](/8-relationships/)  |  [Next](/8-relationships/1)
