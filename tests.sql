-- ============================================================
-- TESTES DE BANCO DE DADOS - BIBLIOTECA
-- ============================================================



-- ============================================================
-- 5.1 TESTE DE INSERÇÃO
-- ============================================================


-- ============================================================
-- Livros (Válido)
-- ============================================================
-- Resultado esperado: O livro deve ser inserido e aparecer no SELECT.


INSERT INTO livros(isbn, titulo, ano, editora, genero)
VALUES ('9780152048044', 'Pequeno Principe', '1943-06-03', 'Reynal & Hitchcock', 'infantojuvenil');



-- ============================================================
-- Livros (Inválido)
-- ============================================================
-- Resultado esperado: O livro vai ser inválido pois já existe um ISBN com essa chave primária.


INSERT INTO livros(isbn, titulo, ano, editora, genero)
VALUES ('9780152048044', 'Como treinar o seu dragão', '1943-06-03', 'Intriseca', 'infantojuvenil');



-- ============================================================
-- Usuário (Válido)
-- ============================================================
-- Resultado esperado: O usuário é criado com um cod_usuario gerado automaticamente.


INSERT INTO usuario(nome_usuario, endereco, telefone, email)
VALUES ('Bruno Borges', 'Caicó', '8398598951', 'BruninhoPegacao@gmail.com');



-- ============================================================
-- Usuário (Inválido)
-- ============================================================
-- Resultado esperado: O NULL no nome_usuario viola as restrições NOT NULL na tabela usuario.


INSERT INTO usuario(nome_usuario, endereco, telefone, email)
VALUES (NULL, 'Caicó', '8398598951', 'BruninhoPegacao@gmail.com');



-- ============================================================
-- Empréstimo (Válido)
-- ============================================================
-- Resultado esperado: O empréstimo vai aparecer na tabela sem erros.


INSERT INTO emprestimo(data_emprestimo, data_devolucao, id_bibliotecario, cod_usuario, isbn)
VALUES ('2025-11-01', '2025-11-16', 1, 3, '9788598078717');



-- ============================================================
-- Empréstimo (Inválido)
-- ============================================================
-- Resultado esperado: Vai ocorrer um erro, pois não existe esse usuário (inexistente).


INSERT INTO emprestimo(data_emprestimo, data_devolucao, id_bibliotecario, cod_usuario, isbn)
VALUES ('2025-11-01', '2025-11-16', 1, 999, '9788598078717');



-- ============================================================
-- 5.2 TESTE DE REMOÇÃO
-- ============================================================


-- ============================================================
-- Remover um livro (Válido)
-- ============================================================
-- Resultado esperado: Remoção do livro pelo seu ISBN.


DELETE FROM livros
WHERE isbn = '9780152048044';



-- ============================================================
-- Remover um livro (Inválido)
-- ============================================================
-- Resultado esperado: Comando inválido, pois não existe ISBN com esse número.


DELETE FROM livros
WHERE isbn = '1231232744333';



-- ============================================================
-- Remover um Usuário (Válido)
-- ============================================================
-- Resultado esperado: Remoção do usuário pelo seu cod_usuario.


DELETE FROM usuario
WHERE cod_usuario = 1;



-- ============================================================
-- Remover um Usuário (Inválido)
-- ============================================================
-- Resultado esperado: Comando inválido, pois não existe cod_usuario com essa chave primária.


DELETE FROM usuario
WHERE cod_usuario = 999;



-- ============================================================
-- Remover um Empréstimo (Válido)
-- ============================================================
-- Resultado esperado: Remoção do empréstimo pelo seu id_emprestimo.


DELETE FROM emprestimo
WHERE id_emprestimo = 1;



-- ============================================================
-- Remover um Empréstimo (Inválido)
-- ============================================================
-- Resultado esperado: Comando inválido, pois não existe id_emprestimo com essa chave primária.


DELETE FROM emprestimo
WHERE id_emprestimo = 999;



-- ============================================================
-- 5.3 TESTE DE LISTAGEM (SELECT)
-- ============================================================


-- ============================================================
-- Listagem de todos os usuários (Válido)
-- ============================================================
-- Resultado esperado: Lista todos os usuários na tabela usuario.


SELECT * FROM usuario;



-- ============================================================
-- Listagem de tabela inexistente (Inválido)
-- ============================================================
-- Resultado esperado: Erro - Tabela inexistente.


SELECT * FROM tabela_inexistente;



-- ============================================================
-- Listagem de usuário pelo nome e telefone (Válido)
-- ============================================================
-- Resultado esperado: Lista todos os usuários a partir do nome e telefone.


SELECT nome_usuario, telefone FROM usuario;



-- ============================================================
-- Listagem com colunas inexistentes (Inválido)
-- ============================================================
-- Resultado esperado: Erro - As colunas nomes e telefones não existem na tabela usuario.


SELECT nomes, telefones FROM usuario;



-- ============================================================
-- 5.4 TESTES DE ALTERAÇÃO (UPDATE)
-- ============================================================


-- ============================================================
-- Atualizar email de um usuário (Válido)
-- ============================================================
-- Resultado esperado: Email atualizado com sucesso.


UPDATE usuario
SET email = 'BruninhoReiDelas@gmail.com'
WHERE cod_usuario = 1;



-- ============================================================
-- Atualizar email de um usuário inexistente (Inválido)
-- ============================================================
-- Resultado esperado: Nada foi afetado, pois o usuário não existe.


UPDATE usuario
SET email = 'BruninhoReiDelas@gmail.com'
WHERE cod_usuario = 99;



-- ============================================================
-- 5.5 TESTES DE VIEWS
-- ============================================================


-- ============================================================
-- Consultar view de usuários (Válido)
-- ============================================================
-- Resultado esperado: Exibe apenas o nome e o telefone dos usuários.


SELECT * FROM lista_usuarios;



-- ============================================================
-- Inserir dados diretamente em uma VIEW (Inválido)
-- ============================================================
-- Resultado esperado: Erro - Não é possível inserir dados diretamente em uma VIEW, 
-- pois lista_usuarios não é atualizável.


INSERT INTO lista_usuarios (nome_usuario, telefone)
VALUES ('Ruan Pablo', '999990000');



-- ============================================================
-- 5.6 TESTES DE GATILHOS (TRIGGERS)
-- ============================================================


-- ============================================================
-- Trigger de atualização do usuário (Válido)
-- ============================================================
-- Resultado esperado: A linha é atualizada e a coluna ultima_atualizacao 
-- recebe automaticamente a data e hora atual.


UPDATE usuario
SET telefone = '999999999'
WHERE cod_usuario = 1;



-- ============================================================
-- Trigger de atualização do usuário com NULL (Inválido)
-- ============================================================
-- Resultado esperado: Erro - nome_usuario é NOT NULL, então não pode receber valor nulo.


UPDATE usuario
SET nome_usuario = NULL
WHERE cod_usuario = 1;



-- ============================================================
-- 5.7 TESTES DE FUNÇÕES
-- ============================================================


-- ============================================================
-- Calcular a idade a partir da função presente no SQL (Válido)
-- ============================================================
-- Resultado esperado: Retorna um número inteiro (21).


SELECT calcular_idade('2004-09-10');



-- ============================================================
-- Calcular a idade com entrada inválida (Inválido)
-- ============================================================
-- Resultado esperado: Erro - A entrada é inválida.


SELECT calcular_idade('data');



-- ============================================================
-- Total de empréstimos de um usuário (Válido)
-- ============================================================
-- Resultado esperado: Retorna o número total de empréstimos do usuário.


SELECT total_emprestimos(1) AS total_emprestimos_usuario;
