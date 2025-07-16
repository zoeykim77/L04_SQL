-- ========== SQL 로 전처리하기 ========== 

-- 조건분기 (1) : IF 함수
-- 하나의 조건으로, 두 케이스 중 하나를 반환
-- IF(조건, 참일때 값, 거짓일때 값)
SELECT co.`Name` AS 국가명,
        co.`LifeExpectancy` AS 기대수명,
        IF(co.`LifeExpectancy` >= 80, '고령사회','해당 없음') AS '분류'
FROM country AS co
WHERE co.`Continent` = 'Asia';

-- 조건 분기 (2) : CASE 표현식
-- IF, ELIF, ELSE 와 같은 조건문을 만들 수 있다.
SELECT 
    c.`Name`,
    c.`Continent`,
    CASE 
        WHEN c.`Continent` = 'Asia' THEN '아시아권'
        WHEN c.`Continent` = 'Europe' THEN '유럽권'
        -- ELSE '기타' -- ELSE 구문이 없으면, 그외의 케이스는 NULL
    END AS '권역'
FROM country AS c
LIMIT 10;
