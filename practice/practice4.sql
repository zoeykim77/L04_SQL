-- 실습 4 : ORDER BY

USE world;
SELECT DATABASE();

-- [1] 
-- country 테이블에서 
-- 대륙별로 정렬하고, 
-- 같은 대륙 내에서는 GNP가 높은 순으로 정렬하여 
-- Name, Continent, GNP을 조회하세요.

SELECT Name, Continent, GNP
FROM country
ORDER BY `Continent`, GNP DESC;


-- [2] 대륙 별 국가 수가 많은 순서대로 
-- Continent, 국가 수를 조회하세요.
SELECT c.`Continent` AS 대륙명, COUNT(*) AS 국가수
FROM country AS c
GROUP BY c.`Continent`
ORDER BY 국가수 DESC;

-- [3] 독립년도가 있는 국가들의 
-- 대륙 별 평균 기대수명이 높은 순서대로 
-- Continent, 평균 기대수명을 조회하세요.
SELECT c.`Continent` AS 대륙명, AVG(c.`LifeExpectancy`) AS 평균기대수명
FROM country AS c
WHERE c.`IndepYear` IS NOT NULL
GROUP BY c.`Continent`
ORDER BY 평균기대수명 DESC;


-- [4]
-- 인구가 많은 도시 중 11위부터 20위까지 조회하세요.
SELECT *
FROM city
ORDER BY city.`Population` DESC
LIMIT 10
OFFSET 10;