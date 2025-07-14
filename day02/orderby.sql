-- ORDER BY 로 정렬하기

USE world;
SELECT DATABASE();

-- 인구가 많은 순서대로 정렬
SELECT c.`Name`, c.`Population`
FROM city AS c
ORDER BY c.`Population` DESC;

-- 정렬 여러번 가능
SELECT c.`Name`, c.`CountryCode`, c.`Population`
FROM city AS c
WHERE c.`CountryCode` IN ('KOR','JPN','CHN')
ORDER BY c.`Population` DESC, c.`CountryCode`;

DESC city;

-- NULL의 케이스 확인
-- NULL은 가장 작은 값으로 해석이 된다.
SELECT c.Name, c.`IndepYear`
FROM country AS c
ORDER BY c.`IndepYear` IS NULL DESC,`IndepYear` DESC;

-- 상위 N개의 행만 보기
SELECT *
FROM city
LIMIT 5
OFFSET 10;