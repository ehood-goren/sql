-- Exercise 1
SELECT country, COUNT(DISTINCT event) as cnt
 FROM summer
 GROUP BY country
 HAVING cnt > 100
 ORDER BY cnt DESC

-- Exercise 2
SELECT athlete
 FROM summer
 WHERE country = 'CAN'
 GROUP BY athlete
 HAVING COUNT(DISTINCT medal) = 3

--  Exercise 3
WITH all_athletes AS (
 SELECT *
  FROM summer
 UNION
 SELECT *
  FROM winter
)
SELECT athlete, country, COUNT(medal) as medal_count, GROUP_CONCAT(event)
 FROM all_athletes
 GROUP BY athlete, country
 ORDER BY medal_count DESC
LIMIT 10

-- Exercise 4
SELECT discipline, event, medal, athlete, country,
  COUNT(medal) OVER(PARTITION BY athlete) AS athlete_medals
 FROM summer
 WHERE city='London'
