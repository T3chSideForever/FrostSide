CREATE DATABASE frostSide;
USE frostSide;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY auto_increment,
    login VARCHAR(100),
    senha VARCHAR(50)
);

CREATE TABLE transportadora(
	idTransportadora INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
	cnpj CHAR(18),
    IE CHAR(9)
);

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY auto_increment,
    sitSensor VARCHAR(50) constraint ckSensor check (sitSensor IN('Quebrado', 'Funcionando'))
);

CREATE TABLE registro(
	idRegistro INT primary key auto_increment,
    idSensor INT,
    registro DECIMAL(3,1), -- colocar valor como: 24.2, 21.0 e por ai vai, sempre com 3 digitos, 2 depois do ponto e um atrás
    dtRegistro DATETIME DEFAULT current_timestamp,    
    FOREIGN KEY (idSensor) REFERENCES sensor(idSensor)
);

CREATE TABLE destino (
idDestino int primary key auto_increment,
nomeDestino VARCHAR(100)
);

CREATE TABLE pedido (
idPedido INT PRIMARY KEY auto_increment,
qtdLotes int
);

CREATE TABLE lote (
idLote int primary key auto_increment,
nomeRemedio varchar(80),
tempMax DECIMAL(3,1),
tempMin DECIMAL(3,1)
);

CREATE TABLE carga (
idCarga int primary key auto_increment,
fkTransportadora int,
fkPedido int,
fkLote int,
FOREIGN KEY (fkPedido) REFERENCES pedido(idPedido),
FOREIGN KEY (fkLote) REFERENCES lote(idLote)
);
SHOW TABLES;

-- INSERTS 
INSERT INTO usuario (login, senha)
	VALUES 
		('empresa1', '123456');
        
INSERT INTO transportadora(nome, cnpj)
	VALUES	
		('Log10','18459628000115'),
		('FarmaTransporte','13094578000872'),
		('SpeedTransfer','46070868003699');

INSERT INTO sensor (sitSensor)
	VALUES
		('Quebrado'),
		('Funcionando'),
		('Funcionando'),
		('Funcionando');

INSERT INTO registro(idSensor, registro)
	VALUES 
		(2,-05.2),
		(3,01.2),
		(4,30.5);
        
INSERT INTO destino (idDestino, nomeDestino) VALUES
(null, 'Eurofarma'),
(null, 'Sanofi'),
(null, 'Hospital Estadual Sumaré Dr. Leandro Franceschini'),
(null, 'Hospital Geral Dr. Waldemar Alcantara');        

-- SELECTS
SELECT * FROM usuario;
SELECT * FROM transportadora;
SELECT * FROM sensor;
SELECT * FROM registro;
SELECT * FROM destino;
SELECT * FROM pedido;
SELECT * FROM lote;
SELECT * FROM carga;



