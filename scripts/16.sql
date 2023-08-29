--16. Написать 4 запроса по строковым функциям
SELECT * FROM Manufacturer WHERE name LIKE 'О%';

SELECT LEN(full_name) as name_length FROM Customer;

SELECT name, LEN(address) as address_length FROM Manufacturer;

SELECT name, address FROM Supplier WHERE CHARINDEX('ул', address) > 0;
