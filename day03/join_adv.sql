-- 세개 이상의 테이블 합치기
USE world;
SELECT DATABASE();

SELECT co.`Name` AS 국가명,
        ct.`Name` AS 수도명,
        cl.`Language` AS 공식언어
FROM 
    country AS co
INNER JOIN
    city AS ct
    ON co.`Capital` = ct.`ID`
INNER JOIN
    countrylanguage AS cl
    ON cl.`CountryCode` = co.`Code`
WHERE cl.`IsOfficial` = 'T';

-- M:N관계의 중계 테이블
-- sakila
USE sakila;

-- 영화(film)와 배우(actor) 를 연결
SELECT a.first_name AS 이름, 
        a.last_name AS 성,
        f.title AS 영화이름
FROM 
    actor AS a
INNER JOIN -- 중계 테이블
    film_actor AS fa
    ON a.actor_id = fa.actor_id
INNER JOIN
    film AS f
    ON f.film_id = fa.film_id;

-- 같은 컬럼명일 때,
-- USING을 이용한 간단한 조인
USE sakila;
SELECT a.first_name, a.last_name, f.title
FROM actor a
INNER JOIN film_actor fa USING (actor_id)
INNER JOIN film f USING (film_id);
-- 공백,들여쓰기,개행의 형태는 편한대로