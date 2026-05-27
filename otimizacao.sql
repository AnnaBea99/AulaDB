-- ============================================================
-- RESUMO DA ORDEM DE EXECUÇÃO SQL
-- ============================================================
--  1. FROM / JOIN   → monta a "tabela virtual" com os dados unidos
--  2. WHERE         → filtra linhas ANTES de agrupar
--  3. GROUP BY      → agrupa as linhas restantes
--  4. HAVING        → filtra os GRUPOS (resultados agregados)
--  5. SELECT        → escolhe as colunas a exibir
--  6. ORDER BY      → ordena o resultado final
--  7. LIMIT         → limita a quantidade de linhas retornadas
-- ============================================================
use cafeteria;

-- ==============================================================
-- PARTE 1 — O PROBLEMA: por que precisamos de JOIN?
-- ==============================================================

-- TENTATIVA ERRADA: olhar apenas UMA tabela
-- Isso mostra só o ID do cliente — não sabemos quem é.
SELECT id, idcliente, status
FROM pedidos;
-- Resultado: vemos números, mas não nomes. Precisamos "cruzar" tabelas!


-- ============================================================
-- PARTE 2 — JOINs: AS PONTES ENTRE TABELAS
-- ============================================================

-- --------------------------------------------------
-- 2.1  INNER JOIN — só o que existe nos dois lados
-- --------------------------------------------------
-- Analogia: "Mostre-me apenas os clientes que JÁ fizeram pedidos."
-- A ponte é: pedidos.idcliente = clientes.id

SELECT
    c.nome          AS cliente,        -- nome vem da tabela clientes
    c.telefone,
    p.id            AS numero_pedido,
    p.datahorapedido,
    p.status
FROM pedidos AS p                      -- tabela à esquerda
INNER JOIN clientes AS c               -- tabela à direita
    ON p.idcliente = c.id;             -- condição da "ponte"
-- Retorna SOMENTE clientes que têm pelo menos 1 pedido.


-- --------------------------------------------------
-- 2.2  LEFT JOIN — tudo da esquerda, mesmo sem par
-- --------------------------------------------------
-- Analogia: "Liste TODOS os clientes; se tiver pedido, mostre; se não tiver, mostre NULL."

SELECT
    c.nome          AS cliente,
    p.id            AS numero_pedido,  -- será NULL se não houver pedido
    p.status
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id = p.idcliente;
-- Útil para descobrir clientes que NUNCA fizeram um pedido.


-- --------------------------------------------------
-- 2.3  JOIN em 3 tabelas — unindo tudo
-- --------------------------------------------------
-- Pergunta real: "Quais produtos cada cliente pediu e quanto pagou?"

SELECT
    c.nome                                        AS cliente,
    pr.nome                                       AS produto,
    pr.categoria,
    ip.quantidade,
    ip.precounitario,
    (ip.quantidade * ip.precounitario)            AS subtotal
FROM pedidos          AS p
INNER JOIN clientes   AS c   ON p.idcliente  = c.id
INNER JOIN itenspedidos AS ip ON ip.idpedido = p.id
INNER JOIN produtos   AS pr  ON ip.idproduto = pr.id;
-- Três "pontes" encadeadas: pedidos → clientes, pedidos → itenspedidos → produtos.


-- ============================================================
-- PARTE 3 — WHERE vs. HAVING: OS DOIS FILTROS
-- ============================================================

-- --------------------------------------------------
-- 3.1  WHERE — filtra ANTES do agrupamento (linha a linha)
-- --------------------------------------------------
-- Pergunta: "Quais pedidos estão com status 'entregue'?"

SELECT
    p.id            AS pedido,
    c.nome          AS cliente,
    p.datahorapedido,
    p.status
FROM pedidos   AS p
INNER JOIN clientes AS c ON p.idcliente = c.id
WHERE p.status = 'entregue';           -- ← filtra ANTES de qualquer cálculo
-- O banco descarta as linhas que não batem com o filtro logo no início.


-- --------------------------------------------------
-- 3.2  GROUP BY + SUM — agrupando para calcular totais
-- --------------------------------------------------
-- Pergunta: "Qual o total gasto por cada cliente?"

SELECT
    c.nome                                    AS cliente,
    SUM(ip.quantidade * ip.precounitario)     AS total_gasto
FROM pedidos            AS p
INNER JOIN clientes     AS c   ON p.idcliente  = c.id
INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
GROUP BY c.nome;          -- ← agrupa todas as linhas do mesmo cliente
-- ✔ SUM soma os valores dentro de cada grupo.


-- --------------------------------------------------
-- 3.3  HAVING — filtra APÓS o agrupamento (sobre o resultado agregado)
-- --------------------------------------------------
-- Pergunta: "Quais clientes gastaram MAIS DE R$ 10,00 no total?"

SELECT
    c.nome                                    AS cliente,
    SUM(ip.quantidade * ip.precounitario)     AS total_gasto
FROM pedidos            AS p
INNER JOIN clientes     AS c   ON p.idcliente  = c.id
INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
GROUP BY c.nome
HAVING total_gasto > 10.00;    -- ← filtra DEPOIS do GROUP BY
-- WHERE não pode usar "total_gasto" (ainda não existe nesse ponto da execução).
-- HAVING sim, porque ele age após a agregação.


-- --------------------------------------------------
-- 3.4  WHERE + HAVING juntos
-- --------------------------------------------------
-- Pergunta: "Quais clientes com pedidos 'pendente' gastaram mais de R$ 5,00?"

SELECT
    c.nome                                    AS cliente,
    SUM(ip.quantidade * ip.precounitario)     AS total_gasto
