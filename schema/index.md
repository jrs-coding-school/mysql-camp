# MySQL Schemas

What is a Schema?



## Creating a database in MySQL Workbench

### Collation

When creating a new database (schema), you will need to select a _collation_.

Collations affect how data is sorted and how strings are compared to each other. That means you should use the collation that most of your users expect.

Selecting the 'correct' collation depends on your expected user base and on how much you need correct sorting. For an English user base, `utf8_general_ci` or `utf8_unicode_ci` should suffice, for other languages, like Swedish, special collations have been created.
