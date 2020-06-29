# README

##** SET UP **

rails new colonies --database=postgresql
rails db:create
commit
hub create

*No specific gem (only added Rspec), I used Le Wagon configuration.*
*Configuration is pretty standard for a basic Rails App.*


##** QUESTION 1 **

Draw the db
Generate models.
Adding associations.
Creating seeds file.
5 values for each models.
Adding simple validation.

Commit.

##** QUESTION 2 **

Adding custom validation for start_date and end_date.
Test and sudo-code for the date validation (aka studio is free or not) with every case possible, to complete the SQL request.
Rake creation with test.
Cleaning of the rake test, by parts
Double verification by Seeding the database.

*Database changed a bit from here, for simplification ( Initially start_date / duration  - moved to start_date / end_date)*

##** QUESTION 3 **

Creation of 2 views : Index (not aksed but simpler in term of UI) and Show.
Step 1 : Focus on the show : display basic informations.
Step 2 : Think about how calculate and have an array of month.
Step 3 : Implement a group_by with the start_date - end_date range.
Played with this to order and display the different thing asked.

##** QUESTION 4 **






