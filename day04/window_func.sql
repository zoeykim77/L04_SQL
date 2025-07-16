-- 윈도우 함수 사용하였을 때, 훨씬 쉬워지는 것들이 많다.
USE world;
WITH df AS (
    SELECT c.`Name`,
            c.`Continent`,
            c.`LifeExpectancy`,
            AVG(c.`LifeExpectancy`) OVER (PARTITION BY c.`Continent`) AS a_le
    FROM country AS c)

SELECT Name, Continent, LifeExpectancy,
        COALESCE(LifeExpectancy,a_le)
FROM df;


-- 누적합계 구하기
SELECT c.`Name`, c.`Population`,
        SUM(c.`Population`) OVER (ORDER BY c.`Population` DESC)
FROM country AS c
WHERE c.`Continent` = 'Asia';


-- 이동평균 구하기
SELECT c.`Name`, c.`Population`,
        AVG(c.`Population`) OVER (
                            ORDER BY c.`Population` DESC
                            ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
                            AS moving_avg_3
FROM country AS c
WHERE c.`Continent` = 'Europe';


-- 순위
WITH scores AS (
    SELECT 'A학생' AS name, 95 AS score
    UNION ALL SELECT 'B학생', 90
    UNION ALL SELECT 'C학생', 85
    UNION ALL SELECT 'D학생', 85
    UNION ALL SELECT 'E학생', 85
    UNION ALL SELECT 'F학생', 70
)
SELECT *
FROM scores;


WITH scores AS (
    SELECT 'A학생' AS name, 95 AS score
    UNION ALL SELECT 'B학생', 90
    UNION ALL SELECT 'C학생', 85
    UNION ALL SELECT 'D학생', 85
    UNION ALL SELECT 'E학생', 85
    UNION ALL SELECT 'F학생', 70
)
SELECT
    name, score,
    ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num,
    RANK()       OVER (ORDER BY score DESC) AS rnk,
    DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rnk
FROM scores;

SELECT 
    Name, GNP,
    NTILE(4) OVER (ORDER BY GNP DESC) AS gnp_tier
FROM country
WHERE GNP > 0;


SELECT DISTINCT
    Continent,
    FIRST_VALUE(Name) OVER (PARTITION BY Continent ORDER BY LifeExpectancy DESC) AS highest_le_country,
    LAST_VALUE(Name) OVER (PARTITION BY Continent ORDER BY LifeExpectancy DESC 
                            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_le_country
FROM country
WHERE Continent IS NOT NULL AND LifeExpectancy IS NOT NULL;