-- 실습 10 : 함수 사용하기
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

