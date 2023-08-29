--15. Написать 4 запроса с использованием подзапросов, используя операторы сравнения, операторы IN, ANY|SOME и ALL, предикат EXISTS
--Выводит название и цену всех типов лекарств, цена которых выше средней цены всех лекарств.
SELECT name, price 
FROM Drug_Type
WHERE price > (SELECT AVG(price) FROM Drug_Type);
--Выводит название всех типов лекарств, которые поставляет поставщик с id 1.
SELECT name 
FROM Drug_Type
WHERE id_type IN (SELECT type_id FROM Drug WHERE supplier_id = 1);
--Выводит название и цену всех типов лекарств, цена которых не меньше цены самого дорогого антибиотика.
SELECT name, price 
FROM Drug_Type
WHERE price >= ALL(SELECT price FROM Drug_Type WHERE category = 'Антибиотик');
--Выводит название всех производителей, которые производят хотя бы один безрецептурный лекарственный препарат.
SELECT name 
FROM Manufacturer
WHERE id_manufacturer = ANY(SELECT manufacturer_id FROM Drug_Type WHERE over_the_counter = 1);
--Выводит название всех филиалов, у которых есть склад с вместимостью больше 1000 единиц.
SELECT name 
FROM Branch b
WHERE EXISTS(SELECT * FROM Warehouse w WHERE w.branch_id = b.id_branch AND w.capacity > 1000);
