-- Netflix Project

-- Importing the data
DROP TABLE IF EXISTS netflix;
Create table netflix(
	show_id	VARCHAR(7),
	type VARCHAR(10),	
	title VARCHAR(150),	
	director VARCHAR(208),	
	casts VARCHAR(800),	
	country	VARCHAR(150),
	date_added VARCHAR(50),
	release_year INT,	
	rating VARCHAR(10),
	duration VARCHAR(15),
	listed_in VARCHAR(100),	
	description VARCHAR(250)
)

SELECT * FROM NETFLIX;

-- 15 BUSINESS PROBLEMS

-- 1. Count the number of Movies vs TV Shows

select type, count(distinct show_id) from netflix
group by type;


-- 2. Find the most common rating for movies and TV shows

with cte as(
select type, rating,  
rank() over (partition by type order by count(*) desc) as most_common_rating_rank
from netflix
group by type, rating
)
select cte.type,cte.rating from cte
where most_common_rating_rank = 1;


-- 3. List all movies released in a specific year (e.g., 2020)
--Two filters - Movie, year

select * from netflix
where release_year = 2020 and type = 'Movie';


-- 4. Find the top 5 countries with the most content on Netflix

select 
      TRIM(UNNEST(STRING_TO_ARRAY(country,','))) as new_country, count(*) as total_shows
	  -- by using the unnest function, basically we are unnesting the array
from netflix
where country is not null
group by new_country
order by total_shows desc
limit 5;


-- 5. Identify the longest movie

with cte as
(select 
	title,
	cast(split_part(duration,' ',1) as INTEGER) as duration
from netflix
where type='Movie')
select title,duration
from cte
where duration=(select max(duration) from cte);


-- 6. Find content added in the last 5 years
-- select current_date - interval '5 years' gives the date before 5 years exactly from today

select * from netflix
where TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'	


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select * from netflix
where director like '%Rajiv Chilaka%';

-- OR
select * from
(
select *, 
      unnest(string_to_array(director,',')) as director_name 
	  from netflix
)
where director_name = 'Rajiv Chilaka';


-- 8. List all TV shows with more than 5 seasons
--we cannot > function for string, it will provide incorrect result

select * from netflix
where type = 'TV Show' and
      split_part(duration,' ',1)::numeric > 5;
	  -- in this 1 is acts like delimiter and it tells to retrive everything before the first space
	  
-- 9. Count the number of content items in each genre

select 
	  count(*) as total_contents, 
	  unnest(string_to_array(listed_in,',')) as genre
	  from netflix
	  group by genre
	  order by total_contents desc;


-- 10.Find each year and the average numbers of content release in India on netflix. return top 5 year with highest avg content release!
select 
      country, 
	  extract(year from TO_DATE(date_added, 'Month DD, YYYY')) as year, 
	  count(*) as content_released,
      round(count(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100 , 2) as avg_release
from netflix
where country = 'India'
group by country, 2
order by content_released desc
limit 5;

-- 11. List all movies that are documentaries

select * from netflix
where type = 'Movie' and listed_in like '%Documentaries%';


-- 12. Find all content without a director

select * from netflix
where director is null;

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

select * from netflix
where 
    type = 'Movie' and 
	casts like '%Salman Khan%' and 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10 
	

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select count(*) as total_movies, unnest(string_to_array(casts,',')) as actors
from netflix
where type = 'Movie' and country like '%India'
group by actors
order by total_movies desc
limit 10;

/*
15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. 
Label content containing these keywords as 'Bad' and all other content as 'Good'. 
Count how many items fall into each category.
*/

with cte as(
select *,
        case 
		    when description ilike '%kill%' or description like '%violence%' then 'Bad'
            else 'Good' 
			end as category from netflix) 
select category, type, count(*) as total_content from cte			
group by category,type
order by 2,3;