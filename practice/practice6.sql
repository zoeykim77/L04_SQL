-- Active: 1751779934239@@127.0.0.1@3306@sakila
USE sakila;
SELECT DATABASE(); -- 데이터베이스 확인
SHOW TABLES; -- 테이블 목록 확인

-- [1] 고객의 기본 정보, 주소, 도시 조회
-- 사용 테이블 : customer,address, city
-- ON : city_id, address_id

SELECT c.first_name AS 이름,
        c.last_name AS 성,
        c.email AS 이메일,
        a.address AS 주소,
        ct.city AS 도시명
FROM 
    customer AS c
LEFT JOIN
    address AS a
    ON c.address_id = a.address_id
LEFT JOIN
    city AS ct
    ON ct.city_id = a.city_id;


-- [2] London(city)에 사는 고객의 기본 정보, 주소, 도시 조회
SELECT c.first_name AS 이름,
        c.last_name AS 성,
        c.email AS 이메일,
        a.address AS 주소,
        ct.city AS 도시명
FROM 
    customer AS c
LEFT JOIN
    address AS a
    ON c.address_id = a.address_id
LEFT JOIN
    city AS ct
    ON ct.city_id = a.city_id
WHERE ct.city = 'London';

-- [3] 도시별 고객 수 조회
SELECT 
    ct.city AS 도시명,
    COUNT(*) AS 고객수
FROM 
    customer AS c
LEFT JOIN
    address AS a
    ON c.address_id = a.address_id
LEFT JOIN
    city AS ct
    ON ct.city_id = a.city_id
GROUP BY ct.city
ORDER BY 고객수 DESC;

-- [4] 고객의 기본 정보, 주소, 국가 조회
-- JOIN 할 테이블 : customer, address, city, country
SELECT c.first_name, c.last_name, c.email,
        a.address, ct.city, co.country
FROM customer AS c
LEFT JOIN address AS a USING (address_id)
LEFT JOIN city AS ct USING (city_id)
LEFT JOIN country AS co USING (country_id);

-- [5] 배우가 출연한 영화 조회
-- 사용되는 테이블 : actor, film_actor, film
SELECT a.first_name, a.last_name, f.title
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON f.film_id = fa.film_id;

-- [6] 특정 배우가 출연한 영화의 제목을 조회
SELECT a.first_name, a.last_name, f.title
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON f.film_id = fa.film_id
WHERE a.first_name = 'PENELOPE';
