-- 서브쿼리란?
-- 쿼리 안에 쿼리

-- 위치에 따른 서브쿼리의 모양
USE world;
SELECT DATABASE();
SHOW TABLES;

-- SELECT 절에서 서브쿼리 사용
-- 스칼라 서브쿼리
SELECT c.`Name` AS 나라명, (
        SELECT ct.`Name`
        FROM city AS ct
        WHERE ct.ID = c.`Capital`) AS 수도명
FROM country AS c;

-- 같은 결과를 반환 (JOIN 케이스)
SELECT co.`Name` AS 나라명, ct.`Name` AS 수도명
FROM country AS co
JOIN city AS ct
ON ct.`ID` = co.`Capital`;

-- FROM 절에서도 서브쿼리를 쓸 수 있다.
-- 인라인 뷰
SELECT *
FROM (
    SELECT Name, Population
    FROM city AS ct
    WHERE ct.`Population` > 500000
) AS BigCities;

-- WHERE 절
SELECT *
FROM city
WHERE `CountryCode` IN 
    (
        SELECT `Code`
        FROM country
        WHERE `Continent` = 'Asia'
    )
ORDER BY `Population` DESC;

SELECT `Code`
FROM country
WHERE `Continent` = 'Asia'; 
-- 해당 목록에 CountryCode 가 있는지,없는지 확인 (True/False)
-- True에 해당하는 케이스만 조회한다. (필터링 조건)

-- HAVING 절의 서브쿼리
SELECT co.`Continent` AS 대륙명,
        SUM(co.`Population`) AS 총인구수
FROM country AS co
GROUP BY co.Continent
HAVING 총인구수 >
        (
        SELECT co.`Population`
        FROM country AS co
        WHERE co.`Name` = 'Indonesia'
        );

SELECT co.`Population`
FROM country AS co
WHERE co.`Name` = 'Indonesia';

SELECT co.`Name`
FROM country AS co
ORDER BY co.`Population` DESC
LIMIT 10;