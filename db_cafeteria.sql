create schema if not exists Cafeteria;
use Cafeteria;

CREATE TABLE if not exists produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(255),
  descricao VARCHAR(255),
  preco DECIMAL(10,2),
  categoria VARCHAR(50)
);

CREATE TABLE if not exists colaboradores (
    ID INT PRIMARY KEY ,
    Nome VARCHAR(255) NOT NULL,
    Cargo VARCHAR(100),
    DataContratacao DATE,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
	Rua VARCHAR(100) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Estado VARCHAR(2) NOT NULL,
	cep VARCHAR(8) NOT NULL
);



CREATE TABLE if not exists fornecedores (
    ID INT PRIMARY KEY ,
    Nome VARCHAR(255) NOT NULL,
  	Contato VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
	Rua VARCHAR(100) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Estado VARCHAR(2) NOT NULL,
	cep VARCHAR(8) NOT NULL
);

CREATE TABLE if not exists clientes (
  id INT NOT NULL,
  nome VARCHAR(255),
  telefone VARCHAR(20),
  email VARCHAR(100) DEFAULT 'Sem email',
  endereco VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE if not exists pedidos (
  id INT PRIMARY KEY,
  idcliente INT,
  datahorapedido DATETIME,
  status VARCHAR(50),
  FOREIGN KEY (idcliente) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE if not exists itenspedidos (
  idpedido INT,
  idproduto INT,
  quantidade INT,
  precounitario DECIMAL(10,2),
  PRIMARY KEY (idpedido,idproduto),
  FOREIGN KEY (idpedido) REFERENCES pedidos(id) ON DELETE CASCADE,
  FOREIGN KEY (idproduto) REFERENCES produtos(id) ON DELETE CASCADE
);

INSERT INTO colaboradores (ID, Nome, Cargo, DataContratacao, Telefone, Email, Rua, Bairro, Cidade, Estado, CEP) VALUES
(1, 'Carlos Silva', 'Gerente', '2022-03-15', '115551234', 'carlos.silva@email.com', 'Rua do Comércio - 258', 'Centro', 'São Paulo', 'SP', '01000001');

INSERT INTO colaboradores (ID, Nome, Cargo, DataContratacao, Telefone, Email, Rua, Bairro, Cidade, Estado, CEP) VALUES
(2, 'Marta Sousa', 'Chef de Cozinha', '2022-05-10', '215555678', 'marta.sousa@email.com', 'Rua dos Sabores - 456', 'Saboroso', 'São Paulo', 'SP', '20000001'),
(3, 'Pedro Almeida', 'Barista', '2022-07-20', '315557890', 'pedro.almeida@email.com', 'Avenida do Café - 789', 'Centro', 'São Paulo', 'SP', '01000001'),
(4, 'Sofia Rodrigues', 'Garçom', '2022-01-12', '415552345', 'sofia.rodrigues@email.com', 'Rua da Hospitalidade - 101', 'Boas Maneiras', 'São Paulo', 'SP', '40000001'),
(5, 'João Pereira', 'Atendente', '2022-09-05', '515558765', 'joao.pereira@email.com', 'Rua das flores - 210', 'Centro', 'São Paulo', 'SP', '20000001'),
(6, 'Inês Lima', 'Barista', '2022-04-02', '615553421', 'ines.lima@email.com', 'Rua das Entregas - 280', 'Entregas Rápidas', 'São Paulo', 'SP', '90000001'),
(7, 'Antonio Artur', 'Entregador', '2023-01-10', '568442577', 'antonio.artur@email.com', 'Rua das flores - 210', 'Centro', 'São Paulo', 'SP', '20000001');


INSERT INTO fornecedores (ID, Nome, Contato, Telefone, Email, Rua, Bairro, Cidade, Estado, CEP) VALUES
(1, 'Café do Brasil Ltda.', 'Maria Oliveira', '115551234', 'cafebrasil@email.com', 'Rua do Café - 123', 'Centro', 'São Paulo', 'SP', '01000000'),
(2, 'Laticínios Sabor Puro', 'João Santos', '215555678', 'laticinios@email.com', 'Avenida das Vacas - 456', 'Leite Feliz', 'Rio de Janeiro', 'RJ', '20000000'),
(3, 'Frutas Frescas S.A.', 'Carlos Ferreira', '315557890', 'frutasfrescas@email.com', 'Rua das Maçãs - 789', 'Pomar Verde', 'Belo Horizonte', 'MG', '30000000'),
(4, 'Padaria da Cidade', 'Sofia Alves', '415552345', 'padariacidade@email.com', 'Rua dos Pães - 101', 'Pão Quentinho', 'Salvador', 'BA', '40000000'),
(5, 'Fornecedor de Chocolate', 'Rui Lima', '515558765', 'chocolatelovers@email.com', 'Rua do Cacau - 210', 'Chocolateira', 'Florianópolis', 'SC', '88000000'),
(6, 'Distribuidora de Bebidas', 'Ana Pereira', '615553421', 'bebidaspremium@email.com', 'Avenida das Garrafas - 35', 'Copo Cheio', 'Porto Alegre', 'RS', '90000000');



INSERT INTO produtos (ID, Nome, Descricao, Preco, Categoria) VALUES
(1, 'Espresso', 'Um shot de espresso forte e encorpado.', 2.50, 'Café'),
(2, 'Cappuccino', 'Espresso, leite vaporizado e espuma de leite.', 3.50, 'Café'),
(3, 'Latte Macchiato', 'Leite vaporizado, espresso e espuma de leite.', 4.00, 'Café'),
(4, 'Mocha', 'Espresso, leite vaporizado, chocolate e chantilly.', 4.50, 'Café'),
(5, 'Café da Casa', 'Café da casa especial com sabor suave.', 2.00, 'Café'),
(6, 'Chá de Camomila', 'Chá de camomila com mel e limão.', 2.00, 'Chá'),
(7, 'Omelete de Queijo', 'Omelete recheada com queijo e ervas.', 7.50, 'Almoço'),
(8, 'Quiche de Espinafre', 'Quiche de espinafre e queijo de cabra.', 8.00, 'Almoço'),
(9, 'Frango ao Curry', 'Frango ao curry com arroz basmati.', 9.00, 'Jantar'),
(10, 'Tiramisu', 'Sobremesa italiana com café e mascarpone.', 5.00, 'Sobremesa'),
(11, 'Croissant de Chocolate', 'Croissant recheado com chocolate belga.', 3.50, 'Sobremesa'),
(12, 'Cappuccino Gelado', 'Cappuccino gelado com chantilly e canela.', 4.50, 'Café'),
(13, 'Salada de Quinoa', 'Salada de quinoa com vegetais frescos.', 7.00, 'Almoço'),
(14, 'Sanduíche de Peru', 'Sanduíche de peru com queijo e mostarda.', 6.00, 'Almoço'),
(15, 'Salmão Grelhado', 'Salmão grelhado com legumes da estação.', 11.00, 'Jantar'),
(16, 'Cheesecake de Framboesa', 'Cheesecake de framboesa com calda.', 5.50, 'Sobremesa'),
(17, 'Smoothie de Frutas', 'Smoothie refrescante de frutas da estação.', 4.00, 'Bebidas'),
(18, 'Chá Verde', 'Chá verde com gengibre e limão.', 2.50, 'Chá'),
(19, 'Baguete de Presunto', 'Baguete fresca recheada com presunto e queijo.', 10.00, 'Almoço'),
(20, 'Salada de Frutas', 'Salada de frutas frescas com iogurte.', 4.00, 'Sobremesa'),
(21, 'Caprese Wrap', 'Wrap recheado com tomate, mozzarella e manjericão.', 6.50, 'Almoço'),
(22, 'Muffin de Mirtilo', 'Muffin de mirtilo recém-assado.', 3.00, 'Café'),
(23, 'Smoothie de Manga', 'Smoothie refrescante de manga e banana.', 4.50, 'Bebidas'),
(24, 'Misto Quente', 'Sanduíche misto quente de presunto e queijo.', 5.50, 'Almoço'),
(25, 'Tarte Tatin de Maçã', 'Tarte de maçã caramelizada.', 5.00, 'Sobremesa'),
(26, 'Sanduíche de Frango', 'Sanduíche de frango grelhado e abacate.', 7.00, 'Almoço'),
(27, 'Batido de Morango', 'Batido cremoso de morango com chantilly.', 4.50, 'Bebidas'),
(28, 'Croissant de Amêndoa', 'Croissant recheado com chocolate belga.', 3.50, 'Sobremesa'),
(29, 'Tofu Scramble', 'Scramble de tofu com vegetais e espinafre.', 6.50, 'Sobremesa'),
(30, 'Salada de Atum', 'Salada de atum com feijão e pimentão.', 8.00, 'Almoço');

INSERT INTO produtos (ID, Nome, Descricao, Preco, Categoria)VALUES 
(31, 'Lasanha à Bolonhesa', 'Deliciosa lasanha caseira com molho bolonhesa', 12.50, 'Almoço');




INSERT INTO clientes (ID, Nome, Telefone, Email, Endereco) VALUES
(1, 'Maria Silva', '115551234', 'maria.silva@email.com', 'Rua das Flores, 123, Cidade A'),
(2, 'João Pereira', '215555678', 'joao.pereira@email.com', 'Av. Principal, 456, Cidade B'),
(3, 'Ana Rodrigues', '315557890', 'ana.rodrigues@email.com', 'Rua Central, 789, Cidade C'),
(4, 'Pedro Alves', '415552345', 'pedro.alves@email.com', 'Travessa dos Sonhos, 56, Cidade D'),
(5, 'Sofia Santos', '515558765', 'sofia.santos@email.com', 'Alameda das Artes, 321, Cidade E'),
(6, 'Jorge Lima', '615553421', 'jorge.lima@email.com', 'Praça das Estrelas, 987, Cidade F'),
(7, 'Luisa Ferreira', '715559876', 'luisa.ferreira@email.com', 'Rua das Palmeiras, 789, Cidade G'),
(8, 'Carlos Gomes', '815552345', 'carlos.gomes@email.com', 'Avenida dos Ventos, 123, Cidade H'),
(9, 'Marta Ribeiro', '915555432', 'marta.ribeiro@email.com', 'Travessa das Maravilhas, 56, Cidade I');


INSERT INTO clientes (ID, Nome, Telefone, Email, Endereco) VALUES
(10, 'Ana Maria Silva', '1515557890', 'ana.silva@email.com', 'Rua Central, 567, Cidade O');
INSERT INTO clientes (ID,Nome, Telefone, Endereco) VALUES
(11, 'André Almeida', '1015556789', 'Praça da Felicidade, 456, Cidade J');
INSERT INTO clientes (ID,Nome, Telefone, Email, Endereco) VALUES
(12, 'João Carlos Rodrigues', '1615552345', 'joao.rodrigues@email.com', 'Praça dos Poetas, 321, Cidade P');
INSERT INTO clientes (ID,Nome, Telefone, Endereco) VALUES
(13, 'Isabela Pereira', '1115558765', 'Rua das Araras, 789, Cidade K');

INSERT INTO clientes (ID, Nome, Telefone, Email, Endereco) VALUES
(14, 'Isabel Gonçalves', '1715558765', 'isabel.goncalves@email.com', 'Alameda das Gaivotas, 654, Cidade Q'),
(15, 'Ricardo Ferreira', '1815554321', 'ricardo.ferreira@email.com', 'Avenida da Paz, 987, Cidade R'),
(16, 'Mariana Costa', '1915551234', 'mariana.costa@email.com', 'Travessa das Mariposas, 234, Cidade S'),
(17, 'Luís Carlos Sousa', '2015555678', 'luis.sousa@email.com', 'Rua dos Sonhos, 456, Cidade T'),
(18, 'Silvia Ribeiro', '2115557890', 'silvia.ribeiro@email.com', 'Alameda dos Sorrisos, 765, Cidade U'),
(19, 'Artur Santos', '2215552345', 'artur.santos@email.com', 'Praça das Alegrias, 987, Cidade V'),
(20, 'Arya Santos', '2215552852', 'arya.santos@email.com', 'Rua Gloriosa, 96, Cidade V'),
(21, 'Carolina Lima', '2315558765', 'carolina.lima@email.com', 'Avenida da Felicidade, 654, Cidade W'),
(22, 'Pedro Almeida', '2415554321', 'pedro.almeida@email.com', 'Rua das Estrelas, 123, Cidade X'),
(23, 'Inês Gonçalves', '2515551234', 'ines.goncalves@email.com', 'Travessa das Maravilhas, 234, Cidade Y');

INSERT INTO clientes (ID,Nome, Telefone, Endereco) VALUES
(24, 'Rui Santos', '1215554321', 'Alameda das Estrelas, 654, Cidade L');
INSERT INTO clientes (ID,Nome, Telefone, Email, Endereco) VALUES
(25, 'Diogo Fernandes', '2615555678', 'diogo.fernandes@email.com', 'Praça dos Desejos, 987, Cidade Z');
INSERT INTO clientes (ID,Nome, Telefone, Endereco) VALUES
(26, 'Helena Lima', '1315551234', 'Avenida dos Sonhos, 234, Cidade M');
INSERT INTO clientes (ID,Nome, Telefone, Endereco) VALUES
(27, 'Paulo Sousa', '1415555678', 'Travessa das Marés, 876, Cidade N');

INSERT INTO clientes (ID, Nome, Telefone, Email, Endereco)
VALUES (28, 'João Santos', '215555678', 'joao.santos@email.com', 'Avenida Principal, 456, Cidade B'),
       (29, 'Carla Ferreira', '315557890', 'carla.ferreira@email.com', 'Travessa das Ruas, 789, Cidade C');

INSERT INTO `pedidos` VALUES (1,10,'2023-01-02 08:15:00','Em Andamento'),(2,3,'2023-01-02 08:45:00','ConcluÃ­do'),(3,8,'2023-01-02 09:30:00','Entregue'),(4,14,'2023-01-02 10:00:00','Em Andamento'),(5,7,'2023-01-02 11:30:00','ConcluÃ­do'),(6,1,'2023-01-02 12:45:00','Entregue'),(7,25,'2023-01-06 08:30:00','Em Andamento'),(8,9,'2023-01-06 09:00:00','ConcluÃ­do'),(9,12,'2023-01-06 09:30:00','Entregue'),(10,26,'2023-01-06 10:15:00','Em Andamento'),(11,4,'2023-01-06 10:45:00','ConcluÃ­do'),(12,5,'2023-01-06 12:00:00','Em Andamento'),(13,22,'2023-01-12 08:15:00','ConcluÃ­do'),(14,18,'2023-01-12 09:45:00','Entregue'),(15,19,'2023-01-12 10:30:00','Em Andamento'),(16,15,'2023-01-12 11:00:00','ConcluÃ­do'),(17,20,'2023-01-12 12:15:00','Entregue'),(18,13,'2023-01-18 09:15:00','Em Andamento'),(19,23,'2023-01-18 09:45:00','ConcluÃ­do'),(20,2,'2023-01-18 10:30:00','Entregue'),(21,6,'2023-01-22 08:00:00','Em Andamento'),(22,11,'2023-01-22 09:30:00','ConcluÃ­do'),(23,21,'2023-01-22 10:45:00','Entregue'),(24,16,'2023-01-22 11:15:00','Em Andamento'),(25,24,'2023-01-26 12:00:00','ConcluÃ­do'),(26,17,'2023-01-26 12:30:00','Entregue'),(27,8,'2023-02-01 08:30:00','Em Andamento'),(28,12,'2023-02-01 10:00:00','ConcluÃ­do'),(29,2,'2023-02-01 11:15:00','Entregue'),(30,16,'2023-02-03 09:45:00','Em Andamento'),(31,25,'2023-02-03 12:30:00','ConcluÃ­do'),(32,7,'2023-02-05 08:15:00','Entregue'),(33,10,'2023-02-05 10:30:00','Em Andamento'),(34,4,'2023-02-06 08:00:00','ConcluÃ­do'),(35,11,'2023-02-06 10:15:00','Entregue'),(36,15,'2023-02-06 12:45:00','Em Andamento'),(37,26,'2023-02-07 09:00:00','ConcluÃ­do'),(38,3,'2023-02-07 10:45:00','Entregue'),(39,18,'2023-02-07 11:30:00','Em Andamento'),(40,20,'2023-02-10 08:15:00','ConcluÃ­do'),(41,21,'2023-02-10 09:30:00','Entregue'),(42,13,'2023-02-10 11:00:00','Em Andamento'),(43,9,'2023-02-12 08:45:00','ConcluÃ­do'),(44,5,'2023-02-12 10:30:00','Entregue'),(45,19,'2023-02-12 12:15:00','Em Andamento'),(46,22,'2023-02-15 08:30:00','ConcluÃ­do'),(47,24,'2023-02-15 09:15:00','Entregue'),(48,1,'2023-02-15 10:00:00','Em Andamento'),(49,23,'2023-02-18 11:45:00','ConcluÃ­do'),(50,6,'2023-02-18 12:00:00','Entregue'),(51,8,'2023-03-01 08:15:00','Em Andamento'),(52,10,'2023-03-01 10:30:00','ConcluÃ­do'),(53,4,'2023-03-01 11:45:00','Entregue'),(54,2,'2023-03-01 12:00:00','Em Andamento'),(55,16,'2023-03-02 09:00:00','ConcluÃ­do'),(56,12,'2023-03-02 10:15:00','Entregue'),(57,26,'2023-03-02 11:30:00','Em Andamento'),(58,5,'2023-03-03 08:30:00','ConcluÃ­do'),(59,9,'2023-03-03 10:45:00','Entregue'),(60,18,'2023-03-03 12:15:00','Em Andamento'),(61,1,'2023-03-04 08:45:00','ConcluÃ­do'),(62,22,'2023-03-04 09:15:00','Entregue'),(63,15,'2023-03-04 10:00:00','Em Andamento'),(64,19,'2023-03-05 08:00:00','ConcluÃ­do'),(65,21,'2023-03-05 09:30:00','Entregue'),(66,7,'2023-03-05 10:45:00','Em Andamento'),(67,11,'2023-03-06 11:00:00','ConcluÃ­do'),(68,13,'2023-03-06 12:30:00','Entregue'),(69,3,'2023-03-07 08:15:00','Em Andamento'),(70,24,'2023-03-07 09:00:00','ConcluÃ­do'),(71,17,'2023-03-07 10:30:00','Entregue'),(72,23,'2023-03-08 08:00:00','Em Andamento'),(73,6,'2023-03-08 09:45:00','ConcluÃ­do'),(74,20,'2023-03-08 11:15:00','Entregue'),(75,14,'2023-03-09 12:45:00','Em Andamento'),(76,25,'2023-03-09 13:30:00','ConcluÃ­do'),(77,8,'2023-04-01 08:15:00','Em Andamento'),(78,10,'2023-04-01 10:30:00','ConcluÃ­do'),(79,4,'2023-04-01 11:45:00','Entregue'),(80,2,'2023-04-01 12:00:00','Em Andamento'),(81,16,'2023-04-02 09:00:00','ConcluÃ­do'),(82,12,'2023-04-02 10:15:00','Entregue'),(83,26,'2023-04-02 11:30:00','Em Andamento'),(84,5,'2023-04-03 08:30:00','ConcluÃ­do'),(85,9,'2023-04-03 10:45:00','Entregue'),(86,18,'2023-04-03 12:15:00','Em Andamento'),(87,1,'2023-04-04 08:45:00','ConcluÃ­do'),(88,22,'2023-04-04 09:15:00','Entregue'),(89,15,'2023-04-04 10:00:00','Em Andamento'),(90,19,'2023-04-05 08:00:00','ConcluÃ­do'),(91,21,'2023-04-05 09:30:00','Entregue'),(92,7,'2023-04-05 10:45:00','Em Andamento'),(93,11,'2023-04-06 11:00:00','ConcluÃ­do'),(94,13,'2023-04-06 12:30:00','Entregue'),(95,3,'2023-04-07 08:15:00','Em Andamento'),(96,24,'2023-04-07 09:00:00','ConcluÃ­do'),(97,17,'2023-04-07 10:30:00','Entregue'),(98,23,'2023-04-08 08:00:00','Em Andamento'),(99,6,'2023-04-08 09:45:00','ConcluÃ­do'),(100,20,'2023-04-08 11:15:00','Entregue'),(101,14,'2023-04-09 12:45:00','Em Andamento'),(102,25,'2023-04-09 13:30:00','ConcluÃ­do'),(103,8,'2023-05-01 08:15:00','Em Andamento'),(104,10,'2023-05-01 10:30:00','ConcluÃ­do'),(105,4,'2023-05-01 11:45:00','Entregue'),(106,2,'2023-05-01 12:00:00','Em Andamento'),(107,16,'2023-05-02 09:00:00','ConcluÃ­do'),(108,12,'2023-05-02 10:15:00','Entregue'),(109,26,'2023-05-02 11:30:00','Em Andamento'),(110,5,'2023-05-03 08:30:00','ConcluÃ­do'),(111,9,'2023-05-03 10:45:00','Entregue'),(112,18,'2023-05-03 12:15:00','Em Andamento'),(113,1,'2023-05-03 08:45:00','ConcluÃ­do'),(114,22,'2023-05-03 09:15:00','Entregue'),(115,15,'2023-05-03 10:00:00','Em Andamento'),(116,19,'2023-05-04 08:00:00','ConcluÃ­do'),(117,21,'2023-05-04 09:30:00','Entregue'),(118,7,'2023-05-04 10:45:00','Em Andamento'),(119,11,'2023-05-05 11:00:00','ConcluÃ­do'),(120,13,'2023-05-05 12:30:00','Entregue'),(121,3,'2023-05-06 08:15:00','Em Andamento'),(122,24,'2023-05-06 09:00:00','ConcluÃ­do'),(123,17,'2023-05-06 10:30:00','Entregue'),(124,23,'2023-05-07 08:00:00','Em Andamento'),(125,6,'2023-05-07 09:45:00','ConcluÃ­do'),(126,20,'2023-05-07 11:15:00','Entregue'),(127,14,'2023-05-08 12:45:00','Em Andamento'),(128,25,'2023-05-08 13:30:00','ConcluÃ­do'),(129,8,'2023-05-15 08:15:00','Entregue'),(130,10,'2023-05-15 10:30:00','Em Andamento'),(131,4,'2023-05-15 11:45:00','ConcluÃ­do'),(132,2,'2023-05-15 12:00:00','Entregue'),(133,16,'2023-05-15 09:00:00','Em Andamento'),(134,12,'2023-05-15 10:15:00','ConcluÃ­do'),(135,26,'2023-05-15 11:30:00','Entregue'),(136,5,'2023-05-20 08:30:00','Em Andamento'),(137,9,'2023-05-20 10:45:00','ConcluÃ­do'),(138,18,'2023-05-20 12:15:00','Entregue'),(139,1,'2023-05-20 08:45:00','Em Andamento'),(140,22,'2023-05-20 09:15:00','ConcluÃ­do'),(141,15,'2023-05-20 10:00:00','Entregue'),(142,19,'2023-05-25 08:00:00','Em Andamento'),(143,21,'2023-05-25 09:30:00','ConcluÃ­do'),(144,7,'2023-05-25 10:45:00','Entregue'),(145,11,'2023-05-25 11:00:00','Em Andamento'),(146,13,'2023-05-25 12:30:00','ConcluÃ­do'),(147,3,'2023-05-30 08:15:00','Entregue'),(148,24,'2023-05-30 09:00:00','Em Andamento'),(149,17,'2023-05-30 10:30:00','ConcluÃ­do'),(150,23,'2023-05-30 08:00:00','Em Andamento'),(151,6,'2023-05-30 09:45:00','Entregue'),(152,8,'2023-06-01 08:15:00','Em Andamento'),(153,10,'2023-06-01 10:30:00','ConcluÃ­do'),(154,4,'2023-06-01 11:45:00','Entregue'),(155,2,'2023-06-01 12:00:00','Em Andamento'),(156,16,'2023-06-02 09:00:00','ConcluÃ­do'),(157,12,'2023-06-02 10:15:00','Entregue'),(158,26,'2023-06-02 11:30:00','Em Andamento'),(159,5,'2023-06-03 08:30:00','ConcluÃ­do'),(160,9,'2023-06-03 10:45:00','Entregue'),(161,18,'2023-06-03 12:15:00','Em Andamento'),(162,1,'2023-06-04 08:45:00','ConcluÃ­do'),(163,22,'2023-06-04 09:15:00','Entregue'),(164,15,'2023-06-04 10:00:00','Em Andamento'),(165,19,'2023-06-05 08:00:00','ConcluÃ­do'),(166,21,'2023-06-05 09:30:00','Entregue'),(167,7,'2023-06-05 10:45:00','Em Andamento'),(168,11,'2023-06-06 11:00:00','ConcluÃ­do'),(169,13,'2023-06-06 12:30:00','Entregue'),(170,3,'2023-06-07 08:15:00','Em Andamento'),(171,24,'2023-06-07 09:00:00','ConcluÃ­do'),(172,17,'2023-06-07 10:30:00','Entregue'),(173,23,'2023-06-08 08:00:00','Em Andamento'),(174,6,'2023-06-08 09:45:00','ConcluÃ­do'),(175,20,'2023-06-08 11:15:00','Entregue'),(176,14,'2023-06-09 12:45:00','Em Andamento'),(177,25,'2023-06-09 13:30:00','ConcluÃ­do'),(178,8,'2023-06-10 08:15:00','Entregue'),(179,10,'2023-06-10 10:30:00','Em Andamento'),(180,4,'2023-06-10 11:45:00','ConcluÃ­do'),(181,2,'2023-06-10 12:00:00','Entregue'),(182,16,'2023-06-11 09:00:00','Em Andamento'),(183,12,'2023-06-11 10:15:00','ConcluÃ­do'),(184,26,'2023-06-11 11:30:00','Entregue'),(185,5,'2023-06-12 08:30:00','Em Andamento'),(186,9,'2023-06-12 10:45:00','ConcluÃ­do'),(187,18,'2023-06-12 12:15:00','Entregue'),(188,1,'2023-06-13 08:45:00','Em Andamento'),(189,22,'2023-06-13 09:15:00','ConcluÃ­do'),(190,15,'2023-06-13 10:00:00','Entregue'),(191,19,'2023-06-14 08:00:00','Em Andamento'),(192,21,'2023-06-14 09:30:00','ConcluÃ­do'),(193,7,'2023-06-14 10:45:00','Entregue'),(194,11,'2023-06-15 11:00:00','Em Andamento'),(195,13,'2023-06-15 12:30:00','ConcluÃ­do'),(196,3,'2023-06-15 08:15:00','Entregue'),(197,24,'2023-06-15 09:00:00','Em Andamento'),(198,17,'2023-06-15 10:30:00','ConcluÃ­do'),(199,23,'2023-06-16 08:00:00','Entregue'),(200,6,'2023-06-16 09:45:00','Em Andamento'),(201,8,'2023-07-01 08:15:00','Em Andamento'),(202,10,'2023-07-01 10:30:00','ConcluÃ­do'),(203,4,'2023-07-01 11:45:00','Entregue'),(204,2,'2023-07-01 12:00:00','Em Andamento'),(205,16,'2023-07-02 09:00:00','ConcluÃ­do'),(206,12,'2023-07-02 10:15:00','Entregue'),(207,26,'2023-07-02 11:30:00','Em Andamento'),(208,5,'2023-07-03 08:30:00','ConcluÃ­do'),(209,9,'2023-07-03 10:45:00','Entregue'),(210,18,'2023-07-03 12:15:00','Em Andamento'),(211,1,'2023-07-04 08:45:00','ConcluÃ­do'),(212,22,'2023-07-04 09:15:00','Entregue'),(213,15,'2023-07-04 10:00:00','Em Andamento'),(214,19,'2023-07-05 08:00:00','ConcluÃ­do'),(215,21,'2023-07-05 09:30:00','Entregue'),(216,7,'2023-07-05 10:45:00','Em Andamento'),(217,11,'2023-07-06 11:00:00','ConcluÃ­do'),(218,13,'2023-07-06 12:30:00','Entregue'),(219,3,'2023-07-07 08:15:00','Em Andamento'),(220,24,'2023-07-07 09:00:00','ConcluÃ­do'),(221,17,'2023-07-07 10:30:00','Entregue'),(222,23,'2023-07-08 08:00:00','Em Andamento'),(223,6,'2023-07-08 09:45:00','ConcluÃ­do'),(224,20,'2023-07-08 11:15:00','Entregue'),(225,14,'2023-07-09 12:45:00','Em Andamento'),(226,25,'2023-07-09 13:30:00','ConcluÃ­do'),(227,8,'2023-07-10 08:15:00','Entregue'),(228,10,'2023-07-10 10:30:00','Em Andamento'),(229,4,'2023-07-10 11:45:00','ConcluÃ­do'),(230,2,'2023-07-10 12:00:00','Entregue'),(231,16,'2023-07-11 09:00:00','Em Andamento'),(232,12,'2023-07-11 10:15:00','ConcluÃ­do'),(233,26,'2023-07-11 11:30:00','Entregue'),(234,5,'2023-07-12 08:30:00','Em Andamento'),(235,9,'2023-07-12 10:45:00','ConcluÃ­do'),(236,18,'2023-07-12 12:15:00','Entregue'),(237,1,'2023-07-13 08:45:00','Em Andamento'),(238,22,'2023-07-13 09:15:00','ConcluÃ­do'),(239,15,'2023-07-13 10:00:00','Entregue'),(240,19,'2023-07-14 08:00:00','Em Andamento'),(241,21,'2023-07-14 09:30:00','ConcluÃ­do'),(242,7,'2023-07-14 10:45:00','Entregue'),(243,11,'2023-07-15 11:00:00','Em Andamento'),(244,13,'2023-07-15 12:30:00','ConcluÃ­do'),(245,3,'2023-07-15 08:15:00','Entregue'),(246,24,'2023-07-15 09:00:00','Em Andamento'),(247,17,'2023-07-15 10:30:00','ConcluÃ­do'),(248,23,'2023-07-16 08:00:00','Entregue'),(249,6,'2023-07-16 09:45:00','Em Andamento'),(250,8,'2023-07-20 08:15:00','ConcluÃ­do'),(251,10,'2023-07-20 10:30:00','Entregue'),(252,4,'2023-07-20 11:45:00','Em Andamento'),(253,2,'2023-07-20 12:00:00','ConcluÃ­do'),(254,16,'2023-07-21 09:00:00','Entregue'),(255,12,'2023-07-21 10:15:00','Em Andamento'),(256,26,'2023-07-21 11:30:00','ConcluÃ­do'),(257,5,'2023-07-22 08:30:00','Entregue'),(258,9,'2023-07-22 10:45:00','Em Andamento'),(259,18,'2023-07-22 12:15:00','ConcluÃ­do'),(260,1,'2023-07-23 08:45:00','Entregue'),(261,22,'2023-07-23 09:15:00','Em Andamento'),(262,15,'2023-07-23 10:00:00','ConcluÃ­do'),(263,19,'2023-07-24 08:00:00','Entregue'),(264,21,'2023-07-24 09:30:00','Em Andamento'),(265,7,'2023-07-24 10:45:00','ConcluÃ­do'),(266,11,'2023-07-25 11:00:00','Entregue'),(267,13,'2023-07-25 12:30:00','Em Andamento'),(268,3,'2023-07-25 08:15:00','ConcluÃ­do'),(269,24,'2023-07-25 09:00:00','Entregue'),(270,17,'2023-07-25 10:30:00','Em Andamento'),(271,23,'2023-07-26 08:00:00','ConcluÃ­do'),(272,6,'2023-07-26 09:45:00','Entregue'),(273,8,'2023-07-30 08:15:00','Em Andamento'),(274,10,'2023-07-30 10:30:00','ConcluÃ­do'),(275,4,'2023-07-30 11:45:00','Entregue'),(276,2,'2023-07-30 12:00:00','Em Andamento'),(277,8,'2023-08-01 08:15:00','Em Andamento'),(278,10,'2023-08-01 10:30:00','ConcluÃ­do'),(279,4,'2023-08-01 11:45:00','Entregue'),(280,2,'2023-08-01 12:00:00','Em Andamento'),(281,16,'2023-08-02 09:00:00','ConcluÃ­do'),(282,12,'2023-08-02 10:15:00','Entregue'),(283,26,'2023-08-02 11:30:00','Em Andamento'),(284,5,'2023-08-03 08:30:00','ConcluÃ­do'),(285,9,'2023-08-03 10:45:00','Entregue'),(286,18,'2023-08-03 12:15:00','Em Andamento'),(287,1,'2023-08-04 08:45:00','ConcluÃ­do'),(288,22,'2023-08-04 09:15:00','Entregue'),(289,15,'2023-08-04 10:00:00','Em Andamento'),(290,19,'2023-08-05 08:00:00','ConcluÃ­do'),(291,21,'2023-08-05 09:30:00','Entregue'),(292,7,'2023-08-05 10:45:00','Em Andamento'),(293,11,'2023-08-06 11:00:00','ConcluÃ­do'),(294,13,'2023-08-06 12:30:00','Entregue'),(295,3,'2023-08-07 08:15:00','Em Andamento'),(296,24,'2023-08-07 09:00:00','ConcluÃ­do'),(297,17,'2023-08-07 10:30:00','Entregue'),(298,23,'2023-08-08 08:00:00','Em Andamento'),(299,6,'2023-08-08 09:45:00','ConcluÃ­do'),(300,20,'2023-08-08 11:15:00','Entregue'),(301,14,'2023-08-09 12:45:00','Em Andamento'),(302,25,'2023-08-09 13:30:00','ConcluÃ­do'),(303,8,'2023-08-10 08:15:00','Entregue'),(304,10,'2023-08-10 10:30:00','Em Andamento'),(305,4,'2023-08-10 11:45:00','ConcluÃ­do'),(306,2,'2023-08-10 12:00:00','Entregue'),(307,16,'2023-08-11 09:00:00','Em Andamento'),(308,12,'2023-08-11 10:15:00','ConcluÃ­do'),(309,26,'2023-08-11 11:30:00','Entregue'),(310,5,'2023-08-12 08:30:00','Em Andamento'),(311,9,'2023-08-12 10:45:00','ConcluÃ­do'),(312,18,'2023-08-12 12:15:00','Entregue'),(313,1,'2023-08-13 08:45:00','Em Andamento'),(314,22,'2023-08-13 09:15:00','ConcluÃ­do'),(315,15,'2023-08-13 10:00:00','Entregue'),(316,19,'2023-08-14 08:00:00','Em Andamento'),(317,21,'2023-08-14 09:30:00','ConcluÃ­do'),(318,7,'2023-08-14 10:45:00','Entregue'),(319,11,'2023-08-15 11:00:00','Em Andamento'),(320,13,'2023-08-15 12:30:00','ConcluÃ­do'),(321,3,'2023-08-15 08:15:00','Entregue'),(322,24,'2023-08-15 09:00:00','Em Andamento'),(323,17,'2023-08-15 10:30:00','ConcluÃ­do'),(324,23,'2023-08-16 08:00:00','Entregue'),(325,6,'2023-08-16 09:45:00','Em Andamento'),(326,8,'2023-08-20 08:15:00','ConcluÃ­do'),(327,10,'2023-08-20 10:30:00','Entregue'),(328,4,'2023-08-20 11:45:00','Em Andamento'),(329,2,'2023-08-20 12:00:00','ConcluÃ­do'),(330,16,'2023-08-21 09:00:00','Entregue'),(331,12,'2023-08-21 10:15:00','Em Andamento'),(332,26,'2023-08-21 11:30:00','ConcluÃ­do'),(333,5,'2023-08-22 08:30:00','Entregue'),(334,9,'2023-08-22 10:45:00','Em Andamento'),(335,18,'2023-08-22 12:15:00','ConcluÃ­do'),(336,1,'2023-08-23 08:45:00','Entregue'),(337,22,'2023-08-23 09:15:00','Em Andamento'),(338,15,'2023-08-23 10:00:00','ConcluÃ­do'),(339,19,'2023-08-24 08:00:00','Entregue'),(340,21,'2023-08-24 09:30:00','Em Andamento'),(341,7,'2023-08-24 10:45:00','ConcluÃ­do'),(342,11,'2023-08-25 11:00:00','Entregue'),(343,13,'2023-08-25 12:30:00','Em Andamento'),(344,3,'2023-08-25 08:15:00','ConcluÃ­do'),(345,24,'2023-08-25 09:00:00','Entregue'),(346,17,'2023-08-25 10:30:00','Em Andamento'),(347,23,'2023-08-26 08:00:00','ConcluÃ­do'),(348,6,'2023-08-26 09:45:00','Entregue'),(349,8,'2023-08-30 08:15:00','Em Andamento'),(350,10,'2023-08-30 10:30:00','ConcluÃ­do'),(351,4,'2023-08-30 11:45:00','Entregue'),(352,2,'2023-08-30 12:00:00','Em Andamento'),(353,16,'2023-08-31 09:00:00','ConcluÃ­do'),(354,12,'2023-08-31 10:15:00','Entregue'),(355,8,'2023-09-01 08:15:00','Em Andamento'),(356,10,'2023-09-01 10:30:00','ConcluÃ­do'),(357,4,'2023-09-01 11:45:00','Entregue'),(358,2,'2023-09-01 12:00:00','Em Andamento'),(359,16,'2023-09-02 09:00:00','ConcluÃ­do'),(360,12,'2023-09-02 10:15:00','Entregue'),(361,26,'2023-09-02 11:30:00','Em Andamento'),(362,5,'2023-09-03 08:30:00','ConcluÃ­do'),(363,9,'2023-09-03 10:45:00','Entregue'),(364,18,'2023-09-03 12:15:00','Em Andamento'),(365,1,'2023-09-04 08:45:00','ConcluÃ­do'),(366,22,'2023-09-04 09:15:00','Entregue'),(367,15,'2023-09-04 10:00:00','Em Andamento'),(368,19,'2023-09-05 08:00:00','ConcluÃ­do'),(369,21,'2023-09-05 09:30:00','Entregue'),(370,7,'2023-09-05 10:45:00','Em Andamento'),(371,11,'2023-09-06 11:00:00','ConcluÃ­do'),(372,13,'2023-09-06 12:30:00','Entregue'),(373,3,'2023-09-07 08:15:00','Em Andamento'),(374,24,'2023-09-07 09:00:00','ConcluÃ­do'),(375,17,'2023-09-07 10:30:00','Entregue'),(376,23,'2023-09-08 08:00:00','Em Andamento'),(377,6,'2023-09-08 09:45:00','ConcluÃ­do'),(378,20,'2023-09-08 11:15:00','Entregue'),(379,14,'2023-09-09 12:45:00','Em Andamento'),(380,25,'2023-09-09 13:30:00','ConcluÃ­do'),(381,8,'2023-09-10 08:15:00','Entregue'),(382,10,'2023-09-10 10:30:00','Em Andamento'),(383,4,'2023-09-10 11:45:00','ConcluÃ­do'),(384,2,'2023-09-10 12:00:00','Entregue'),(385,16,'2023-09-11 09:00:00','Em Andamento'),(386,12,'2023-09-11 10:15:00','ConcluÃ­do'),(387,26,'2023-09-11 11:30:00','Entregue'),(388,5,'2023-09-12 08:30:00','Em Andamento'),(389,9,'2023-09-12 10:45:00','ConcluÃ­do'),(390,18,'2023-09-12 12:15:00','Entregue'),(391,1,'2023-09-13 08:45:00','Em Andamento'),(392,22,'2023-09-13 09:15:00','ConcluÃ­do'),(393,15,'2023-09-13 10:00:00','Entregue'),(394,19,'2023-09-14 08:00:00','Em Andamento'),(395,21,'2023-09-14 09:30:00','ConcluÃ­do'),(396,7,'2023-09-14 10:45:00','Entregue'),(397,11,'2023-09-15 11:00:00','Em Andamento'),(398,13,'2023-09-15 12:30:00','ConcluÃ­do'),(399,3,'2023-09-15 08:15:00','Entregue'),(400,24,'2023-09-15 09:00:00','Em Andamento'),(401,17,'2023-09-15 10:30:00','ConcluÃ­do'),(402,23,'2023-09-16 08:00:00','Entregue'),(403,6,'2023-09-16 09:45:00','Em Andamento'),(404,8,'2023-09-20 08:15:00','ConcluÃ­do'),(405,10,'2023-09-20 10:30:00','Entregue'),(406,4,'2023-09-20 11:45:00','Em Andamento'),(407,2,'2023-09-20 12:00:00','ConcluÃ­do'),(408,16,'2023-09-21 09:00:00','Entregue'),(409,12,'2023-09-21 10:15:00','Em Andamento'),(410,26,'2023-09-21 11:30:00','ConcluÃ­do'),(411,5,'2023-09-22 08:30:00','Entregue'),(412,9,'2023-09-22 10:45:00','Em Andamento'),(413,18,'2023-09-22 12:15:00','ConcluÃ­do'),(414,1,'2023-09-23 08:45:00','Entregue'),(415,22,'2023-09-23 09:15:00','Em Andamento'),(416,15,'2023-09-23 10:00:00','ConcluÃ­do'),(417,19,'2023-09-24 08:00:00','Entregue'),(418,21,'2023-09-24 09:30:00','Em Andamento'),(419,7,'2023-09-24 10:45:00','ConcluÃ­do'),(420,11,'2023-09-25 11:00:00','Entregue'),(421,13,'2023-09-25 12:30:00','Em Andamento'),(422,3,'2023-09-25 08:15:00','ConcluÃ­do'),(423,24,'2023-09-25 09:00:00','Entregue'),(424,17,'2023-09-25 10:30:00','Em Andamento'),(425,23,'2023-09-26 08:00:00','ConcluÃ­do'),(426,6,'2023-09-26 09:45:00','Entregue'),(427,8,'2023-09-30 08:15:00','Em Andamento'),(428,10,'2023-09-30 10:30:00','ConcluÃ­do'),(429,4,'2023-09-30 11:45:00','Entregue'),(430,2,'2023-09-30 12:00:00','Em Andamento'),(431,16,'2023-10-01 09:00:00','ConcluÃ­do'),(432,12,'2023-10-01 10:15:00','Entregue'),(433,26,'2023-10-01 11:30:00','Em Andamento'),(434,5,'2023-10-02 08:30:00','ConcluÃ­do'),(435,9,'2023-10-02 10:45:00','Entregue'),(436,18,'2023-10-02 12:15:00','Em Andamento'),(437,1,'2023-10-03 08:45:00','ConcluÃ­do'),(438,22,'2023-10-03 09:15:00','Entregue'),(439,15,'2023-10-03 10:00:00','Em Andamento'),(440,19,'2023-10-04 08:00:00','ConcluÃ­do'),(441,21,'2023-10-04 09:30:00','Entregue'),(442,7,'2023-10-04 10:45:00','Em Andamento'),(443,11,'2023-10-05 11:00:00','ConcluÃ­do'),(444,13,'2023-10-05 12:30:00','Entregue'),(445,3,'2023-10-05 08:15:00','Em Andamento'),(446,24,'2023-10-05 09:00:00','ConcluÃ­do'),(447,17,'2023-10-05 10:30:00','Entregue'),(448,23,'2023-10-06 08:00:00','Em Andamento'),(449,6,'2023-10-06 09:45:00','ConcluÃ­do'),(450,8,'2023-10-06 10:30:00','Entregue');
