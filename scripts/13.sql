--Внутреннее
SELECT *
FROM Drug_Type
INNER JOIN Manufacturer ON Drug_Type.manufacturer_id = Manufacturer.id_manufacturer
INNER JOIN Drug ON Drug.type_id = Drug_Type.id_type
INNER JOIN Warehouse ON Drug.warehouse_id = Warehouse.id_warehouse
WHERE Manufacturer.name = 'ООО "МедТехника"'

SELECT *
FROM Invoice_In
INNER JOIN Supplier ON Invoice_In.supplier_id = Supplier.id_supplier
INNER JOIN Drug ON Invoice_In.drug_id = Drug.id_drug
INNER JOIN Drug_Type ON Drug.type_id = Drug_Type.id_type
INNER JOIN Manufacturer ON Drug_Type.manufacturer_id = Manufacturer.id_manufacturer
INNER JOIN Warehouse ON Drug.warehouse_id = Warehouse.id_warehouse
WHERE Supplier.name = 'ООО "Медфарм"'

--Внешнее левое соединение:
--Вывести данные о складах и лекарствах, даже если на складе нет лекарств:
SELECT *
FROM Warehouse
LEFT JOIN Drug ON Warehouse.id_warehouse = Drug.warehouse_id
--Вывести данные о поставщиках и поставках, включая тех, у которых нет поставок:
SELECT *
FROM Supplier
LEFT JOIN Invoice_In ON Supplier.id_supplier = Invoice_In.supplier_id

--Внешнее правое соединение:
--Вывести данные о лекарствах и складах, включая те, на которых нет лекарств:
SELECT *
FROM Drug
RIGHT JOIN Warehouse ON Drug.warehouse_id = Warehouse.id_warehouse
--Вывести данные о поставках и поставщиках, включая тех, у кого нет поставок:
SELECT *
FROM Invoice_In
RIGHT JOIN Supplier ON Invoice_In.supplier_id = Supplier.id_supplier

--Полное внешнее соединение:
--Вывести данные о лекарствах и складах, включая те, на которых нет лекарств, а также склады, на которых нет лекарств:
SELECT *
FROM Drug
FULL OUTER JOIN Warehouse ON Drug.warehouse_id = Warehouse.id_warehouse
--Вывести данные о поставках и поставщиках, включая тех, у кого нет поставок, а также тех, кто не поставлял лекарства:
SELECT *
FROM Invoice_In
FULL OUTER JOIN Supplier ON Invoice_In.supplier_id = Supplier.id_supplier
