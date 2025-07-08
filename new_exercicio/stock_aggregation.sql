-- Banco de dados: stock_aggregation
-- Autor: [William]

-- DDL - Estrutura das tabelas
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS product;

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    created_date TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE stock (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- DML - Inserção de dados fictícios
INSERT INTO product (name) VALUES 
('celular'),
('livro'),
('tablet'),
('notebook'),
('roteador');

INSERT INTO stock (product_id, quantity) VALUES
(1, 5),
(2, 3),
(3, 0),
(4, 1),
(5, 0);

-- AGREGAÇÃO - Soma da quantidade por produto com JOIN
SELECT
    p.name AS product_name,
    SUM(s.quantity) AS total_quantity
FROM product p
INNER JOIN stock s ON p.product_id = s.product_id
GROUP BY p.name
ORDER BY total_quantity DESC;

-- TOTAL GERAL DE ITENS EM ESTOQUE
SELECT SUM(quantity) AS total_stock_items FROM stock;
