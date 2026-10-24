-- VIEWS: consultas salvas
-- Peça baixada por Descarte por Defeito/Avaria

-- ==========================================

-- 3. VIEWS E CONSULTAS DE TESTE

-- ==========================================

CREATE VIEW vw_preco_venda_maior_100 AS

SELECT

	id,

	nome_peca,

	preco_venda AS 'preço',

	estoque_atual

FROM

	peca

WHERE

	preco_venda >= 10000;

CREATE VIEW vw_estoque_baixo AS

SELECT

	id,

	nome_peca,

	estoque_atual

FROM

	peca

WHERE

	estoque_atual <= 20

ORDER BY

	estoque_atual DESC;
