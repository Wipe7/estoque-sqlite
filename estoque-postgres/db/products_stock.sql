-- Script para criar as tabelas products e stock, inserir dados e realizar uma consulta combinada
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS products;
-- Criando a tabela products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    unit_price NUMERIC(10,2) NOT NULL
);
-- Criando a tabela stock
CREATE TABLE stock (
    stock_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Inserindo dados na tabela products
INSERT INTO products (name, description, unit_price) VALUES
('Monitor 24"', 'Full HD com entrada HDMI e VGA', 899.90),
('Teclado Mecânico', 'Switch Blue, retroiluminado RGB', 320.00),
('Mouse Gamer', 'Sensor óptico 16000 DPI com LED', 150.00);

-- Vinculando produtos ao estoque
INSERT INTO stock (product_id, quantity) VALUES
(1, 15),
(2, 30),
(3, 50);

-- Consulta combinada com JOIN
SELECT
    p.product_id,
    p.name,
    p.unit_price,
    s.quantity,
    s.last_updated
FROM products p
INNER JOIN stock s ON p.product_id = s.product_id;
