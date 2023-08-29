--суммарная стоимость проданных лекарств каждого типа в каждой аптеке, а также общая сумма для каждой аптеки и общуа сумму для всех аптек и типов лекарств
SELECT Branch.name AS branch_name, Drug_Type.name AS drug_type, SUM(Drug_Type.price) AS total_price
FROM Invoice_Out
JOIN Branch ON Branch.id_branch = Invoice_Out.branch_id
JOIN Drug ON Drug.id_drug = Invoice_Out.drug_id
JOIN Drug_Type ON Drug_Type.id_type = Drug.type_id
GROUP BY ROLLUP(Branch.name, Drug_Type.name)

-- суммарная стоимость проданных лекарств каждого типа в каждой аптеке, а также сумма для каждой аптеки, каждого типа лекарств и общая сумма для всех аптек и типов лекарств.
SELECT Branch.name AS branch_name, Drug_Type.name AS drug_type, SUM(Drug_Type.price) AS total_price
FROM Invoice_Out
JOIN Branch ON Branch.id_branch = Invoice_Out.branch_id
JOIN Drug ON Drug.id_drug = Invoice_Out.drug_id
JOIN Drug_Type ON Drug_Type.id_type = Drug.type_id
GROUP BY CUBE(Branch.name, Drug_Type.name)

-- Этот запрос выводит суммарную стоимость проданных лекарств каждого типа в каждой аптеке, а также суммы для каждой аптеки и общую сумму для всех аптек и типов лекарств.
SELECT Branch.name AS branch_name, Drug_Type.name AS drug_type, SUM(Drug_Type.price) AS total_price
FROM Invoice_Out
JOIN Branch ON Branch.id_branch = Invoice_Out.branch_id
JOIN Drug ON Drug.id_drug = Invoice_Out.drug_id
JOIN Drug_Type ON Drug_Type.id_type = Drug.type_id
GROUP BY GROUPING SETS((Branch.name, Drug_Type.name), (Branch.name), ())
