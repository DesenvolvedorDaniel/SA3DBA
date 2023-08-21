CREATE DATABASE IF NOT EXISTS db_fintech
COLLATE utf8mb4_general_ci CHARSET utf8mb4;
USE db_fintech;
CREATE TABLE IF NOT EXISTS tb_tipo_conta (
  id_tipo_conta INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(255) NOT NULL
  )
  ;
CREATE TABLE IF NOT EXISTS tb_tipo_telefone (
  id_tipo_telefone INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(255) NOT NULL
  )
  ;
CREATE TABLE IF NOT EXISTS tb_tipo_transacao (
  id_tipo_transacao INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(255) NOT NULL
  )
  ;
CREATE TABLE IF NOT EXISTS tb_cliente_juridico(
  id_cliente_juridico INT PRIMARY KEY AUTO_INCREMENT,
  nome_fantasia VARCHAR(255) NOT NULL,
  razao_social VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  status_juridico BLOB NOT NULL,
  cnpj BIGINT NOT NULL,
  CONSTRAINT uq_cnpj_tb_cliente_juridico UNIQUE (cnpj)
  )
  ;
CREATE TABLE IF NOT EXISTS tb_endereco(
	id_endereco INT PRIMARY KEY AUTO_INCREMENT,
	localidade VARCHAR(255) NOT NULL,
	cliente_juridico INT,
	CONSTRAINT fk_cliente_juridico_tb_endereco FOREIGN KEY (cliente_juridico) REFERENCES tb_cliente_juridico (id_cliente_juridico)
    )
    ;
CREATE TABLE IF NOT EXISTS tb_cliente_fisico (
  id_cliente_fisico INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  sobrenome VARCHAR(255) NOT NULL,
  email_f VARCHAR(255) NOT NULL,
  dt_nascimento DATE NOT NULL,
  filiacao VARCHAR(255) NOT NULL,
  status_fisico BLOB NOT NULL,
  cpf BIGINT NOT NULL,
  endereco INT,
  CONSTRAINT uq_cpf_tb_cliente_fisico UNIQUE (cpf),
  CONSTRAINT fk_endereco_tb_cliente_fisico FOREIGN KEY (endereco) REFERENCES tb_endereco (id_endereco)
  )
  ;
CREATE TABLE IF NOT EXISTS tb_telefone (
  id_telefone INT PRIMARY KEY AUTO_INCREMENT,
  ddd SMALLINT(3) NOT NULL,
  numero INT(8) NOT NULL,
  tipo_telefone INT NOT NULL,
  cliente_juridico INT,
  CONSTRAINT fk_tipo_telefone_tb_telefone FOREIGN KEY (tipo_telefone) REFERENCES tb_tipo_telefone (id_tipo_telefone),
  CONSTRAINT fk_cliente_juridico_tb_telefone FOREIGN KEY (cliente_juridico) REFERENCES tb_cliente_juridico (id_cliente_juridico)
  )
  ;
  CREATE TABLE IF NOT EXISTS tb_cliente_telefone (
  telefone INT,
  cliente_fisico INT,
  CONSTRAINT fk_telefone_tb_cliente_telefone FOREIGN KEY (telefone) REFERENCES tb_telefone (id_telefone),
  CONSTRAINT fk_cliente_fisico_tb_cliente_telefone FOREIGN KEY (cliente_fisico) REFERENCES tb_cliente_fisico (id_cliente_fisico)
  )
  ;
CREATE TABLE IF NOT EXISTS tb_conta (
  id_conta INT PRIMARY KEY AUTO_INCREMENT,
  numero_c INT(6) NOT NULL,
  agencia INT(4) NOT NULL,
  saldo FLOAT NOT NULL,
  status_conta BLOB NOT NULL,
  cliente_fisico INT,
  cliente_juridico INT,
  tipo_conta INT NOT NULL,
  CONSTRAINT fk_cliente_fisico_tb_conta FOREIGN KEY (cliente_fisico) REFERENCES tb_cliente_fisico (id_cliente_fisico),
  CONSTRAINT fk_cliente_juridico_tb_conta FOREIGN KEY (cliente_juridico) REFERENCES tb_cliente_juridico (id_cliente_juridico),
  CONSTRAINT fk_tipo_conta_tb_conta FOREIGN KEY (tipo_conta) REFERENCES tb_tipo_conta (id_tipo_conta)
  )
  ;
  CREATE TABLE IF NOT EXISTS tb_transacao (
  id_transacao INT PRIMARY KEY AUTO_INCREMENT,
  conta_saida INT(6) NOT NULL,
  conta_destino INT(6) NOT NULL,
  valor FLOAT NOT NULL,
  conta INT NOT NULL,
  tipo_transacao INT NOT NULL,
  CONSTRAINT fk_conta_tb_transacao FOREIGN KEY (conta) REFERENCES tb_conta (id_conta),
  CONSTRAINT fk_tipo_transacao_tb_transacao FOREIGN KEY (tipo_transacao) REFERENCES tb_tipo_transacao (id_tipo_transacao)
  )
  ;