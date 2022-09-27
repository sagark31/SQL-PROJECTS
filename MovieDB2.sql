##1. A SQL query to find those reviewers who have rated nothing for some movies. Return reviewer name.
CREATE VIEW rev_name_rat0
AS SELECT rev_name 
FROM reviewer 
WHERE rev_id IN (
SELECT rev_id 
FROM rating 
WHERE rev_stars=0);

## Here creating a view named rev_nmae_rat0 which will return reviewer name from the reviewer table and 
#only those selected data where the rev_stars=0 data from the rating table and
# gives the matching rev_id data on both rating and reviewer tables.

SELECT * FROM rev_name_rat0;

##2. A SQL query to find the movies, which have been reviewed by any reviewer body except by 'Paul Monks'. Return movie title.
CREATE VIEW MOVTITLES
AS SELECT movie.mov_title
FROM movie 
WHERE movie.mov_id IN(
SELECT mov_id 
FROM rating 
WHERE rev_id NOT IN (
SELECT rev_id 
FROM reviewer 
WHERE rev_name='Paul Monks'));

## Here creating a view named MOVTITLES which will return the movie title which has been reviwed by everyone except for paul monks
# hence collecting all the mov_title from the movie table and making sure that the reviewer is not Paul Monks checking through rev_name from the 
# reviewer table and matching the data with rev_id on both rating and reviwer table and returning the data .

SELECT * FROM MOVTITLES;


# 3.A SQL query to find the lowest rated movies. Return reviewer name, movie title, and number of stars for those movies. 

CREATE VIEW rev_name_mtitle AS 
SELECT reviewer.rev_name, movie.mov_title, rating.rev_stars
FROM reviewer, movie, rating
WHERE rating.rev_stars = (
SELECT MIN(rating.rev_stars) 
FROM rating
)
AND rating.rev_id = reviewer.rev_id
AND rating.mov_id = movie.mov_id;


## Here creating a view named rev_name_mtitle which will return the reviewer name , movie title and no of stars for the lowest rated movie .
## using min function on rev_stars from the rating table and matching the rev_id and mov_id from rating and reviwer table and rating and movie table
## hence getting the rev_name , mov_title , rev_stars from the matched data .


SELECT * FROM rev_name_mtitle;




# 4.A SQL query to find the movies directed by 'James Cameron'. Return movie title
CREATE VIEW MV_TITLE AS
SELECT mov_title FROM movie 
JOIN  movie_direction 
 ON movie.mov_id=movie_direction.mov_id
JOIN  director 
 ON movie_direction.dir_id=director.dir_id
WHERE dir_fname = 'James' AND dir_lname='Cameron';

## Here creating  view named MV_TITLE which will return the movie title for the movies directed by James Cameron 
## by using join joining the movie_dirction and dirction table first then movie_direction and director tables
## and filtering the data where first name = james and last name = cameron

SELECT * FROM MV_TITLE;


# 5.A query in SQL to find the name of those movies where one or more actors acted in two or more movies. 
CREATE VIEW ACT_NAME
AS SELECT mov_title 
FROM movie 
WHERE mov_id IN (
SELECT mov_id 
FROM movie_cast 
WHERE act_id IN (
SELECT act_id 
FROM actors 
WHERE act_id IN (
SELECT act_id 
FROM movie_cast GROUP BY act_id 
HAVING COUNT(act_id)>1)));

##Here creating aview named as ACT_NAME which will give the mov_title from the movie table which will select the data which is having 
## act_id count greater than 1 and will match the data act_id and mov_id from the actors and movie_cast tables and will give the appropriate values.

SELECT * FROM ACT_NAME;