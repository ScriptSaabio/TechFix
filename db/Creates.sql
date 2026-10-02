return
-- =========================================
-- DROP DAS TABELAS
-- =========================================

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS ordem_servico;

DROP TABLE IF EXISTS equipamento;

DROP TABLE IF EXISTS servico;

DROP TABLE IF EXISTS pecas;

DROP TABLE IF EXISTS situacao;

DROP TABLE IF EXISTS categoria;

DROP TABLE IF EXISTS cliente;

DROP TABLE IF EXISTS modelo;

DROP TABLE IF EXISTS tipo;

DROP TABLE IF EXISTS marca;

DROP TABLE IF EXISTS funcionario;

DROP TABLE IF EXISTS cargo;

PRAGMA foreign_keys = ON;

return

-- =========================================
-- TABELA: cargo
-- =========================================

CREATE TABLE cargo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
) STRICT;


-- =========================================
-- TABELA: funcionario
-- =========================================

CREATE TABLE funcionario (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    id_cargo INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_cargo)
        REFERENCES cargo(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    UNIQUE(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: cliente
-- =========================================

CREATE TABLE cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    telefone TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL
        CHECK(id_funcionario_cargo = 1 OR id_funcionario_cargo = 2),
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: marca
-- =========================================

CREATE TABLE marca (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL
        CHECK(id_funcionario_cargo = 1 OR id_funcionario_cargo = 2),
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: tipo
-- =========================================

CREATE TABLE tipo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL
        CHECK(id_funcionario_cargo = 1 OR id_funcionario_cargo = 2),
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: modelo
-- =========================================

CREATE TABLE modelo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL
        CHECK(id_funcionario_cargo = 1 OR id_funcionario_cargo = 2),
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: equipamento
-- =========================================

CREATE TABLE equipamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    id_marca INTEGER NOT NULL,
    id_modelo INTEGER NOT NULL,
    id_tipo INTEGER NOT NULL,
    serial_number TEXT NOT NULL,
    imei TEXT NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL
        CHECK(id_funcionario_cargo = 1 OR id_funcionario_cargo = 2),
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL
        DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo),

    FOREIGN KEY (id_marca)
        REFERENCES marca(id),

    FOREIGN KEY (id_modelo)
        REFERENCES modelo(id),

    FOREIGN KEY (id_tipo)
        REFERENCES tipo(id),

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id)
) STRICT;


-- =========================================
-- TABELA: categoria
-- =========================================

CREATE TABLE categoria (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL COLLATE NOCASE UNIQUE,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL,
    data_cadastro TEXT NOT NULL
        DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: situacao
-- =========================================

CREATE TABLE situacao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL COLLATE NOCASE UNIQUE,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL
        DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: servico
-- =========================================

CREATE TABLE servico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_servico TEXT NOT NULL COLLATE NOCASE UNIQUE,
    id_categoria INTEGER NOT NULL,
    preco_base INTEGER NOT NULL,
    horas_trabalho REAL NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL
        DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_categoria)
        REFERENCES categoria(id),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: pecas
-- =========================================

CREATE TABLE pecas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_peca TEXT NOT NULL COLLATE NOCASE UNIQUE,
    id_categoria INTEGER NOT NULL,
    preco_compra INTEGER NOT NULL,
    preco_venda INTEGER NOT NULL,
    estoque_atual INTEGER NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_funcionario_cargo INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL
        DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_categoria)
        REFERENCES categoria(id),

    FOREIGN KEY (id_funcionario, id_funcionario_cargo)
        REFERENCES funcionario(id, id_cargo)
) STRICT;


-- =========================================
-- TABELA: ordem_servico
-- =========================================

CREATE TABLE ordem_servico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_equipamento INTEGER NOT NULL,
    id_funcionario_abertura INTEGER NOT NULL,
    id_funcionario_cargo_abertura INTEGER NOT NULL,
    data_abertura TEXT NOT NULL
        DEFAULT (datetime('now', 'localtime')),
    data_fechamento TEXT,
    descricao_defeito TEXT NOT NULL,
    defeito_relato TEXT NOT NULL,
    relatorio_tecnico TEXT,
    status_atual INTEGER NOT NULL,
    valor_total INTEGER NOT NULL,
    id_tecnico_abertura INTEGER NOT NULL
        CHECK (id_tecnico_abertura = 3),

    FOREIGN KEY (id_equipamento)
        REFERENCES equipamento(id),

    FOREIGN KEY (
        id_funcionario_abertura,
        id_funcionario_cargo_abertura
    )
        REFERENCES funcionario(id, id_cargo),

    FOREIGN KEY (status_atual)
        REFERENCES situacao(id),

    FOREIGN KEY (id_tecnico_abertura)
        REFERENCES funcionario(id)
) STRICT;