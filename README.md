# Netflix Movies And TV Shows Data Analysis

![Netflix](https://github.com/Spoorthi-920/Netflix_SQL_Project/blob/main/Netflix_logo.png)

## Overview

This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to study the data effectively and extract valuable insights to answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, key learnings and conclusions.

## 15 Key Business Problems Answered

* Movies vs. TV Shows – Count and compare both categories
* Most Common Ratings – Identify the most frequent ratings 
* Yearly Content Analysis – Find all movies released in a specific year
* Top 5 Countries with Most Content – Discover which countries contribute the most
* Longest Movie – Identify the longest-duration movie
* Recent Additions – Find content added in the last five years
* Content by Director – List all content by a specific director
* TV Shows with 5+ Seasons – Identify long-running shows
* Genre Analysis – Count content items per genre
* Content Released in India – Analyze the top 5 years with the most releases
* Documentaries – List all movies that are documentaries
* Content Without a Director – Find entries with missing director information
* Actor-Specific Movies – Find how many movies a specific actor appeared in
* Top 10 Actors in Indian Movies – Identify actors with the most appearances
* Content Categorization – Classify content as “Good” or “Bad” based on keywords

## Key Learnings

✅ **Advanced String Manipulation**: Used the UNNEST function to split comma-separated values (e.g., country, genre, actors) into individual rows for deeper analysis.

✅ **Window Functions for Ranking**: Applied RANK() to identify the most common ratings for movies and TV shows efficiently.

✅ **Date Handling & Time-Based Analysis**: Converted date_added into a proper date format using TO_DATE() and calculated recent content additions based on dynamic time intervals (last 5 years).

✅ **Data Cleaning & Transformation**: Handled missing values (e.g., missing directors), extracted numeric values from text fields (e.g., duration), and converted data types for accurate analysis.

✅ **Filtering & Aggregation Techniques**: Used WHERE CLAUSE, LIKE, ILIKE, and STRING_TO_ARRAY() to filter content by keywords, genres, and actors while ensuring accurate counts, averages.

✅ **Business-Oriented Insights**: Extracted meaningful insights such as top countries producing content, actor appearances, and genre distribution to understand Netflix’s content trends.

## How to Use This Repository

* Download the dataset and SQL file.
* Import the dataset into SQL environment.
* Run the queries to explore Netflix content trends.
* Modify the queries to gain deeper insights.

## Conclusion

This project explored Netflix’s content trends using SQL, uncovering key insights on movie vs. TV show distribution, top-rated content, and genre patterns. By applying advanced SQL techniques like UNNEST, RANK(), and TO_DATE(), we efficiently handled and analyzed complex data. Future enhancements could include data visualization for better insights. Feel free to contribute or share feedback!
