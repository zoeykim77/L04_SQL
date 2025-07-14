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

-- ============ WHERE ============

USE world;

-- 조건 필터링
-- (1) 비교 연산
-- 파이썬의 비교연산과 유사하나, 일부 다름
-- 일치연산 같다(=), 같지 않다 (!=, <>)
SELECT *
FROM city
WHERE city.CountryCode = 'KOR';

-- 논리 연산
SELECT CountryCode AS 국가명, Name AS 도시이름, Population AS 인구수
FROM city
WHERE Population > 1000000
        AND Population < 10000000;

-- 범위 연산
SELECT CountryCode AS 국가명, Name AS 도시이름, Population AS 인구수
FROM city
WHERE Population BETWEEN 100000 AND 1000000;

-- 포함 연산
SELECT CountryCode AS 국가명, Name AS 도시이름, Population AS 인구수
FROM city
WHERE CountryCode IN ('KOR','JPN','CHN');

-- 사실상 동일한 결과 반환
SELECT CountryCode AS 국가명, Name AS 도시이름, Population AS 인구수
FROM city
WHERE CountryCode = 'KOR'
    OR CountryCode = 'JPN'
    OR CountryCode = 'CHN';

DESC city; -- NULL 이 없기 때문에 country 테이블 사용하여, 복습
DESC country;

-- NULL 여부 체크
SELECT *
FROM country
WHERE IndepYear IS NOT NULL
    AND Continent = 'Asia'
    AND IndepYear > 1900;

-- 패턴매칭 (LIKE)
SELECT *
FROM country AS c
WHERE c.IndepYear IS NOT NULL
    AND c.Name LIKE '%stan'
    AND c.IndepYear > 1990;