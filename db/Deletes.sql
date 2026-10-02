
-- =========================================
-- DELETE DOS DADOS
-- =========================================

PRAGMA foreign_keys = OFF;

DELETE FROM ordem_servico;

DELETE FROM equipamento;

DELETE FROM servico;

DELETE FROM pecas;

DELETE FROM situacao;

DELETE FROM categoria;

DELETE FROM cliente;

DELETE FROM modelo;

DELETE FROM tipo;

DELETE FROM marca;

DELETE FROM funcionario;

DELETE FROM cargo;

PRAGMA foreign_keys = ON;