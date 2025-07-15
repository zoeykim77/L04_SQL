-- CTE
-- 서브쿼리를 좀 더 가독성 있게 쓰는 방법

WITH continentMaxPopulation AS (
    SELECT c.`Continent`, MAX(c.`Population`) AS max_pop
    FROM country AS c
    GROUP BY c.`Continent`
)
SELECT c.`Continent`, c.`Name`, c.`Population`
FROM country AS c
JOIN continentMaxPopulation AS cmp
ON cmp.Continent = c.Continent AND cmp.max_pop = c.`Population`
WHERE c.`Population` > 0;

-- 아래 서브쿼리와 같은 결과
SELECT c.`Continent`, c.`Name`, c.`Population`
FROM country AS c
JOIN (
    SELECT c.`Continent`, MAX(c.`Population`) AS max_pop
    FROM country AS c
    GROUP BY c.`Continent`
) AS cmp
ON cmp.Continent = c.Continent AND cmp.max_pop = c.`Population`
WHERE c.`Population` > 0;