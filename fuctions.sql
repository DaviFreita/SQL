--DEMONSTRAÇÃO DE TRIGGERS--01
--Registrar data da ultima atualização de usuário
ALTER TABLE usuario
ADD COLUMN ultima_atualizacao TIMESTAMP;

CREATE OR REPLACE FUNCTION atualizar_timestamp_usuario()
RETURNS TRIGGER AS $$
BEGIN
    NEW.ultima_atualizacao := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tg_atualiza_usuario
BEFORE UPDATE ON usuario
FOR EACH ROW
EXECUTE FUNCTION atualizar_timestamp_usuario();


--DEMONSTRAÇÂO DE TRIGGERS--02
--Impedir emprestimo se não houver livros disponiveis
CREATE OR REPLACE FUNCTION verificar_disponibilidade()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT quantidade FROM livros WHERE id = NEW.id_livro) <= 0 THEN
        RAISE EXCEPTION 'Livro indisponÃ­vel para emprÃ©stimo';
    END IF;

    -- reduz quantidade do estoque ao emprestar
    UPDATE livros SET quantidade = quantidade - 1 WHERE id = NEW.id_livro;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

