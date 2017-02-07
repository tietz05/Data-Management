--James Tietz		2/5/2017		Lab 3

--1) 
SELECT ordNumber, totalUSD
FROM Orders;

	
--2)
SELECT name, city
FROM Agents
WHERE name = 'Smith';


--3)
SELECT pid, name, priceUSD
FROM Products
WHERE quantity > 200100;


--4) 
SELECT name, city
FROM Customers
WHERE city = 'Duluth';


--5)
SELECT name
FROM Agents
WHERE city <> 'New York'
  AND city <> 'Duluth';


--6)
SELECT * FROM Products
WHERE city <> 'Dallas'
  AND city <> 'Duluth'
  AND priceUSD >= 1;


--7)
SELECT * FROM Orders
WHERE month = 'May'
   OR month = 'Feb';


--8) 
SELECT * FROM Orders
WHERE month = 'Feb'
  AND totalUSD >= 600;


--9)
SELECT * FROM Customers, Orders
WHERE Customers.cid = Orders.cid
  AND Customers.cid = 'c005';

