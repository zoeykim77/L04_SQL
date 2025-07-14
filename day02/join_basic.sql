USE world;

-- INNER JOIN
SELECT con.`Code`, con.`Name` AS 국가명, ct.`Name` AS 도시명
FROM country AS con
INNER JOIN
    city AS ct
ON con.`Code` = ct.`CountryCode`;

-- LEFT JOIN
SELECT *
FROM country as con
LEFT JOIN 
    city as ct
ON con.`Capital` = ct.ID;

-- LEFT JOIN (NULL 발생 가능)
SELECT  country.Name as CountryName, 
        city.Name as CapitalCity
FROM country
LEFT JOIN city 
    ON country.Capital = city.ID
WHERE city.Name IS NULL;

-- sakila 비디오 대여점 예시
USE sakila;

SHOW TABLES;
DESC rental;

-- LEFT JOIN 예시
SELECT
    c.first_name,
    c.last_name,
    r.rental_date,
    r.return_date
FROM customer AS c
LEFT JOIN 
    rental AS r
ON c.customer_id = r.customer_id
WHERE r.return_date IS NULL;