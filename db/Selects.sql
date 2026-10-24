-- CONSULTAS: SELECTs e JOINs
-- Execução das consultas

SELECT

	*

FROM

	peca

WHERE

	preco_venda <= 10000;

SELECT

	*

FROM

	vw_preco_venda_maior_100;

SELECT

	*

FROM

	vw_estoque_baixo;

SELECT

	f.nome_funcionario AS *'nome'*,

	c.nome_cargo AS *'cargo'*

FROM

	funcionario f

JOIN cargo c ON

	f.id_cargo = c.id;

SELECT

	*

FROM

	ordem;

-- Informação consolidada das OS abertas

SELECT

	o.id AS *'ordem_serviço'*,

	m.nome_modelo AS *'modelo'*,

	o.defeito_constatado,

	o.defeito_relatado,

	fp.nome_forma_pagamento *'forma_pagto'*,

	f.nome_funcionario *'aberto_por'*,

	f2.nome_funcionario *'atendido_por'*

FROM

	ordem o

JOIN equipamento e ON

	o.id_equipamento = e.id

JOIN modelo m ON

	e.id = m.id

JOIN forma_pagamento fp ON

	o.id_forma_pagamento = fp.id

JOIN funcionario f ON

	o.id_funcionario_abertura = f.id

JOIN funcionario f2 ON

	o.id_tecnico = f2.id;

-- SELECT E JOIN PARA VERIFICAR O STATUS DE REPARO DE UM EQUIPAMENTO, COM FILTRO POR OS

SELECT

	os.id_ordem AS *'OS'*,

	m.nome_modelo AS *'Modelo'*,

	s.nome_situacao AS *"Situação"*,

	os.data_situacao AS *'Data'*

FROM

	ordem_situacao os

JOIN ordem o ON

	os.id_ordem = o.id

JOIN situacao s ON

	os.id_nova_situacao = s.id

JOIN equipamento e ON

	o.id_equipamento = e.id

JOIN modelo m ON

	e.id_modelo = m.id

WHERE

	os.id_ordem = 1;
