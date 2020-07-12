USE AdventureWorks2012
Go

-------------------/// Take a look at the table [Sales].[CreditCard]

SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'CreditCard' AND table_schema = 'Sales';

-------------------/// Take a look at the table [Sales].[SalesOrderHeader]

SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'SalesOrderHeader' AND table_schema = 'Sales';


-------------------------------- My goal: Sales BY Credit Card

----------------------------------------------------
---------//////// USING INNER JOIN ////////---------
----------------------------------------------------

SELECT	ss.SubTotal,
		SC.CardType AS Flag
FROM [Sales].[SalesOrderHeader] AS ss
INNER JOIN [Sales].[CreditCard] AS sc
	ON ss.CreditCardID = sc.CreditCardID

-----30.334 ROWS

----------------------------------------------------
---------//////// USING LEFT JOIN ////////---------
----------------------------------------------------

SELECT	ss.SubTotal,
		SC.CardType AS Flag
FROM [Sales].[SalesOrderHeader] AS ss
LEFT JOIN [Sales].[CreditCard] AS sc
	ON ss.CreditCardID = sc.CreditCardID

-----31.465 ROWS

----------------------------------------------------
---------//////// USING RIGHT JOIN ////////---------
----------------------------------------------------

SELECT	ss.SubTotal,
		SC.CardType AS Flag
FROM [Sales].[SalesOrderHeader] AS ss
RIGHT JOIN [Sales].[CreditCard] AS sc
	ON ss.CreditCardID = sc.CreditCardID

-----31.068 ROWS

----------------------------------------------------
---------//////// USING FULL JOIN ////////---------
----------------------------------------------------

SELECT	ss.SubTotal,
		SC.CardType AS Flag
FROM [Sales].[SalesOrderHeader] AS ss
FULL JOIN [Sales].[CreditCard] AS sc
	ON ss.CreditCardID = sc.CreditCardID

-----32.199 ROWS