FROM pedidos            AS p
INNER JOIN clientes     AS c   ON p.idcliente  = c.id
INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
WHERE  p.status = 'pendente'       -- 1º filtro: só pedidos pendentes
GROUP BY c.nome
HAVING total_gasto > 5.00;         -- 2º filtro: só quem gastou mais de R$5
-- Ordem de execução: FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT


-- ============================================================
-- PARTE 4 — OPERAÇÕES DE CONJUNTO
-- ============================================================

-- --------------------------------------------------
-- 4.1  UNION — combina resultados, remove duplicatas
-- --------------------------------------------------
-- Analogia: "Liste todos os e-mails de contato da cafeteria
--            (clientes + colaboradores), sem repetir."

SELECT email, 'Cliente'      AS tipo FROM clientes      WHERE email <> 'Sem email'
UNION
SELECT email, 'Colaborador'  AS tipo FROM colaboradores;
-- UNION elimina linhas idênticas automaticamente.
-- UNION ALL manteria duplicatas (mais rápido quando você sabe que não há).


-- --------------------------------------------------
-- 4.2  INTERSECT (simulado com INNER JOIN no MySQL)
-- --------------------------------------------------
-- Objetivo: "Quais nomes aparecem tanto em clientes quanto em colaboradores?"
-- (MySQL não tem INTERSECT nativo — usamos INNER JOIN como equivalente)

SELECT DISTINCT c.nome
FROM clientes      AS c
INNER JOIN colaboradores AS col ON c.nome = col.nome;
-- Retorna apenas nomes que existem nas DUAS tabelas.
-- Dica: Em bancos que suportam (PostgreSQL, Oracle), seria:
--   SELECT nome FROM clientes
--   INTERSECT
--   SELECT nome FROM colaboradores;


-- --------------------------------------------------
-- 4.3  EXCEPT / MINUS (simulado com LEFT JOIN no MySQL)
-- --------------------------------------------------
-- Objetivo: "Quais clientes NUNCA foram colaboradores?"

SELECT c.nome
FROM clientes       AS c
LEFT JOIN colaboradores AS col ON c.nome = col.nome
WHERE col.id IS NULL;           -- ← NULL significa "não encontrou par"
-- LEFT JOIN traz todos os clientes; WHERE col.id IS NULL filtra
--   apenas os que NÃO têm correspondente na tabela colaboradores.
-- Dica: Em bancos nativos (PostgreSQL):
--   SELECT nome FROM clientes
--   EXCEPT
--   SELECT nome FROM colaboradores;


-- ============================================================
-- PARTE 5 — DESAFIO PRÁTICO (adaptado para a Cafeteria)
-- ============================================================

-- Tarefa: "Identificar clientes cujo valor total de pedidos
--          seja superior a R$ 15,00, exibindo o total por categoria."

SELECT
    c.nome                                    AS cliente,
    pr.categoria,
    SUM(ip.quantidade * ip.precounitario)     AS total_por_categoria
FROM pedidos            AS p
INNER JOIN clientes     AS c   ON p.idcliente  = c.id
INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
INNER JOIN produtos     AS pr  ON ip.idproduto = pr.id
GROUP BY c.nome, pr.categoria
HAVING total_por_categoria > 15.00
ORDER BY total_por_categoria DESC;     -- ordena do maior para o menor
-- ORDER BY DESC: do maior para o menor.
-- Agrupamos por (cliente + categoria) para ver onde cada um mais gasta.


-- ============================================================
-- PARTE 6 — OTIMIZAÇÃO: PENSANDO COMO PROFISSIONAL
-- ============================================================

-- --------------------------------------------------
-- 6.1  Evite SELECT * — peça só o que precisa
-- --------------------------------------------------

-- RUIM: trafega todas as colunas (muitas desnecessárias)
SELECT * FROM clientes;

-- BOM: apenas as colunas necessárias
SELECT id, nome, email FROM clientes;


-- --------------------------------------------------
-- 6.2  INDEX — criando "índices" para acelerar buscas
-- --------------------------------------------------
-- Analogia: o índice de um livro — você vai direto ao assunto,
--           sem ler página por página.

-- Índice na coluna usada em JOIN (idcliente em pedidos):
CREATE INDEX idx_pedidos_idcliente ON pedidos (idcliente);

-- Índice em coluna usada em WHERE (status):
CREATE INDEX idx_pedidos_status    ON pedidos (status);

-- Índice em coluna usada em WHERE/JOIN em itenspedidos:
CREATE INDEX idx_itens_idpedido    ON itenspedidos (idpedido);
CREATE INDEX idx_itens_idproduto   ON itenspedidos (idproduto);

-- Índices aceleram SELECT, mas têm custo em INSERT/UPDATE.
--   Crie apenas nos campos realmente consultados com frequência.


-- --------------------------------------------------
-- 6.3  EXPLAIN — enxergando como o banco "pensa"
-- --------------------------------------------------
-- Coloque EXPLAIN antes de qualquer SELECT para ver o plano de execução.

EXPLAIN
SELECT
    c.nome,
    SUM(ip.quantidade * ip.precounitario) AS total_gasto
FROM pedidos            AS p
INNER JOIN clientes     AS c   ON p.idcliente = c.id
INNER JOIN itenspedidos AS ip  ON ip.idpedido = p.id
GROUP BY c.nome
HAVING total_gasto > 10.00;

-- Colunas importantes do resultado:
-- • type        → "ALL" = full scan (lento); "ref"/"eq_ref" = usa índice (rápido)
-- • key         → qual índice foi usado (NULL = nenhum!)
-- • rows        → estimativa de linhas examinadas (quanto menor, melhor)
-- • Extra       → "Using filesort" ou "Using temporary" = sinais de lentidão



