--С помощью языка T-SQL написать и выполнить 7 запросов на фильтрацию данных с использованием в запросах операторов сравнения, логических операторов
SELECT *
FROM Manufacturer
WHERE address LIKE 'ул. Ленина, д. 5';

SELECT *
FROM Drug_Type
WHERE price > 100;
SELECT *
FROM Drug
WHERE warehouse_id = 1 AND type_id < 5;

SELECT *
FROM Invoice_In
WHERE date > '2022-03-02' AND number < 1005;

SELECT *
FROM Branch
WHERE phone LIKE '+7%';

SELECT *
FROM Drug_Type
WHERE price < 50 OR category = 'Антибиотик';
SELECT *
FROM Invoice_Out
WHERE drug_id = 3 AND customer_id <> 5;
