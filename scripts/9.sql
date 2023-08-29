--Подсчет количества лекарств каждого типа, проданных в каждой аптеке за определенный период времени
SELECT Branch.name AS branch_name, Drug_Type.name AS drug_type, COUNT(*) AS quantity
FROM Invoice_Out
JOIN Branch ON Branch.id_branch = Invoice_Out.branch_id
JOIN Drug ON Drug.id_drug = Invoice_Out.drug_id
JOIN Drug_Type ON Drug_Type.id_type = Drug.type_id
WHERE Invoice_Out.date BETWEEN '2022-01-01' AND '2022-03-31'
GROUP BY Branch.name, Drug_Type.name

--Запрос 2: Подсчет общей стоимости закупок каждого поставщика на каждой аптеке
SELECT Branch.name AS branch_name, Supplier.name AS supplier_name, SUM(Drug_Type.price) AS total_purchase
FROM Invoice_In
JOIN Branch ON Branch.id_branch = Invoice_In.branch_id
JOIN Supplier ON Supplier.id_supplier = Invoice_In.supplier_id
JOIN Drug ON Drug.id_drug = Invoice_In.drug_id
JOIN Drug_Type ON Drug_Type.id_type = Drug.type_id
GROUP BY Branch.name, Supplier.name
