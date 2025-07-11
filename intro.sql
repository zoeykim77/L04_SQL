-- Active: 1751779934239@@127.0.0.1@3306@world
SELECT *
FROM country
WHERE country.`Continent` = 'Asia'; 
-- 쿼리 끝난 것을 나타내는 세미콜론

SELECT Name, Continent
FROM country
WHERE country.`Continent` = 'Europe';

/*
여러줄의 
주석은
이렇게 작성
*/

-- 키워드는 대문자로 써줘야 함 
-- (소문자도 작동은 되지만, 가독성 떨어짐)

-- select *
-- from country
-- where `Continent` = 'Asia';

SELECT * FROM country WHERE `Continent` = 'Asia';

-- 가독성을 위한 줄바꿈이 필요하다.
SELECT * 
FROM country 
WHERE `Continent` = 'Asia';
