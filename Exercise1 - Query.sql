use moviesdb;
/* 1.	Write an sql query to find the names and year of the movies */
select mov_title, mov_year
from movie;

/* 2. 	Write a query to find the year when the movie American Beauty was released */
select mov_year
from movie
where mov_title like '%american beauty%';

/* 3. 	write a sql query to find the movie which was released in the year 1999 */
select mov_title
from movie
where mov_year in ('1999');

/* 4.	Write an sql squery to find the movies which was released before 1998 */
select mov_title
from movie
where mov_year < 1998;

/* 5.	Write an sql query to return the name of all reviewers and name of movies together in a single list */
select re.rev_name, mo.mov_title
from reviewer as re join movie as mo
order by rev_name;

/* 6.	Write an sql query to find the name of reviewers who have rated 7 or more stars to their rating */
select rev_name
from reviewer
where rev_id in 
	(select rev_id
    from rating
    where num_o_ratings > 7);
    
/* 7.	Write a query in SQL to find the titles of all movies that have no ratings. */
select mov_title
from movie as b
where not exists
	(select mov_title
    from rating as a
    where b.mov_id = a.mov_id);
    
/* 8.	Write a query in SQL to find the name of all reviewers who have rated their ratings with a NULL value */
select rev_name
from reviewer
where rev_id in	
	(select rev_name
    from rating as a
    where b. rev_id = a.rev_id);
    
/* 9.	Write a query in SQL to find the name of movie and director (first and last names) who directed a movie 
that casted a role for 'Eyes Wide Shut'. */
select dir_fname, dir_lname
from director
where dir_id in	
	(select dir_id
    from movie_direction
    where mov_id in 
		(select mov_id
        from movie 
        where mov_title = 'eyes wide shut'));
