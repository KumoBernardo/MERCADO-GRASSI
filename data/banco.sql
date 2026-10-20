DROP DATABASE IF EXISTS db_mercado;

CREATE DATABASE IF NOT EXISTS db_mercado;
USE db_mercado;

CREATE TABLE tb_usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
perfil ENUM('operador', 'gestor') NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
senha VARCHAR(50) NOT NULL,
esta_ativo TINYINT DEFAULT 1
);

CREATE TABLE tb_produto(
id_produto INT PRIMARY KEY AUTO_INCREMENT,
codigo_interno VARCHAR(50) NOT NULL UNIQUE,
nome VARCHAR(50) NOT NULL,
Categoria VARCHAR(50) NOT NULL,
unidade_venda VARCHAR(50) NOT NULL,
preco DECIMAL(6,2),
imagem VARCHAR(50),
esta_ativo TINYINT DEFAULT 1
);

CREATE TABLE tb_ocorrencia(
id_ocorrencia INT PRIMARY KEY AUTO_INCREMENT,
produto_errado INT,
FOREIGN KEY (produto_errado) REFERENCES tb_produto(id_produto),
produto_certo INT,
FOREIGN KEY (produto_certo) REFERENCES tb_produto(id_produto),
quantidade INT NOT NULL,
diferenca DECIMAL(6,2) NOT NULL,
data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
usuario INT,
FOREIGN KEY (usuario) REFERENCES tb_usuario(id_usuario)
);