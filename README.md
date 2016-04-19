This an example for application using 2 databases
 1. Mysql (Relational DB)
 2. Neo4j (GraphDB)

In this appplication you get the suggestions of the freinds and books.

The Calculation for this is quite very simple in Neo4j and with very good performances
So gettings only the ids form neo4j db and then fetching it from Squlit

## How To Use

* Install Neo4j and run
* clone the application
* setup database
* use users#follow method to follow another user
* use users#neighborhood_friends to get suggestions

Example:
  Users [A,B,C,D, E]
  A  follow > B
  B  follow > C
  B  follow > D
  A  follow > E
then user#neighborhood_friends will return the neo4j object of user C and D

* use user#books_suggestions controller method to get books suggestions
Example:
  Users [A, B, C D, E]
  Books [B1, B2, B3, B4, B5]
  A  follow > B
  B  follow > C
  A  follow > E
  A's fav books are B1, B2
  B's fav books are B2, B3
  E's fav books are B4, B1
  D's fav books are B2, B5
then A will get B3, B4 in suggestions bacase his friends B abd E also mark these as fav books.



