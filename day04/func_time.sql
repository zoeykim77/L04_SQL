
SELECT NOW(), CURDATE(), CURTIME();
SELECT WEEKDAY(NOW());

SELECT DATE_FORMAT(NOW(),'%T'); -- 형식은 필요에 따라 찾아보면 된다.

-- 날짜 계산
SELECT DATE_ADD(NOW(), INTERVAL 3 DAY); -- 날짜 더하기
SELECT DATE_SUB(NOW(), INTERVAL 3 DAY); -- 날짜 빼기

USE sakila;
-- 날짜 사이 간격 구하기
SELECT AVG(DATEDIFF(r.return_date, r.rental_date)) 
FROM rental AS r;

-- 크리스마스까지 남은 날짜
SELECT DATEDIFF('2025-12-25',CURDATE());