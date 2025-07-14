-- 데이터베이스 목록 확인하기
SHOW DATABASES;

-- 데이터베이스 사용하기 
USE lecture;

-- 테이블 목록 확인하기
SHOW TABLES;

-- 테이블 살펴보기
DESC user_info;

-- 테이블 삭제
DROP TABLE IF EXISTS user_info;

-- 테이블 삭제된 내용 확인
SHOW TABLES;

-- ================ DDL ================ 
-- 테이블 생성
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

SHOW TABLES;

-- 기본적인 테이블 생성
CREATE TABLE student (
    student_id VARCHAR(7) PRIMARY KEY,
    name VARCHAR(10),
    grade INT, 
    major VARCHAR(20)
);


-- 외래키가 있는 테이블 생성
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(7) REFERENCES student(student_id),
    date DATE,
    status VARCHAR(10)
);


SHOW TABLES;

-- 데이터 수정
ALTER TABLE users
ADD phone VARCHAR(20) NOT NULL;

ALTER TABLE users
MODIFY phone VARCHAR(20);

DESC users;

SHOW TABLES;

DROP TABLE attendance;
DROP TABLE IF EXISTS attendance; -- 없어도 에러가 뜨지 않음

RENAME TABLE users
TO user_info;

-- ================ DML ================ 
-- 데이터 추가 (INSERT)
DESC user_info;

INSERT INTO user_info (user_id, name)
VALUES  (1, 'alex'),
        (2, 'jun'),
        (3, 'chelsea');

SELECT *
FROM user_info;

INSERT INTO user_info
VALUES  (4, 'ken','ken@example.com',''),
        (5, 'hailey','hailey@google.com','010-0000-0000');

-- 데이터 조회 (SELECT)
SELECT *
FROM user_info;

-- 데이터 수정 (UPDATE)
-- 조건대로 수정하는 것이 꼭 필요
UPDATE user_info
SET email = 'chelsea@example.com'
WHERE name = 'chelsea';

SELECT *
FROM user_info;

-- 데이터 삭제 (DELETE)
-- 조건을 통해서 삭제
DELETE FROM user_info
WHERE email IS NULL;

SELECT *
FROM user_info;


-- ============== SELECT ==============
USE world;

SHOW TABLES;

DESC city;

-- city 확인하기 (Name,CountryCode, Population)
-- where의 실행 순서가 먼저 옴에 따라, SELECT 문의 Alias 는 쓸 수 없다.
SELECT c.Name AS 이름, CountryCode AS 국가코드, Population AS 인구수
FROM city AS c
WHERE c.Population >= 10000000;

-- SELECT c.Name AS 이름, CountryCode AS 국가코드, Population AS 인구수
-- FROM city AS c
-- WHERE 인구수 >= 10000000; -- 에러 발생
