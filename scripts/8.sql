--Напишите 5 запросов, используя агрегатные функции (SUM, MAX, MIN, AVG, COUNT)

SELECT SUM(price) AS total_price
FROM Drug_Type

SELECT MAX(price) AS max_price
FROM Drug_Type

SELECT MIN(price) AS min_price_bought
FROM Drug_Type

SELECT AVG(price) AS avg_price
FROM Drug_Type

SELECT COUNT(*) AS total_drugs
FROM Drug;
