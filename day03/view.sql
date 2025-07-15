
USE world;
SELECT DATABASE();

-- 아시아(Asia) 대륙에 속한 국가들의 이름, 수도, 인구, GNP 정보
SHOW TABLES;

-- 필요 테이블 : city, country
-- ON : co.Capital = ct.ID
SELECT co.Code AS 국가코드,
        co.Name AS 국가명,
        ct.Name AS 수도명,
        co.Population AS 인구수,
        co.GNP
FROM 
    country AS co
INNER JOIN
    city AS ct
ON co.Capital = ct.ID
WHERE co.Continent = 'Asia';


-- VIEW를 생성
CREATE VIEW asia_countries_view AS
SELECT co.Code AS 국가코드,
        co.Name AS 국가명,
        ct.Name AS 수도명,
        co.Population AS 인구수,
        co.GNP
FROM 
    country AS co
INNER JOIN
    city AS ct
ON co.Capital = ct.ID
WHERE co.Continent = 'Asia';

SHOW TABLES;

-- 테이블처럼 사용하면 된다!
SELECT *
FROM asia_countries_view
LIMIT 10;

SELECT *
FROM asia_countries_view
WHERE 인구수 BETWEEN 100000000 AND 200000000;

-- 뷰 변경
CREATE OR REPLACE VIEW asia_countries_view AS
SELECT co.Code AS 국가코드,
        co.Name AS 국가명,
        ct.Name AS 수도명,
        co.Population AS 인구수,
        co.GNP AS GNP,
        co.GovernmentForm AS 정부형태
FROM 
    country AS co
INNER JOIN
    city AS ct
ON co.Capital = ct.ID
WHERE co.Continent = 'Asia';

DESCRIBE asia_countries_view;

SELECT *
FROM asia_countries_view
LIMIT 10;

-- 삭제하기
DROP VIEW IF EXISTS asia_countries_view; -- 없어도 에러발생하지 않도록 