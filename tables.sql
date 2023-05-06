create database bd_escola;

use bd_escola;

create table tbl_endereco (
  id int(10) not null,
  cep int(9) not null,
  logradouro varchar(90) not null,
  bairro varchar(50) not null,
  cidade varchar(50) not null,
  estado char(2) not null,
  
  primary key (cep)
);

select * from tbl_endereco where bairro = 'Sítio das Madres';

create table tbl_escola(
	id_unidade int auto_increment,
    unidade varchar(50),
    cep int(9) not null,
    numero varchar(10),
    nivel_ensino varchar(80),
    
    primary key (id_unidade),
    FOREIGN KEY (cep) REFERENCES tbl_endereco(cep)
);

insert into tbl_escola (unidade, cep, numero, nivel_ensino) values 
('EMI Monica', 6774100, '80', 'pré-escola|creche'),
('EMEF Ugo Arduini', 6774100, '135', 'ensino fundamental(1º ao 5º ano)');

select es.cep, en.logradouro from tbl_escola as es
inner join tbl_endereco as en
on es.cep = en.cep;

create table tbl_professor(
	id_professor int auto_increment,
    nome varchar(50) not null,
    
    primary key(id_professor)
);

INSERT INTO tbl_professor (nome)
VALUES 
('João da Silva'),
('Maria dos Santos'),
('Pedro Henrique'),
('Carla Pereira'),
('Lucas Oliveira'),
('Aline Costa'),
('Ricardo Ferreira');

select * from tbl_professor;

create table tbl_turma(
	id_turma int auto_increment,
    max_aluno int default 30,
    min_aluno int default 10,
    horario varchar(20),
    nivel varchar(20),
    id_unidade int,
    id_professor int,
    
	primary key (id_turma),
    FOREIGN KEY (id_unidade) REFERENCES tbl_escola(id_unidade),
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id_professor)
);

INSERT INTO tbl_turma (id_unidade, id_professor, horario, nivel)
VALUES 
(1, 1, 'manhã', 'pré'),
(1, 1, 'tarde', 'creche'),
(1, 2, 'manhã', 'pré'),
(1, 2, 'tarde', 'creche');

select t.id_turma, p.nome, e.unidade from tbl_turma as t
inner join tbl_escola as e on e.id_unidade = t.id_unidade
inner join tbl_professor as p on p.id_professor = t.id_professor;

create table tbl_responsavel(
	cpf varchar(11),
    nome varchar(50),
    rg varchar (20),
    cep int(9) not null,
    numero varchar(10),
    complemento varchar(20),
    data_nascimento date,
    
    primary key(cpf),
    FOREIGN KEY (cep) REFERENCES tbl_endereco(cep)
);

INSERT INTO tbl_responsavel (cpf, nome, rg, cep, numero, complemento, data_nascimento)
VALUES 
('12345678900', 'João Silva', '1234567', 6790000, '123', 'Casa', '1985-06-20'),
('13456789011', 'Maria Santos', '2345678', 6757130, '234', 'Apt 101', '1978-11-15'),
('34567890123', 'Pedro Souza', '3456789', 6774290, '345', 'Casa', '1982-02-10'),
('45998904321', 'Ana Oliveira', '4567890', 6783110, '456', 'Apt 202', '1975-09-25'),
('66689012345', 'Luiz Pereira', '5678901', 6795040, '567', 'Casa', '1988-03-05'),
('99890123456', 'Amanda Costa', '6789012', 6774210, '678', 'Apt 303', '1973-08-12'),
('43201234567', 'Lucas Carvalho', '7890123', 6774230, '789', 'Casa', '1980-04-30'),
('89012345678', 'Carla Lima', '8901234', 6775490, '890', 'Apt 404', '1977-01-17'),
('90123456700', 'Ricardo Santos', '9012345', 6775300, '901', 'Casa', '1986-07-22'),
('01234567890', 'Fernanda Rocha', '0123456', 6775280, '012', 'Apt 505', '1971-12-08'),
('12345678901', 'Thiago Ferreira', '1234567', 6774280, '123', 'Casa', '1983-09-18'),
('23456789012', 'Mariana Alves', '2345678', 6774250, '234', 'Apt 606', '1976-05-13'),
('34567890321', 'Vitoria Santos', '3456789', 6774300, '345', 'Casa', '1984-02-07'),
('45678901234', 'Bruno Silva', '4567890', 6774260, '456', 'Apt 707', '1979-11-02'),
('56789012345', 'Tatiana Oliveira', '5678901', 6774255, '567', 'Casa', '1987-08-27'),
('67890123456', 'Renan Almeida', '6789012', 6790000, '678', 'Apt 808', '1974-04-14'),
('78901234567', 'Fabiola Barbosa', '7890123', 6783110, '789', 'Casa', '1981-01-01'),
('89012345688', 'Luana Santos', '8901234', 6795040, '890', 'Apt 909', '1972-06-16'),
('90123456789', 'Guilherme Ribeiro', '9012345', 6774230, '901', 'Casa', '1989-03-12'),
('22233344455', 'Maria Silva', '1234567', '6774255', '123', 'Apto 1', '1975-10-20');

