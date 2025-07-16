-- ========= 날짜 ========= 
SELECT NOW(), CURDATE(), CURTIME();
SELECT WEEKDAY(NOW());

SELECT DATE_FORMAT(NOW(),'%T'); -- 형식은 필요에 따라 찾아보면 된다.

-- 날짜 계산
SELECT DATE_ADD(NOW(), INTERVAL 3 DAY); -- 날짜 더하기
SELECT DATE_SUB(NOW(), INTERVAL 3 DAY); -- 날짜 빼기

USE sakila;
-- 날짜 사이 간격 구하기
SELECT AVG(DATEDIFF(r.return_date, r.rental_date)) 
FROM rental AS r;

-- 크리스마스까지 남은 날짜
SELECT DATEDIFF('2025-12-25',CURDATE());

USE world;
SELECT Name,`GNPOld`, GNP,  COALESCE(GNPOld, GNP, 0)
FROM country;

-- ========= 결측치 ========= 
DESC country;

SELECT COUNT(*)
FROM country
WHERE GNP IS NULL; -- 사실 결측치가 없다.

SHOW CREATE TABLE country;

-- IFNULL
SELECT co.`Name`, co.`HeadOfState`, co.`Continent`,
        IFNULL(co.`HeadOfState`,'정보없음') AS 국가원수
FROM country AS co; --추가적인 전처리가 필요


-- 일부러 결측치를 발생시키기
SELECT Language, Percentage, NULLIF(Percentage, 0.2)
FROM countrylanguage
WHERE CountryCode = 'USA';