CREATE DATABASE  IF NOT EXISTS `db_fintech` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_fintech`;
-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: db_fintech
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_cliente_fisico`
--

DROP TABLE IF EXISTS `tb_cliente_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente_fisico` (
  `id_cliente_fisico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `email_f` varchar(255) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `filiacao` varchar(255) NOT NULL,
  `status_fisico` tinyint(1) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `endereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente_fisico`),
  UNIQUE KEY `uq_cpf_tb_cliente_fisico` (`cpf`),
  KEY `fk_endereco_tb_cliente_fisico` (`endereco`),
  CONSTRAINT `fk_endereco_tb_cliente_fisico` FOREIGN KEY (`endereco`) REFERENCES `tb_endereco` (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_fisico`
--

LOCK TABLES `tb_cliente_fisico` WRITE;
/*!40000 ALTER TABLE `tb_cliente_fisico` DISABLE KEYS */;
INSERT INTO `tb_cliente_fisico` VALUES (1,'daniel','santos','daniel@email.com.br','1990-08-17','maria dos santos e jose dos santos',1,98712345600,6),(2,'luciana','santos','luciana@email.com.br','1992-08-17','josefa dos santos e mario dos santos',1,45612378900,7),(3,'maria','dos santos','maria@email.com.br','1963-08-17','ana da silva e joao dos santos',1,78912345600,8),(4,'jose','dos santos','jose@email.com.br','1964-08-17','geova da silva e joao dos santos',1,65432178900,9),(5,'josefa','dos santos','josefa@email.com.br','1950-08-17','maria de souza e joao dos santos',1,12378945600,10);
/*!40000 ALTER TABLE `tb_cliente_fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_juridico`
--

DROP TABLE IF EXISTS `tb_cliente_juridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente_juridico` (
  `id_cliente_juridico` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(255) NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status_juridico` tinyint(1) NOT NULL,
  `cnpj` bigint(20) NOT NULL,
  PRIMARY KEY (`id_cliente_juridico`),
  UNIQUE KEY `uq_cnpj_tb_cliente_juridico` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_juridico`
--

LOCK TABLES `tb_cliente_juridico` WRITE;
/*!40000 ALTER TABLE `tb_cliente_juridico` DISABLE KEYS */;
INSERT INTO `tb_cliente_juridico` VALUES (1,'indaia','concessionario indaia brasil aguas minerais ltda.','financeiro@indaia.com.br',1,48785004674),(2,'mondelez','mondelez brasil ltda.','financeiro@mondelez.com.br',1,33303028002047),(3,'credeal','nova credeal industria de cadernos sa','financeiro@credeal.com.br',1,87864237000107),(4,'samsung','samsung eletronica da amazonia ltda.','financeiro@samsung.com,br',1,280273000218),(5,'hp','hewlett packard brasil ltda.','financeiro@hpbrasil.com.br',1,61797924000317);
/*!40000 ALTER TABLE `tb_cliente_juridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_telefone`
--

DROP TABLE IF EXISTS `tb_cliente_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente_telefone` (
  `telefone` int(11) DEFAULT NULL,
  `cliente_fisico` int(11) DEFAULT NULL,
  KEY `fk_telefone_tb_cliente_telefone` (`telefone`),
  KEY `fk_cliente_fisico_tb_cliente_telefone` (`cliente_fisico`),
  CONSTRAINT `fk_cliente_fisico_tb_cliente_telefone` FOREIGN KEY (`cliente_fisico`) REFERENCES `tb_cliente_fisico` (`id_cliente_fisico`),
  CONSTRAINT `fk_telefone_tb_cliente_telefone` FOREIGN KEY (`telefone`) REFERENCES `tb_telefone` (`id_telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_telefone`
--

LOCK TABLES `tb_cliente_telefone` WRITE;
/*!40000 ALTER TABLE `tb_cliente_telefone` DISABLE KEYS */;
INSERT INTO `tb_cliente_telefone` VALUES (6,1),(7,2),(8,3),(9,4),(10,5);
/*!40000 ALTER TABLE `tb_cliente_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_conta`
--

DROP TABLE IF EXISTS `tb_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_conta` (
  `id_conta` int(11) NOT NULL AUTO_INCREMENT,
  `numero_c` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `saldo` float NOT NULL,
  `status_conta` tinyint(1) NOT NULL,
  `cliente_fisico` int(11) DEFAULT NULL,
  `cliente_juridico` int(11) DEFAULT NULL,
  `tipo_conta` int(11) NOT NULL,
  PRIMARY KEY (`id_conta`),
  KEY `fk_cliente_fisico_tb_conta` (`cliente_fisico`),
  KEY `fk_cliente_juridico_tb_conta` (`cliente_juridico`),
  KEY `fk_tipo_conta_tb_conta` (`tipo_conta`),
  CONSTRAINT `fk_cliente_fisico_tb_conta` FOREIGN KEY (`cliente_fisico`) REFERENCES `tb_cliente_fisico` (`id_cliente_fisico`),
  CONSTRAINT `fk_cliente_juridico_tb_conta` FOREIGN KEY (`cliente_juridico`) REFERENCES `tb_cliente_juridico` (`id_cliente_juridico`),
  CONSTRAINT `fk_tipo_conta_tb_conta` FOREIGN KEY (`tipo_conta`) REFERENCES `tb_tipo_conta` (`id_tipo_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_conta`
--

LOCK TABLES `tb_conta` WRITE;
/*!40000 ALTER TABLE `tb_conta` DISABLE KEYS */;
INSERT INTO `tb_conta` VALUES (1,456123,1,10000,1,NULL,1,5),(2,789456,2,20000,1,NULL,2,5),(3,789123,3,30000,1,NULL,3,5),(4,123789,4,40000,1,NULL,4,5),(5,234789,5,50000,1,NULL,5,5),(6,466123,6,1000,1,1,NULL,1),(7,799456,7,2000,1,2,NULL,1),(8,779123,8,3000,1,3,NULL,1),(9,113789,9,4000,1,4,NULL,1),(10,244789,10,5000,1,5,NULL,2);
/*!40000 ALTER TABLE `tb_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `localidade` varchar(255) NOT NULL,
  `cliente_juridico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_cliente_juridico_tb_endereco` (`cliente_juridico`),
  CONSTRAINT `fk_cliente_juridico_tb_endereco` FOREIGN KEY (`cliente_juridico`) REFERENCES `tb_cliente_juridico` (`id_cliente_juridico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (1,'BA-093 Km 24, Fazenda Santo Antonio de Camboata, Municipio Dias D Avila - BA',1),(2,'Avenida Juscelino Kubitschek de Oliveira, 13.300, Cidade Industrial, Curitiba - PR',2),(3,'Rua Padre Luis, 187 - Centro, Serafina Corrêa - RS',3),(4,'Avenida dos Oitis, 1.460, Distrito Industrial, Manaus - AM',4),(5,'Alameda Xingu, Nº 350 - Andar 8 Conj 801 no bairro Alphaville Industrial em Barueri - SP',5),(6,'BA-093 Km 204, Fazenda Santo Antonio de Camboata, Municipio Dias D Avila - BA',NULL),(7,'Avenida Juscelino Kubitschek de Oliveira, 1.000, Cidade Industrial, Curitiba - PR',NULL),(8,'Rua Padre Luis, 18 - Centro, Serafina Corrêa - RS',NULL),(9,'Avenida dos Oitis, 460, Distrito Industrial, Manaus - AM',NULL),(10,'Alameda Xingu, Nº 35 - Andar 8 Conj 801, Alphaville Industrial, Barueri - SP',NULL);
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone`
--

DROP TABLE IF EXISTS `tb_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_telefone` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `ddd` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tipo_telefone` int(11) NOT NULL,
  `cliente_juridico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `fk_tipo_telefone_tb_telefone` (`tipo_telefone`),
  KEY `fk_cliente_juridico_tb_telefone` (`cliente_juridico`),
  CONSTRAINT `fk_cliente_juridico_tb_telefone` FOREIGN KEY (`cliente_juridico`) REFERENCES `tb_cliente_juridico` (`id_cliente_juridico`),
  CONSTRAINT `fk_tipo_telefone_tb_telefone` FOREIGN KEY (`tipo_telefone`) REFERENCES `tb_tipo_telefone` (`id_tipo_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone`
--

LOCK TABLES `tb_telefone` WRITE;
/*!40000 ALTER TABLE `tb_telefone` DISABLE KEYS */;
INSERT INTO `tb_telefone` VALUES (1,68,32147895,3,1),(2,41,40014001,3,2),(3,55,30255500,3,3),(4,88,40040099,3,4),(5,21,55009000,3,5),(6,67,32147895,1,NULL),(7,42,40014001,1,NULL),(8,54,30255500,1,NULL),(9,89,40040099,1,NULL),(10,27,55009000,1,NULL);
/*!40000 ALTER TABLE `tb_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_conta`
--

DROP TABLE IF EXISTS `tb_tipo_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_conta` (
  `id_tipo_conta` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_conta`
--

LOCK TABLES `tb_tipo_conta` WRITE;
/*!40000 ALTER TABLE `tb_tipo_conta` DISABLE KEYS */;
INSERT INTO `tb_tipo_conta` VALUES (1,'corrente'),(2,'poupanca'),(3,'salario'),(4,'estudante'),(5,'juridica');
/*!40000 ALTER TABLE `tb_tipo_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_telefone`
--

DROP TABLE IF EXISTS `tb_tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_telefone` (
  `id_tipo_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_telefone`
--

LOCK TABLES `tb_tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tb_tipo_telefone` DISABLE KEYS */;
INSERT INTO `tb_tipo_telefone` VALUES (1,'residencial'),(2,'celular'),(3,'comercial'),(4,'fax'),(5,'whatsapp');
/*!40000 ALTER TABLE `tb_tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_transacao`
--

DROP TABLE IF EXISTS `tb_tipo_transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_transacao` (
  `id_tipo_transacao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_transacao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_transacao`
--

LOCK TABLES `tb_tipo_transacao` WRITE;
/*!40000 ALTER TABLE `tb_tipo_transacao` DISABLE KEYS */;
INSERT INTO `tb_tipo_transacao` VALUES (1,'transferencia'),(2,'doc'),(3,'emprestimo'),(4,'pagamento'),(5,'deposito'),(6,'saque'),(7,'extrato'),(8,'pix');
/*!40000 ALTER TABLE `tb_tipo_transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transacao`
--

DROP TABLE IF EXISTS `tb_transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transacao` (
  `id_transacao` int(11) NOT NULL AUTO_INCREMENT,
  `conta_saida` int(11) NOT NULL,
  `conta_destino` int(11) NOT NULL,
  `valor` float NOT NULL,
  `conta` int(11) NOT NULL,
  `tipo_transacao` int(11) NOT NULL,
  PRIMARY KEY (`id_transacao`),
  KEY `fk_conta_tb_transacao` (`conta`),
  KEY `fk_tipo_transacao_tb_transacao` (`tipo_transacao`),
  CONSTRAINT `fk_conta_tb_transacao` FOREIGN KEY (`conta`) REFERENCES `tb_conta` (`id_conta`),
  CONSTRAINT `fk_tipo_transacao_tb_transacao` FOREIGN KEY (`tipo_transacao`) REFERENCES `tb_tipo_transacao` (`id_tipo_transacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transacao`
--

LOCK TABLES `tb_transacao` WRITE;
/*!40000 ALTER TABLE `tb_transacao` DISABLE KEYS */;
INSERT INTO `tb_transacao` VALUES (1,466123,244789,100,6,1),(2,799456,779123,300,7,4),(3,779123,799456,100,8,6),(4,113789,466123,200,9,1),(5,244789,466123,200,10,2);
/*!40000 ALTER TABLE `tb_transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_dados_clientes`
--

DROP TABLE IF EXISTS `vw_dados_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_dados_clientes` (
  `Código Pessoa Física` tinyint NOT NULL,
  `Nome Pessoa Física` tinyint NOT NULL,
  `Sobrenome Pessoa Física` tinyint NOT NULL,
  `Correio eletrônico Pessoa Física` tinyint NOT NULL,
  `Data de nascimento Pessoa Física` tinyint NOT NULL,
  `Filiação Pessoa Física` tinyint NOT NULL,
  `Status Pessoa Física` tinyint NOT NULL,
  `CPF` tinyint NOT NULL,
  `Endereço Pessoa Física` tinyint NOT NULL,
  `Código conta` tinyint NOT NULL,
  `Conta número` tinyint NOT NULL,
  `Agência número` tinyint NOT NULL,
  `Saldo em conta` tinyint NOT NULL,
  `Status conta` tinyint NOT NULL,
  `Tipo de conta` tinyint NOT NULL,
  `Código Pessoa Juridica` tinyint NOT NULL,
  `Nome fantasia Pessoa Jurídica` tinyint NOT NULL,
  `Razão social Pessoa Jurídica` tinyint NOT NULL,
  `Correio eletrônico Pessoa Jurídica` tinyint NOT NULL,
  `Status Pessoa Jurídica` tinyint NOT NULL,
  `CNPJ` tinyint NOT NULL,
  `Código endereço` tinyint NOT NULL,
  `Endereço` tinyint NOT NULL,
  `Código telefone` tinyint NOT NULL,
  `DDD` tinyint NOT NULL,
  `Número de telefone` tinyint NOT NULL,
  `Tipo de telefone` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_transacao_cliente_fisico`
--

DROP TABLE IF EXISTS `vw_transacao_cliente_fisico`;
/*!50001 DROP VIEW IF EXISTS `vw_transacao_cliente_fisico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_transacao_cliente_fisico` (
  `Nome Pessoa Física` tinyint NOT NULL,
  `Sobrenome Pessoa Física` tinyint NOT NULL,
  `CPF` tinyint NOT NULL,
  `Tipo de transação` tinyint NOT NULL,
  `Código Transacão` tinyint NOT NULL,
  `Conta de saída dos recursos` tinyint NOT NULL,
  `Conta de destino dos rescursos` tinyint NOT NULL,
  `Valor movimentado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_fintech'
--

--
-- Dumping routines for database 'db_fintech'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_remove_acento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_remove_acento`(texto VARCHAR (255)) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
SET texto = REPLACE(texto,'á', 'a'),
	texto = REPLACE(texto,'Á', 'a'),
	texto = REPLACE(texto,'à', 'a'),
	texto = REPLACE(texto,'À', 'a'),
	texto = REPLACE(texto,'ã', 'a'),
	texto = REPLACE(texto,'Ã', 'a'),
	texto = REPLACE(texto,'ä', 'a'),
	texto = REPLACE(texto,'Ä', 'a'),
	texto = REPLACE(texto,'â', 'a'),
	texto = REPLACE(texto,'Â', 'a'),
	texto = REPLACE(texto,'É', 'e'),
	texto = REPLACE(texto,'È', 'e'),
	texto = REPLACE(texto,'Ë', 'e'),
	texto = REPLACE(texto,'Ê', 'e'),
	texto = REPLACE(texto,'é', 'e'),
	texto = REPLACE(texto,'è', 'e'),
	texto = REPLACE(texto,'ë', 'e'),
	texto = REPLACE(texto,'Ì', 'i'),
    texto = REPLACE(texto,'Í', 'i'),
    texto = REPLACE(texto,'Î', 'i'),
	texto = REPLACE(texto,'Ï', 'i'),
	texto = REPLACE(texto,'ì', 'i'),
	texto = REPLACE(texto,'í', 'i'),    
	texto = REPLACE(texto,'ï', 'i'),
    texto = REPLACE(texto,'î', 'i'),
	texto = REPLACE(texto,'Ò', 'o'),
    texto = REPLACE(texto,'Ó', 'o'),
    texto = REPLACE(texto,'Ô', 'o'),
    texto = REPLACE(texto,'Õ', 'o'),
    texto = REPLACE(texto,'Ö', 'o'),
    texto = REPLACE(texto,'ò', 'o'),
    texto = REPLACE(texto,'ó', 'o'),
    texto = REPLACE(texto,'ô', 'o'),
    texto = REPLACE(texto,'õ', 'o'),
    texto = REPLACE(texto,'ö', 'o'),
    texto = REPLACE(texto,'Ù', 'u'),
    texto = REPLACE(texto,'Ú', 'u'),
    texto = REPLACE(texto,'Û', 'u'),
    texto = REPLACE(texto,'Ü', 'u'),
    texto = REPLACE(texto,'ù', 'u'),
	texto = REPLACE(texto,'ú', 'u'),
    texto = REPLACE(texto,'û', 'u'),
    texto = REPLACE(texto,'ü', 'u'),
    texto = REPLACE(texto,'Ý', 'y'),
    texto = REPLACE(texto,'ý', 'y'),
    texto = REPLACE(texto,'ÿ', 'y');
RETURN texto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cliente_fisico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente_fisico`(nom VARCHAR(255), sobre VARCHAR(255), correio VARCHAR(255), nasc DATE, pais VARCHAR(255), tipo BOOLEAN, cadastro BIGINT, res INT)
BEGIN

	IF
		(LENGTH(REPLACE(TRIM(nom),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nome não preenche os requisitos';
    ELSEIF
		(LENGTH(REPLACE(TRIM(sobre),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sobrenome não preenche os requisitos';
	ELSEIF
		(LENGTH(REPLACE(TRIM(correio),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Correio eletrônico não preenche os requisitos';
	ELSEIF
		(nasc>=CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data informada não preenche os requisitos';
    ELSEIF
		(LENGTH(REPLACE(TRIM(pais),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Filiação não preenche os requisitos';
	ELSE
    	INSERT INTO tb_cliente_fisico
			(nome,sobrenome,email,dt_nascimento,filiacao,status,cpf,endereco)
		VALUES
			(nom,sobre,correio,nasc,pais,tipo,cadastro,res);
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cliente_juridico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente_juridico`(nome VARCHAR(255),social VARCHAR(255),correio VARCHAR(255),tipo BOOLEAN,cadastro BIGINT)
BEGIN

	IF
		(LENGTH(REPLACE(TRIM(nome),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nome fantasia não preenche os requisitos';
    ELSEIF
        (LENGTH(REPLACE(TRIM(social),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Razão social não preenche os requisitos';
    ELSEIF
        (LENGTH(REPLACE(TRIM(correio),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Correio eletrônico não preenche os requisitos';
    ELSE
    INSERT INTO tb_cliente_juridico
		(nome_fantasia,razao_social,email,status,cnpj)
	VALUES
		(nome,social,correio,tipo,cadastro);
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_tipo_conta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tipo_conta`(tipo VARCHAR(255))
BEGIN

	IF
    (LENGTH(REPLACE(TRIM(tipo),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Descrição não preenche os requisitos';
    ELSE
    INSERT INTO tb_tipo_conta
		(descricao)
	VALUES
		(tipo);
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_tipo_telefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tipo_telefone`(tipo VARCHAR(255))
BEGIN

	IF
    (LENGTH(REPLACE(TRIM(tipo),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Descrição não preenche os requisitos';
    ELSE
    INSERT INTO tb_tipo_telefone
		(descricao)
	VALUES
		(tipo);
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_tipo_transacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tipo_transacao`(tipo VARCHAR(255))
BEGIN

	IF
    (LENGTH(REPLACE(TRIM(tipo),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Descrição não preenche os requisitos';
    ELSE
    INSERT INTO tb_tipo_transacao
		(descricao)
	VALUES
		(tipo);
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_dados_clientes`
--

/*!50001 DROP TABLE IF EXISTS `vw_dados_clientes`*/;
/*!50001 DROP VIEW IF EXISTS `vw_dados_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_clientes` AS select `f`.`id_cliente_fisico` AS `Código Pessoa Física`,`f`.`nome` AS `Nome Pessoa Física`,`f`.`sobrenome` AS `Sobrenome Pessoa Física`,`f`.`email_f` AS `Correio eletrônico Pessoa Física`,`f`.`dt_nascimento` AS `Data de nascimento Pessoa Física`,`f`.`filiacao` AS `Filiação Pessoa Física`,`f`.`status_fisico` AS `Status Pessoa Física`,`f`.`cpf` AS `CPF`,`f`.`endereco` AS `Endereço Pessoa Física`,`c`.`id_conta` AS `Código conta`,`c`.`numero_c` AS `Conta número`,`c`.`agencia` AS `Agência número`,`c`.`saldo` AS `Saldo em conta`,`c`.`status_conta` AS `Status conta`,`c`.`tipo_conta` AS `Tipo de conta`,`j`.`id_cliente_juridico` AS `Código Pessoa Juridica`,`j`.`nome_fantasia` AS `Nome fantasia Pessoa Jurídica`,`j`.`razao_social` AS `Razão social Pessoa Jurídica`,`j`.`email` AS `Correio eletrônico Pessoa Jurídica`,`j`.`status_juridico` AS `Status Pessoa Jurídica`,`j`.`cnpj` AS `CNPJ`,`e`.`id_endereco` AS `Código endereço`,`e`.`localidade` AS `Endereço`,`t`.`id_telefone` AS `Código telefone`,`t`.`ddd` AS `DDD`,`t`.`numero` AS `Número de telefone`,`t`.`tipo_telefone` AS `Tipo de telefone` from (((((`tb_cliente_fisico` `f` join `tb_conta` `c` on(`f`.`id_cliente_fisico` = `c`.`cliente_fisico`)) join `tb_cliente_juridico` `j` on(`c`.`cliente_juridico` = `j`.`id_cliente_juridico`)) join `tb_endereco` `e` on(`j`.`id_cliente_juridico` = `e`.`cliente_juridico`)) join `tb_telefone` `t` on(`j`.`id_cliente_juridico` = `t`.`cliente_juridico`)) join `tb_cliente_telefone` `c_t` on(`c_t`.`cliente_fisico` = `f`.`id_cliente_fisico`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_transacao_cliente_fisico`
--

/*!50001 DROP TABLE IF EXISTS `vw_transacao_cliente_fisico`*/;
/*!50001 DROP VIEW IF EXISTS `vw_transacao_cliente_fisico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_transacao_cliente_fisico` AS select `f`.`nome` AS `Nome Pessoa Física`,`f`.`sobrenome` AS `Sobrenome Pessoa Física`,`f`.`cpf` AS `CPF`,`t_t`.`descricao` AS `Tipo de transação`,`t`.`id_transacao` AS `Código Transacão`,`t`.`conta_saida` AS `Conta de saída dos recursos`,`t`.`conta_destino` AS `Conta de destino dos rescursos`,`t`.`valor` AS `Valor movimentado` from (((`tb_cliente_fisico` `f` join `tb_conta` `c` on(`f`.`id_cliente_fisico` = `c`.`cliente_fisico`)) join `tb_transacao` `t` on(`c`.`id_conta` = `t`.`conta`)) join `tb_tipo_transacao` `t_t` on(`t_t`.`id_tipo_transacao` = `t`.`tipo_transacao`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-21 15:08:51
