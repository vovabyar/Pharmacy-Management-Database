use Pharmacy
SELECT * FROM Manufacturer;
SELECT * FROM Supplier;
SELECT * FROM Branch;
SELECT * FROM Customer;
SELECT * FROM Drug_Type;
SELECT * FROM Warehouse;
SELECT * FROM Drug;
SELECT * FROM Invoice_In;
SELECT * FROM Invoice_Out;
-- вывести определенные данные, отсортированные в алфавитном порядке поопределенному полю

SELECT name FROM Manufacturer ORDER BY name;
SELECT name, category, expiry_date FROM Drug_Type ORDER BY name;
--вывести определенные данные, отсортированные в обратном алфавитном порядке по двум полям

SELECT name, address FROM Branch ORDER BY name DESC, address DESC;
SELECT full_name, phone FROM Customer ORDER BY full_name DESC, phone DESC;
--создать вычисляемое поле, и вывести данные, убрав дубликаты
SELECT DISTINCT category FROM Drug_Type;
--вывести 30% строк
SELECT TOP 30 PERCENT * FROM Drug_Type;
--вывести первые 5 строк
SELECT TOP 5 * FROM Supplier;
-- вывести строки начиная с 4 строки по 7 строку, отсортированные в обратном порядке
SELECT * FROM Customer ORDER BY full_name DESC OFFSET 3 ROWS FETCH NEXT 4 ROWS ONLY;
-- Отсортировать данные, используя в качестве критерия сортировки сложное выражение на основе столбцов
SELECT name, category, expiry_date FROM Drug_Type ORDER BY LEN(category), name;
--Запрос на выборку с добавлением SELECT INTO
SELECT *
INTO NewTable
FROM Drug_Type
WHERE over_the_counter = 1;
Select * From NewTable
