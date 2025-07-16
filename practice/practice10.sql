-- 실습 10 : 함수 사용하기
-- ========== PART 1 ==========
-- [1] 고객 전체 이름 만들기
USE sakila;
SELECT CONCAT(c.last_name, ', ', c.first_name) AS full_name
FROM customer AS c;

-- [2] 영화 제목을 대문자로, 설명은 소문자 

SELECT UPPER(f.title) AS upper_title,
        LOWER(f.description) AS lower_desc
FROM film AS f;

-- [3] 고객 이메일에서 아이디만 추출하기
-- 목표 : @를 기준으로 앞에 있는 문자만 가지고 오겠다.

SELECT SUBSTRING_INDEX(c.email,'@',1) AS customer_id
FROM customer AS c
LIMIT 10;

-- ========== PART 2 ==========
-- [4] 결제 금액 반올림/올림/버림 비교

USE sakila;
SELECT p.amount,
        ROUND(p.amount) AS 반올림,
        CEIL(p.amount) AS 올림,
        FLOOR(p.amount) AS 버림
FROM payment AS p;


-- ========== PART 3 ==========
-- [5] 대여 날짜를 특정 형식으로 출력 
-- DATE_FORMAT 사용하기
USE sakila;
SELECT DATE_FORMAT(r.rental_date,'%Y-%m-%d (%a)')
FROM rental AS r;

-- [6] 대여 요일 별 렌탈건수와 총수익
SELECT WEEKDAY(r.rental_date) AS 요일별 , 
        COUNT(*) AS 렌탈건수,
        SUM(p.amount) AS 총수익
FROM rental AS r
INNER JOIN payment AS p USING (rental_id)
GROUP BY WEEKDAY(r.rental_date);

SELECT DATE_FORMAT(r.rental_date, '%a') AS 요일별 , 
        COUNT(*) AS 렌탈건수,
        SUM(p.amount) AS 총수익
FROM rental AS r
INNER JOIN payment AS p USING (rental_id)
GROUP BY DATE_FORMAT(r.rental_date, '%a') ;

-- [7] 영화의 실제 대여 기간 계산
SELECT r.rental_id AS 렌탈ID,
        DATEDIFF(r.return_date, r.rental_date) AS 대여기간
FROM rental AS r;