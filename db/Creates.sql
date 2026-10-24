-- ESTRUTURA: criação das tabelas (DDL)
-- ==========================================

-- 1. ESTRUTURA DAS TABELAS (DDL)

-- ==========================================

CREATE TABLE cargo (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_cargo TEXT NOT NULL COLLATE NOCASE UNIQUE,

	status INTEGER NOT NULL DEFAULT 1

) STRICT;

CREATE TABLE funcionario (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_funcionario TEXT NOT NULL COLLATE NOCASE,

	id_cargo INTEGER NOT NULL,

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY(id_cargo) REFERENCES cargo(id) ON

UPDATE

	CASCADE ON

	DELETE

		CASCADE,

		UNIQUE(id, id_cargo)

) STRICT;

CREATE TABLE categoria (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_categoria TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (id_funcionario_cargo = 1),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE cliente (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_cliente TEXT NOT NULL COLLATE NOCASE,

	email TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (

		id_funcionario_cargo = 1

	OR id_funcionario_cargo = 2

	),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE marca (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_marca TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (

		id_funcionario_cargo = 1

	OR id_funcionario_cargo = 2

	),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE modelo (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_modelo TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (

		id_funcionario_cargo = 1

	OR id_funcionario_cargo = 2

	),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE tipo (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_tipo TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (

		id_funcionario_cargo = 1

	OR id_funcionario_cargo = 2

	),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE equipamento(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	id_marca INTEGER NOT NULL,

	id_modelo INTEGER NOT NULL,

	id_tipo INTEGER NOT NULL,

	id_cliente INTEGER NOT NULL,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (

		id_funcionario_cargo = 1

		OR id_funcionario_cargo = 2

	),

	numero_serie TEXT DEFAULT(NULL) COLLATE NOCASE,

	imei TEXT DEFAULT(NULL) COLLATE NOCASE UNIQUE,

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_marca) REFERENCES marca(id),

	FOREIGN KEY (id_modelo) REFERENCES modelo(id),

	FOREIGN KEY (id_tipo) REFERENCES tipo(id),

	FOREIGN KEY (id_cliente) REFERENCES cliente(id),

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE peca (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_peca TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_categoria INTEGER NOT NULL,

	preco_venda INTEGER NOT NULL,

	estoque_atual INTEGER NOT NULL,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (id_funcionario_cargo = 1),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo),

	FOREIGN KEY (id_categoria) REFERENCES categoria(id)

) STRICT;

CREATE TABLE situacao (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_situacao TEXT NOT NULL COLLATE NOCASE UNIQUE,

	status INTEGER NOT NULL DEFAULT 1

) STRICT;

CREATE TABLE entrada_peca(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	id_peca INTEGER NOT NULL,

	preco_compra INTEGER NOT NULL,

	quantidade INTEGER NOT NULL,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (id_funcionario_cargo = 1),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	FOREIGN KEY (id_peca) REFERENCES peca(id),

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE saida_peca(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	id_peca INTEGER NOT NULL,

	preco_venda INTEGER NOT NULL,

	quantidade INTEGER NOT NULL,

	id_situacao INTEGER NOT NULL,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (id_funcionario_cargo = 1),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	FOREIGN KEY (id_peca) REFERENCES peca(id),

	FOREIGN KEY (id_situacao) REFERENCES situacao(id),

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE forma_pagamento(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_forma_pagamento TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (id_funcionario_cargo = 1),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE servico (

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	nome_servico TEXT NOT NULL COLLATE NOCASE UNIQUE,

	id_categoria INTEGER NOT NULL,

	preco INTEGER NOT NULL,

	horas_trabalho REAL NOT NULL,

	id_funcionario INTEGER NOT NULL,

	id_funcionario_cargo INTEGER NOT NULL CHECK (id_funcionario_cargo = 1),

	data_cadastro TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	status INTEGER NOT NULL DEFAULT 1,

	FOREIGN KEY (id_funcionario, id_funcionario_cargo) REFERENCES funcionario(id, id_cargo),

	FOREIGN KEY (id_categoria) REFERENCES categoria(id)

) STRICT;

CREATE TABLE ordem(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	id_equipamento INTEGER NOT NULL,

	defeito_relatado TEXT NOT NULL COLLATE NOCASE,

	defeito_constatado TEXT DEFAULT('') COLLATE NOCASE,

	data_abertura TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	data_fechamento TEXT,

	valor_total INTEGER,

	id_forma_pagamento INTEGER NOT NULL,

	id_funcionario_abertura INTEGER NOT NULL,

	id_funcionario_cargo_abertura INTEGER NOT NULL CHECK (

		id_funcionario_cargo_abertura = 1

		OR id_funcionario_cargo_abertura = 2

	),

	id_tecnico INTEGER NOT NULL,

	id_tecnico_cargo INTEGER NOT NULL CHECK (id_tecnico_cargo = 3),

	FOREIGN KEY (id_equipamento) REFERENCES equipamento(id),

	FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id),

	FOREIGN KEY (

		id_funcionario_abertura,

		id_funcionario_cargo_abertura

	) REFERENCES funcionario(id, id_cargo),

	FOREIGN KEY (id_tecnico, id_tecnico_cargo) REFERENCES funcionario(id, id_cargo)

) STRICT;

CREATE TABLE ordem_situacao(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	id_ordem INTEGER NOT NULL,

	id_nova_situacao INTEGER NOT NULL,

	id_funcionario INTEGER NOT NULL,

	data_situacao TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	FOREIGN KEY (id_ordem) REFERENCES ordem(id),

	FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),

	FOREIGN KEY (id_nova_situacao) REFERENCES situacao(id)

) STRICT;

CREATE TABLE ordem_peca(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	id_ordem INTEGER NOT NULL,

	id_peca INTEGER NOT NULL,

	preco INTEGER NOT NULL,

	quantidade INTEGER NOT NULL,

	data_saida TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	FOREIGN KEY (id_ordem) REFERENCES ordem(id),

	FOREIGN KEY (id_peca) REFERENCES peca(id)

) STRICT;

CREATE TABLE ordem_servico(

	id INTEGER PRIMARY KEY AUTOINCREMENT,

	id_ordem INTEGER NOT NULL,

	id_servico INTEGER NOT NULL,

	preco_praticado INTEGER NOT NULL,

	quantidade INTEGER NOT NULL,

	data_execucao TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),

	FOREIGN KEY (id_ordem) REFERENCES ordem(id),

	FOREIGN KEY (id_servico) REFERENCES servico(id)

) STRICT;
