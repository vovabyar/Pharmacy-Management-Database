--14. Написать по два запроса на пересечение, разность, объединение таблиц
--Пересечение
--Найти поставщиков, которые также являются производителями:
SELECT name FROM Manufacturer
INTERSECT
SELECT name FROM Supplier;
--Найти клиентов, которые приобрели препараты в указанном филиале:
SELECT full_name FROM Customer
INTERSECT
SELECT c.full_name FROM Customer c
JOIN Invoice_Out io ON c.id_customer = io.customer_id
WHERE io.branch_id = 1;

--Разность таблиц:
--Найти производителей, которые не являются поставщиками:
SELECT name FROM Manufacturer
EXCEPT
SELECT name FROM Supplier;
--Найти клиентов, которые не приобретали препараты в указанном филиале:
SELECT full_name FROM Customer
EXCEPT
SELECT c.full_name FROM Customer c
JOIN Invoice_Out io ON c.id_customer = io.customer_id
WHERE io.branch_id = 1;

--Объединение таблиц:
--Найти все филиалы и склады, включая информацию о ёмкости склада:
SELECT b.name AS branch_name, w.id_warehouse, w.capacity
FROM Branch b
LEFT JOIN Warehouse w ON b.id_branch = w.branch_id
UNION
SELECT NULL, w.id_warehouse, w.capacity
FROM Warehouse w
LEFT JOIN Branch b ON w.branch_id = b.id_branch
WHERE b.id_branch IS NULL;
