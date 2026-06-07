-- ==========================================
-- Project: IMDb Top 1000 Movies Analysis
-- Author: Divanshu Singh
-- Tool: MySQL Workbench
-- Skills: SQL, Aggregations, Window Functions
-- Dataset: IMDb Top 1000 Movies (Kaggle)
-- Date: June 2026
-- ==========================================

-- Project Description:
-- This project analyzes the IMDb Top 1000 Movies dataset using SQL.
-- The objective is to identify trends in movie ratings, genres,
-- directors, votes, and audience preferences through data analysis.

CREATE DATABASE IF NOT EXISTS imdb_db;
USE imdb_db;

-- ==========================================
-- Basic Analysis
-- ==========================================

-- 1. How many movies are in the dataset?
SELECT COUNT(*) AS total_movies 
FROM imdb_top_1000;

-- 2. What are the Top 10 highest-rated movies?
SELECT Series_Title, IMDB_Rating 
FROM imdb_top_1000 
ORDER BY IMDB_Rating DESC 
LIMIT 10;

-- 3. What are the Top 10 movies with the most votes?
SELECT Series_Title, No_of_Votes 
FROM imdb_top_1000 
ORDER BY No_of_Votes DESC 
LIMIT 10;

-- 4. What is the average IMDb rating?
SELECT ROUND(AVG(IMDB_Rating), 2) AS avg_rating 
FROM imdb_top_1000;

-- ==========================================
-- Intermediate Analysis
-- ==========================================

-- 5. Which genres have the highest average IMDb ratings?
SELECT Genre, ROUND(AVG(IMDB_Rating), 2) AS avg_rating 
FROM imdb_top_1000 
GROUP BY Genre 
ORDER BY avg_rating DESC;

-- 6. Which directors directed the most movies?
SELECT Director, COUNT(*) AS total_movies 
FROM imdb_top_1000 
GROUP BY Director 
ORDER BY total_movies DESC 
LIMIT 10;

-- 7. Which release year produced the most movies?
SELECT Released_Year, COUNT(*) AS total_movies 
FROM imdb_top_1000 
GROUP BY Released_Year 
ORDER BY total_movies DESC;

-- 8. What are the highest grossing movies?
SELECT Series_Title, Gross 
FROM imdb_top_1000 
WHERE Gross IS NOT NULL 
ORDER BY CAST(Gross AS UNSIGNED) DESC 
LIMIT 10;

-- ==========================================
-- Advanced Analysis
-- ==========================================

-- 9. Which directors consistently produce highly-rated movies?
SELECT Director,
       COUNT(*) AS total_movies,
       ROUND(AVG(IMDB_Rating), 2) AS avg_rating
FROM imdb_top_1000
GROUP BY Director
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC;

-- 10. Rank movies within each genre based on IMDb Rating
SELECT Series_Title,
       Genre,
       IMDB_Rating,
       RANK() OVER (
           PARTITION BY Genre
           ORDER BY IMDB_Rating DESC
       ) AS genre_rank
FROM imdb_top_1000;

-- 11. Find Hidden Gems (High Rating but Low Votes)
SELECT Series_Title,
       IMDB_Rating,
       No_of_Votes
FROM imdb_top_1000
WHERE IMDB_Rating >= 8.0
  AND No_of_Votes < 100000
ORDER BY IMDB_Rating DESC;

-- 12. Which decade produced the highest-rated movies?
SELECT CONCAT(FLOOR(CAST(Released_Year AS UNSIGNED) / 10) * 10, 's') AS decade,
       ROUND(AVG(IMDB_Rating), 2) AS avg_rating
FROM imdb_top_1000
WHERE Released_Year REGEXP '^[0-9]+$'
GROUP BY decade
ORDER BY avg_rating DESC;

-- ==========================================
-- Key Insights
-- ==========================================

-- 1. The 1970s achieved the highest average IMDb rating (8.54).
-- 2. Certain directors consistently delivered highly-rated movies.
-- 3. Highly-rated hidden gems exist despite lower vote counts.
-- 4. Genre performance varies significantly across the dataset.
