USE cafeteria;

-- INNER JOIN

SELECT c.nome, p.id, p.datahorapedido
FROM clientes as c
INNER JOIN pedidos as p
ON c.id = p.idcliente;


-- RIGHT JOIN (identificar quais produtos foram vendidos)

SELECT pr.nome, ip.idproduto, ip.idpedido
FROM itenspedidos as ip
right join produtos as pr
on pr.id = ip.idproduto;

SELECT pr.nome, x.idproduto, x.idpedido
FROM (
    SELECT ip.idpedido, ip.idproduto
    FROM pedidos AS p
    INNER JOIN itenspedidos AS ip
        ON p.id = ip.idpedido
    WHERE MONTH(p.DataHoraPedido) = 10
) AS x
RIGHT JOIN produtos AS pr
    ON pr.id = x.idproduto;
    
    
-- ============================================================
-- LEFT JOIN
-- ============================================================

SELECT * FROM clientes;

SELECT c.nome, p.id
FROM clientes c
LEFT JOIN pedidos p
ON c.id = p.idcliente;



SELECT c.nome, p.idcliente
FROM clientes c
LEFT JOIN pedidos p
ON c.id = p.idcliente
WHERE MONTH(p.datahorapedido) = 10;


-- Clientes que NÃO fizeram pedido em setembro
SELECT c.nome, x.id
FROM clientes c
LEFT JOIN (
    SELECT p.id, p.idcliente
    FROM pedidos p
    WHERE MONTH(p.datahorapedido) = 9
) x ON c.id = x.idcliente
WHERE x.idcliente IS NULL;


-- ============================================================
-- FULL JOIN (MySQL não tem FULL JOIN — usa-se UNION)
-- ============================================================

-- Equivalente ao FULL JOIN
SELECT c.nome, p.id
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.idcliente

UNION

SELECT c.nome, p.id
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.idcliente;


-- Pedidos sem cliente correspondente
SELECT c.nome, p.id
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.idcliente

UNION

SELECT c.nome, p.id
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.idcliente
WHERE c.id IS NULL;


-- Clientes sem nenhum pedido
SELECT c.nome, p.id
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.idcliente
WHERE p.id IS NULL;