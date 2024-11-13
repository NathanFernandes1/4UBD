CREATE TABLE EMPREGADO (
    nome VARCHAR(50 CHAR) NOT NULL,
    rg VARCHAR(8 CHAR) NOT NULL,
    cic VARCHAR(8 CHAR) NOT NULL,
    depto INTEGER NOT NULL,
    rg_supervisor VARCHAR(8 CHAR),
    salario NUMBER(11,2) NOT NULL
);

CREATE TABLE DEPARTAMENTO (
    nome VARCHAR(50 CHAR) NOT NULL,
    numero INTEGER NOT NULL,
    rg_gerente VARCHAR(8 CHAR) NOT NULL
);

CREATE TABLE PROJETO (
    nome VARCHAR(50 CHAR) NOT NULL,
    numero INTEGER NOT NULL,
    localizacao VARCHAR(50 CHAR) NOT NULL
);

CREATE TABLE DEPENDENTES (
    rg_responsavel VARCHAR(8 CHAR) NOT NULL,
    nome_dependente VARCHAR(50 CHAR) NOT NULL,
    nascimento DATE NOT NULL,
    relacao VARCHAR(30 CHAR),
    sexo VARCHAR(15 CHAR)
);

CREATE TABLE DEPARTAMENTO_PROJETO(
    numero_departamento INTEGER NOT NULL,
    numero_projeto INTEGER NOT NULL
);

CREATE TABLE EMPREGADO_PROJETO(
    rg_empregado VARCHAR2(8 CHAR) NOT NULL,
    numero_projeto INTEGER NOT NULL,
    horas INTEGER NOT NULL
);



ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY ( rg );

ALTER TABLE empregado
    ADD CONSTRAINT empregado_empregado_fk FOREIGN KEY ( rg_supervisor )
        REFERENCES empregado ( rg );



ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( numero );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_empregado_fk FOREIGN KEY ( rg_gerente )
        REFERENCES empregado ( rg );



ALTER TABLE projeto
    ADD CONSTRAINT projeto_pk PRIMARY KEY ( numero );



ALTER TABLE dependentes
    ADD CONSTRAINT dependentes_pk PRIMARY KEY ( nome_dependente );

ALTER TABLE dependentes
    ADD CONSTRAINT dependentes_empregado_fk FOREIGN KEY ( rg_responsavel )
    REFERENCES empregado(rg);



ALTER TABLE departamento_projeto
    ADD CONSTRAINT departamento_projeto_departamento_fk FOREIGN KEY ( numero_departamento )
    REFERENCES departamento(numero);

ALTER TABLE departamento_projeto
    ADD CONSTRAINT departamento_projeto_projeto_fk FOREIGN KEY ( numero_projeto )
    REFERENCES projeto(numero);



ALTER TABLE empregado_projeto
    ADD CONSTRAINT empregado_projeto_projeto_fk FOREIGN KEY ( numero_projeto )
    REFERENCES projeto(numero);

ALTER TABLE empregado_projeto
    ADD CONSTRAINT empregado_projeto_empregado_fk FOREIGN KEY ( rg_empregado )
    REFERENCES empregado(rg);



INSERT INTO empregado (nome, rg, cic, depto, rg_supervisor, salario)
VALUES ('João Luiz', '10101010', 11111111, 1, NULL, 3000.00);

INSERT INTO empregado (nome, rg, cic, depto, rg_supervisor, salario)
VALUES ('Fernando', '20202020', 22222222, 2, 10101010, 2500.00);

INSERT INTO empregado (nome, rg, cic, depto, rg_supervisor, salario)
VALUES ('Ricardo', '30303030', 33333333, 2, 10101010, 2300.00);

INSERT INTO empregado (nome, rg, cic, depto, rg_supervisor, salario)
VALUES ('Jorge', '40404040', 44444444, 2, 20202020, 4200.00);

INSERT INTO empregado (nome, rg, cic, depto, rg_supervisor, salario)
VALUES ('Renato', '50505050', 55555555, 3, 20202020, 1300.00);


INSERT INTO departamento (nome, numero, rg_gerente)
VALUES ('Contabilidade', 1, '10101010' );

INSERT INTO departamento (nome, numero, rg_gerente)
VALUES ('Engenharia Civil', 2, '30303030' );

INSERT INTO departamento (nome, numero, rg_gerente)
VALUES ('Engenharia
Mecânica', 3, '20202020' );


INSERT INTO projeto (nome, numero, localizacao)
VALUES ('Financeiro 1', 5, 'São Paulo' );

INSERT INTO projeto (nome, numero, localizacao)
VALUES ('Motor 3', 10, 'Rio Claro' );

INSERT INTO projeto (nome, numero, localizacao)
VALUES ('Prédio Central', 20, 'Campinas' );



INSERT INTO dependentes (rg_responsavel, nome_dependente, nascimento, relacao, sexo)
VALUES ('10101010', 'Jorge','12-27-86', 'Filho', 'Masculino' );

INSERT INTO dependentes (rg_responsavel, nome_dependente, nascimento, relacao, sexo)
VALUES ('10101010', 'Luiz','11-18-79', 'Filho', 'Masculino' );

INSERT INTO dependentes (rg_responsavel, nome_dependente, nascimento, relacao, sexo)
VALUES ('20202020', 'Fernanda','02-14-69', 'Cônjuge', 'Feminino' );

INSERT INTO dependentes (rg_responsavel, nome_dependente, nascimento, relacao, sexo)
VALUES ('20202020', 'Ângelo','02-10-95', 'Filho', 'Masculino' );

INSERT INTO dependentes (rg_responsavel, nome_dependente, nascimento, relacao, sexo)
VALUES ('30303030', 'Adreia','05-01-90', 'Filho', 'Feminino' );



INSERT INTO DEPARTAMENTO_PROJETO (numero_departamento,numero_projeto)
VALUES (2,5);

INSERT INTO DEPARTAMENTO_PROJETO (numero_departamento,numero_projeto)
VALUES (3, 10);

INSERT INTO DEPARTAMENTO_PROJETO (numero_departamento,numero_projeto)
VALUES (2,20);



INSERT INTO EMPREGADO_PROJETO (rg_empregado,numero_projeto,horas)
VALUES (20202020,5,10);

INSERT INTO EMPREGADO_PROJETO (rg_empregado,numero_projeto,horas)
VALUES (20202020,10,25);

INSERT INTO EMPREGADO_PROJETO (rg_empregado,numero_projeto,horas)
VALUES (30303030,5,35);

INSERT INTO EMPREGADO_PROJETO (rg_empregado,numero_projeto,horas)
VALUES (40404040,20,50);

INSERT INTO EMPREGADO_PROJETO (rg_empregado,numero_projeto,horas)
VALUES (50505050,20,35);



