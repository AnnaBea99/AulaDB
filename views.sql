use cafeteria;

CREATE VIEW ViewCliente as
SELECT p.id, c.nome, p.datahorapedido, SUM(ip.precounitario) as ValorTotalPedido 
FROM clientes c
join pedidos p on c.id = p.idcliente
join itenspedidos ip on p.id = ip.idpedido
group by p.id, c.nome;

CREATE OR REPLACE VIEW ViewCliente AS
SELECT p.id, c.nome, p.datahorapedido, SUM(ip.precounitario) as ValorTotalPedido, c.telefone
FROM clientes c
join pedidos p on c.id = p.idcliente
join itenspedidos ip on p.id = ip.idpedido
group by p.id, c.nome;


select * from ViewCliente;

drop view ViewCliente;

show indexes from clientes;

create index nome_cliente
on clientes(nome);



