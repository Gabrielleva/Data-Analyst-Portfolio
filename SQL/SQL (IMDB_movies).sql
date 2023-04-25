# Table of movies
SELECT * FROM movies.imdb;

# How many rows is in the table?
SELECT 
COUNT(Rank_ID) AS data_values
FROM movies.imdb;

# The first row
SELECT *
FROM movies.imdb
WHERE Rank_ID =  1;

# The last row
SELECT *
FROM movies.imdb
ORDER BY Rank_ID DESC
LIMIT 1;

# Finding distinct values by movies years and sorting descending
SELECT 
DISTINCT(Movie_year)
FROM movies.imdb
ORDER BY Movie_year DESC;

# Finding how many movies each year have
SELECT 
COUNT(Movie_year) AS movie_numbers, 
Movie_year
FROM movies.imdb
GROUP BY Movie_year
ORDER BY movie_numbers;

# Movies with rating greater than 8.5 and runtime is between 110 and 120 minutes
SELECT 
Title,
Runtime_minutes, 
Rating 
FROM movies.imdb
WHERE runtime_minutes BETWEEN 110 AND 120
AND Rating > 8;

# Total revenue where genre is Fantasy
SELECT 
ROUND(SUM(Revenue_millions), 2) AS sum_revenue
FROM movies.imdb
WHERE Genre LIKE '%Fantasy%';

# Metascore level using multiple conditions
SELECT 
Title, 
Director, 
Metascore,
CASE
WHEN Metascore > 80 THEN 'High'
WHEN Metascore <= 80 AND Metascore >= 50 THEN 'Medium'
ELSE 'Low'
END AS 'Level'
FROM movies.imdb
ORDER BY Metascore DESC;

# Movies which runtime is higher that average runtime 
SELECT 
*
FROM movies.imdb
WHERE Runtime_minutes > ( SELECT 
						  AVG(Runtime_minutes)
                          FROM movies.imdb)
                          ORDER BY Runtime_minutes DESC;
                          
# TOP-5 directors with numbers of directed movies
SELECT 
COUNT(Director) AS movie_numbers, 
Director
FROM movies.imdb
GROUP BY Director
ORDER BY movie_numbers desc
LIMIT 5;

# Found out earlier that Ridley Scott directed 8 movies, so we want to find information about these movies 
SELECT 
*
FROM movies.imdb
WHERE Director = 'Ridley Scott';

# Ridley Scott movies average rating, average metascore, average revenue, maximum revenue and minimu revenue
SELECT
ROUND(AVG(Rating),2) AS Average_rating,
ROUND(AVG(Metascore),2) AS Average_metascore,
ROUND(AVG(Revenue_millions),2) AS Average_revenue,
ROUND(MAX(Revenue_millions),2) AS Maximum_revenue,
ROUND(MIN(Revenue_millions),2) AS Minimum_revenue
FROM movies.imdb
WHERE Director = 'Ridley Scott';



