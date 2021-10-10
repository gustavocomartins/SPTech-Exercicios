CREATE DATABASE JOGOS;
USE JOGOS;

CREATE TABLE TABELA_TIME (
IDTIME INT PRIMARY KEY AUTO_INCREMENT,
NOME_TIME VARCHAR(45),
FUNDACAO DATE,
SERIE CHAR(1) CHECK( SERIE = "D" OR SERIE = "C" OR SERIE = "B" OR SERIE = "A" OR SERIE = "S"),
VALOR_TIME DECIMAL(11,2)
);

CREATE TABLE JOGADORES (
IDJOGADORES INT PRIMARY KEY AUTO_INCREMENT,
NOME_JOGADORES VARCHAR(50),
NASCIMENTO_JOGADORES DATE,
SEXO_JOGADORES CHAR(1) CHECK(SEXO_JOGADORES = "M" OR SEXO_JOGADORES = "F"),
PASSE_JOGADOR DECIMAL(10,2),
FK_TIME INT,
FOREIGN KEY(FK_TIME) REFERENCES TABELA_TIME(IDTIME)
);

CREATE TABLE SEGUIDORES (
IDSEGUIDORES INT PRIMARY KEY AUTO_INCREMENT,
NOME_SEGUIDOR VARCHAR(50),
DATA_FOLLOW DATE,
SEXO CHAR(1) CHECK(SEXO = "M" OR SEXO = "F"),
VALOR_CARTEIRINHA DECIMAL(6,2),
FK_JOGADOR INT,
FOREIGN KEY(FK_JOGADOR) REFERENCES JOGADORES(IDJOGADORES)
);

INSERT INTO TABELA_TIME (NOME_TIME, FUNDACAO, SERIE, VALOR_TIME) VALUES
("ATLETICO","1980-12-25","C",25000.00),
("JUVENTUDE","1999-05-18","A",74500.00),
("CAÇAROLA","2005-02-04","S",7000000.00);

INSERT INTO JOGADORES (NOME_JOGADORES,NASCIMENTO_JOGADORES,SEXO_JOGADORES,PASSE_JOGADOR,FK_TIME) VALUES
("MARCIO","1988-04-03","M",1300.00,1),
("CAMPBELL","1997-11-06","M",250000.50,3),
("LYANNA","2004-07-13","F",102500.00,2),
("CLARA","2000-01-25","F",50000.00,1),
("JULIUS","1975-04-30","M",44900.00,3);

INSERT INTO SEGUIDORES (NOME_SEGUIDOR, DATA_FOLLOW, SEXO, VALOR_CARTEIRINHA, FK_JOGADOR) VALUES
("JOAO","2010-05-04","M",500.00,3),
("LIZA","2013-02-20","F",85.50,1),
("STEBAN","2007-10-15","M",410.99,2),
("BEATRIZ","2011-05-05","F",100.00,2),
("GABRIEL","1999-12-12","M",8000.00,3);

SELECT * FROM TABELA_TIME;
SELECT * FROM JOGADORES;
SELECT * FROM SEGUIDORES;

DESC JOGADORES;
DESC SEGUIDORES;
DESC TABELA_TIME;

UPDATE TABELA_TIME SET NOME_TIME = "CARVALHO" WHERE IDTIME = 2;

UPDATE JOGADORES SET NOME_JOGADORES = "MIRANDA" WHERE IDJOGADORES = 1;

SELECT SUM(PASSE_JOGADOR) FROM JOGADORES;

SELECT AVG(VALOR_TIME) AS "MEDIA DOS TIMES" FROM TABELA_TIME;

SELECT * FROM SEGUIDORES LEFT JOIN JOGADORES ON SEGUIDORES.FK_JOGADOR = JOGADORES.IDJOGADORES;

SELECT * FROM TABELA_TIME LEFT JOIN JOGADORES ON JOGADORES.FK_TIME = TABELA_TIME.IDTIME WHERE JOGADORES.SEXO_JOGADORES = "M";