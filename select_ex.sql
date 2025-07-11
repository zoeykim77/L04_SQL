-- SELECT의 이해
USE world;
SHOW TABLES;
DESC city;

-- 잘못된 순서 예시 (작동자체가 안됨)
-- FROM city
-- SELECT Name, Population;

-- 제대로 된 순서
SELECT Name, Population
FROM city;

-- 전체 열 조회
SELECT * -- 전체 열
FROM city; -- from 뒤에는 테이블명이 붙는다.

-- 특정 열 조회
SELECT Name, Population -- select 뒤에는 컬럼명이 붙는다.
FROM city;

SELECT city.Name, city.Population -- select 뒤에는 컬럼명이 붙는다.
FROM city;

------------
-- [2] 별칭 (Alias)

-- (1) 테이블명 축약
SELECT c.`Name`, c.`Population`
FROM city AS c; -- AS는 생략해도 됨

-- (2) 컬럼명 축약
SELECT city.`CountryCode` AS cc
FROM city;

-- 예시
SELECT c.Name AS 국가, c.Population AS 인구
FROM country AS c;

-- [4] 중복 제거
DESC country;

-- country 테이블에서 중복 제외 continent 의 목록을 뽑은 것
SELECT DISTINCT Continent
FROM country;

SELECT DISTINCT * --각 행은 PRIMARY KEY를 기준으로 무조건 다르다.
FROM country;
-- > SELECT * FROM country와 똑같다.