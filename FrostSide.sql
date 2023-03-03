CREATE DATABASE frostSide;
USE frostSide;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY auto_increment,
    login VARCHAR(100),
    senha VARCHAR(50)
);

CREATE TABLE fornecedor(
	idFornecedor INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
	cnpj CHAR(18),
    inscEstadual CHAR(15)
);

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY auto_increment,
    sttSensor TINYINT constraint chkSensor check (sttSensor IN(0,1)),
    sitSensor VARCHAR(50) constraint ckSensor check (sitSensor IN('Quebrado', 'Funcionando')),
    registro FLOAT NOT NULL,
    dtRegistro DATETIME DEFAULT current_timestamp    
);

DESC sensor;
DESC fornecedor;
DESC usuario;