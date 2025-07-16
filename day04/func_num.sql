-- 숫자형 함수
USE world;
SHOW TABLES;

-- 산술연산자
SELECT co.`Name` AS 나라명,
        100*(co.`Population` / co.`SurfaceArea`) AS 면적당인구수
FROM country AS co
WHERE co.`SurfaceArea` > 0;

-- ROUND
-- 반올림
SELECT co.`LifeExpectancy`,
        ROUND(co.`LifeExpectancy`)
FROM country AS co
LIMIT 4;

-- CEIL, FLOOR
-- 올림, 내림
SELECT CEIL(3.14), FLOOR(3.99999);

-- TRUNCATE
-- 자릿수 버림
SELECT TRUNCATE(3.141592, 3);