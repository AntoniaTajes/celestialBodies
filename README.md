# celestialBodies
SQL practice database
Celestial Bodies Database
This is a database of celestial bodies created using PostgreSQL. The purpose of this project is to demonstrate my understanding of database creation and management.

Installation
To use this database, you need to have PostgreSQL installed on your local machine. You can download PostgreSQL from the official website.

Once you have installed PostgreSQL, you can create a new database by running the following command in your terminal:

Copy code
createdb celestial_bodies
After creating the database, you can import the data from the celestial_bodies.sql file by running the following command:

Copy code
psql celestial_bodies < celestial_bodies.sql
Usage
To query the database, you can use the following command:

Copy code
psql celestial_bodies
This will open the PostgreSQL command-line interface, where you can execute SQL queries to retrieve data from the database.
