

-- tb_pacienet

INSERT INTO tb_paciente (cpf, email, telefone, nome, sobrenome, data_nascimento, estado_civil) VALUES
('12345678901', 'joao@example.com', '11987654321', 'João', 'Silva', '1990-01-15', 'Solteiro'),
('23456789012', 'maria@example.com', '11876543210', 'Maria', 'Oliveira', '1985-05-20', 'Casado'),
('34567890123', 'pedro@example.com', '11765432109', 'Pedro', 'Santos', '1992-07-30', 'Divorciado'),
('45678901234', 'ana@example.com', '11654321098', 'Ana', 'Costa', '1988-11-25', 'Solteiro'),
('56789012345', 'carlos@example.com', '11543210987', 'Carlos', 'Pereira', '1995-02-10', 'Viúvo'),
('67890123456', 'luana@example.com', '11432109876', 'Luana', 'Melo', '1993-03-18', 'Solteiro'),
('78901234567', 'jose@example.com', '11321098765', 'José', 'Almeida', '1980-08-05', 'Casado'),
('89012345678', 'fernanda@example.com', '11210987654', 'Fernanda', 'Souza', '1991-04-12', 'Divorciado'),
('90123456789', 'ricardo@example.com', '11109876543', 'Ricardo', 'Lima', '1986-12-30', 'Solteiro'),
('01234567890', 'juliana@example.com', '11098765432', 'Juliana', 'Ribeiro', '1994-09-17', 'Casado');




INSERT INTO tb_cargo (nome, atribuicoes) VALUES
('Médico', 'Atender e diagnosticar pacientes.'),
('Enfermeiro', 'Cuidar da saúde dos pacientes.'),
('Recepcionista', 'Gerenciar agendamentos e atendimento ao público.'),
('Farmacêutico', 'Dispensar medicamentos e orientar sobre uso.'),
('Fisioterapeuta', 'Reabilitar pacientes com técnicas físicas.'),
('Nutricionista', 'Elaborar dietas e orientações alimentares.'),
('Psicólogo', 'Apoiar pacientes em questões emocionais.'),
('Técnico de Enfermagem', 'Auxiliar enfermeiros em procedimentos.'),
('Assistente Social', 'Apoiar pacientes em questões sociais.'),
('Administrativo', 'Gerenciar processos internos do hospital.');


-- 2. tb_funcionario


INSERT INTO tb_funcionario (matricula, id_cargo, cpf, nome, sobrenome, salario, data_nascimento, data_inicio_contrato, data_termino_contrato, estado_civil) VALUES
(1001, 1, '12345678901', 'Lucas', 'Silva', 15000.00, '1985-06-12', '2020-01-15', NULL, 'Casado'),
(1002, 2, '23456789012', 'Maria', 'Souza', 8000.00, '1990-03-22', '2019-04-10', NULL, 'Solteiro'),
(1003, 3, '34567890123', 'Ana', 'Oliveira', 3000.00, '1995-05-30', '2021-07-01', NULL, 'Divorciado'),
(1004, 4, '45678901234', 'Carlos', 'Pereira', 5000.00, '1980-09-15', '2018-10-12', NULL, 'Viúvo'),
(1005, 5, '56789012345', 'Fernanda', 'Lima', 7000.00, '1988-12-08', '2017-03-18', NULL, 'Casado'),
(1006, 1, '67890123456', 'Roberto', 'Almeida', 16000.00, '1982-11-05', '2019-06-01', NULL, 'Solteiro'),
(1007, 2, '78901234567', 'Cláudia', 'Matos', 7500.00, '1991-02-25', '2021-03-20', NULL, 'Casada'),
(1008, 3, '89012345678', 'Júlio', 'César', 3500.00, '1986-08-10', '2020-07-15', NULL, 'Divorciado'),
(1009, 4, '90123456789', 'Patrícia', 'Ferreira', 5200.00, '1989-01-30', '2022-09-05', NULL, 'Solteira'),
(1010, 5, '01234567890', 'Gabriel', 'Rocha', 6200.00, '1993-04-14', '2020-12-12', NULL, 'Casado');


-- 3. tb_consulta


