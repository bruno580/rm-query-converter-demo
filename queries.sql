-- Get email address from customer 1
SELECT email FROM customers WHERE id = 1;

-- Get email addresses from customers who have placed an order
SELECT email FROM customers 
WHERE id IN (SELECT customer_id FROM orders)
ORDER BY 1 ASC;

-- Find the "Top Buyer"
SELECT CONCAT(name," ",lastname) AS TopBuyer FROM customers 
WHERE id in (SELECT customer_id FROM orders 
   WHERE total_amount = (SELECT MAX(total_amount) FROM orders)
   )
ORDER BY 1 ASC;