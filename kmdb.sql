-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS studios;

-- Create new tables, according to your domain model
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year_released INTEGER,
  MPAA_ratings TEXT
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_name TEXT
);

CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movies_id INTEGER,
  role_name TEXT,
  actor_id INTEGER
);

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movies_id INTEGER,
  studio_name TEXT
);

-- Insert data into your database that reflects the sample data shown above
-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.
INSERT INTO movies (title, year_released, MPAA_ratings, id)
VALUES ('Batman Begins', 2005,'PG-13', 1);
INSERT INTO movies (title, year_released, MPAA_ratings, id)
VALUES ('The Dark Knight', 2008,'PG-13', 2);
INSERT INTO movies (title, year_released, MPAA_ratings, id)
VALUES ('The Dark Knight Rises', 2012,'PG-13', 3);

INSERT INTO actors (actor_name,id)
VALUES ("Christian Bale", 1);
INSERT INTO actors (actor_name,id)
VALUES ("Michael Caine", 2);
INSERT INTO actors (actor_name,id)
VALUES ("Liam Neeson", 3);
INSERT INTO actors (actor_name,id)
VALUES ("Katie Holmes", 4);
INSERT INTO actors (actor_name,id)
VALUES ("Gary Oldman", 5);
INSERT INTO actors (actor_name,id)
VALUES ("Heath Ledger", 6);
INSERT INTO actors (actor_name,id)
VALUES ("Aaron Eckhart", 7);
INSERT INTO actors (actor_name,id)
VALUES ("Maggie Gyllenhaal", 8);
INSERT INTO actors (actor_name,id)
VALUES ("Tom Hardy", 9);
INSERT INTO actors (actor_name,id)
VALUES ("Joseph Gordon-Levitt", 10);
INSERT INTO actors (actor_name,id)
VALUES ("Anne Hathaway", 11);

INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (1, "Bruce Wayne", 1, 1);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (1, "Alfred", 2, 2);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (1, "Ra's Al Ghul", 3, 3);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (1, "Rachel Dawes", 4, 4);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (1, "Commissioner Gordon", 5, 5);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (2, "Bruce Wayne", 1, 6);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (2, "Joker", 6, 7);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (2, "Harvey Dent", 7, 8);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (2, "Alfred", 2, 9);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (2, "Rachel Dawes", 8, 10);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (3, "Bruce Wayne", 1, 11);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (3, "Commissioner Gordon", 5, 12);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (3, "Bane", 9, 13);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (3, "John Blake", 10, 14);
INSERT INTO roles (movies_id, role_name, actor_id, id)
VALUES (3, "Selina Kyle ", 11, 15);

INSERT INTO studios (movies_id, studio_name, id)
VALUES (1, "Warner Bros", 1);
INSERT INTO studios (movies_id, studio_name, id)
VALUES (2, "Warner Bros", 2);
INSERT INTO studios (movies_id, studio_name, id)
VALUES (3, "Warner Bros", 3);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output (SELECT)
SELECT movies.title, movies.year_released, movies.MPAA_ratings, studios.studio_name
FROM movies INNER JOIN studios ON movies.id = studios.movies_id;


-- Prints a header for the cast output
.print "Top cast"
.print "======"
.print ""

-- The SQL statement for the cast output
SELECT movies.title, actors.actor_name, roles.role_name
FROM movies 
INNER JOIN roles ON movies.id = roles.movies_id
INNER JOIN actors ON roles.actor_id = actors.id
