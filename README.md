This an example for application using 2 databases
 1. Sqlite
 2. Neo4j (GraphDB)

In this appplication i will get friends suggestion based on friends or friends.

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


