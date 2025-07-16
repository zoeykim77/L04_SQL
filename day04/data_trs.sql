-- 데이터 형변환
-- 숫자 / 문자 / 시간 및 날짜
USE world;
SHOW TABLES;
DESCRIBE city;
SHOW CREATE TABLE city;

-- 형변환의 두가지 종류
-- 암시적 형변환
SELECT "1" + "10000";
-- 자동 변환하여 계산해주지만 원하는 형태가 아닐 수도 있다.

-- 명시적 형변환
-- CAST 함수로 형변환하기

SELECT CAST(-2 AS DECIMAL(3,2)); -- 바꿀수 있는 것만 바꾼다.

-- 예시 : 문자를 숫자로 변환
SELECT CAST('123' AS SIGNED) + CAST('77' AS SIGNED); -- 명시적 형변환
SELECT '123' + '77'; -- 암시적 형변환으로도 가능하나, 의도한 바와 다를 수 있다.

-- 숫자를 문자로 변환
SELECT CONCAT(CAST(city.ID AS CHAR), '번')
FROM city
WHERE city.`CountryCode` = 'KOR';


-- 문자 -> 날짜
SELECT WEEK(CAST('2025-07-16' AS DATE));