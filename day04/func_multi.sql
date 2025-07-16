
-- 다중행 함수
-- 우리는 배우지 않았지만 계속 다중행 함수를 쓰고 있었다.
--  => 집계함수의 형태로!

USE sakila;
SELECT COUNT(*)
FROM film; -- 전체 테이블 행 갯수 확인

SELECT AVG(rental_rate), 
        COUNT(*), 
        MIN(rental_rate),
        MAX(rental_rate)
FROM film; -- 전체 행에 대해서 요약된 값을 보여줌


-- 그룹별 행에 대해서 요약된 값을 보여줌
USE world;
SELECT `Continent`, SUM(`Population`)
FROM country
GROUP BY `Continent`;