use sprint1;
CREATE DATABASE frostSide;
USE frostSide;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY auto_increment,
    login VARCHAR(100),
    senha VARCHAR(50)
);

INSERT INTO usuario (login, senha)
	VALUES 
		('empresa1', '123456');
SELECT * FROM usuario;

CREATE TABLE transportadora(
	idTransportadora INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
	cnpj CHAR(18),
    IE CHAR(9)
);

INSERT INTO transportadora(nome, cnpj)
	VALUES	
		('Log10','18459628000115'),
		('FarmaTransporte','13094578000872'),
		('SpeedTransfer','46070868003699');
        
SELECT *  FROM transportadora;

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY auto_increment,
    sitSensor VARCHAR(50) constraint ckSensor check (sitSensor IN('Quebrado', 'Funcionando'))
);

INSERT INTO sensor (sitSensor)
	VALUES
		('Quebrado'),
		('Funcionando'),
		('Funcionando'),
		('Funcionando');
SELECT * FROM sensor;


CREATE TABLE registro(
	idRegistro INT primary key auto_increment,
    idSensor INT,
    registro DECIMAL(3,1), -- colocar valor como: 24.2, 21.0 e por ai vai, sempre com 3 digitos, 2 depois do ponto e um atrás
    dtRegistro DATETIME DEFAULT current_timestamp,    
    FOREIGN KEY (idSensor) REFERENCES sensor(idSensor)
);

INSERT INTO registro(idSensor, registro)
	VALUES 
		(2,-05.2),
		(3,01.2),
		(4,30.5);

SELECT * FROM registro;
DESC sensor;
DESC fornecedor;
DESC usuario;

SELECT * FROM usuario;

INSERT INTO usuario (login, senha) VALUES
('empresa5', '489012');

select * from usuario;

select * from fornecedor;

insert into fornecedor (nome, cnpj) values
('Johnson', '90547821436517');

update fornecedor set nome = 'johnson johnson' where idFornecedor = 5;

select * from usuario where login like '%_';

drop database frostSide;

CREATE TABLE destino (
idDestino int primary key auto_increment,
nomeDestino VARCHAR(100)
);
/*dtEntrega DATETIME*/

