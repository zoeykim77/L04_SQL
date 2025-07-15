-- 실습 7 : 데이터 반환 형태에 따른 서브쿼리

USE sakila;

-- [1] 평균보다 비싼 대여료의 영화 찾기
-- 조건 : 평균보다 비싼 대여료 
-- 대상 테이블 : film
-- (단일행 반환 서브쿼리)

SELECT f.title, f.rental_rate
FROM film AS f
WHERE f.rental_rate > (
    SELECT AVG(f.rental_rate)
    FROM film AS f
);

SELECT AVG(f.rental_rate)
FROM film AS f;


-- [3] 'Action' 카테고리에 속한 영화의 재고 목록 조회
-- 대상 테이블 : inventory
-- 조건 : Action 카테고리 속하는 영화ID 만 고른다.
-- 다중행 서브쿼리

SELECT *
FROM inventory AS inv
WHERE inv.film_id IN (
    SELECT fc.film_id
    FROM film_category AS fc
    JOIN category AS c
    ON fc.category_id = c.category_id
    WHERE c.name = 'Action'
);


SELECT fc.film_id
FROM film_category AS fc
JOIN category AS c
ON fc.category_id = c.category_id
WHERE c.name = 'Action';

-- [5] 고객별 총 결제액과 평균 결제액을 동시에 조회
-- 서브 쿼리
SELECT p.customer_id,
        SUM(p.amount) AS 총결제액,
        AVG(p.amount) AS 평균결제액
FROM payment AS p
GROUP BY p.customer_id;

SELECT c.first_name, 
        c.last_name,
        p_summary.총결제액,
        p_summary.평균결제액
FROM customer AS c
JOIN
    (SELECT p.customer_id,
            SUM(p.amount) AS 총결제액,
            AVG(p.amount) AS 평균결제액
    FROM payment AS p
    GROUP BY p.customer_id) AS p_summary
    ON p_summary.customer_id = c.customer_id;