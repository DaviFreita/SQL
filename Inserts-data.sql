--INSERINDO INFORMAÇÕES DE USUARIOS
INSERT INTO usuario(nome_usuario, endereco, telefone, email)
VALUES ('Maria helena', 'Caico', '8398123456', 'mhdograu@gmail.com')

INSERT INTO usuario(nome_usuario, endereco, telefone, email)
VALUES ('Vitor Silva', 'Santa Cruz', '8398123468', 'Vitinho@gmail.com')

INSERT INTO usuario(nome_usuario, endereco, telefone, email)
VALUES ('Bruno Borges', 'Caico', '8398598951', 'BruninhoPegacao@gamil.com')



--INSERINDO INFORMAÇÕES DE LIVROS
INSERT INTO livros(isbn, titulo, ano, editora, genero)
VALUES ('9780152048044', 'Pequeno Principe', '1943-06-03', 'Reynal & Hitchcock', 'infantojuvenil')

INSERT INTO livros(isbn, titulo, ano, editora, genero)
VALUES ('9780152048045', 'Pequeno Principe - 2', '1943-06-3', 'Reynal & Hitchcock', 'infantojuvenil')

INSERT INTO livros(isbn, titulo, ano, editora, genero)
VALUES ('9788598078717','Como Treinar Seu Dragão','2003-01-01','Intriseca','Fantasia, ficção juvenil e aventura')


--DEMONSTRAÇÃO DE DELETE 
DELETE FROM livros WHERE isbn = '9780152048045'

DELETE FROM usuario WHERE endereco = 'Santa Cruz'


--INSERINDO INFORMAÇÕES DE BIBLIOTECARIO
INSERT INTO bibliotecario(nome_bibliotecario)
VALUES ('Davi Freitas')




--INSERINDO INFORMAÇÕES DE EMPRESTIMO
INSERT INTO emprestimo(data_emprestimo, data_devolucao,id_bibliotecario, cod_usuario, isbn)
VALUES ('01-11-2025','16-11-2025', 1, 3, '9788598078717')

INSERT INTO emprestimo(data_emprestimo, data_devolucao,id_bibliotecario, cod_usuario, isbn)
VALUES ('25-11-2025','10-12-2025', 1, 2, '9780152048044')



--INSERINDO INFORMAÇÕES DE PAGAMENTO
INSERT INTO pagamento(valor, data_pagamento, tipo_pagamento, cod_usuario)
VALUES (20.99, '01-11-2025', 'PIX', 3)

INSERT INTO pagamento(valor, data_pagamento, tipo_pagamento, cod_usuario)
VALUES (25.99, '25-11-2025', 'BOLETO', 2)
SELECT * FROM pagamento


--INSERINDO INFORMAÇÕES DE MULTA
INSERT INTO multa(valor, dias_atraso, status_pagamento, data_pagamento, id_pagamento)
VALUES (20.99, 15, FALSE, '01-12-2025', 2)




--DEMONSTRAÇÃO DE UPDATE
UPDATE usuario
SET email = 'BruninhoReiDelas@gmail.com'
WHERE nome_usuario = 'Bruno Borges'

