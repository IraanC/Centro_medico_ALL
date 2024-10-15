/* 1 Trigger
    Essa trigger foi pensada para garantiar uma melhoar organização, evitando conflitos de horario de consultas tanto para pacinete qunato para o nosso colaborador.

    ## Vantagens 
    Reduz a necessidade de verificações manuais de disponibilidade, agilizando o processo de agendamento de consultas.
    Melhora a experiência do paciente: Evita que o paciente seja agendado em duas consultas ao mesmo tempo, o que pode gerar frustração e perda de tempo.
*/

CREATE TRIGGER tr_validar_horario_consulta
BEFORE INSERT ON tb_consulta
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM tb_consulta
        WHERE (id_paciente = NEW.id_paciente OR matricula = NEW.matricula)
          AND data_inicio = NEW.data_inicio
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe uma consulta agendada para este paciente ou funcionário no mesmo horário.';
    END IF;
END;

/* 2 Trigger
 Essa Triger foi pensada para prevenir erros de digitação ou equivoco do nosso paciate/cliente quando estiver realizando o seu cadastro.
 ##Vantagens
  Manter a integridade e confiabilidade em relação as idades dos nossos clientes 
*/

CREATE TRIGGER tr_validar_data_nascimento_paciente
BEFORE INSERT ON tb_paciente
FOR EACH ROW
BEGIN
    IF NEW.data_nascimento > CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de nascimento inválida. Não pode ser uma data futura.';
    END IF;
END ;

/* 3 Trigger
 Essa trigger foi pensada para:
 * Acompanhar as alterações nos dados dos funcionários: Saber quando um funcionário foi atualizado pela última vez pode ser importante para auditoria, controle de alterações e histórico de informações.
 *Gerenciar informações sobre o funcionário: Facilita a identificação de quais dados foram modificados e quando, auxiliando na gestão de informações e na tomada de decisões.
 *Monitorar a atividade do sistema: Permite analisar a frequência de atualizações e identificar possíveis anomalias ou atividades suspeitas. 
*/

CREATE TRIGGER tr_registrar_ultima_atualizacao
BEFORE UPDATE ON tb_funcionario
FOR EACH ROW
BEGIN
    SET NEW.data_ultima_atualizacao = NOW();
END;



/* !!!!!!!! OBSERVAÇÃO !!!!!!!! 
para o funcionamento dessa ultima TRIGGER será necessário add uma nova coluna 
*/
@@@ ALTER TABLE tb_funcionario ADD COLUMN data_ultima_atualizacao DATETIME;