DROP DATABASE IF EXISTS estacionamento;

CREATE DATABASE estacionamento;

USE estacionamento;

CREATE TABLE
  carro (
    placa VARCHAR(8) NOT NULL PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano VARCHAR(4) NOT NULL,
    UNIQUE (placa)
  );

CREATE TABLE
  funcionario (
    matricula VARCHAR(28) NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(28) NOT NULL
  );

CREATE TABLE
  manutencao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(8) NOT NULL,
    matricula VARCHAR(28) NOT NULL,
    inicio DATETIME NOT NULL,
    fim DATETIME NOT NULL,
    descricao VARCHAR(255),
    FOREIGN KEY (placa) REFERENCES carro (placa),
    FOREIGN KEY (matricula) REFERENCES funcionario (matricula)
  );

LOAD DATA INFILE 'C:\Users\bruno\Desktop\BCD\veiculos.csv' INTO TABLE carro FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\Users\bruno\Desktop\BCD\funcionarios.csv' INTO TABLE funcionario FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\Users\bruno\Desktop\BCD\manutencoes.csv' INTO TABLE manutencao FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;