--17. Написать 4 запроса по числовым функциям
SELECT SUM(price) AS total_price FROM Drug_Type;

SELECT MIN(price) AS min_price, MAX(price) AS max_price FROM Drug_Type;

SELECT AVG(price) AS avg_price FROM Drug_Type;

SELECT COUNT(*) AS expired_drugs FROM Drug_Type WHERE YEAR(expiry_date) = YEAR(GETDATE());
