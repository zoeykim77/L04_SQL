SHOW DATABASES; -- 생성 이전 데이터베이스 확인

-- DDL : 데이터 구조 정의
-- [1] CREATE 생성
-- (1) 데이터베이스 만들기
CREATE DATABASE lecture;
SHOW DATABASES; -- 확인

-- (2) 테이블 만들기
USE lecture; -- 데이터베이스 사용

CREATE TABLE user (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

SHOW TABLES;

SELECT *
FROM `user`;

-- [2] ALTER : 변경
-- (1) 추가
ALTER TABLE user
ADD birth_date DATE NOT NULL;

DESC user; -- 확인

-- (2) 수정
ALTER TABLE user
MODIFY name VARCHAR(100) NOT NULL;

DESC user;

# [3] 삭제 : Drop
CREATE TABLE test (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
DESC test;
SHOW TABLES;

-- 앞서 생성한 test 테이블 삭제
DROP TABLE IF EXISTS test;

SHOW TABLES;

DESC user;

-- [4] 이름 변경
RENAME TABLE user
TO user_info;

SHOW TABLES;