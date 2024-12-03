CREATE TABLE MORADOR (
bloco VARCHAR2(10) ,
numApt INTEGER ,
valorAluguel FLOAT,
idCondomino VARCHAR2(8)
);

CREATE TABLE CONDOMINOS (
idCondominio VARCHAR2(10) ,
nome VARCHAR2(50) ,
nomeMae VARCHAR2(50) ,
dataNasc DATE,
cpf VARCHAR2(15),
tel VARCHAR2(15),
email VARCHAR2(50),
tipo VARCHAR2(15),
senha VARCHAR2(50),
idCondominio VARCHAR2(8),
mensagem_id INTEGER
);


CREATE TABLE SINDICO (
inicioMandato DATE ,
fimMandato DATE,
idCondominio VARCHAR2(10)
);

CREATE TABLE SOLICITACOES (
idSolicitacao INTEGER,
solicitacao VARCHAR2(50),
justificativa VARCHAR2(60),
idCondomino VARCHAR2(10),
idCondominio VARCHAR2(8)
);

CREATE TABLE TAREFAS (
idTarefa INTEGER,
nome VARCHAR2(45),
status VARCHAR2(15),
dataConclusao DATE,
descricao VARCHAR2(45),
idCondomino VARCHAR2(10),
idCondominio VARCHAR2(8)
);

CREATE TABLE CONDOMINIO (
idCondominio VARCHAR2(8),
nome VARCHAR2(50),
endereco VARCHAR2(50),
num INTEGER,
cep VARCHAR2(15),
bairro VARCHAR2(30),
cidade VARCHAR2(20),
estado VARCHAR2(15),
proprietario VARCHAR2(45),
cnpj VARCHAR2(15)
);

CREATE TABLE MENSAGEM (
idMensagem INTEGER,
destinatario VARCHAR2(50),
mensagem VARCHAR2(50),
condomino VARCHAR2(10),
portaria INTEGER
);

CREATE TABLE PORTARIA (
idPortaria INTEGER,
porteiro VARCHAR2(45),
idCondominio VARCHAR2(8)
);



ALTER TABLE CONDOMINOS
    ADD CONSTRAINT CONDOMINOS_PK PRIMARY KEY (idCondomino );

ALTER TABLE SOLICITACOES
    ADD CONSTRAINT SOLICITACOES_PK PRIMARY KEY (idSolicitacao );

ALTER TABLE TAREFAS
    ADD CONSTRAINT TAREFAS_PK PRIMARY KEY (idTarefa );

ALTER TABLE CONDOMINIO
    ADD CONSTRAINT CONDOMINIP_PK PRIMARY KEY (idCondominio );

ALTER TABLE MENSAGEM
    ADD CONSTRAINT MENSAGEM_PK PRIMARY KEY (idMensagem);

ALTER TABLE PORTARIA
    ADD CONSTRAINT PORTARIA_PK PRIMARY KEY (idPortaria);







ALTER TABLE MORADOR
    ADD CONSTRAINT MORADOR_CONDOMINOS_FK FOREIGN KEY ( idCondomino )
    REFERENCES CONDOMINOS(idCondomino);


ALTER TABLE CONDOMINOS
    ADD CONSTRAINT CONDOMINOS_CONDOMINIO_FK FOREIGN KEY ( idCondominio )
    REFERENCES CONDOMINIO(idCondominio);


ALTER TABLE CONDOMINOS
    ADD CONSTRAINT CONDOMINOS_MENSAGEM_FK FOREIGN KEY ( mensagem_id )
    REFERENCES MENSAGEM(idMensagem);

ALTER TABLE SOLICITACOES
    ADD CONSTRAINT SOLICITACOES_CONDOMINOS_FK FOREIGN KEY ( idCondomino )
    REFERENCES CONDOMINOS(idCondomino);

ALTER TABLE SINDICO
    ADD CONSTRAINT SINDICO_CONDOMINOS_FK FOREIGN KEY ( idCondomino )
    REFERENCES CONDOMINOS(idCondomino);


ALTER TABLE TAREFAS
    ADD CONSTRAINT TAREFAS_CONDOMINOS_FK FOREIGN KEY ( idCondomino )
    REFERENCES CONDOMINOS(idCondomino);

ALTER TABLE TAREFAS
    ADD CONSTRAINT TAREFAS_CONDOMINIO_FK FOREIGN KEY ( idCondominio )
    REFERENCES CONDOMINIO(idCondominio);

ALTER TABLE MENSAGEM
    ADD CONSTRAINT MENSAGEM_CONDOMINOS_FK FOREIGN KEY ( condomino )
    REFERENCES CONDOMINOS(idCondomino);

ALTER TABLE MENSAGEM
    ADD CONSTRAINT MENSAGEM_PORTARIA_FK FOREIGN KEY ( portaria )
    REFERENCES PORTARIA(idPortaria);

ALTER TABLE PORTARIA
    ADD CONSTRAINT PORTARIA_CONDOMINIO_FK FOREIGN KEY ( idCondominio )
    REFERENCES CONDOMINIO(idCondominio);



