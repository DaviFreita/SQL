
--DEMONSTRACAO DE FUNCAO--00
--Retorna idade de um usuario
CREATE TRIGGER tg_verifica_emprestimo
BEFORE INSERT ON emprestimo
FOR EACH ROW
EXECUTE FUNCTION verificar_disponibilidade();


--DEMONSTRACAO DE FUNCAO--01
--Retorna idade de um usuario
CREATE OR REPLACE FUNCTION calcular_idade(data_nascimento DATE)
RETURNS INTEGER AS $$
BEGIN
    IF data_nascimento IS NULL THEN
        RETURN NULL;
    END IF;

    RETURN CAST(DATE_PART('year', AGE(NOW(), data_nascimento)) AS INTEGER);
END;
$$ LANGUAGE plpgsql;

--DEMONSTRAÇÃO DE FUNCAO--02
--Retorna quantos livros um usuario ja pegou emprestado
CREATE OR REPLACE FUNCTION total_emprestimos(idUser INTEGER)
RETURNS INTEGER AS $$
DECLARE
    total INTEGER;
BEGIN
    SELECT COUNT(*) INTO total
    FROM emprestimo
    WHERE cod_usuario = idUser;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;