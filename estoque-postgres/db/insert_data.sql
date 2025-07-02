INSERT INTO customers (name, email, phone, address) VALUES
('Ana Silva', 'ana.silva@email.com', '11999999999', 'Rua A, 100'),
('Bruno Costa', 'bruno.costa@email.com', '21988888888', 'Rua B, 200'),
('Carla Mendes', 'carla.mendes@email.com', '31977777777', 'Rua C, 300');

INSERT INTO products (name, description, unit_price, stock_quantity) VALUES
('Notebook', 'Notebook i5, 8GB RAM', 3200.00, 10),
('Mouse', 'Mouse óptico USB', 45.50, 50),
('Teclado', 'Teclado mecânico RGB', 250.00, 20);

INSERT INTO inventory_movements (product_id, customer_id, movement_type, quantity) VALUES
(1, NULL, 'in', 5),
(2, 1, 'out', 2),
(3, 2, 'out', 1);
