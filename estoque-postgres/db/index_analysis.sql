-- Script para análise de desempenho de consultas com e sem índice no PostgreSQL

-- Etapa 1: EXPLAIN ANALYZE 
-- Executa uma busca por nome e analisa o plano de execução
EXPLAIN ANALYZE
SELECT * FROM customers
WHERE name = 'Ana Silva';

-- Etapa 2: Criação de índice no campo "name" da tabela customers
CREATE INDEX idx_customers_name
ON customers(name);

-- Etapa 3: EXPLAIN ANALYZE novamente para verificar a diferença de desempenho
EXPLAIN ANALYZE
SELECT * FROM customers
WHERE name = 'Ana Silva';
