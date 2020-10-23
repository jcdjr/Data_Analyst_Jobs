-- # 1
SELECT COUNT(*)
FROM data_analyst_jobs

-- # 2
SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- # 3
-- # 3A
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'

-- # 3b
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location ='KY'

--Evan
SELECT location, COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY'
GROUP BY location;

-- # 4
SELECT COUNT(star_rating)
FROM data_analyst_jobs
WHERE location = 'TN'
AND (star_rating>4);

-- #5
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000

-- #6
SELECT location, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL
AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- #7
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs

-- #8
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA'

-- #9
SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count> 5000
AND company IS NOT NULL
GROUP BY company

SELECT COUNT(company),(AVG(star_rating))
FROM data_analyst_jobs
WHERE review_count> 5000
AND company IS NOT NULL
GROUP BY company;

SELECT DISTINCT company, review_count, star_rating
FROM data_analyst_jobs
WHERE company IS NOT null
AND (review_count > 5000)
AND star_rating IS NOT null
ORDER BY star_rating DESC;

SELECT AVG (star_rating), company
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company;

--Dereje

SELECT company,round(avg(star_rating),2) as star_rating,sum(review_count)as review_count
FROM data_analyst_jobs
GROUP BY company
HAVING sum(review_count)>5000
ORDER BY star_rating desc;

-- # 10
SELECT company,AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count> 5000
AND star_rating IS NOT null
GROUP BY company
ORDER BY avg_star_rating DESC;

--correct?
SELECT company, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count> 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;

-- #11
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE LOWER(title) LIKE '%analyst%'

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title iLIKE '%analyst%'
-- #12
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE LOWER(title) NOT LIKE '%analyst%' 
AND title IS NOT NULL;

SELECT title
FROM data_analyst_jobs
WHERE LOWER(title) NOT LIKE '%analyst%' 
AND title IS NOT NULL;

-- BONUS

SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE days_since_posting >21
AND skill LIKE '%SQL%'
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;

SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE days_since_posting >21
AND LOWER(skill) LIKE '%sql%'
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;

SELECT *
FROM data_analyst_jobs

SELECT domain, COUNT(title) AS job_count
FROM data_analyst_jobs
WHERE UPPER(skill) LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY job_count DESC
LIMIT 4;
