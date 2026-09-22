
return
-- =========================================
-- Ativa as chaves estrangeiras do SQLite
-- =========================================
PRAGMA foreign_keys = ON;

-- =========================================
-- TABELA: cargo
-- =========================================

CREATE TABLE cargo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
) Strict;


-- =========================================
-- TABELA: funcionario
-- =========================================

CREATE TABLE funcionario (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    id_cargo INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT s(datetime('now', 'localtime')),

    FOREIGN KEY (id_cargo)
        REFERENCES cargo(id) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE(id,id_cargo)
) Strict;

INSERT INTO cargo (Nome) VALUES ('Gerente'), ('Atendente'),('Técnico');

INSERT INTO funcionario (Nome, id_cargo)
VALUES
    ('Carlos Oliveira', 3),
    ('Rafael Santos', 3),
    ('Lucas Almeida', 3),
    ('Mariana Costa', 2),
    ('Juliana Souza', 2),
    ('Fernando Martins', 1);

SELECT * FROM Funcionario

-- =========================================
-- TABELA: cliente
-- =========================================

CREATE TABLE cliente (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    Nome TEXT NOT NULL,

    telefone TEXT NOT NULL UNIQUE,

    email TEXT NOT NULL UNIQUE,

    id_funcionario INTEGER NOT NULL,

    id_funcionario_cargo INTEGER NOT NULL,

    status INTEGER NOT NULL DEFAULT 1,

    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE

) STRICT;


-- =========================================
-- TABELA: marca
-- =========================================

CREATE TABLE marca (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    id_funcionario INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id)
) Strict;


-- =========================================
-- TABELA: tipo
-- =========================================

CREATE TABLE tipo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    id_funcionario INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id)
) Strict;

-- =========================================
-- TABELA: modelo
-- =========================================

CREATE TABLE modelo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL UNIQUE,
    id_funcionario INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id)
) Strict;


-- =========================================
-- TABELA: situacao
-- =========================================

CREATE TABLE situacao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
);


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
    status INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),

    FOREIGN KEY (id_marca)
        REFERENCES marca(id),

    FOREIGN KEY (id_modelo)
        REFERENCES modelo(id),

    FOREIGN KEY (id_tipo)
        REFERENCES tipo(id),

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id)
);


PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS equipamento;
DROP TABLE IF EXISTS modelo;
DROP TABLE IF EXISTS tipo;
DROP TABLE IF EXISTS marca;
DROP TABLE IF EXISTS situacao;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS cargo;

PRAGMA foreign_keys = ON;