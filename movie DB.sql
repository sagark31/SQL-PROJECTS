#1.Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.
SELECT actors.act_fname AS FIRST_NAME  ,actors.act_lname AS LAST_NAME, movie_cast.role AS ROLE
FROM actors, movie_cast , movie  
WHERE  movie.mov_id = movie_cast.mov_id 
AND movie_cast.act_id = actors.act_id 
AND movie.mov_title=  'Annie Hall';


#2.From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name and movie title.
SELECT director.dir_fname AS FIRST_NAME, director.dir_lname AS LAST_NAME, movie.mov_title AS TITLE  
FROM  director , movie  , movie_cast , movie_direction
WHERE  movie.mov_id=movie_direction.mov_id 
AND movie_direction.dir_id = director.dir_id 
AND  movie_cast.mov_id = movie.mov_id 
AND movie.mov_title  = 'Eyes Wide Shut';

#3.Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.
SELECT  b.dir_fname AS FIRST_NAME , b.dir_lname AS LAST_NAME, a.mov_title AS TITLE
FROM movie a , director b , movie_direction md , movie_cast mc
WHERE a.mov_id = md.mov_id
AND  md.dir_id =b.dir_id
AND mc.mov_id = a.mov_id
AND mc.role like '%Sean Maguire%';



#4.Write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year. 
SELECT a.act_fname AS FIRST_NAME, a.act_lname AS LAST_NAME, c.mov_title AS TITLE, c.mov_year AS RELEASE_YR  
FROM actors a, movie_cast b, movie c  
WHERE a.act_id=b.act_id  
AND b.mov_id=c.mov_id  
AND c.mov_year NOT BETWEEN 1990 and 2000;




#5.Write a SQL query to find the directors with number of genres movies. Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres movies.
SELECT d.dir_fname AS FIRST_NAME,d.dir_lname AS LAST_NAME ,g.gen_title AS GENERIC_TITLE,count(g.gen_title) AS COUNT
FROM director d , movie_direction md , genres g , movie_genres mg
WHERE d.dir_id=md.dir_id
AND g.gen_id = mg.gen_id
AND mg.mov_id = md.mov_id
GROUP BY d.dir_fname , d.dir_lname, g.gen_title
ORDER BY d.dir_fname , d.dir_lname asc ;



 #6.Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
SELECT m.mov_title , m.mov_year, g.gen_title
FROM movie m , genres g , movie_genres mg
WHERE m.mov_id =mg.mov_id
AND g.gen_id =mg.gen_id;




#7.Write a SQL query to find all the movies with year, genres, and name of the director. 
SELECT m.mov_title , m.mov_year , g.gen_title , d.dir_fname , d.dir_lname
FROM movie m , genres g , movie_genres mg , director d , movie_direction md
WHERE m.mov_id = mg.mov_id
AND g.gen_id = mg.gen_id
AND d.dir_id = md.dir_id
AND md.mov_id = m.mov_id;



#8.Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director. 
SELECT m.mov_title , m.mov_year , m.mov_time , m.mov_dt_rel ,  d.dir_fname , d.dir_lname
FROM movie m , director d , movie_direction md
WHERE m.mov_id = md.mov_id
AND d.dir_id = md.dir_id
AND mov_dt_rel <'01/01/1989' 
ORDER BY 4 DESC;



#9.Write a SQL query to compute the average time and count number of movies for each genre. Return genre title, average time and number of movies for each genre.
SELECT g.gen_title ,  AVG(m.mov_time) , count (g.gen_title)
FROM genres g  , movie m , movie_genres mg
WHERE g.gen_id = mg.gen_id
AND mg.mov_id = m.mov_id
GROUP BY g.gen_title;





#10.Write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.
SELECT m.mov_title , q.Mini, m.mov_year ,  d.dir_fname , d.dir_lname , a.act_fname, a.act_lname, mc.role
FROM movie m , director d , actor a , movie_cast mc , movie_direction md  , (SELECT min(m.mov_time) AS Mini FROM movie m) AS q
WHERE m.mov_id = mc.mov_id
AND md.mov_id = m.mov_id
AND d.dir_id = md.dir_id
AND mc.act_id = a.act_id 
AND m.mov_time =q.Mini;

