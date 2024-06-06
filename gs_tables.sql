-- Dropando as tabelas para que não haja conflito 
DROP TABLE TB_REGIAO CASCADE CONSTRAINTS;
DROP TABLE TB_ANIMAL CASCADE CONSTRAINTS;
DROP TABLE TB_REGIAO_ANIMAL CASCADE CONSTRAINTS;
DROP TABLE TB_ATIVIDADE CASCADE CONSTRAINTS;
DROP TABLE TB_LICENCA CASCADE CONSTRAINTS;
DROP TABLE TB_PESCADOR CASCADE CONSTRAINTS;


-- Criação da tb_pescador
CREATE TABLE tb_pescador (
    id_pescador   NUMBER GENERATED ALWAYS AS IDENTITY,
    nome_pescador VARCHAR2(50) NOT NULL,
    rgp           VARCHAR2(20) NOT NULL,
    telefone      VARCHAR2(20) NOT NULL
);
-- Adicionando a Primary Key na tb_pescador 
ALTER TABLE tb_pescador ADD CONSTRAINT tb_pescador_pk PRIMARY KEY ( id_pescador );


-- Criação da tb_animal
CREATE TABLE tb_animal (
    id_animal        NUMBER GENERATED ALWAYS AS IDENTITY,
    nome_animal      VARCHAR2(50) NOT NULL,
    epoca_reproducao VARCHAR2(50) NOT NULL,
    epoca_pesca      VARCHAR2(50) NOT NULL,
    qtd_permitida    NUMBER(6, 2) NOT NULL
);
-- Adicionando a Primary Key na tb_animal
ALTER TABLE tb_animal ADD CONSTRAINT tb_animal_pk PRIMARY KEY ( id_animal );


-- Criação da tb_atividade
CREATE TABLE tb_atividade (
    id_atividade            NUMBER NOT NULL,
    local_inicial           VARCHAR2(50) NOT NULL,
    local_final             VARCHAR2(50) NOT NULL,
    inicio                  TIMESTAMP NOT NULL,
    fim                     TIMESTAMP NOT NULL,
    id_pescador             NUMBER NOT NULL
);
-- Adicionando a Primary Key na tb_atividade
ALTER TABLE tb_atividade ADD CONSTRAINT tb_atividade_pk PRIMARY KEY ( id_atividade );


-- Criação da tb_licenca
CREATE TABLE tb_licenca (
    id_licenca              NUMBER NOT NULL,
    situacao                VARCHAR2(10) NOT NULL,
    tipo                    VARCHAR2(1) NOT NULL,
    data_emissao            DATE NOT NULL,
    data_validade           DATE NOT NULL,
    id_pescador             NUMBER NOT NULL
);
CREATE UNIQUE INDEX tb_licenca__idx ON
    tb_licenca (
        id_pescador
    ASC );
-- Adicionando a Primary Key na tb_licenca
ALTER TABLE tb_licenca ADD CONSTRAINT tb_licenca_pk PRIMARY KEY ( id_licenca );


-- Criação da tb_regiao
CREATE TABLE tb_regiao (
    id_regiao   NUMBER NOT NULL,
    nome_regiao VARCHAR2(50) NOT NULL
);
-- Adicionando a Primary Key na tb_regiao
ALTER TABLE tb_regiao ADD CONSTRAINT tb_regiao_pk PRIMARY KEY ( id_regiao );


-- Criação da tb_regiao_animal por causa da relação N:N entre tb_animal e tb_regiao
CREATE TABLE tb_regiao_animal (
    id_animal NUMBER NOT NULL,
    id_regiao NUMBER NOT NULL
);
-- Adicionando as Primary Keys na tb_regiao_animal
ALTER TABLE tb_regiao_animal ADD CONSTRAINT regiao_animal_pk PRIMARY KEY ( id_animal,
                                                                           id_regiao );
                                                                           
-- Adicionando as Foreign Keys nas tabelas 
ALTER TABLE tb_regiao_animal
    ADD CONSTRAINT regiao_animal_tb_animal_fk FOREIGN KEY ( id_animal )
        REFERENCES tb_animal ( id_animal );

ALTER TABLE tb_regiao_animal
    ADD CONSTRAINT regiao_animal_tb_regiao_fk FOREIGN KEY ( id_regiao )
        REFERENCES tb_regiao ( id_regiao );

ALTER TABLE tb_atividade
    ADD CONSTRAINT tb_atividade_tb_pescador_fk FOREIGN KEY ( id_pescador )
        REFERENCES tb_pescador ( id_pescador );

ALTER TABLE tb_licenca
    ADD CONSTRAINT tb_licenca_tb_pescador_fk FOREIGN KEY ( id_pescador )
        REFERENCES tb_pescador ( id_pescador );