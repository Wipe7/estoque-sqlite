-- Script para análise de desempenho de consultas com e sem índice no PostgreSQL

-- 1. Criação da tabela simples
CREATE TABLE test_indexing (
    id SERIAL,
    name TEXT
);

-- 2. Inserção de 500.000 registros
INSERT INTO test_indexing(name)
SELECT 'bob' FROM generate_series(1, 250000);

INSERT INTO test_indexing(name)
SELECT 'alice' FROM generate_series(1, 250000);

-- 3. Consulta com análise de plano SEM índice
EXPLAIN ANALYZE
SELECT * FROM test_indexing WHERE id = 2;

-- RESULTADO SEM ÍNDICE:
-- Seq Scan on test_indexing  (cost=0.00..9467.00 rows=1 width=36)
-- Filter: (id = 2)
-- Rows Removed by Filter: 499999
-- Planning Time: 0.060 ms
-- Execution Time: 95.500 ms

-- 4. Criação de índice no campo "id"
CREATE INDEX test_idx_ebac ON test_indexing(id);

-- 5. Consulta com análise de plano COM índice
EXPLAIN ANALYZE
SELECT * FROM test_indexing WHERE id = 2;

-- RESULTADO COM ÍNDICE:
-- Index Scan using test_idx_ebac on test_indexing  (cost=0.14..8.16 rows=1 width=36)
-- Index Cond: (id = 2)
-- Planning Time: 0.080 ms
-- Execution Time: 0.030 ms