INSERT INTO tb_consulta (matricula, id_paciente, data_inicio) VALUES
(1001, 1, '2023-10-01 09:00:00'),
(1002, 2, '2023-10-01 10:00:00'),
(1003, 3, '2023-10-01 11:00:00'),
(1004, 4, '2023-10-01 14:00:00'),
(1005, 5, '2023-10-01 15:00:00'),
(1006, 1, '2023-10-02 09:30:00'),
(1007, 2, '2023-10-02 10:30:00'),
(1008, 3, '2023-10-02 11:30:00'),
(1009, 4, '2023-10-02 13:00:00'),
(1010, 5, '2023-10-02 14:30:00');


-- 4. tb_endereco_funcionario


INSERT INTO tb_endereco_funcionario (matricula, nome_rua, numero, bairro, cep) VALUES
(1001, 'Rua A', 123, 'Centro', '12345678'),
(1002, 'Rua B', 456, 'Jardim', '23456789'),
(1003, 'Rua C', 789, 'Vila', '34567890'),
(1004, 'Rua D', 101, 'Bairro Alto', '45678901'),
(1005, 'Rua E', 202, 'Novo Mundo', '56789012'),
(1006, 'Rua F', 303, 'Parque', '67890123'),
(1007, 'Rua G', 404, 'Nova Esperança', '78901234'),
(1008, 'Rua H', 505, 'São José', '89012345'),
(1009, 'Rua I', 606, 'Cascavel', '90123456'),
(1010, 'Rua J', 707, 'Morumbi', '01234567');


--  5. tb_endereco_paciente


INSERT INTO tb_endereco_paciente (id_paciente, nome_rua, numero, bairro, cep) VALUES
(1, 'Avenida 1', 100, 'Centro', '12345678'),
(2, 'Avenida 2', 200, 'Jardim', '23456789'),
(3, 'Avenida 3', 300, 'Vila', '34567890'),
(4, 'Avenida 4', 400, 'Bairro Alto', '45678901'),
(5, 'Avenida 5', 500, 'Novo Mundo', '56789012'),
(6, 'Avenida 6', 600, 'Parque', '67890123'),
(7, 'Avenida 7', 700, 'Nova Esperança', '78901234'),
(8, 'Avenida 8', 800, 'São José', '89012345'),
(9, 'Avenida 9', 900, 'Cascavel', '90123456'),
(10, 'Avenida 10', 1000, 'Morumbi', '01234567');


-- 6. tb_status_pgto


INSERT INTO tb_status_pgto (status_final, status) VALUES
(1, 'Pendente'),
(2, 'Pago'),
(3, 'Cancelado'),
(4, 'Em análise'),
(5, 'Pendente'),
(6, 'Pago'),
(7, 'Cancelado'),
(8, 'Em análise'),
(9, 'Pendente'),
(10, 'Pago');


-- 7. tb_faturamento


INSERT INTO tb_faturamento (id_status_pgto, id_cunsulta, valor, data) VALUES
(2, 1, 200.00, '2023-10-01'),
(1, 2, 150.00, '2023-10-01'),
(3, 3, 300.00, '2023-10-01'),
(2, 4, 250.00, '2023-10-01'),
(1, 5, 180.00, '2023-10-01'),
(2, 6, 220.00, '2023-10-02'),
(1, 7, 175.00, '2023-10-02'),
(3, 8, 260.00, '2023-10-02'),
(2, 9, 150.00, '2023-10-02'),
(1, 10, 200.00, '2023-10-02');


-- 8 tb_feedback


INSERT INTO tb_feedback (id_paciente, nota, data, comentario) VALUES
(1, 5, '2023-10-01', 'Excelente atendimento!'),
(2, 4, '2023-10-01', 'Bom, mas poderia melhorar o tempo de espera.'),
(3, 3, '2023-10-01', 'Atendimento satisfatório.'),
(4, 5, '2023-10-01', 'Ótimos profissionais!'),
(5, 4, '2023-10-01', 'Gostei muito do serviço.'),
(6, 5, '2023-10-01', 'Atendimento rápido e eficiente.'),
(7, 3, '2023-10-01', 'Pode melhorar o conforto.'),
(8, 4, '2023-10-01', 'Muito bom, recomendo!'),
(9, 5, '2023-10-01' , 'Muito bom, recomendo!');
