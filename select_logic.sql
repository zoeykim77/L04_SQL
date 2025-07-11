USE world;
SHOW TABLES;
DESC country;

-- 논리적 실행 순서에 따른 예시
SELECT c.`Continent` AS 대륙, c.`Name` AS 이름, c.`Population` AS 인구
FROM country AS c
WHERE c.`Continent` = 'Asia'
ORDER BY 인구;

-- WHERE 대륙 = 'Asia';
--실행순서가 WHERE이 먼저 오기 때문에
-- 별칭을 사용할 수 없다.