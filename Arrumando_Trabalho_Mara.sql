Create database if not exists DB_Agencia_Turismo
default character set utf8
default collate utf8_general_ci;

use DB_Agencia_Turismo;

create table cidade(
nome_cidade varchar(50),
estado varchar(20),
populacao int,
cod_cidade int primary key auto_increment) default charset = utf8;

desc cidade;

create table hotel(
cod_hotel int primary key,
nome_hotel varchar(50),
endereco varchar(100),
categoria varchar(10),
cod_cidade int,
foreign key (cod_cidade) references cidade (cod_cidade))  default charset = utf8;

desc hotel;

create table tipo_quarto(
cod_hotel int,
cod_tipo int,
primary key (cod_hotel, cod_tipo),
num_quarto int,
valor_diaria decimal(6,2),
decricao varchar(50),
foreign key (cod_hotel) references hotel (cod_hotel))  default charset = utf8;

desc tipo_quarto;

create table restaurante(
cod_restaurante int primary key,
cod_cidade int,
cod_hotel int,
nome varchar(50),
endereco varchar (100),
categoria varchar(30),
foreign key (cod_cidade) references cidade(cod_cidade),
foreign key (cod_hotel) references hotel (cod_hotel)) default charset = utf8;

desc restaurante;

create table ponto_turistico(
cod_ponto_turistico int,
cod_cidade int,
primary key(cod_ponto_turistico),
descricao varchar(50),
endereco varchar(100),
foreign key (cod_cidade) references cidade(cod_cidade))default charset = utf8;

desc ponto_turistico;

create table igreja(
cod_igreja int,
data_fundacao date,
estilo varchar(30),
primary key(cod_igreja),
foreign key (cod_igreja) references ponto_turistico (cod_ponto_turistico)) default charset = utf8;

desc igreja;

create table museu(
cod_museu int,
data_fund date,
num_salas int,
primary key (cod_museu),
foreign key (cod_museu) references ponto_turistico (cod_ponto_turistico)) default charset = utf8;

desc museu;

create table if not exists casa_show(
cod_casa_show int,
primary key (cod_casa_show),
horario time,
dias_fechado varchar(50),
cod_restaurante int,
foreign key (cod_casa_show) references ponto_turistico (cod_ponto_turistico),
foreign key (cod_restaurante) references restaurante (cod_restaurante)) default charset = utf8;

desc casa_show;

create table fundador(
cod_fundador int,
nome varchar(50),
data_nasc date,
data_obto date,
nacionalidade varchar(30),
atividade varchar(30),
primary key (cod_fundador)) default charset = utf8;

desc fundador;

create table fundacao(
cod_museu int,
cod_fundador int,
foreign key (cod_museu) references museu (cod_museu),
foreign key (cod_fundador) references fundador (cod_fundador),
primary key (cod_museu, cod_fundador)) default charset = utf8;

desc fundacao;

insert into cidade (cod_cidade, nome_cidade, estado, populacao) values (default, 'Sao Paulo', 'SP', 124000000),
(default, 'Rio de Janeiro', 'RJ', 6320000), (default, 'Belo Horizonte', 'MG', 1433000);

select * from cidade;

insert into hotel (cod_hotel, nome_hotel, endereco, categoria, cod_cidade) values (1, 'Nova Era', 'Rua Libero Badarol, 22', '3 estrelas', 1),
(2, 'Jasmine', 'Rua do Tijuco, 430', '2 estrelas', 2), (3, 'Miraje', 'Rua Sertao, 120', '4 estrelas', 3);
select * from hotel;

insert into tipo_quarto (cod_hotel, cod_tipo, num_quarto, valor_diaria, decricao) values (1, 2, 10, 89.50, 'Quarto solteiro'),
(1,3,10,100,'Quarto Casal'), (1,4,5,120.50,'1 Casal 2 solteiro'), (2,2,10,70,'Quarto 2 solteiro'), (2,3,4,85,'Quarto Casal'),
(2,4,5,100,'1 Casal 2 solteiro'), (3,2,20,90.50,'Quarto solteiro'), (3,3,10,110.50,'Quarto Casal'), (3,4,15,120.50,'1 Casal 2 solteiro');

select * from tipo_quarto;

insert into restaurante (cod_restaurante, cod_cidade, cod_hotel, nome, endereco, categoria) values
(10, 1, 1, 'Restaurante Nova Era', 'Rua Libero Badarol, 22', 'Restaurante por Kilo'), (20, 2, 2, 'Churrascaria', 'Rua do Tijuco, 500', 'Churrascaria'),
(30, 3, 3, 'Pizzaria', 'Rua Sertao, 150', 'Pizzaria'), (40,1,null,'Restaurante X', 'Rua Xavantes, 1330', 'Self Service');

select * from restaurante;

insert into ponto_turistico (cod_ponto_turistico, cod_cidade, descricao, endereco) values (2,3,'Museu', 'Rua Braz Cubas, 401'),
(3,3, 'Boate', 'Av Coimbra, 100'), (5,3,'Igreja NS da Luz', 'Rua Bom Fim, 18'),
(11, 3, 'Igreja Menino Jesus', 'Rua Major Olimpo, 1000'), (15, 1, 'Igreaja NS da Luz', 'Rua Bom Fim, 18'),
(20, 1, 'Museu', 'Rua Braz Cubas, 401'), (25,2, 'Igreja São Judas', 'Rua XV Novembro SN'),
(30, 1, 'Boate', 'Av Coimbra, 100'), (40,2,'Museu','Av Copa Cabana, 40'),
(50,2,'Discotec', 'Rua da Ladeira, 200');

select * from ponto_turistico;

insert into Igreja (cod_igreja, data_fundacao, estilo) values (5,'1790-06-01','Bizantina'), (11,'1900-05-22',null),
(15,'1850-02-04','Barrroco'), (25,'1910-08-16','Gótico');

select * from igreja;

insert into museu (cod_museu, data_fund, num_salas) values (2,'2005-10-10', 5),
(20, '1900-07-05', 7), (40, '1988-11-01', 3);

select * from museu;

insert into casa_show (cod_casa_show, horario, dias_fechado, cod_restaurante) values 
(3,'22:00:00','Domingo a Quinta', null), (30,'23:00:00','Segunda a Quinta', null),
(50, '21:00:00', 'Segunda a Sexta', null);

select * from casa_show;

insert into fundador (cod_fundador, nome, data_nasc, data_obto, nacionalidade, atividade) values 
(13, 'Antônio Vilas Boas', '1932-01-01', '1994-05-07', 'Brasileiro', 'Historiador'),
(23, 'Plinio Alcântara', '1901-03-07', '1959-05-11', 'Brasileiro', 'Médico'), 
(31, 'José Bonifácio', '1845-02-10', '1902-05-02', 'Português', 'Professor');

select * from fundador;

insert into fundacao (cod_museu, cod_fundador) values (2,13), (20,31), (40,23);

select * from fundacao;