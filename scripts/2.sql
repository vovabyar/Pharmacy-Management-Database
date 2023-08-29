CREATE DATABASE Pharmacy
ON PRIMARY (
    NAME = 'PharmacyData',
    FILENAME = 'C:\MSSQL\Data\PharmacyData.mdf',
    SIZE = 100MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 100MB
)
LOG ON (
    NAME = 'PharmacyLog',
    FILENAME = 'C:\MSSQL\Logs\PharmacyLog.ldf',
    SIZE = 100MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 100MB
);
GO

USE Pharmacy;
GO

CREATE TABLE Manufacturer (
    id_manufacturer INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Supplier (
    id_supplier INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    account VARCHAR(20) NOT NULL,
    inn VARCHAR(12) NOT NULL,
    address VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Branch (
    id_branch INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Customer (
    id_customer INT PRIMARY KEY IDENTITY(1,1),
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);
GO

CREATE TABLE Drug_Type (
    id_type INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    manufacturer_id INT NOT NULL,
    expiry_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    over_the_counter BIT NOT NULL,
    CONSTRAINT fk_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(id_manufacturer)
);
GO

CREATE TABLE Warehouse (
    id_warehouse INT PRIMARY KEY IDENTITY(1,1),
    capacity INT NOT NULL,
    branch_id INT NOT NULL,
    CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES Branch(id_branch)
);
GO

CREATE TABLE Drug (
    id_drug INT PRIMARY KEY IDENTITY(1,1),
    supplier_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    type_id INT NOT NULL,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES Supplier(id_supplier),
    CONSTRAINT fk_warehouse FOREIGN KEY (warehouse_id) REFERENCES Warehouse(id_warehouse),
    CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES Drug_Type(id_type)
);
GO

CREATE TABLE Invoice_In (
    number INT PRIMARY KEY,
    date DATE NOT NULL,
    supplier_id INT NOT NULL,
    branch_id INT NOT NULL,
    drug_id INT NOT NULL,
    CONSTRAINT fk_supplier_in FOREIGN KEY (supplier_id) REFERENCES Supplier(id_supplier),
    CONSTRAINT fk_branch_in FOREIGN KEY (branch_id) REFERENCES Branch(id_branch),
    CONSTRAINT fk_drug_in FOREIGN KEY (drug_id) REFERENCES Drug(id_drug)
);
GO

CREATE TABLE Invoice_Out (
    number INT PRIMARY KEY,
    date DATE NOT NULL,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    drug_id INT NOT NULL,
    CONSTRAINT fk_customer_out FOREIGN KEY (customer_id) REFERENCES Customer(id_customer),
    CONSTRAINT fk_branch_out FOREIGN KEY (branch_id) REFERENCES Branch(id_branch),
    CONSTRAINT fk_drug_out FOREIGN KEY (drug_id) REFERENCES Drug(id_drug)
);
GO

INSERT INTO Manufacturer (name, address, phone, email)
VALUES
('ООО "РосФарма"', 'ул. Ленина, д. 5', '+7 (495) 123-45-67', 'info@rospharma.ru'),
('ООО "Медицина-Сервис"', 'пр. Невский, д. 10', '+7 (812) 234-56-78', 'medservice@gmail.com'),
('ООО "Аптечная сеть №1"', 'ул. Кирова, д. 15', '+7 (383) 345-67-89', 'apteka1@mail.ru'),
('ООО "Здоровый образ жизни"', 'ул. Мира, д. 20', '+7 (343) 456-78-90', 'zdorovieekb@yandex.ru'),
('ОАО "Фармакон"', 'ул. Пушкина, д. 25', '+7 (843) 567-89-01', 'pharmakon@mail.ru'),
('ООО "ФармСтандарт"', 'ул. Гагарина, д. 30', '+7 (863) 678-90-12', 'farmstandart@gmail.com'),
('ООО "МедТехника"', 'ул. Ленина, д. 50', '+7 (347) 789-01-23', 'medtechnika@mail.ru'),
('ООО "Здоровье нации"', 'ул. Светланская, д. 35', '+7 (423) 890-12-34', 'zdnacie@list.ru'),
('ООО "ВиталМед"', 'ул. Куйбышева, д. 55', '+7 (846) 901-23-45', 'vitalmed@yandex.ru'),
('ООО "ФармаТрейд"', 'ул. Лермонтова, д. 40', '+7 (381) 234-56-78', 'pharmatrade@mail.ru');

INSERT INTO Supplier (name, account, inn, address) VALUES
('ООО "Медфарм"', '40702810400000000123', '123456789012', 'ул. Ленина, д. 10'),
('ООО "ФармСнаб"', '40702810400000000234', '234567890123', 'пр. Невский, д. 100'),
('ИП Иванов И.И.', '40817810000000000123', '345678901234', 'ул. Гоголя, д. 5'),
('ОАО "Здравлек"', '30101810400000000234', '456789012345', 'ул. Кремлевская, д. 15'),
('ИП Петров П.П.', '40817810000000000345', '567890123456', 'ул. Лермонтова, д. 20'),
('ООО "ФармаСервис"', '40702810400000000456', '678901234567', 'пр. Лермонтова, д. 25'),
('ИП Сидорова Е.В.', '40817810000000000567', '789012345678', 'ул. Пушкина, д. 30'),
('ООО "МедТехника"', '40702810400000000678', '890123456789', 'ул. Кирова, д. 35'),
('ООО "Фармацевт"', '40702810400000000789', '901234567890', 'ул. Ленинградская, д. 40'),
('ИП Новикова О.А.', '40817810000000000890', '012345678901', 'ул. Карла Маркса, д. 45');

INSERT INTO Branch (name, address, phone, email) VALUES 
('Первая аптека', 'ул. Ленина, 10', '+7 (495) 123-45-67', 'info@apteka1.ru'),
('Вторая аптека', 'ул. Пушкина, 5', '+7 (495) 234-56-78', 'info@apteka2.ru'),
('Третья аптека', 'ул. Гагарина, 15', '+7 (495) 345-67-89', 'info@apteka3.ru'),
('Четвертая аптека', 'ул. Жуковского, 20', '+7 (495) 456-78-90', 'info@apteka4.ru'),
('Пятая аптека', 'ул. Московская, 25', '+7 (495) 567-89-01', 'info@apteka5.ru'),
('Шестая аптека', 'ул. Первомайская, 30', '+7 (495) 678-90-12', 'info@apteka6.ru'),
('Седьмая аптека', 'ул. Октябрьская, 35', '+7 (495) 789-01-23', 'info@apteka7.ru'),
('Восьмая аптека', 'ул. Кирова, 40', '+7 (495) 890-12-34', 'info@apteka8.ru'),
('Девятая аптека', 'ул. Ленинградская, 45', '+7 (495) 901-23-45', 'info@apteka9.ru'),
('Десятая аптека', 'ул. Революции, 50', '+7 (495) 012-34-56', 'info@apteka10.ru');

INSERT INTO Customer (full_name, phone) VALUES
('Шевцов Евгений Олегович', '123-456-7890'),
('Иванов Иван Иванович', '456-789-1230'),
('Сидорова Анна Ивановна', '789-123-4560'),
('Кузнецов Александр Александрович', '321-654-0987'),
('Федорова Елена Сергеевна', '654-987-3210'),
('Крылов Илья Викторович', '987-654-3210'),
('Шевцов Евгений Олегович', '234-567-8901'),
('Козлов Артем Алексеевич', '567-890-1234'),
('Медведева Надежда Анатольевна', '890-123-4567'),
('Никитина Ольга Владимировна', '432-109-8765');

INSERT INTO Drug_Type (name, category, manufacturer_id, expiry_date, price, over_the_counter) VALUES
('Анальгин', 'Анальгетик', 2, '2023-05-20', 25.00, 1),
('Валериана', 'Снотворное', 1, '2024-01-01', 15.50, 1),
('Аспирин', 'Противовоспалительное', 3, '2023-12-31', 12.75, 1),
('Парацетамол', 'Анальгетик', 4, '2023-09-15', 18.90, 1),
('Ингавирин', 'Противовирусное', 5, '2024-03-01', 150.00, 0),
('Энтерол', 'Противодиарейное', 6, '2023-11-10', 50.00, 0),
('Но-шпа', 'Спазмолитик', 4, '2024-06-30', 20.50, 1),
('Цетрин', 'Антигистаминное', 7, '2023-08-20', 30.00, 1),
('Ципрофлоксацин', 'Антибиотик', 8, '2022-12-15', 70.00, 0),
('Корвалтабс', 'Кардиотоник', 9, '2024-02-01', 120.00, 0);

INSERT INTO Warehouse (capacity, branch_id)
VALUES
(1000, 1),
(500, 2),
(300, 3),
(800, 4),
(600, 5),
(1200, 6),
(900, 7),
(400, 8),
(700, 9),
(1100, 10);

INSERT INTO Drug (supplier_id, warehouse_id, type_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

INSERT INTO Invoice_In (number, date, supplier_id, branch_id, drug_id) VALUES 
(1001, '2022-03-01', 1, 1, 1),
(1002, '2022-03-02', 2, 2, 2),
(1003, '2022-03-03', 3, 3, 3),
(1004, '2022-03-04', 4, 4, 4),
(1005, '2022-03-05', 5, 5, 5),

(1006, '2022-03-06', 6, 6, 6),
(1007, '2022-03-07', 7, 7, 7),
(1008, '2022-03-08', 8, 8, 8),
(1009, '2022-03-09', 9, 9, 9),
(1010, '2022-03-10', 10, 10, 10);

INSERT INTO Invoice_Out (number, date, customer_id, branch_id, drug_id) VALUES 
(2001, '2022-03-01', 1, 1, 1),
(2002, '2022-03-02', 2, 2, 2),
(2003, '2022-03-03', 3, 3, 3),
(2004, '2022-03-04', 4, 4, 4),
(2005, '2022-03-05', 5, 5, 5),
(2006, '2022-03-06', 6, 6, 6),
(2007, '2022-03-07', 7, 7, 7),
(2008, '2022-03-08', 8, 8, 8),
(2009, '2022-03-09', 9, 9, 9),
(2010, '2022-03-10', 10, 10, 10);
