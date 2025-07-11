-- 실전! SQL 실습 : WHERE 연습
USE world;
SHOW TABLES;
DESC city;

-- [1] 인구가 800만 이상인 도시의 Name, Population을 조회하시오
SELECT c.Name, c.Population
FROM city AS c
WHERE c.`Population` >= 8000000;


-- [2] 한국(KOR)에 있는 도시의 Name, CountryCode를 조회하시오
SELECT c.`Name`, c.`CountryCode`
FROM city AS c
WHERE c.`CountryCode` = 'KOR'; 

SELECT COUNT(*)
FROM city AS c
WHERE c.`CountryCode` = 'KOR'; -- 한국인 70개의 행만을 조회

-- [3] 이름이 'San'으로 시작하는 도시의 Name을 조회하시오
SELECT c.`Name`
FROM city AS c
WHERE c.`Name` LIKE 'San%';

-- 중첩된 값을 제외하고, San 으로 시작하는 케이스만을 조회
SELECT DISTINCT c.Name
FROM city AS c
WHERE c.`Name` LIKE 'San__'; 
-- %(0개이상 글자)와 _(1글자)와의 차이점

-- [4] 인구가 100만에서 200만 사이인 한국 도시의 Name을 조회하시오
SELECT c.`Name`
FROM city AS c
WHERE c.`CountryCode` = 'KOR'
    AND c.`Population` BETWEEN 1000000 AND 2000000;

-- [5] 인구가 500만 이상인 한국, 일본, 중국의 도시의 Name, CountryCode, Population 을 조회하시오

SELECT DISTINCT c.`CountryCode`
FROM city AS c;

SELECT c.`Name`, c.`CountryCode`, c.`Population`
FROM city AS c
WHERE c.`CountryCode` IN ('KOR','JPN','CHN')
    AND c.`Population` >= 5000000;

-- [6] 오세아니아 대륙에서 예상 수명의 데이터가 없는 나라의 Name, LifeExpectancy, Continent를 조회하시오.
SHOW TABLES;

DESC country;

SELECT DISTINCT Continent
FROM country;

SELECT con.`Name`, con.`LifeExpectancy`, con.`Continent`
FROM country as con
WHERE con.`Continent` = 'Oceania'
    AND con.`LifeExpectancy` IS NULL;

SELECT *
FROM country as con
WHERE con.`Continent` = 'Oceania'
    AND con.`LifeExpectancy` IS NULL;