select r.cep, e.logradouro from tbl_responsavel as r
inner join tbl_endereco as e
on e.cep = r.cep
where e.bairro = "Jardim Santa Cruz"; 

CREATE TABLE tbl_aluno (
    id_aluno INT AUTO_INCREMENT,
    nome VARCHAR(50),
    rg VARCHAR(20),
    cep INT(9) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(20),
    data_nascimento DATE,
    
    id_responsavel VARCHAR(11) NOT NULL,
    id_turma INT NOT NULL,
    PRIMARY KEY (id_aluno),
    FOREIGN KEY (cep)
        REFERENCES tbl_endereco (cep),
    FOREIGN KEY (id_responsavel)
        REFERENCES tbl_responsavel (cpf),
    FOREIGN KEY (id_turma)
        REFERENCES tbl_turma (id_turma)
);

/*Turma 1*/

INSERT INTO tbl_aluno (nome, rg, cep, numero, complemento, data_nascimento, id_responsavel, id_turma)
values
('Karina Almeida Pereira', '20212223-5', 6790000, '123', 'Casa',      '2019-01-01', 12345678900, 1),
('Leandro Rocha Barbosa', '30313233-6', 6790000, '123', 'Casa',       '2019-03-15', 12345678900, 1),
('Marcela Fernandes Silva', '40414243-7', 6757130, '234', 'Apt 101',  '2019-05-22', 13456789011, 1),
('Natália Ribeiro Santos',  '50515253-8', 6757130, '234', 'Apt 101',  '2019-07-07', 13456789011, 1),
('Otávio Costa Pereira', '60616273-9', 6774290, '345', 'Casa',        '2019-09-12', 34567890123, 1),
('Patrícia Alves Rodrigues', '70717283-0', 6774290, '345', 'Casa',    '2019-11-23', 34567890123, 1),
('Rafaela Mendes Oliveira', '80818293-1', 6783110, '456', 'Apt 202',  '2018-02-14', 45998904321, 1),
('Sarah Lima Santos', '90919203-2', 6783110, '456', 'Apt 202',        '2018-04-29', 45998904321, 1),
('Thales Souza Castro', '11213141-3', 6795040, '567', 'Casa',         '2018-06-18', 66689012345, 1),
('Vanessa Pereira Fernandes', '12223242-4', 6795040, '567', 'Casa',   '2018-12-31', 66689012345, 1); 

select a.id_aluno, a.nome as nome_aluno, t.horario, t.nivel, a.data_nascimento, r.nome as responsavel from tbl_aluno as a
inner join tbl_responsavel as r on a.id_responsavel = r.cpf
inner join tbl_turma as t on t.id_turma = a.id_turma
order by a.nome;

/*Turma 2*/
INSERT INTO tbl_aluno (nome, rg, cep, numero, complemento, data_nascimento, id_responsavel, id_turma)
values
('Bruno Oliveira Silva', '22334455-6',  6774280, '123', 'Casa',     '2020-03-22', 12345678901, 2),
('Carla Souza Lima',  '33445566-7', 6774250, '234', 'Apt 606',      '2020-05-05', 23456789012, 2),
('Diego Pereira Santos',  '44556677-8', 6774300, '345', 'Casa',     '2021-02-10', 34567890321, 2),
('Erika Castro Almeida',  '55667788-9', 6774260, '456', 'Apt 707',  '2021-04-28', 45678901234, 2),
('Felipe Rodrigues Mendes', '66778899-0',  6774255, '567', 'Casa',  '2021-06-17', 56789012345, 2),
('Gabriela Silva Rocha',   '77889900-1', 6790000, '678', 'Apt 808', '2022-01-01', 67890123456, 2),
('Henrique Santos Alves',   '88990011-2', 6783110, '789', 'Casa',   '2022-03-11', 78901234567, 2),
('Isabela Oliveira Costa', '99001122-3', 6795040, '890', 'Apt 909', '2022-07-02', 89012345688, 2),
('João Pedro Lima Fernandes', '10111213-4', 6774230, '901', 'Casa', '2022-10-19', 90123456789, 2);



















