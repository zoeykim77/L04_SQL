USE lecture;
SHOW TABLES;
DESCRIBE user_info;

SELECT *
FROM user_info;

-- DML : 데이터 값 조작
-- [1] INSERT : 데이터 삽입

-- 단일 행 입력
INSERT INTO user_info (user_id, name, email, birth_date)
VALUES (101, 'alex', 'alex@example','2000.01.01');

SELECT *
FROM user_info;

-- 다중행 입력
INSERT INTO user_info (user_id, name, email, birth_date)
VALUES  (102, 'jun', 'jun@example','1980.01.01'),
        (103, 'chelsea', 'chelsea@example','1990.01.01');

SELECT *
FROM user_info;

-- [2] SELECT : 데이터 조회
SELECT *
FROM user_info
WHERE name = 'jun';

-- [3] UPDATE : 값 수정
UPDATE user_info
SET birth_date = '1988-01-01'
WHERE name = 'jun';

SELECT *
FROM user_info;

-- [4] 삭제 : 특정 값 삭제
DELETE FROM user_info
WHERE user_id = 101;

SELECT *
FROM user_info;