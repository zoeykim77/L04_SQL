-- group by 강의 진행
USE world;
SHOW TABLES;
DESC country;

SELECT c.Continent, AVG(GNP) AS avg_gnp, SUM(GNP) AS sum_gnp, COUNT(*) AS country_cnt
FROM country AS c
GROUP BY c.Continent;

SELECT Region, AVG(Population) as avg_pop
FROM country
GROUP BY Region;

SELECT Continent as 대륙,
   MIN(Population) as 최소인구,
   MAX(Population) as 최대인구
FROM country
GROUP BY Continent;
