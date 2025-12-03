

--DDEMONSTRACAO COM SELECT FROM

SELECT * FROM usuario

SELECT cod_usuario, nome_usuario FROM usuario

SELECT * FROM livros

SELECT titulo, genero FROM livros

SELECT * FROM bibliotecario

SELECT nome_bibliotecario FROM bibliotecario

SELECT * FROM pagamento

SELECT cod_usuario, valor FROM pagamento

SELECT * FROM multa

SELECT id_multa, valor FROM multa


--DEMONSTRACAO DELETE 

DELETE FROM livros WHERE isbn = '9780152048045'

DELETE FROM usuario WHERE endereco = 'Santa Cruz'


--DEMONSTRACAO SELECT FROM WHERE

SELECT nome_usuario, endereco
FROM usuario
WHERE endereco = 'Caico'


--DEMONSTRACAO SELECT FROM INNER JOIN

SELECT nome_usuario, status_pagamento, valor 
FROM usuario u
INNER JOIN pagamento p 
ON p.id_pagamento = u.cod_usuario


--DEMONTRACAO SELECT FROM LEFT JOIN

SELECT nome_usuario, status_pagamento, valor
FROM usuario u 
LEFT JOIN pagamento p
ON p.id_pagamento = u.cod_usuario


--DEMONSTRACAO SELECT FROM RIGHT JOIN

SELECT nome_usuario, status_pagamento, valor
FROM usuario u
RIGHT JOIN pagamento p
ON p.id_pagamento = u.cod_usuario


--DEMONSTRACAO SELECT FROM FULL OUTER JOIN

SELECT nome_usuario, status_pagamento, valor
FROM usuario u
FULL OUTER JOIN pagamento p 
ON p.id_pagamento = u.cod_usuario

--DEMONSTRACAO SELECT FROM GROUP BY

SELECT nome_usuario, COUNT(*) AS total
FROM usuario
GROUP BY nome_usuario
