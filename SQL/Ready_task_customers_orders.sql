Исходные данные: есть 2 таблицы customers и orders с соответствующим набором полей. Структура таблиц и значения полей указаны ниже:
CREATE TABLE Customers (
   CustomerID varchar(50) not null,
   CompanyName varchar(50) not null,
   Address varchar(50) not null,
   City varchar(50) not null,
   Country varchar(50) not null,
   PRIMARY KEY (CustomerID)
   );							

INSERT INTO Customers (CustomerID, CompanyName, Address, City, Country)  
VALUES ('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany'), 
('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico'),
('ANTON', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', 'Mexico'),
('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK'),
('BERGS', 'Berglunds snabbköp', 'Berguvsvägen  8', 'BLuleå', 'Sweden'),
('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany'),
('BLONP', 'Blondesddsl père et fils', '24, place Kléber', 'StrasbourgCity', 'France'),
('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'MadridCity', 'Spain')

CREATE TABLE Orders (
   OrderID integer not null,
   CustomerID varchar(50) not null,
   OrderDate date not null,
   OrderSum integer not null,
   PRIMARY KEY (OrderID)
   );

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderSum)  
VALUES (10355, 'AROUT', '11/15/1996', 10000),
(10365, 'ANTON', '11/27/1996', 15000), 
(10381, 'LILAS', '12/12/1996', 20000),
(10436, 'BLONP', '02/05/1997', 17500),
(10442, 'ERNSH', '02/11/1997', 20000),
(10449, 'BLONP', '02/18/1997', 10000),
(10453, 'AROUT', '02/21/1997', 15000)

Необходимо написать запросы, которые будут выводить следующую информацию:
Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 

SELECT CompanyName FROM customers
WHERE CustomerID = (SELECT CustomerID FROM Orders WHERE OrderDate NOT BETWEEN to_date('15-11-1996','dd-mm-yyyy') AND to_date('18-02-1997','dd-mm-yyyy'));

Вывести названия компаний поставщиков, которые находятся в México D.F.;

SELECT CompanyName FROM customers
WHERE City = 'México D.F';

Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;

SELECT OrderId From orders
Where OrderDate BETWEEN to_date ('12.12.1996', 'dd-mm-yyyy') AND to_date ('18.02.1997', 'dd-mm-yyyy');

Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;

SELECT CompanyName FROM customers
Where CompanyName LIKE 'An%';

Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.

SELECT q.CompanyName,
o.orderid
From Customers as q
Inner Join orders AS o ON q.CustomerID = o.CustomerID WHERE ordersum > 17000;

Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания

SELECT q.CompanyName,
o.ordersum
From Customers as q
Inner Join orders AS o ON q.CustomerID = o.CustomerID
ORDER BY q.Companyname DESC;


Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.
SELECT CompanyName,
orderdate
From Customers
LEFT Join orders ON Customers.CustomerID = Orders.CustomerID;
