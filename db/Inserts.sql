
-- =========================================
-- CARGOS
-- =========================================

INSERT INTO cargo (Nome)
VALUES
    ('Gerente'),
    ('Atendente'),
    ('Técnico');


-- =========================================
-- FUNCIONÁRIOS
-- =========================================

INSERT INTO funcionario (Nome, id_cargo)
VALUES
    ('Carlos Oliveira', 3),
    ('Rafael Santos', 3),
    ('Lucas Almeida', 3),
    ('Mariana Costa', 2),
    ('Juliana Souza', 2),
    ('Fernando Martins', 1);


-- =========================================
-- CLIENTES
-- =========================================

INSERT INTO cliente
    (Nome, telefone, email, id_funcionario, id_funcionario_cargo)
VALUES
    ('João Pereira', '11987654321', 'joao.pereira@email.com', 4, 2),
    ('Ana Beatriz', '11976543210', 'ana.beatriz@email.com', 5, 2),
    ('Marcos Ribeiro', '11965432109', 'marcos.ribeiro@email.com', 6, 1),
    ('Camila Fernandes', '11954321098', 'camila.fernandes@email.com', 4, 2),
    ('Pedro Henrique', '11943210987', 'pedro.henrique@email.com', 5, 2),
    ('Larissa Martins', '11932109876', 'larissa.martins@email.com', 6, 1);


-- =========================================
-- MARCAS
-- =========================================

INSERT INTO marca
    (Nome, id_funcionario, id_funcionario_cargo)
VALUES
    ('Dell', 6, 1),
    ('Lenovo', 4, 2),
    ('HP', 5, 2),
    ('Samsung', 6, 1),
    ('Apple', 4, 2),
    ('Motorola', 5, 2);


-- =========================================
-- TIPOS
-- =========================================

INSERT INTO tipo
    (Nome, id_funcionario, id_funcionario_cargo)
VALUES
    ('Notebook', 4, 2),
    ('Desktop', 5, 2),
    ('Smartphone', 6, 1),
    ('Tablet', 4, 2),
    ('Monitor', 5, 2),
    ('Impressora', 6, 1);


-- =========================================
-- MODELOS
-- =========================================

INSERT INTO modelo
    (Nome, id_funcionario, id_funcionario_cargo)
VALUES
    ('Inspiron 15', 4, 2),
    ('ThinkPad E14', 5, 2),
    ('Pavilion 15', 6, 1),
    ('Galaxy S24', 4, 2),
    ('iPhone 15', 5, 2),
    ('Moto G84', 6, 1),
    ('iPad 10', 4, 2),
    ('Galaxy Tab S9', 5, 2);


-- =========================================
-- EQUIPAMENTOS
-- =========================================

INSERT INTO equipamento
(
    Nome,
    id_marca,
    id_modelo,
    id_tipo,
    serial_number,
    imei,
    id_cliente,
    id_funcionario,
    id_funcionario_cargo
)
VALUES
    ('Notebook Dell Inspiron 15', 1, 1, 1, 'DLINS150001', '356789012345678', 1, 4, 2),
    ('Notebook Lenovo ThinkPad E14', 2, 2, 1, 'LNE140002', '356789012345679', 2, 5, 2),
    ('Notebook HP Pavilion 15', 3, 3, 1, 'HPPAV150003', '356789012345680', 3, 6, 1),
    ('Samsung Galaxy S24', 4, 4, 3, 'SGS240004', '356789012345681', 4, 4, 2),
    ('Apple iPhone 15', 5, 5, 3, 'IPH150005', '356789012345682', 5, 5, 2),
    ('Motorola Moto G84', 6, 6, 3, 'MOG840006', '356789012345683', 6, 6, 1),
    ('Apple iPad 10', 5, 7, 4, 'IPAD100007', '356789012345684', 1, 4, 2),
    ('Samsung Galaxy Tab S9', 4, 8, 4, 'SGTS90008', '356789012345685', 2, 5, 2);


-- =========================================
-- CATEGORIAS
-- =========================================

INSERT INTO categoria
    (Nome, id_funcionario, id_funcionario_cargo)
