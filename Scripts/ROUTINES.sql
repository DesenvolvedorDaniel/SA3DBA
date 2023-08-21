DELIMITER //
CREATE FUNCTION fn_remove_acento(texto VARCHAR (255))
RETURNS VARCHAR(255) 
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
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_cliente_fisico(nom VARCHAR(255), sobre VARCHAR(255), correio VARCHAR(255), nasc DATE, pais VARCHAR(255), tipo BOOLEAN, cadastro BIGINT, res INT)
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
			(nome,sobrenome,email_f,dt_nascimento,filiacao,status_fisico,cpf,endereco)
		VALUES
			(nom,sobre,correio,nasc,pais,tipo,cadastro,res);
	END IF;
    END //
    DELIMITER ;
    
    DELIMITER //
CREATE PROCEDURE sp_insert_cliente_juridico(nome VARCHAR(255),social VARCHAR(255),correio VARCHAR(255),tipo BOOLEAN,cadastro BIGINT)
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
		(nome_fantasia,razao_social,email,status_juridico,cnpj)
	VALUES
		(nome,social,correio,tipo,cadastro);
	END IF;
    END //
    DELIMITER ;
    
    DELIMITER //
CREATE PROCEDURE sp_insert_conta(conta INT(6), local INT(4), disponivel FLOAT, cod BOOLEAN, fisico INT, juridico INT, tipo INT)
BEGIN

	IF
		(LENGTH(REPLACE(TRIM(conta),' ','')))=6 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Número não preenche os requisitos';
    ELSEIF
		(LENGTH(REPLACE(TRIM(local),' ','')))=4 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Agência não preenche os requisitos';
	ELSE
    	INSERT INTO tb_conta
			(numero_c,agencia,saldo,status_conta,cliente_fisico,cliente_juridico,tipo_conta)
		VALUES
			(conta,local,disponivel,cod,fisico,juridico,tipo);
	END IF;
    END //
    DELIMITER ;
    
    DELIMITER //
CREATE PROCEDURE sp_insert_endereco(tipo VARCHAR(255))
BEGIN

	IF
		(LENGTH(REPLACE(TRIM(tipo),' ','')))<2 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Endereço não preenche os requisitos';
    ELSE
		INSERT INTO tb_endereco
			(localidade)
		VALUES
			(tipo);
	END IF;
    END //
    DELIMITER ;
    
    DELIMITER //
CREATE PROCEDURE sp_insert_telefone(cod SMALLINT(3), digito INT(8), tipo INT, cliente INT)
BEGIN

	IF
		(LENGTH(REPLACE(TRIM(cod),' ','')))=3 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Código não preenche os requisitos';
    ELSEIF
		(LENGTH(REPLACE(TRIM(digito),' ','')))=8 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Número não preenche os requisitos';
	ELSE
    	INSERT INTO tb_telefone
			(ddd,numero,tipo_telefone,cliente_juridico)
		VALUES
			(cod,digito,tipo,cliente);
	END IF;
    END //
    DELIMITER ;
    
    DELIMITER //
CREATE PROCEDURE sp_insert_tipo_conta(tipo VARCHAR(255))
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
    END //
    DELIMITER ;
    
    DELIMITER //
CREATE PROCEDURE sp_insert_tipo_telefone(tipo VARCHAR(255))
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
    END //
    DELIMITER ;
    
    DELIMITER //
    CREATE PROCEDURE sp_insert_tipo_transacao(tipo VARCHAR(255))
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
    END //
    DELIMITER ;
        
    DELIMITER //
CREATE PROCEDURE sp_insert_transacao(saida INT(6), destino INT(6), montante FLOAT, local INT, tipo INT)
BEGIN

	IF
		(LENGTH(REPLACE(TRIM(saida),' ','')))=6 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Conta não preenche os requisitos';
    ELSEIF
		(LENGTH(REPLACE(TRIM(destino),' ','')))=6 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Conta destino não preenche os requisitos';
	ELSE
    	INSERT INTO tb_transacao
			(conta_saida,conta_destino,valor,conta,tipo_transacao)
		VALUES
			(saida,destino,montante,local,tipo);
	END IF;
    END //
    DELIMITER ;