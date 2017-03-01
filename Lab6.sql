--James Tietz			cMPT308			Lab 6: Interesting and Painful Queries

--1) 
Select
name, city
From 
customers
Where 
city in (Select city
		   From Products
		   Group By city
		   Order By count (*) DESc 
		   LIMIT 1);
		  	   


--2)
Select name 
From products 
Where priceUSD > (Select avg(priceUSD)
		  		  From products 
		  		 )

Order by name desc;


--3)
Select c.name,
	   o.pid, 
	   sum(o.totalUSD)
From customers c Inner Join orders o on c.cid = o.cid

Group by c.name, o.pid

Order by sum(o.totalUSD) desc;


--4)
Select c.name, sum (coalesce(O.totalUSD, 0))
From customers c 
	Left Join Orders O
	On c.cid = O.cid

Group By c.name;


--5)
Select c.name, 
	   p.name, 
	   a.name
From customers c 

Inner Join orders o on c.cid = o.cid
Inner Join products p on o.pid = p.pid
Inner Join agents a on a.aid = o.aid

Where a.city <> 'Newark';


--6) 
Select *
From (Select o.*, o.qty*p.priceusd*(1-(discount/100)) as realTotal
From orders o

Inner Join products p on o.pid = p.pid
Inner Join customers c on o.cid = c.cid) as tempTable

Where totalUSD != realTotal;


--7) A Left Outer Join returns all rows from the left table and the 
--   result for the right table will come back null because there will not
--   be any matches. In this querie you will see that Weyland from customers
--   shows up as a null value because he didnt place any orders.

Select *
From customers Left Outer Join orders on customers.cid = orders.cid;

--   A Right Outer Join is the same concept, just reversed. All result from 
--   the left tablel will come back null. This querie will also exclude Weyland.

Select *
From customers Right Outer Join orders on customers.cid = orders.cid;
