
-- 실습 3 : HAVING
USE world;
SELECT DATABASE(); -- 현재 나의 데이터베이스를 확인
SHOW TABLES;
DESC city;

-- [1] 각 국가별 도시가 10개 이상인 국가의 CountryCode, 도시 수를 조회하시오.

SELECT c.`CountryCode` AS 국가코드, COUNT(*) AS 도시수
FROM city AS c
GROUP BY c.`CountryCode`
HAVING COUNT(*) >= 10;



-- [2] District별 평균 인구가 100만 이상이면서 
-- 도시 수가 3개 이상인 
-- District,  도시 수, 총 인구를 구하시오

SELECT c.`District` AS 지역, COUNT(*) AS 도시수, SUM(c.`Population`) AS 총인구
FROM city AS c
GROUP BY c.`District`
HAVING AVG(c.`Population`) >= 1000000
    AND COUNT(*) >= 3;


-- [3] 아시아 대륙의 국가들 중에서, 
-- Region별 평균 GNP가 1000 이상인 Region,  평균 GNP를 조회하시오

-- c.Continent = 'Asia'
-- 1. WHERE 필터링 (정답)
-- 2. HAVING 필터링

SELECT c.`Region` AS 지역명,  AVG(c.`GNP`) AS 평균GNP
FROM country AS c
WHERE c.Continent = 'Asia'
GROUP BY c.`Region`
HAVING AVG(c.`GNP`) >= 1000;

-- [4] 독립년도가 1900년 이후인 국가들 중에서, 
-- 대륙별 평균 기대수명이 70세 이상인 Continent, 평균 기대수명을 조회하시오.
SELECT  c.`Continent` AS 대륙명, 
        AVG(c.`LifeExpectancy`) AS 평균기대수명
FROM country AS c
WHERE c.`IndepYear` > 1900
GROUP BY c.`Continent`
HAVING 평균기대수명 >= 70;

-- [5] CountryCode별 
-- 도시 평균 인구가 100만 이상이고 
-- 도시 최소 인구가 50만 이상인 
-- CountryCode, 총 도시수, 총 인구수를 조회하시오.
SELECT c.`CountryCode` AS 국가코드, 
        COUNT(*) AS 총도시수, 
        SUM(c.`Population`) AS 총인구수
FROM city AS c
GROUP BY c.`CountryCode`
HAVING AVG(c.`Population`) >= 1000000
    AND MIN(c.`Population`) >= 500000;