VALUES
    ('Manutenção de Computadores', 4, 2),
    ('Manutenção de Celulares', 5, 2),
    ('Manutenção de Tablets', 6, 1),
    ('Formatação e Sistema', 4, 2),
    ('Troca de Componentes', 5, 2),
    ('Diagnóstico', 6, 1),

    ('Computadores', 4, 2),
    ('Celulares', 5, 2),
    ('Smart TVs', 6, 1),
    ('Redes', 4, 2),
    ('Videogames', 5, 2),
    ('Áudio', 6, 1),
    ('Recuperação de Dados', 4, 2),
    ('Eletrônica Avançada', 5, 2),
    ('Informática', 6, 1),
    ('Insumos', 4, 2),
    ('Acessórios', 5, 2),
    ('Telas', 6, 1),
    ('Baterias', 4, 2),
    ('Componentes', 5, 2),
    ('Carcaças', 6, 1),
    ('TVs', 4, 2);


-- =========================================
-- SITUAÇÕES
-- =========================================

INSERT INTO situacao
    (Nome, id_funcionario, id_funcionario_cargo)
VALUES
    ('Aberta', 4, 2),
    ('Em análise', 5, 2),
    ('Aguardando peça', 6, 1),
    ('Em manutenção', 4, 2),
    ('Aguardando cliente', 5, 2),
    ('Pronta', 6, 1),
    ('Entregue', 4, 2),
    ('Cancelada', 5, 2);


-- =========================================
-- SERVIÇOS
-- =========================================

INSERT INTO servico (
    nome_servico,
    id_categoria,
    preco_base,
    horas_trabalho,
    id_funcionario,
    id_funcionario_cargo
)
VALUES
    ('Formatação e Instalação de Sistema Operacional', 1, 12000, 2.0, 4, 2),
    ('Limpeza Interna e Troca de Pasta Térmica', 1, 15000, 1.5, 5, 2),
    ('Upgrade de Hardware (RAM/SSD)', 1, 8000, 1.0, 6, 1),
    ('Remoção de Vírus e Malwares', 1, 10000, 1.5, 4, 2),
    ('Troca de Tela de Notebook', 1, 18000, 1.5, 5, 2),
    ('Troca de Display/Frontal de Celular', 2, 15000, 1.0, 6, 1),
    ('Troca de Bateria de Smartphone', 2, 9000, 0.5, 4, 2),
    ('Desoxidação após Contato com Líquido', 2, 20000, 3.0, 5, 2),
    ('Reparo em Conector de Carga (Micro USB / Type-C)', 2, 11000, 1.5, 6, 1),
    ('Troca de Barra de LED de Smart TV', 3, 35000, 3.0, 4, 2),
    ('Reparo na Placa Principal de Smart TV', 3, 28000, 2.5, 5, 2),
    ('Conserto de Fonte de Alimentação Interna (TV)', 3, 22000, 2.0, 6, 1),
    ('Configuração de Rede e Roteador Wi-Fi', 4, 9000, 1.0, 4, 2),
    ('Higienização e Troca de Metal Líquido / Pasta Térmica (Console)', 5, 22000, 2.0, 5, 2),
    ('Reparo de Drift em Analógico de Controle (Joy-Con / DualSense / Xbox)', 5, 8000, 1.0, 6, 1),
    ('Substituição de HDMI / Conector de Vídeo (Console)', 5, 25000, 2.5, 4, 2),
    ('Troca de Bateria de Caixa de Som Portátil (Bluetooth)', 6, 12000, 1.5, 5, 2),
    ('Troca de Almofadas / Reparo de Cabo de Headset Gamer', 6, 7000, 1.0, 6, 1),
    ('Recuperação de Dados de HD / SSD / Pendrive Danificado', 7, 30000, 4.0, 5, 2),
    ('Rebaling / Reparo de BGA em Placa Mãe ou Placa de Vídeo', 8, 45000, 5.0, 6, 1),
    ('Gravação e Reprogramação de BIOS Eprom (Notebook / Desktop)', 8, 16000, 2.0, 4, 2),
    ('Troca de Vidro Traseiro de Smartphone a Laser / Manual', 2, 18000, 2.5, 5, 2),
    ('Reparo e Solda de Conector Jack P2/P10 de Mesa de Som ou Amplificador', 6, 9500, 1.0, 4, 2);



