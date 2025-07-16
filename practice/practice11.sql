-- 실습 11: 전처리(Preprocessing)

USE world;

-- [1] 누락된 정보 확인하기


-- [2] 결측치를 대륙별 평균으로 대체하기
-- 대륙별(Continent)의 평균 기대 수명 -> 대체
SELECT 
    c1.`Name`, 
    c1.`Continent`,
    c1.`LifeExpectancy`,
    COALESCE(c1.`LifeExpectancy`, c2.avg_le)
FROM country AS c1
JOIN (
    SELECT `Continent`, AVG(`LifeExpectancy`) AS avg_le
    FROM country
    GROUP BY `Continent`) AS c2
ON c1.`Continent` = c2.`Continent`;


-- 대륙별(Continent)의 평균 기대 수명
SELECT `Continent`, AVG(`LifeExpectancy`)
FROM country
GROUP BY `Continent`;

-- [3] 카테고리 표준화하기


-- [4] '인구 밀도' 계산하기



-- [5] '1인당 GNP' 계산하기



-- [6] '수도 인구 비율' 계산하기