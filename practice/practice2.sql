-- Active: 1751779934239@@127.0.0.1@3306@world
-- 실습 2: GROUP BY
USE world;
SHOW TABLES;
DESC country;

-- [1] 대륙별 총 인구수를 구하시오.
SELECT c.`Continent` AS 대륙명, SUM(c.`Population`) AS 총인구수
FROM country AS c
GROUP BY c.`Continent`;
-- 어디에서 가져올 것? country


-- [2] Region별로 GNP가 가장 높은 나라를 찾으시오
SELECT c.`Region` AS 지역명, MAX(c.GNP) AS 최대GNP
FROM country AS c
GROUP BY c.`Region`;


-- [3] 대륙별 평균 GNP와 평균 인구를 구하시오
SELECT c.`Continent` AS 대륙명, 
        AVG(c.`GNP`) AS 평균GNP, 
        AVG(c.`Population`) AS 평균인구
FROM country AS c
GROUP BY c.`Continent`;

-- [4] 인구가 50만에서 100만 사이인 도시들에 대해, 
--     District별 도시 수를 구하시오
SELECT c.`District` AS 지역명, COUNT(*) AS 도시수
FROM city AS c
WHERE c.`Population` BETWEEN 500000 AND 1000000
GROUP BY c.`District`;

-- [5] 아시아 대륙 국가들의 Region별 총 GNP를 구하세요
SELECT c.`Region` AS 지역명, SUM(c.GNP) AS 총GNP
FROM country AS c
WHERE c.`Continent` = 'Asia'
GROUP BY c.`Region`;