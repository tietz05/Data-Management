--James Tietz			CMPT308				2/19/2017

--1)

Select Distinct	
Agents.city

From
Orders, Agents

Where
Agents.aid = Orders.aid
	     and Orders.cid = 'c006';
	
	
--2)

Select Distinct	
One.pid
	
From
Orders One, (Select Distinct
					aid
			From
				Orders, Customers
			Where
				Orders.cid = Customers.cid
		 	 			 and Customers.city = 'Kyoto') Two

Where
One.aid = Two.aid

Order By One.pid DESC;


--3)

Select
name

From
Customers

Where
cid not =any (Select Distinct
				cid
		    From
		 		Orders);


--4)

Select Distinct
Customers.name

From
Customers

Left Outer Join Orders
On
Customers.cid = Orders.cid

Where
Orders.cid Is Null;


--5)

Select Distinct
Customers.name, Agents.name

From
Agents, Orders, Customers

Where
	Customers.cid = Orders.cid
And Agents.aid = Orders.aid
And Customers.city = Agents.city;

	
--6)

Select Distinct
Customers.name, Agents.name

From
Orders

Full Outer Join Customers
On
Customers.cid = Orders.cid

Full Outer Join Agents 
On
Agents.aid = Orders.aid

Where
Customers.city = Agents.city;


--7)
	  
Select
Customers.name, Customers.city

From
Customers, (Select
			city, Count (*)
			From
				Products
			Group By 
				city
		 	Order By 
		 		count ASC
	 		Limit 1) limited
Where
	Customers.city = limited.city;
	
	