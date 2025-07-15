-- ======== SELECT 부터 ORDER BY 까지 : 기초 ======== 
-- SELECT 구문의 이해
USE world;

-- 기본 구조 (필수)
SELECT *
FROM country;

DESCRIBE country;

-- 경우 1 : WHERE를 통해 GROUP BY 이전 필터링
SELECT Continent AS 대륙명, COUNT(*) AS 나라수 -- (2) SELECT 절에서 별도 조회 필요
FROM country
WHERE Continent IN ('Asia','Europe')
GROUP BY Continent; 
-- (1) Group by 한 컬럼에 대해 SELECT에서 정보를 따로 주지 않음

-- 경우 2 : GROUP BY로 집계 후, HAVING으로 필터링
SELECT Continent AS 대륙명, COUNT(*) AS 나라수
FROM country
GROUP BY Continent
HAVING Continent IN ('Asia','Europe');


SELECT Continent, GovernmentForm, SUM(Population) AS sum_pop
FROM country
GROUP BY Continent, GovernmentForm -- 그룹의 기준 여러개
HAVING sum_pop > 0
-- 그룹핑하는 대상을 여러개로도 가능하다.
ORDER BY Continent ASC, sum_pop DESC;
-- 열거형 Continent의 오름차순, 총인구스의 내림차순으로 정렬

DESC country;

-- ================ JOIN ==============
-- 사용 시점 : FROM 절에서 사용이 됨 .
-- JOIN의 종류
-- INNER / LEFT -> JOIN 앞에 해당하는 종류를 붙여 주면 됨

SELECT *
FROM city AS ct
INNER JOIN country AS co -- 기본 JOIN : INNER
ON ct.CountryCode = co.Code; -- 해당하는 조건이 같을 때, JOIN


CREATE VIEW asia_countries_view AS
SELECT
    co.Code,
    co.Name AS country_name,
    ci.Name AS capital_name,
    co.Population AS country_population,
    co.GNP
FROM
    country co
JOIN
    city ci ON co.Capital = ci.ID
WHERE
    co.Continent = 'Asia';
-- country 테이블과 city 테이블을 조인

USE world;
SHOW TABLES;

DROP VIEW asia_countries_view;