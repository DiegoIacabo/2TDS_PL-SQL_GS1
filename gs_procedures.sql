--- Procedure para Inserts na TB_PESCADOR
CREATE OR REPLACE 
PROCEDURE sp_insert_pescador (
    p_nome_pescador VARCHAR2,
    p_rgp VARCHAR2,
    p_telefone VARCHAR2
) AS 
BEGIN 
    INSERT INTO tb_pescador(nome_pescador, rgp, telefone)
    VALUES (p_nome_pescador, p_rgp, p_telefone);
    DBMS_OUTPUT.PUT_LINE('Pescador cadastrado com sucesso.');
    COMMIT;
EXCEPTION 
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Não é possível armazenar valores duplicados em uma coluna de chave primária ou única.');
    WHEN ROWTYPE_MISMATCH THEN
    DBMS_OUTPUT.PUT_LINE('Tipo das variáveis incompatíveis.');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocorreu um erro no programa: '||'cod_erro: '||sqlcode );
    DBMS_OUTPUT.PUT_LINE('cod_erro: '||sqlcode );
    DBMS_OUTPUT.PUT_LINE('msg_erro: '||sqlerrm );
END;
/


--- Procedure para Inserts na TB_LICENCA
CREATE OR REPLACE 
PROCEDURE sp_insert_licenca (
    p_situacao VARCHAR2,
    p_tipo VARCHAR2,
    p_data_emissao DATE,
    p_data_validade DATE,
    p_id_pescador NUMBER
) AS 
BEGIN 
    INSERT INTO tb_licenca(situacao, tipo, data_emissao, data_validade, id_pescador)
    VALUES (p_situacao, p_tipo, p_data_emissao, p_data_validade, p_id_pescador);
    DBMS_OUTPUT.PUT_LINE('Licença inserida com sucesso.');
    COMMIT;
EXCEPTION 
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Não é possível armazenar valores duplicados em uma coluna de chave primária ou única.');
    WHEN ROWTYPE_MISMATCH THEN
    DBMS_OUTPUT.PUT_LINE('Tipo das variáveis incompatíveis.');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocorreu um erro no programa: '||'cod_erro: '||sqlcode );
    DBMS_OUTPUT.PUT_LINE('cod_erro: '||sqlcode );
    DBMS_OUTPUT.PUT_LINE('msg_erro: '||sqlerrm );
END;
/


--- Procedure para Inserts na TB_ATIVIDADE
CREATE OR REPLACE 
PROCEDURE sp_insert_atividade (
    p_local_inicial VARCHAR2,
    p_local_final VARCHAR2,
    p_inicio TIMESTAMP,
    p_fim TIMESTAMP,
    p_id_pescador NUMBER
) AS 
BEGIN 
    INSERT INTO tb_atividade(local_inicial, local_final, inicio, fim, id_pescador)
    VALUES (p_local_inicial, p_local_final, p_inicio, p_fim, p_id_pescador);
    DBMS_OUTPUT.PUT_LINE('Atividade registrada com sucesso.');
    COMMIT;
EXCEPTION 
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Não é possível armazenar valores duplicados em uma coluna de chave primária ou única.');
    WHEN ROWTYPE_MISMATCH THEN
    DBMS_OUTPUT.PUT_LINE('Tipo das variáveis incompatíveis.');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocorreu um erro no programa: '||'cod_erro: '||sqlcode );
    DBMS_OUTPUT.PUT_LINE('cod_erro: '||sqlcode );
    DBMS_OUTPUT.PUT_LINE('msg_erro: '||sqlerrm );
END;
/












