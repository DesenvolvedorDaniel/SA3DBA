USE db_fintech;
INSERT INTO tb_tipo_conta
(descricao)
VALUES
('corrente'),
('poupanca'),
('salario'),
('estudante'),
('juridica')
;
INSERT INTO tb_tipo_telefone
(descricao)
VALUES
('residencial'),
('celular'),
('comercial'),
('fax'),
('whatsapp')
;
INSERT INTO tb_tipo_transacao
(descricao)
VALUES
('transferencia'),
('doc'),
('emprestimo'),
('pagamento'),
('deposito'),
('saque'),
('extrato'),
('pix')
;
INSERT INTO tb_cliente_juridico
(nome_fantasia,razao_social,email,status_juridico,cnpj)
VALUES
('indaia','concessionario indaia brasil aguas minerais ltda.','financeiro@indaia.com.br',1,00048785004674),
('mondelez','mondelez brasil ltda.','financeiro@mondelez.com.br',1,33303028002047),
('credeal', 'nova credeal industria de cadernos sa','financeiro@credeal.com.br',1,87864237000107),
('samsung','samsung eletronica da amazonia ltda.', 'financeiro@samsung.com,br',1,00280273000218),
('hp','hewlett packard brasil ltda.','financeiro@hpbrasil.com.br',1,61797924000317)
;

INSERT INTO tb_endereco
(localidade,cliente_juridico)
VALUES
('BA-093 Km 24, Fazenda Santo Antonio de Camboata, Municipio Dias D Avila - BA',1),
('Avenida Juscelino Kubitschek de Oliveira, 13.300, Cidade Industrial, Curitiba - PR', 2),
('Rua Padre Luis, 187 - Centro, Serafina Corrêa - RS',3),
('Avenida dos Oitis, 1.460, Distrito Industrial, Manaus - AM',4),
('Alameda Xingu, Nº 350 - Andar 8 Conj 801 no bairro Alphaville Industrial em Barueri - SP',5)
;
INSERT INTO tb_endereco
(localidade)
VALUES
('BA-093 Km 204, Fazenda Santo Antonio de Camboata, Municipio Dias D Avila - BA'),
('Avenida Juscelino Kubitschek de Oliveira, 1.000, Cidade Industrial, Curitiba - PR'),
('Rua Padre Luis, 18 - Centro, Serafina Corrêa - RS'),
('Avenida dos Oitis, 460, Distrito Industrial, Manaus - AM'),
('Alameda Xingu, Nº 35 - Andar 8 Conj 801, Alphaville Industrial, Barueri - SP')
;
INSERT INTO tb_cliente_fisico
(nome,sobrenome,email_f,dt_nascimento,filiacao,status_fisico,cpf,endereco)
VALUES
('daniel','santos','daniel@email.com.br','1990-08-17','maria dos santos e jose dos santos',1,98712345600,6),
('luciana','santos','luciana@email.com.br','1992-08-17','josefa dos santos e mario dos santos',1,45612378900,7),
('maria','dos santos','maria@email.com.br','1963-08-17','ana da silva e joao dos santos',1,78912345600,8),
('jose','dos santos','jose@email.com.br','1964-08-17','geova da silva e joao dos santos',1,65432178900,9),
('josefa','dos santos','josefa@email.com.br','1950-08-17','maria de souza e joao dos santos',1,12378945600,10)
;
INSERT INTO tb_telefone
(ddd,numero,tipo_telefone,cliente_juridico)
VALUES
(068,32147895,3,1),
(041,40014001,3,2),
(055,30255500,3,3),
(088,40040099,3,4),
(021,55009000,3,5)
;
INSERT INTO tb_telefone
(ddd,numero,tipo_telefone)
VALUES
(067,32147895,1),
(042,40014001,1),
(054,30255500,1),
(089,40040099,1),
(027,55009000,1)
;
INSERT INTO tb_cliente_telefone
(telefone,cliente_fisico)
VALUES
(6,1),
(7,2),
(8,3),
(9,4),
(10,5)
;
INSERT INTO tb_conta
(numero_c,agencia,saldo,status_conta,cliente_juridico,tipo_conta)
VALUES
(456123,0001,10000.00,1,1,5),
(789456,0002,20000.00,1,2,5),
(789123,0003,30000.00,1,3,5),
(123789,0004,40000.00,1,4,5),
(234789,0005,50000.00,1,5,5)
;
INSERT INTO tb_conta
(numero_c,agencia,saldo,status_conta,cliente_fisico,tipo_conta)
VALUES
(466123,0006,1000.00,1,1,1),
(799456,0007,2000.00,1,2,1),
(779123,0008,3000.00,1,3,1),
(113789,0009,4000.00,1,4,1),
(244789,0010,5000.00,1,5,2)
;
INSERT INTO tb_transacao
(conta_saida,conta_destino,valor,conta,tipo_transacao)
VALUES
(466123,244789,100.00,6,1),
(799456,779123,300.00,7,4),
(779123,799456,100.00,8,6),
(113789,466123,200.00,9,1),
(244789,466123,200.00,10,2)
;