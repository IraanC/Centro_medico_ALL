-- 1°
CREATE TABLE tb_paciente(
 id_paciente     INTEGER  AUTO_INCREMENT,
 cpf             CHAR (11) NOT NULL UNIQUE,
 email          VARCHAR (255) NOT NULL UNIQUE,
 telefone        CHAR (11) NOT NULL UNIQUE,
 nome            VARCHAR(50) NOT NULL,
 sobrenome       VARCHAR (130) NOT NULL,
 data_nascimento DATE NOT NULL,
 estado_civil    VARCHAR (30) NOT NULL,

 PRIMARY KEY ( id_paciente )
); 
-- 2°
CREATE TABLE tb_cargo(
 id_cargo    INTEGER AUTO_INCREMENT,
 nome    VARCHAR (60) NOT NULL,
 atribuicoes TEXT NOT NULL,

 PRIMARY KEY ( id_cargo )
);
-- 3°
CREATE TABLE tb_funcionario(

 matricula             INTEGER NOT NULL,
 id_cargo              INTEGER NOT NULL,
 cpf                   CHAR (11) NOT NULL,
 nome                  VARCHAR (50) NOT NULL,
 sobrenome             VARCHAR (130) NOT NULL,
 salario               DECIMAL NOT NULL,
 data_nascimento       DATE NOT NULL,
 data_inicio_contrato  DATE NOT NULL,
 data_termino_contrato DATE,
 estado_civil          VARCHAR (50) NOT NULL,

 PRIMARY KEY ( matricula ),
 FOREIGN KEY ( id_cargo ) REFERENCES tb_cargo ( id_cargo ) ON DELETE CASCADE 
);
-- 4°
CREATE TABLE tb_consulta(
 id_cunsulta INTEGER AUTO_INCREMENT,
 matricula   INTEGER NOT NULL,
 id_paciente INTEGER NOT NULL,
 data_inicio DATETIME NOT NULL,

  PRIMARY KEY ( id_cunsulta ),
  FOREIGN KEY ( id_paciente ) REFERENCES tb_paciente ( id_paciente ) ON DELETE CASCADE ,
  FOREIGN KEY ( matricula ) REFERENCES tb_funcionario ( matricula ) ON DELETE CASCADE 
);
-- 5°
CREATE TABLE tb_endereco_funcionario(
 id_endereco INTEGER AUTO_INCREMENT,
 matricula   INTEGER NOT NULL,
 nome_rua    VARCHAR(50) NOT NULL,
 numero      INTEGER NULL,
 bairro      VARCHAR(50) NOT NULL,
 cep         CHAR (8) NOT NULL,

  PRIMARY KEY ( id_endereco ),
  FOREIGN KEY ( matricula ) REFERENCES tb_funcionario ( matricula ) ON DELETE CASCADE 
);
-- 6°
CREATE TABLE tb_endereco_paciente(
 id_endereco INTEGER AUTO_INCREMENT,
 id_paciente INTEGER NOT NULL,
 nome_rua    VARCHAR(50) NOT NULL,
 numero      INTEGER NULL,
 bairro      VARCHAR(50) NOT NULL,
 cep         CHAR (8) NOT NULL,

  PRIMARY KEY ( id_endereco ),
  FOREIGN KEY ( id_paciente ) REFERENCES tb_paciente ( id_paciente ) ON DELETE CASCADE 
);
-- 7°
CREATE TABLE tb_status_pgto(
 id_status    INTEGER AUTO_INCREMENT,
 status_final INTEGER NOT NULL,
 status       VARCHAR (50) NOT NULL,

 PRIMARY KEY ( id_status ),
 FOREIGN KEY ( status_final ) REFERENCES tb_status_pgto ( id_status ) ON DELETE CASCADE 
);
-- 8°
CREATE TABLE tb_faturamento(
 id             INTEGER AUTO_INCREMENT,
 id_status_pgto INTEGER NOT NULL,
 id_cunsulta    INTEGER NOT NULL,
 valor          DECIMAL (10,2) NOT NULL,
 data           DATE NOT NULL,

  PRIMARY KEY ( id ),
  FOREIGN KEY ( id_cunsulta ) REFERENCES tb_consulta ( id_cunsulta ) ON DELETE CASCADE ,
  FOREIGN KEY ( id_status_pgto ) REFERENCES tb_status_pgto ( id_status ) ON DELETE CASCADE 
);
-- 9°
CREATE TABLE tb_feedback(
 id_feedback INTEGER AUTO_INCREMENT,
 id_paciente INTEGER NOT NULL,
 nota        INTEGER NOT NULL,
 data        DATE NOT NULL,
 comentario  TEXT,

 PRIMARY KEY ( id_feedback ),
 FOREIGN KEY ( id_paciente ) REFERENCES tb_paciente ( id_paciente ) ON DELETE CASCADE 
);