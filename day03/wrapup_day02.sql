-- SELECT 구문의 실행
-- [작성 순서]
-- SELECT -> FROM (JOIN) -> WHERE -> GROUP BY -> HAVING -> ORDER BY

-- [실행 순서]
-- "FROM (JOIN)" -> WHERE -> GROUP BY -> HAVING -> "SELECT" -> ORDER BY

USE world;
SELECT DATABASE();
SHOW TABLES;

DESC city;

-- WHERE 절
SELECT *
FROM city AS c
WHERE c.`CountryCode` = 'KOR';

-- WHERE 절에서 주의해야 할 점
SELECT ct.`CountryCode` AS 국가명, 
        ct.`Name` AS 도시명,
        ct.`Population` AS 인구수
FROM city AS ct
WHERE ct.`Population` BETWEEN 10000000 AND 20000000;


-- GROUP BY : 그룹별 집계
USE world;

-- 대륙별 인구수 
SELECT co.`Continent` AS 대륙명, 
        COUNT(*) AS 나라수,
        SUM(co.`Population`) AS 총인구수,
        AVG(co.`Population`) AS 평균인구수
FROM country AS co
GROUP BY co.`Continent`;

-- HAVING : 그룹화하여 집계한 값들을 다시 필터링
SELECT co.`Continent` AS 대륙명,
        COUNT(*) AS 나라수,
        SUM(co.`Population`) AS 총인구수
FROM country AS co
GROUP BY co.`Continent`
HAVING 총인구수 > 0;

-- ORDER BY : 정렬
SELECT co.`Continent` AS 대륙명,
        COUNT(*) AS 나라수,
        SUM(co.`Population`) AS 총인구수
FROM country AS co
GROUP BY co.`Continent`
HAVING 총인구수 > 0
ORDER BY 나라수 DESC, 총인구수 DESC;

-- 도시를 기준으로 다시 살펴보기
DESC city;

SELECT ct.`Name` AS 도시명, ct.`Population` AS 인구수
FROM city AS ct
WHERE ct.`CountryCode` IN ('KOR','JPN','CHN')
ORDER BY ct.`Population` DESC
LIMIT 10
OFFSET 10;

-- JOIN : 테이블이 여러 개일때,
-- INNER JOIN : 두 테이블의 교집합

SELECT ct.`Name` AS 도시명,
        co.`Name` AS 나라명,
        co.`Continent` AS 대륙명
FROM 
    city AS ct
INNER JOIN
    country AS co
ON ct.`CountryCode` = co.`Code`;

-- LEFT JOIN : 왼쪽 테이블을 기준으로 합치기
SELECT co.`Name` AS 국가명,
        ct.`Name` AS 수도명
FROM country AS co
LEFT JOIN
    city AS ct
ON co.`Capital` = ct.ID
WHERE co.`Name` LIKE 'South%';