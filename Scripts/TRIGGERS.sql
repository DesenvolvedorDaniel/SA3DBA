DELIMITER //

CREATE TRIGGER tr_altera_saldo
AFTER UPDATE
ON tb_conta
FOR EACH ROW
BEGIN
	DECLARE saldo_atual FLOAT;
	SET saldo_atual = (SELECT valor FROM tb_conta WHERE id_conta = NEW.id_conta);
	UPDATE tb_transacao
	SET valor = (saldo_atual + NEW.valor)
	WHERE id_transacao = NEW.id_transacao;
END //
DELIMITER ;