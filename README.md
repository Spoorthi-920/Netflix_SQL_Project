# Netflix Movies And TV Shows Data Analysis

![Netflix](https://github.com/Spoorthi-920/Netflix_SQL_Project/blob/main/Netflix_logo.png)

## Overview

This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to study the data effectively and extract valuable insights to answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Key Business Problems Answered

	1.	Movies vs. TV Shows – Count and compare both categories
	2.	Most Common Ratings – Identify the most frequent ratings
	3.	Yearly Content Analysis – Find all movies released in a specific year
	4.	Top 5 Countries with Most Content – Discover which countries contribute the most
	5.	Longest Movie – Identify the longest-duration movie
	6.	Recent Additions – Find content added in the last five years
	7.	Content by Director – List all content by a specific director
	8.	TV Shows with 5+ Seasons – Identify long-running shows
	9.	Genre Analysis – Count content items per genre
	10.	Content Released in India – Analyze the top 5 years with the most releases
	11.	Documentaries – List all movies that are documentaries
	12.	Content Without a Director – Find entries with missing director information
	13.	Actor-Specific Movies – Find how many movies a specific actor appeared in
	14.	Top 10 Actors in Indian Movies – Identify actors with the most appearances
	15.	Content Categorization – Classify content as “Good” or “Bad” based on keywords

## Key Learnings

	•	Using UNNEST function to handle comma-separated values in columns like country, listed_in, and casts.
	•	Applying window functions (RANK()) to identify most common ratings.
	•	Working with date transformations using TO_DATE() to analyze recent content additions.
