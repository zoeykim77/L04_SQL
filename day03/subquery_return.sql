-- 데이터 반환 형태에 따른 서브쿼리
-- 단일행 서브쿼리 
-- " 서브쿼리가 단일한 값을 반환 "
-- 하나의 값을 반환하여, >, =, < 과 같은 비교 연산을 사용한다.


-- 평균 인구수보다 인구가 많은 도시들 조회
-- 평균인구수보다 인구가 많다. (필터링 조건)
-- 필터링 걸기 위해 알아야 하는 "평균인구수" -> 서브쿼리

SELECT *
FROM city AS ct
WHERE ct.`Population` > (
    SELECT AVG(ct.`Population`)
    FROM city AS ct
);

-- 가장 많은 인구를 가진 도시의 국가 정보 
-- 조건 : 가장 많은 인구의 도시
-- 사용되는 테이블 : city, country

SELECT *
FROM country AS co
WHERE co.`Code` = (
    SELECT ct.`CountryCode`
    FROM city as ct
    ORDER BY ct.`Population` DESC
    LIMIT 1
);

-- 다중행 서브쿼리
-- 서브쿼리가 반환하는 값이 "여러개"
-- 여러 값을 한번에 비교하기 어려워서,
-- IN, NOT IN, EXISTS 와 같은 연산과 함께 사용한다.

-- 'English'를 공식 언어로 사용하는 모든 국가의 이름을 조회하는 경우
-- 조건으로 필터링 -> 언어 정보 (countrylanguage)
-- 사용 테이블 : country

SELECT co.`Name`
FROM country AS co
WHERE co.`Code` IN (
    SELECT cl.`CountryCode`
    FROM countrylanguage AS cl
    WHERE cl.`Language` = 'English'
        AND cl.`IsOfficial` = 'T'
);


SELECT cl.`CountryCode`
FROM countrylanguage AS cl
WHERE cl.`Language` = 'English'
AND cl.`IsOfficial` = 'T';

-- 인구 500만 이상인 도시가 있는 국가 찾기 
-- 사용 테이블 : country
-- 조건 : 인구 500만 이상 도시 -> city
SELECT co.`Code`, co.`Name`
FROM country AS co
WHERE co.`Code` IN (
    SELECT ct.`CountryCode`
    FROM city AS ct
    WHERE ct.`Population` >= 5000000
);

-- 다중 컬럼 서브쿼리

-- 각 나라에서 가장 인구가 많은 도시의 정보를 조회하는 경우
SELECT ct.`Name`, ct.`CountryCode`, ct.`Population`
FROM city AS ct
WHERE (ct.`CountryCode`, ct.`Population`) IN (
                                                SELECT ct.`CountryCode`, MAX(ct.`Population`)
                                                FROM city AS ct
                                                GROUP BY ct.`CountryCode`);