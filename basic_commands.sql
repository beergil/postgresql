-- SELECT command
SELECT * FROM customers;
SELECT customers.first_name, customers.last_name FROM customers;
SELECT customers.first_name AS "Fist name", customers.last_name AS "Last name" FROM customers;

-- Filtering SELECT command with WHERE
SELECT customers.first_name, customers.last_name FROM customers
WHERE customers.first_name = 'Rolf';

SELECT customers.first_name, customers.last_name FROM customers
WHERE customers.first_name = 'Rolf' OR customers.last_name = 'Watson';

-- Limiting the number of results
SELECT customers.first_name, customers.last_name FROM customers LIMIT 1;

-- Updating data in a table
UPDATE items SET price = 4.00 WHERE id=3;

-- Deleting data from table
DELETE FROM purchases WHERE item_id=1;
DELETE FROM items WHERE id=4;

-- SQL Wildcards for filtering unknowns
-- '%' show everything 
SELECT * FROM customers WHERE last_name LIKE '%';
-- '____' strictly show record with 4 characters only. note: '_' means one character
SELECT * FROM customers WHERE last_name LIKE '____';
-- '%t%' any number of characters before and after character 't'
SELECT * FROM customers WHERE last_name LIKE '%t%';
-- '%t_' any characters before 't' and strictly 1 character after 't'
SELECT * FROM customers WHERE last_name LIKE '%t_';

-- JOIN Command
-- JOINs are like Sets
-- INTERSECT Set intersection is the elements common to two sets
-- SQL INNER JOIN is akin to Set intersection
-- INNER JOIN selects rows from table1 and table2 where they match the selecting column
SELECT * FROM Customers
	INNER JOIN Orders
ON Customers.ID = Orders.Customer.ID;

-- LEFT JOIN selects all rows from the table1, on the left, the rows from the table2, on the right, if they match
-- if they don't match, the data for the right table is blank
SELECT * FROM Customers
	LEFT JOIN Orders
ON Customers.ID = Orders.Customer.ID;

-- RIGHT JOIN selects all the rows from the table on the right, and then the rows from the table on the left if they match
-- Opposite to LEFT JOIN
-- If they don't match, the data for the table on the left is blank
SELECT * FROM Customers
	RIGHT JOIN Orders
ON Customers.ID = Orders.Customer.ID;

-- FULL JOIN selects all rows from both tables, matching them if there is a match on the selecting column
SELECT * FROM Customers
	FULL JOIN Orders
ON Customers.ID = Orders.Customer.ID;

-- JOIN Examples
-- get items that has been bought
SELECT * FROM items INNER JOIN purchases ON items.id = purchases.item_id;

-- get items that has been bought and not yet sold
SELECT * FROM items LEFT JOIN purchases ON items.id = purchases.item_id;
SELECT * FROM purchases RIGHT JOIN items ON items.id = purchases.item_id;

-- which customers had purchases
SELECT * FROM customers INNER JOIN purchases ON customers.id = purchases.customer_id;
SELECT customers.first_name, customers.last_name FROM customers INNER JOIN purchases ON customers.id = purchases.customer_id;
-- -- which customers had and no purchases 
SELECT * FROM customers LEFT JOIN purchases ON customers.id = purchases.customer_id;

--Joining 2 tables
SELECT * FROM items
INNER JOIN purchases ON items.id = purchases.item_id;

--Joining 3 tables
SELECT * FROM items
INNER JOIN purchases ON items.id = purchases.item_id
INNER JOIN customers ON purchases.customer_id = customers.id;

-- Group by
-- how many items did the customers have purchased?
SELECT customers.first_name, customers.last_name, COUNT(purchases.id) FROM customers 
LEFT JOIN purchases ON customers.id = purchases.customer_id
GROUP BY customers.id;

-- how much did the customers have spent?
SELECT customers.first_name, customers.last_name, SUM(items.price) FROM items 
INNER JOIN purchases ON items.id = purchases.item_id
INNER JOIN customers ON purchases.customer_id = customers.id
GROUP BY customers.id;

-- Order by / sorting data