-- =========================================
-- PEÇAS
-- =========================================

INSERT INTO pecas (
    nome_peca,
    id_categoria,
    preco_compra,
    preco_venda,
    estoque_atual,
    id_funcionario,
    id_funcionario_cargo
)
VALUES
    ('SSD NVMe 512GB M.2', 9, 14000, 26000, 15, 6, 1),
    ('SSD SATA III 480GB 2.5"', 9, 11000, 21000, 20, 4, 2),
    ('Memória RAM DDR4 8GB 2666MHz (Notebook)', 9, 9000, 17000, 12, 5, 2),
    ('Memória RAM DDR4 16GB 3200MHz (Desktop)', 9, 18000, 32000, 8, 6, 1),
    ('Pasta Térmica de Alta Performance (Bisnaga 4g)', 10, 2500, 6000, 25, 4, 2),
    ('Fonte ATX 500W 80 Plus Bronze', 9, 19000, 34000, 6, 5, 2),
    ('Bateria Célula Moeda CR2032 (Cartela c/ 5)', 10, 800, 2500, 30, 6, 1),
    ('Cooler para Processador Socket Universal', 9, 4500, 9500, 10, 4, 2),
    ('Cabo SATA III 6Gbps 50cm', 11, 300, 1500, 50, 5, 2),
    ('Tela LED 15.6" Slim 30 Pinos Full HD', 12, 28000, 48000, 5, 6, 1),
    ('Display Frontal Completo iPhone 11', 12, 18000, 35000, 4, 4, 2),
    ('Display Frontal Completo Samsung Galaxy A54', 12, 16000, 31000, 6, 5, 2),
    ('Display Frontal Completo Motorola Moto G84', 12, 14000, 28000, 5, 6, 1),
    ('Bateria Compatível iPhone 11 (3110mAh)', 13, 7500, 16000, 8, 4, 2),
    ('Bateria Compatível Samsung Galaxy A32', 13, 6000, 13000, 7, 5, 2),
    ('Bateria Compatível Moto G30', 13, 5500, 12000, 6, 6, 1),
    ('Conector de Carga Type-C Universal (Unidade)', 14, 250, 2000, 100, 4, 2),
    ('Conector de Carga Micro USB V8', 14, 150, 1500, 100, 5, 2),
    ('Flex de Carga e Microfone Moto G9 Play', 14, 1800, 5500, 10, 6, 1),
    ('Tampa Traseira de Vidro iPhone 12', 15, 4000, 11000, 4, 4, 2),
    ('Câmera Traseira Principal Redmi Note 11', 14, 6500, 14000, 3, 5, 2),
    ('Alto-Falante Auricular Universal', 14, 500, 2500, 40, 6, 1),
    ('Barra de LED TV Samsung 50" (Kit com 3 barras)', 16, 11000, 23000, 4, 4, 2),
    ('Barra de LED TV LG 43" (Kit com 3 barras)', 16, 9500, 19500, 5, 5, 2),
    ('Placa Fonte TV Samsung UN50TU8000', 16, 16000, 31000, 2, 6, 1),
    ('Placa Principal TV LG 43UP7500', 16, 21000, 42000, 2, 4, 2),
    ('Cabo Flat T-Con para Display TV 55"', 16, 2200, 6500, 8, 5, 2),
    ('Receptor Infravermelho para Controle Remoto TV', 14, 400, 2000, 15, 6, 1),
    ('Solda em Fio Sn60/Pb40 0.8mm (Carretel 500g)', 10, 8500, 15000, 3, 4, 2),
    ('Álcool Isopropílico 99.8% 1 Litro', 10, 2200, 4500, 12, 5, 2),
    ('Fita Kapton Térmica 10mm x 33m', 10, 1200, 3000, 15, 6, 1),
    ('Fita Dupla Face Fixação de Telas (3mm x 50m)', 10, 1500, 3500, 10, 4, 2),
    ('Fusível de Louça 5A 250V (Pacote c/ 10)', 14, 500, 1800, 20, 5, 2),
    ('Capacitor Eletrolítico 1000uF x 25V', 14, 80, 500, 150, 6, 1);









