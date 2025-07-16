-- 문자형 함수
USE world;

-- CONCAT() : 문자열들을 이어낸다.
SELECT CONCAT(ct.`Name`,'(',ct.`CountryCode`,')')
FROM city AS ct
WHERE ct.`CountryCode` IN (
    SELECT country.Code
    FROM country
    WHERE LOWER(country.`Continent`) = 'asia' 
    -- LOWER() 소문자로 바꾸기
);

-- 위치 기반으로 특정부분 잘라내기
SELECT country.`Name`, SUBSTRING(country.`Name`,1, 3)
FROM country
LIMIT 3;

-- REPLACE 대체
SELECT
    co.`Name`, REPLACE(co.`Name`,'South','S.')
FROM country AS co
WHERE co.`Name` LIKE "%South%";

