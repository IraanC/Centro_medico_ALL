/*1°
    Facilidade e padronização: A stored procedure InserirPaciente permite uma inserção de dados no banco de forma padronizada, sem a necessidade de escrever um comando INSERT toda vez que for adicionar um paciente. Isso reduz o risco de erros e garante consistência nos dados inseridos.
*/

DELIMITER %%

CREATE PROCEDURE InserirPaciente(
    IN p_cpf CHAR(11),
    IN p_email VARCHAR(255),
    IN p_telefone CHAR(11),
    IN p_nome VARCHAR(50),
    IN p_sobrenome VARCHAR(130),
    IN p_data_nascimento DATE,
    IN p_estado_civil VARCHAR(30)
)
BEGIN
    INSERT INTO tb_paciente (cpf, email, telefone, nome, sobrenome, data_nascimento, estado_civil)
    VALUES (p_cpf, p_email, p_telefone, p_nome, p_sobrenome, p_data_nascimento, p_estado_civil);
END %%

DELIMITER ;


/*2°
    Centralização da lógica de negócios: A stored procedure AtualizarSalarioFuncionario centraliza a lógica de atualização do salário em um único lugar, evitando que você precise escrever a mesma lógica em diferentes partes do código do sistema.
*/

DELIMITER $$

CREATE PROCEDURE AtualizarSalarioFuncionario(
    IN p_matricula INTEGER,
    IN p_novo_salario DECIMAL(10, 2)
)
BEGIN
    UPDATE tb_funcionario
    SET salario = p_novo_salario
    WHERE matricula = p_matricula;
END $$

DELIMITER ;


/* 3°
    Consulta otimizada: A stored procedure ObterConsultasPaciente encapsula a lógica de consulta de todas as consultas de um paciente específico em um único lugar. Isso permite uma execução mais eficiente da consulta, sem a necessidade de repetir a lógica de junção entre as tabelas tb_consulta e tb_funcionario cada vez que precisar dessa informação.
*/

DELIMITER pp

CREATE PROCEDURE ObterConsultasPaciente(
    IN p_id_paciente INTEGER
)
BEGIN
    SELECT c.id_consulta, c.data_inicio, f.nome AS nome_funcionario
    FROM tb_consulta c
    JOIN tb_funcionario f ON c.matricula = f.matricula
    WHERE c.id_paciente = p_id_paciente;
END pp

DELIMITER ;
