-- [1] practice 데이터베이스를 만들고, practice를 사용할 데이터베이스로 선택하세요.
CREATE DATABASE practice; -- 생성
SHOW DATABASES; -- 생성됨을 확인
USE practice; -- 데이터베이스 사용
SHOW TABLES; -- 비어 있는 데이터베이스 확인 (테이블이 없다.)

-- [2] 학생(student) 테이블을 다음과 같이 생성하는 SQL 문을 작성하세요.
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    grade INT
);
SHOW TABLES;
DESC student;

-- [3] 위에서 생성한 student 테이블에 아래 데이터를 삽입하는 SQL 문을 작성하세요.
-- DML: 데이터 조작 -> 값 삽입
INSERT INTO student (name, grade) VALUES
    ('홍길동',3),
    ('김철수',2),
    ('박병철',1),
    ('안새싹',3);

SELECT *
FROM student;

-- [4] 이름이 '안새싹'인 학생의 학년을 4로 수정하는 SQL 문을 작성하세요.
-- DML : 값 수정
UPDATE student
SET grade = 4
WHERE name = '안새싹';

SELECT *
FROM student;

-- [5] 학년이 2인 학생을 삭제하는 SQL 문을 작성하세요.
-- DML : 값 삭제
DELETE FROM student
WHERE grade = 2;

SELECT *
FROM student;