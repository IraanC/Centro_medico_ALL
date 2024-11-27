/*1°
    Integridade das Informações: Essa transação garante que, ao confirmar um pagamento, o status da consulta e os registros de faturamento sejam atualizados corretamente. O uso de transações evita que o sistema entre em um estado inconsistente, onde uma atualização parcial de pagamento tenha ocorrido (como um pagamento registrado mas o status de pagamento não atualizado)
*/

DELIMITER $$

CREATE PROCEDURE ConfirmarPagamento(
    IN p_id_consulta INTEGER,      -- ID da consulta
    IN p_valor_pago DECIMAL(10, 2) -- Valor do pagamento
)
BEGIN
    -- Inicia a transação
    START TRANSACTION;

    -- Tenta atualizar o status de pagamento da consulta
    BEGIN
        -- Atualiza o status de pagamento da consulta para 'Pago'
        UPDATE tb_consulta
        SET id_status_pgto = 2 -- 2 pode ser o ID do status 'Pago'
        WHERE id_cunsulta = p_id_consulta;

        -- Verifica se a atualização foi bem-sucedida
        IF ROW_COUNT() = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Consulta não encontrada';
        END IF;

        -- Registra o pagamento no faturamento
        INSERT INTO tb_faturamento (id_status_pgto, id_cunsulta, valor, data)
        VALUES (2, p_id_consulta, p_valor_pago, NOW()); -- 2 é o ID do status 'Pago'

        -- Confirma a transação
        COMMIT;
    END;
    
    -- Caso ocorra erro, realiza o rollback e gera uma mensagem de erro
    EXCEPTION
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro ao confirmar pagamento';
END $$

DELIMITER ;


/*2°
    Integridade dos Dados: Essa transação garante que, ao criar uma consulta para um paciente, o sistema verifica primeiramente a existência do paciente, utilizando o CPF fornecido, antes de registrar a consulta. Isso assegura que nenhuma consulta será criada sem um paciente válido. Caso o paciente não seja encontrado, a transação será revertida, evitando a criação de registros inválidos ou inconsistentes. O uso de transações assegura que tanto a inserção do paciente quanto a criação da consulta sejam feitas de maneira atômica, ou seja, ou ambas as operações acontecem com sucesso ou nenhuma delas ocorre.
*/

DELIMITER $$

CREATE PROCEDURE CriarConsultaPaciente(
    IN p_cpf CHAR(11),               -- CPF do paciente
    IN p_matricula_funcionario INT,   -- Matrícula do funcionário (médico)
    IN p_data_consulta DATETIME      -- Data e hora da consulta
)
BEGIN
    -- Inicia a transação
    START TRANSACTION;

    -- Declaração de variável para armazenar o id do paciente
    DECLARE v_id_paciente INT;

    -- Verifica se o paciente existe com o CPF fornecido
    SELECT id_paciente INTO v_id_paciente
    FROM tb_paciente
    WHERE cpf = p_cpf;

    -- Se o paciente não for encontrado, lança um erro
    IF v_id_paciente IS NULL THEN
        ROLLBACK; -- Reverte a transação caso o paciente não seja encontrado
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente não encontrado com o CPF fornecido.';
    END IF;

    -- Insere a consulta associada ao paciente encontrado
    INSERT INTO tb_consulta (matricula, id_paciente, data_inicio)
    VALUES (p_matricula_funcionario, v_id_paciente, p_data_consulta);

    -- Confirma a transação
    COMMIT;

END $$

DELIMITER ;
