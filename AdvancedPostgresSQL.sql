-- VIEWs
CREATE VIEW total_revenue_per_customer AS
SELECT customers.first_name, customers.last_name, SUM(items.price) FROM customers
INNER JOIN purchases ON customers.id= purchases.customer_id
INNER JOIN items ON purchases.item_id = items.id
GROUP BY customers.id;

SELECT * FROM total_revenue_per_customer;
DROP VIEW total_revenue_per_customer;

CREATE VIEW total_revenue_per_customer AS
SELECT customers.id, customers.first_name, customers.last_name, SUM(items.price) FROM customers
INNER JOIN purchases ON customers.id= purchases.customer_id
INNER JOIN items ON purchases.item_id = items.id
GROUP BY customers.id;

INSERT INTO purchases
VALUES (11, 6, 5)

SELECT * FROM total_revenue_per_customer;

CREATE VIEW awesome_customer AS
SELECT * FROM total_revenue_per_customer WHERE sum > 150;

SELECT * FROM awesome_customer ORDER BY sum DESC;

CREATE VIEW expensive_items AS
SELECT * FROM items WHERE price > 100;

SELECT * FROM expensive_items;

INSERT INTO expensive_items(id, name, price)
VALUES (9, 'DLSR', 400.00);

INSERT INTO expensive_items(id, name, price)
VALUES (10, 'Pencil', 2.00);

SELECT * FROM items;

DROP VIEW expensive_items;

CREATE VIEW expensive_items AS
SELECT * FROM items WHERE price >= 100
WITH LOCAL CHECK OPTION;

INSERT INTO expensive_items(id, name, price)
VALUES (11, 'Pencil', 100.00);


SELECT * FROM items WHERE price > 100;

CREATE VIEW expensive_items AS
SELECT * FROM items WHERE price >= 100;

CREATE VIEW non_luxury_items AS
SELECT * FROM expensive_items where price < 10000
WITH LOCAL CHECK OPTION;

INSERT INTO non_luxury_items(id, name, price)
VALUES (12, 'Pencil', 2.00);

INSERT INTO non_luxury_items(id, name, price)
VALUES (13, 'Pencil', 10000.00);

DROP VIEW non_luxury_items;

CREATE VIEW non_luxury_items AS
SELECT * FROM expensive_items where price < 10000
WITH CASCADED CHECK OPTION;

INSERT INTO non_luxury_items(id, name, price)
VALUES (13, 'Pencil', 2.00);

-- built-in functions and the HAVING construct
-- average items 
SELECT AVG(items.price) FROM items;

-- average items sold
SELECT AVG(items.price) FROM items
INNER JOIN purchases ON items.id = purchases.item_id;

-- highest revenue sale solution 1
SELECT items.name, items.price FROM items
INNER JOIN purchases ON items.id = purchases.item_id
ORDER BY items.price DESC
LIMIT 1;

-- highest revenue sale solution 2
SELECT MAX(items.price) FROM items
INNER JOIN purchases ON items.id = purchases.item_id;

-- HAVING construct
-- customers having more than 3 purchases
SELECT customers.first_name, customers.last_name, COUNT(purchases.id) AS purchase_count
FROM customers
INNER JOIN purchases ON customers.id = purchases.customer_id
GROUP BY customers.id
HAVING COUNT(purchases.id)>3;


-- DATES (old problem)
-- ISO 8601
SELECT timestamp '2005-10-10 05:16:45.789';

-- Cconverting time stamp into a readable string
SELECT NOW();

SELECT TO_CHAR(NOW(), 'DD-MM-YYYY');
