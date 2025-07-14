-- Having
-- 집계된 이후, 추가 필터링
-- 작성 순서 : SELECT -> FROM -> WHERE -> GROUP BY -> HAVING

USE world;

-- 대륙 별 국가 수가 20개가 넘는 대륙, 국가 수 조회
SELECT co.`Continent`, COUNT(*) AS country_cnt
FROM country as co
GROUP BY co.`Continent`
HAVING country_cnt > 20;
-- HAVING COUNT(*) > 20; -- 동일한 결과

-- Region 별 평균 인구가 10000000이 넘는 지역, 평균 인구 조회
SELECT co.`Region`, AVG(co.`Population`) as avg_pop
FROM country AS co
GROUP BY co.`Region`
HAVING avg_pop > 10000000;
-- HAVING AVG(co.`Population`) > 10000000; -- 동일

-- 평균 인구수가 10000000 이 넘는 대륙 의 국가 수 
SELECT co.`Continent` AS 대륙명, COUNT(*) AS 천만이상국가수
FROM country AS co
GROUP BY co.`Continent`
HAVING AVG(co.`Population`) > 1000000;