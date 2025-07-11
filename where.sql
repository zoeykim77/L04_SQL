-- WHERE 조건으로 필터링하기
USE world;
SHOW TABLES;
DESC city; -- (Total 4079)

-- [1] 비교 연산자
SELECT *
FROM city AS c
WHERE c.`Population` <> 100000; 
/*
- > 혹은 >= : 대소비교
- < 혹은 <= : 대소비교
- = : 일치 여부 비교 (파이썬과는 다른 연산자)
- != 혹은 <> : 일치 여부 비교
*/

-- [2] 논리연산자
-- AND
-- OR
-- NOT
DESC country;

SELECT *
FROM country AS c
WHERE c.`Population` > 1000000 
    AND c.`Continent` = 'Asia'
    AND c.`IndepYear` > 1990;

-- [3] 범위 연산
-- BETWEEN
-- NOT BETWEEN
SELECT *
FROM country AS c
WHERE c.`Population` NOT BETWEEN 100000 AND 200000;

-- [4] 포함 연산
-- IN : 목록 안에 속해 있는 모든 케이스에 대해서만 필터링하여 조회
SELECT *
FROM country AS c
WHERE `Code` NOT IN ('KOR','JPN','CHN');

-- [5] NULL 여부 
-- -> 결측치 확인 
DESC country;

SELECT *
FROM country AS c
WHERE c.`LifeExpectancy` IS NULL
    AND c.`IndepYear` IS NOT NULL;

-- [6] 패턴매칭
-- LIKE
SELECT *
FROM country AS c
WHERE Name LIKE 'S%';
