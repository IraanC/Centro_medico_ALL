

-- 1. View de Pacientes com Consultas

CREATE VIEW vw_pacientes_consultas AS
SELECT 
    p.id_paciente,
    p.nome,
    p.sobrenome,
    c.data_inicio
FROM 
    tb_paciente p
JOIN 
    tb_consulta c ON p.id_paciente = c.id_paciente;


-- 2. View de Funcionários com Cargos

CREATE VIEW vw_funcionarios_cargos AS
SELECT 
    f.matricula,
    f.nome,
    f.sobrenome,
    c.nome AS cargo
FROM 
    tb_funcionario f
JOIN 
    tb_cargo c ON f.id_cargo = c.id_cargo;


-- 3. View de Faturamento com Status

CREATE VIEW vw_faturamento_status AS
SELECT 
    f.id,
    f.valor,
    f.data,
    s.status
FROM 
    tb_faturamento f
JOIN 
    tb_status_pgto s ON f.id_status_pgto = s.id_status;


-- 4. View de Médias de Notas de Feedback por Paciente

CREATE VIEW vw_media_feedback_paciente AS
SELECT 
    p.id_paciente,
    p.nome,
    p.sobrenome,
    AVG(f.nota) AS media_nota
FROM 
    tb_feedback f
JOIN 
    tb_paciente p ON f.id_paciente = p.id_paciente
GROUP BY 
    p.id_paciente
ORDER BY 
    media_nota DESC;


-- 5. View de Total de Consultas por Funcionário

CREATE VIEW vw_total_consultas_funcionario AS
SELECT 
    f.matricula,
    f.nome,
    COUNT(c.id_cunsulta) AS total_consultas
FROM 
    tb_funcionario f
LEFT JOIN 
    tb_consulta c ON f.matricula = c.matricula
GROUP BY 
    f.matricula
ORDER BY 
    total_consultas DESC;


-- 6. View de Faturamento por Mês

CREATE VIEW vw_faturamento_mensal AS
SELECT 
    MONTH(f.data) AS mes,
    YEAR(f.data) AS ano,
    SUM(f.valor) AS total_faturado
FROM 
    tb_faturamento f
GROUP BY 
    ano, mes
ORDER BY 
    ano, mes;




-- 7. View de Pacientes e Seus Endereços

CREATE VIEW vw_pacientes_enderecos AS
SELECT 
    p.id_paciente,
    p.nome,
    p.sobrenome,
    e.nome_rua,
    e.bairro,
    e.cep
FROM 
    tb_paciente p
JOIN 
    tb_endereco_paciente e ON p.id_paciente = e.id_paciente;


-- 8. View de Funcionários e Seus Endereços

CREATE VIEW vw_funcionarios_enderecos AS
SELECT 
    f.matricula,
    f.nome,
    f.sobrenome,
    e.nome_rua,
    e.bairro,
    e.cep
FROM 
    tb_funcionario f
JOIN 
    tb_endereco_funcionario e ON f.matricula = e.matricula;


-- 9. View de Pacientes com Status de Pagamento

CREATE VIEW vw_pacientes_status_pagamento AS
SELECT 
    p.id_paciente,
    p.nome,
    p.sobrenome,
    s.status
FROM 
    tb_paciente p
JOIN 
    tb_consulta c ON p.id_paciente = c.id_paciente
JOIN 
    tb_faturamento f ON c.id_cunsulta = f.id_cunsulta
JOIN 
    tb_status_pgto s ON f.id_status_pgto = s.id_status;


-- 10. View de Funcionários por Estado Civil

CREATE VIEW vw_funcionarios_estado_civil AS
SELECT 
    estado_civil,
    COUNT(*) AS total
FROM 
    tb_funcionario
GROUP BY 
    estado_civil
ORDER BY 
    total DESC;


11. View de Consultas por Mês

CREATE VIEW vw_consultas_mensal AS
SELECT 
    MONTH(c.data_inicio) AS mes,
    YEAR(c.data_inicio) AS ano,
    COUNT(c.id_cunsulta) AS total_consultas
FROM 
    tb_consulta c
GROUP BY 
    ano, mes
ORDER BY 
    ano, mes;


-- 12. View de Feedbacks por Paciente

CREATE VIEW vw_feedbacks_pacientes AS
SELECT 
    p.id_paciente,
    p.nome,
    p.sobrenome,
    COUNT(f.id_feedback) AS total_feedbacks
FROM 
    tb_feedback f
JOIN 
    tb_paciente p ON f.id_paciente = p.id_paciente
GROUP BY 
    p.id_paciente
ORDER BY 
    total_feedbacks DESC;