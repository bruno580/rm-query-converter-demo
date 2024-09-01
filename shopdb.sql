CREATE DATABASE shopDB;
USE shopDB;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    name VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (username, name, lastname, email) VALUES
('jdoe', 'John', 'Doe', 'john.doe@example.com'),
('jsmith', 'Jane', 'Smith', 'jane.smith@example.com'),
('bjackson', 'Bob', 'Jackson', 'bob.jackson@example.com');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-08-20', 200.00),
(2, '2024-08-21', 150.00),
(3, '2024-08-22', 100.00);

INSERT INTO order_details (order_id, product_name, quantity, price) VALUES
(1, 'Laptop', 1, 200.00),
(2, 'Smartphone', 1, 150.00),
(3, 'Tablet', 1, 100.00);

-- Sample queries
-- Get all orders and corresponding customer details 
SELECT o.order_id, o.order_date, o.total_amount, c.name, c.lastname
FROM orders o
JOIN customers c ON o.customer_id = c.id;

-- Total revenue
SELECT 
    SUM(od.quantity * od.price) AS total_revenue,
    od.product_name
FROM 
    order_details od
GROUP BY 
    od.product_name
ORDER BY 
    total_revenue DESC;