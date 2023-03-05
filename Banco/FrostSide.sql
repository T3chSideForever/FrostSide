CREATE DATABASE frostSide;
USE frostSide;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY auto_increment,
    login VARCHAR(100),
    senha VARCHAR(50)
);

INSERT INTO usuario (login, senha)
	VALUES 
		('empresa1', '123456'),
		('empresa2', '654321'),
		('empresa3', '246810'),
		('empresa3', '135791');
SELECT * FROM usuario;

CREATE TABLE fornecedor(
	idFornecedor INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
	cnpj CHAR(18)
);

INSERT INTO fornecedor(nome, cnpj)
	VALUES	
		('Bayer','18459628000115'),
		('Medley','13094578000872'),
		('Pfizer','46070868003699'),
		('Neo Química','05161069000110');
        
SELECT *  FROM fornecedor;

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