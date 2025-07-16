-- Active: 1751779934239@@127.0.0.1@3306@world

-- ========== 데이터 베이스 확인하기 ==========
SHOW DATABASES;
USE world;
SELECT DATABASE();
-- DATABASE(); -- 작동하지 않음

SHOW TABLES;

SELECT *
FROM country
LIMIT 10;

DESCRIBE country;
SHOW CREATE TABLE country; -- country 테이블 제작한 DDL 확인

-- ============ DDL ============
-- 프로젝트 진행시 보통 VIEW 를 생성하여 진행할 것

-- 임시의 테이블 (쿼리문으로 만든다!)
-- 뷰 생성하기
CREATE VIEW asia_countries_view AS
SELECT co.Code,
        co.Name AS country_name,
        ct.Name AS capital_name,
        co.`Population` AS country_population
FROM country AS co
JOIN city AS ct ON ct.ID = co.`Capital`
WHERE co.`Continent` = 'Asia';

-- 뷰 확인하기
SHOW TABLES;

-- 뷰 사용하기
SELECT *
FROM asia_countries_view
WHERE country_population > 100000000;

-- 뷰 삭제하기
DROP VIEW asia_countries_view;
SHOW TABLES;


-- ============ DML ============
-- "값(행)"에 대한 것 (삽입, 조회, 수정, 삭제)
-- 우리는 보통 SELECT 문만을 사용한다.

-- [SELECT 문 기본구조]
-- SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY
-- 순서에 맞춰야만 코드가 돌아간다.

-- FROM city
-- SELECT *
-- WHERE `CountryCode` = 'KOR'; -- 작동하지 않음

SELECT *
FROM city
WHERE `CountryCode` = 'KOR'; -- WHERE 뒤 조건식

SELECT "1" + "2"; 
-- FROM 절이 필요 없는 경우도 있지만, 
-- 대부분의 쿼리문은 "어디에서" 라는 테이블 소스가 필요하다.

SELECT DISTINCT co.`Continent`
FROM country AS co;  -- 대륙의 유일한 목록들을 확인

-- GROUP BY - HAVING
SELECT co.`Continent` AS 대륙별, COUNT(*) AS 국가수
FROM country AS co
GROUP BY co.`Continent`
HAVING 국가수 >= 30; -- GROUP BY 가 있어야 HAVING이 작동

-- SELECT COUNT(*)
-- FROM country AS co
-- HAVING co.`Population` > 10000000; -- 작동안함

DESC country;