DROP TABLE IF EXISTS inventory_movements;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    unit_price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE inventory_movements (
    movement_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT,
    movement_type VARCHAR(10) CHECK (movement_type IN ('in', 'out')),
    quantity INT NOT NULL,
    movement_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
