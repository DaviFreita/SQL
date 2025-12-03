--CRIANDO DATABASE
CREATE DATABASE BibliotecaUfersa


--CRIANDO TABELA COM INFORMAÇÕES DO LIVRO
CREATE TABLE livros(
	isbn VARCHAR(20) PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	ano DATE NOT NULL,
	editora VARCHAR(100) NOT NULL,
	genero VARCHAR(100) NOT NULL
)


--CRIANDO TABELA COM INFORMAÇÕES DO USUÁRIO
CREATE TABLE usuario(
    cod_usuario SERIAL PRIMARY KEY,
    nome_usuario VARCHAR(150) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150) NOT NULL,
    status_pagamento BOOLEAN DEFAULT FALSE
)


--CRIANDO TABELA COM INFORMAÇÕES DO BIBLIOTECARIO
CREATE TABLE bibliotecario(
	id_bibliotecario SERIAL PRIMARY KEY,
	nome_bibliotecario VARCHAR(100) NOT NULL
)


--CRIANDO TABELA COM INFORMAÇÕES DE EMPRESTIMO
CREATE TABLE emprestimo(
	id_emprestimo SERIAL PRIMARY KEY,
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,
	id_bibliotecario INTEGER NOT NULL REFERENCES bibliotecario(id_bibliotecario),
	cod_usuario INTEGER NOT NULL REFERENCES usuario(cod_usuario),
	isbn VARCHAR(20) NOT NULL REFERENCES livros(isbn)
)


--CRIANDO TABELA COM INFORMAÇÕES DE PAGAMENTO
CREATE TABLE pagamento(
	id_pagamento SERIAL PRIMARY KEY,
	valor NUMERIC(10,2) NOT NULL,
	data_pagamento DATE NOT NULL,
	tipo_pagamento VARCHAR(50),
	cod_usuario INTEGER NOT NULL REFERENCES usuario(cod_usuario)
)


--CRIANDO TABELA COM INFORMAÇÕES DE MULTA
CREATE TABLE multa(
	id_multa SERIAL PRIMARy KEY,
	valor NUMERIC(10,2) NOT NULL,
	dias_atraso INTEGER NOT NULL,
	status_pagamento BOOlEAN NOT NULL,
	data_pagamento DATE NOT NULL,
	id_pagamento INTEGER NOT NULL REFERENCES pagamento(id_pagamento)
)	

--CRIAÇÃO DE VIEW--01
--serve para ver a lista de usuarios que existe sem mostrar informações sigilosas
CREATE VIEW lista_usuarios AS
SELECT nome_usuario, telefone
FROM usuario

SELECT * FROM lista_usuarios

--CRIAÇÃO DE VIEW--02
--serve para listar todas as multas que possue no sistema, sem o id para que nÃ£o saia informaçõe que comprometa o usuario que esta em atraso
CREATE VIEW lista_multa AS
SELECT valor, dias_atraso, status_pagamento, data_pagamento
FROM multa

SELECT * FROM lista_multa