-- 함수의 분류
-- 단일행함수
-- 다중행함수

-- 사용법

SELECT UPPER(co.`Name`), LOWER(co.`Name`)
FROM country AS co;


-- WHERE 절에서 사용
SELECT co.`Name`
FROM country AS co
WHERE LOWER(co.`Continent`) = 'asia';


USE sakila;
SELECT DATABASE();

-- GROUPBY / HAVING
SELECT MONTH(r.rental_date) AS rental_month,
        COUNT(*) AS cnt
FROM rental AS r
WHERE YEAR(r.rental_date) = 2005
GROUP BY MONTH(r.rental_date);


USE world;

SELECT ct.`Name`
FROM city AS ct
ORDER BY LENGTH(ct.`Name`) DESC;