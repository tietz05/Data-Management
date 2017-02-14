--James Tietz		2/10/2017		LAB 4		CMPT308


--1)

Select
city

From
Agents

Where
aid =any (Select Distinct
			aid
		From
			Orders
		Where cid in ('c006'));
	

--2)

Select Distinct
pid

From
Orders

Where
aid =any (Select Distinct
		From
			Orders
		 Where
			cid =any (Select
					cid
				 From
					Customers
				 Where city in ('Kyoto'))) 
Order By pid DESC;


--3) 

Select
cid, name

From
Customers

Where
cid =Any (Select Distinct
			cid
		 From
		 	Orders
		 Where aid not in ('a01'));


--4) 

Select Distinct
cid

From
Customers

Where
cid =any (Select DISTINCT
			cid
		 From
			Orders
		 Where pid in ('p01'));
And

cid =any (Select Distinct
			cid
		 From
			Orders
		 Where pid in ('p07'));
			

--5) 

Select
pid

From
Products

Where
pid not =any (Select
				cid
			From
				Orders
			Where aid in ('a08'));
Order by pid DESC;


--6)

Select
name, discount, city

From
Customers

Where
cid =any (Select Distinct
			cid
		 From
			Orders
		 Where
			aid =any (Select
						aid
				 	From
						Agents
					 Where city in ('Tokyo','New York'));

--7) 

Select *
From
Customers

Where
discount =any (select
				discount
			 From
				Customers
			 Where city in ('Duluth','Tokyo'));
			
					
					
					
--8) A check constraint specifies a requirement that must be met by each row. It must be a Boolean
 --meaning either true, false or unknown. It can also refer to multiple columns, or a single column 
 --alone. It can be used to limit the value range that can be placed in a column. Let’s say that you
 --have a list of a players and each player has gold, you can put a check constraint on the gold saying 
 --that you have greater than 0 of whatever the player has. If a player uses up all of its currency, he 
 --will never have negative gold. A bad use of check constraints would be if you were to use them in 
 --columns that weren’t meant to be similar. Such as numbers varying from positive to negative.