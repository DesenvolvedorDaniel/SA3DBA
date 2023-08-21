CREATE VIEW vw_dados_clientes AS
SELECT
f.id_cliente_fisico 'Código Pessoa Física',
fn_remove_acento(UPPER(f.nome)) 'Nome Pessoa Física',
fn_remove_acento(UPPER(f.sobrenome)) 'Sobrenome Pessoa Física',
fn_remove_acento(UPPER(f.email_f)) 'Correio eletrônico Pessoa Física',
f.dt_nascimento 'Data de nascimento Pessoa Física',
fn_remove_acento(UPPER(f.filiacao)) 'Filiação Pessoa Física',
f.status_fisico 'Status Pessoa Física',
f.cpf 'CPF',
fn_remove_acento(UPPER(f.endereco)) 'Endereço Pessoa Física',
c.id_conta 'Código conta',
c.numero_c 'Conta número',
c.agencia 'Agência número',
c.saldo 'Saldo em conta',
c.status_conta 'Status conta',
fn_remove_acento(UPPER(c.tipo_conta)) 'Tipo de conta',
j.id_cliente_juridico 'Código Pessoa Juridica',
fn_remove_acento(UPPER(j.nome_fantasia)) 'Nome fantasia Pessoa Jurídica',
fn_remove_acento(UPPER(j.razao_social)) 'Razão social Pessoa Jurídica',
fn_remove_acento(UPPER(j.email)) 'Correio eletrônico Pessoa Jurídica',
j.status_juridico 'Status Pessoa Jurídica',
j.cnpj 'CNPJ',
e.id_endereco 'Código endereço',
fn_remove_acento(UPPER(e.localidade)) 'Endereço',
t.id_telefone 'Código telefone',
t.ddd 'DDD',
t.numero 'Número de telefone',
fn_remove_acento(UPPER(t.tipo_telefone)) 'Tipo de telefone'
FROM tb_cliente_fisico f
JOIN tb_conta c
ON f.id_cliente_fisico = c.cliente_fisico
JOIN tb_cliente_juridico j
ON c.cliente_juridico = j.id_cliente_juridico
JOIN tb_endereco e
ON j.id_cliente_juridico = e.cliente_juridico
JOIN tb_telefone t
ON j.id_cliente_juridico = t.cliente_juridico
JOIN tb_cliente_telefone c_t
ON c_t.cliente_fisico = f.id_cliente_fisico
;

CREATE VIEW vw_transacao_cliente_fisico AS
SELECT
fn_remove_acento(UPPER(f.nome)) 'Nome Pessoa Física',
fn_remove_acento(UPPER(f.sobrenome)) 'Sobrenome Pessoa Física',
f.cpf 'CPF',
fn_remove_acento(UPPER(t_t.descricao)) 'Tipo de transação',
t.id_transacao 'Código Transacão',
t.conta_saida 'Conta de saída dos recursos',
t.conta_destino 'Conta de destino dos rescursos',
t.valor 'Valor movimentado'
FROM tb_cliente_fisico f
JOIN tb_conta c
ON f.id_cliente_fisico = c.cliente_fisico
JOIN tb_transacao t
ON c.id_conta = t.conta
JOIN tb_tipo_transacao t_t
ON t_t.id_tipo_transacao = t.tipo_transacao 
;