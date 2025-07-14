-- 실습 5 : JOIN 기초
USE sakila;
SELECT DATABASE();

-- [1] 고객 이름과 주소 함께 보기
SELECT c.first_name, c.last_name, a.address
FROM 
    customer AS c
INNER JOIN
    address AS a
ON c.address_id = a.address_id;

-- [2] 영화 제목과 언어 이름 조회하기
SELECT f.title AS film_name, l.name AS language_type
FROM 
    film AS f
JOIN
    language as l
ON f.language_id = l.language_id;

-- 추가
SELECT l.name AS language_type, COUNT(*) AS cnt
FROM 
    film AS f
JOIN
    language as l
ON f.language_id = l.language_id
GROUP BY l.name;

-- [3] 모든 고객과 각 고객의 최근 대여일 조회하기
SELECT c.first_name, c.last_name, MAX(r.rental_date) AS last_rental_date
FROM 
    customer AS c
LEFT JOIN
    rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- [4] 특정 도시에 사는 고객 찾기
SELECT c.first_name, c.last_name, c.email
FROM 
    customer AS c
JOIN
    address AS a
ON c.address_id = a.address_id
WHERE a.city_id = 312;

-- [5] 직원별로 처리한 총 결제 건수 구하기
SELECT s.first_name, COUNT(p.payment_id) AS payments_cnt
FROM 
    staff AS s
JOIN 
    payment as p
ON s.staff_id = p.staff_id
GROUP BY s.first_name;

-- [6] 결제액 합계가 높은 우수 고객 찾기
SELECT c.first_name, c.last_name, 
        SUM(p.amount) AS total_spent
FROM 
    customer AS c
JOIN
    payment AS p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING total_spent >= 180
ORDER BY total_spent DESC;
