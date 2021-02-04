create database Agencia_Turismo
default character set utf8
default collate utf8_general_ci;

use Agencia_Turismo;

CREATE TABLE Hoteis (
    COD_Hotel INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Endereço VARCHAR(50),
    Valor_Diaria DOUBLE,
    Num_Quartos INT,
    Tipos_Quartos VARCHAR(30),
    Nome VARCHAR(35),
    Categoria VARCHAR(25),
    COD_Restaurante INT,
    FOREIGN KEY (COD_Restaurante)
        REFERENCES restaurantes (COD_Restaurantes)
)  DEFAULT CHARSET=UTF8;

desc hoteis;

CREATE TABLE restaurantes (
    COD_Restaurantes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Endereço VARCHAR(50),
    Tipo_Categ VARCHAR(30),
    Nome VARCHAR(50),
    Especialidade VARCHAR(30),
    Preco_Med DOUBLE
)  DEFAULT CHARSET=UTF8;

desc restaurantes;

CREATE TABLE Cidade (
    COD_Cidade INT PRIMARY KEY AUTO_INCREMENT,
    população BIGINT,
    Estado VARCHAR(2),
    nome VARCHAR(35),
    COD_PontoTurismo INT,
    COD_Hotel INT,
    COD_Restaurante INT,
    FOREIGN KEY (COD_PontoTurismo)
        REFERENCES Ponto_Turistico (COD_PontoTurismo),
    FOREIGN KEY (Hotel)
        REFERENCES Hoteis (COD_Hotel),
    FOREIGN KEY (COD_Restaurante)
        REFERENCES restaurantes (COD_Restaurante)
)  DEFAULT CHARSET=UTF8;

desc Cidade;

CREATE TABLE Ponto_Turistico (
    COD_PontoTurismo INT PRIMARY KEY AUTO_INCREMENT NOT NULL
)  DEFAULT CHARSET=UTF8;

CREATE TABLE Museus (
    COD_Museu INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Endereço VARCHAR(50),
    Data_Fund DATE,
    Num_Salas INT,
    descric VARCHAR(60),
    COD_Fund INT,
    COD_Turismo INT,
    FOREIGN KEY (COD_Turismo)
        REFERENCES Ponto_Turistico (COD_PontoTurismo),
    FOREIGN KEY (COD_Fund)
        REFERENCES fundadores (COD_Fund)
)  DEFAULT CHARSET=UTF8;

desc Museus;

CREATE TABLE Casa_Show (
    descric VARCHAR(60),
    Endereço VARCHAR(50),
    hor_abert TIME,
    Dia_Fech DATE,
    COD_CasaShow INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    COD_Restaurante INT,
    COD_Turismo INT,
    FOREIGN KEY (COD_Turismo)
        REFERENCES Ponto_Turistico (COD_PontoTurismo),
    FOREIGN KEY (COD_Restaurante)
        REFERENCES restaurantes (COD_Restaurantes)
)  DEFAULT CHARSET=UTF8;

desc Casa_Show;

CREATE TABLE Igrejas (
    COD_Igreja INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Descric VARCHAR(60),
    Endereço VARCHAR(50),
    Estilo_Construção VARCHAR(25),
    Data_Igreja DATE,
    COD_Turismo INT,
    FOREIGN KEY (COD_Turismo)
        REFERENCES Ponto_Turistico (COD_PontoTurismo)
)  DEFAULT CHARSET=UTF8;

Desc Igrejas;

CREATE TABLE fundadores (
    COD_Fund INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(50),
    Data_Morte DATE,
    Profissão VARCHAR(50),
    Nacionalidade VARCHAR(30),
    Data_Nasc DATE
)  DEFAULT CHARSET=UTF8;

desc fundadores;

insert into restaurantes (COD_Restaurantes, Endereço, Tipo_Categ, Nome, Preco_Med, Especialidade) values ();

insert into Hoteis (COD_Hotel,Endereço,Valor_Diaria,Num_Quartos,Tipos_Quartos,Nome,Categoria,COD_Restaurante) 
values ();

insert into fundadores (COD_Fund, Nome, Data_Morte, Profissão, Nacionalidade, Data_Nasc) values ();

insert into Ponto_Turistico (COD_PontoTurismo) values ();

insert into Igrejas (COD_Igreja, Descric, Endereço, Estilo_Construção, Data_Igreja, COD_PontoTurismo) values ();

insert into Casa_Show (descric, Endereço, hor_abert, Dia_Fech,COD_CasaShow, COD_Restaurante, COD_PontoTurismo) values ();

insert into Museus (COD_Museu, Endereço, Data_Fund, Num_Salas, descric, COD_Fund, COD_PontoTurismo) values ();

insert into Cidade (COD_Cidade, população, Estado, nome, COD_Museu, COD_Igreja, COD_CasaShow, COD_PontoTurismo) values ();