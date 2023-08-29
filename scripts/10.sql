--Запрос 1: Подсчет средней стоимости лекарств каждого типа, проданных в каждой аптеке, и выбор только тех типов, у которых средняя стоимость выше 50:
SELECT Branch.name AS branch_name, Drug_Type.name AS drug_type, AVG(Drug_Type.price) AS avg_price
FROM Invoice_Out
JOIN Branch ON Branch.id_branch = Invoice_Out.branch_id
JOIN Drug ON Drug.id_drug = Invoice_Out.drug_id
JOIN Drug_Type ON Drug_Type.id_type = Drug.type_id
GROUP BY Branch.name, Drug_Type.name
HAVING AVG(Drug_Type.price) > 50

--Запрос 2: Подсчет общей стоимости закупок каждого поставщика на каждой аптеке, и выбор только тех, у кого общая стоимость закупок выше 50:
SELECT Branch.name AS branch_name, Supplier.name AS supplier_name, SUM(Drug_Type.price) AS total_purchase
FROM Invoice_In
JOIN Branch ON Branch.id_branch = Invoice_In.branch_id
JOIN Supplier ON Supplier.id_supplier = Invoice_In.supplier_id
JOIN Drug ON Drug.id_drug = Invoice_In.drug_id
JOIN Drug_Type ON Drug_Type.id_type = Drug.type_id
GROUP BY Branch.name, Supplier.name
HAVING SUM(Drug_Type.price) > 50
