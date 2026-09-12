CREATE DATABASE gameStore;

USE gameStore;

CREATE TABLE Jogo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    diretor VARCHAR(30),
    genero VARCHAR(30),
    data_lancamento DATE,
    nota INT,
    CONSTRAINT chNota CHECK(nota >= 1 AND nota <=10),
    quantidade INT
);

INSERT INTO Jogo (nome, diretor, genero, data_lancamento, nota, quantidade) VALUES
('Maravilho Mundo de Marco', 'Marco Antonio', 'Ação', '2025-12-24', 10, 777),
('Aventuras em Wonderland', 'Leticia Grigio', 'Aventura', '2021-11-12', 10, 123),
('Sempre feliz', 'Jorge Aragão', 'Ação', '2025-12-24', 5, 4533),
('Aqueles Caras', 'Fabiano Ruiz', 'Comedia', '2012-12-12', 4, 754),
('Pesca Esportiva', 'Paulo Grigio', 'Terror', '2014-06-22', 1, 123),
('Ilha Sombria', 'Marco Antonio', 'Terror', '2001-01-01', 7, 764);

SELECT * FROM Jogo;

-- Alterar a tabela para inserir uma coluna que represente o tipo_midia, que deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
ALTER TABLE Jogo ADD COLUMN tipo_midia VARCHAR(30);

ALTER TABLE Jogo ADD CONSTRAINT chTipo_midia 
CHECK(tipo_midia = 'Fisica' OR tipo_midia = 'Digital');

-- Atualizar os registros dos jogos inseridos anteriormente.
UPDATE Jogo SET tipo_midia = 'Digital'
WHERE id NOT IN (1,3);

UPDATE Jogo SET tipo_midia = 'Fisica'
WHERE id IN (1,3);

 -- Exibir apenas os jogos com data de lançamento a partir de 2015.
 SELECT * FROM Jogo
 WHERE data_lancamento > '2015-01-01';
 
 
-- Exibir os jogos que tenham a letra “a” em seu nome e são de mídia física.
SELECT * FROM Jogo
WHERE nome LIKE '%a%' AND tipo_midia = 'Fisica';


-- Exibir os jogos onde o nome do diretor não contenha a letra “e”.
SELECT * FROM Jogo
WHERE diretor NOT LIKE '%e%';


-- Exibir os jogos de um determinado gênero e que ainda esteja em estoque.
SELECT * FROM Jogo 
WHERE genero = 'Terror' AND quantidade > 0;


-- Excluir os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM Jogo WHERE quantidade <= 0;


-- Renomear a coluna diretor para criador e exibir como ficou a estrutura da tabela.
ALTER TABLE Jogo RENAME COLUMN diretor TO criador;

SELECT * FROM Jogo;




-- TABELA Esportes Olímpicos

CREATE DATABASE olimpiadas;

USE olimpiadas;

CREATE TABLE Esporte(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(20)
    CONSTRAINT chChategoria CHECK(categoria = 'Individual' OR categoria = 'Coletivo'),
    numJogadores INT,
    estreia DATE,
    paisOrigem VARCHAR(30)
);

INSERT INTO Esporte (nome, categoria, numJogadores, estreia, paisOrigem) VALUES
('Futebol', 'Coletivo', 11, '2026-12-12', 'Brasil'),
('Futebol Americano', 'Coletivo', 11, '2026-12-21', 'Estados Unidos'),
('Rugby', 'Coletivo', 15, '2026-12-01', 'Reino Unido'),
('Tênis', 'Individual', 1, '2026-12-28', 'França'),
('críquete ', 'Coletivo', 11, '2026-11-29', 'Inglaterra');

-- Alterar a tabela para adicionar uma coluna popularidade que armazene a popularidade do esporte como um valor decimal entre 0 e 10 e exibir como ficou a estrutura da tabela.
ALTER TABLE Esporte ADD COLUMN popularidade DECIMAL(2,0);

SELECT * FROM Esporte;

-- Atualizar os registros para definir a popularidade dos esportes inseridos anteriormente.
UPDATE Esporte SET popularidade = 6 
WHERE id BETWEEN 3 AND 5;

UPDATE Esporte SET popularidade = 10 
WHERE id = 1;

UPDATE Esporte SET popularidade = 3 
WHERE id = 2;

-- Exibir os esportes ordenados por popularidade em ordem crescente.
SELECT * FROM Esporte ORDER BY popularidade ASC;

-- Exibir apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000.
SELECT * FROM Esporte WHERE estreia > '2000-01-01';

-- Criar uma checagem para que não possa ser inserido valores dentro de estreia que seja menor que 06 de abril de 1896 e depois da data atual.
ALTER TABLE Esporte ADD CONSTRAINT chEstreia
CHECK(estreia >= '1896-04-06' AND estreia <= '2026-12-31');

-- Alterar a tabela para excluir a regra de inserção de categoria, assim podendo colocar valores além de “Individual” ou “Coletivo”.
ALTER TABLE Esporte 
DROP CONSTRAINT chChategoria;

-- Exibir apenas os esportes cujo nome do país de origem tenha “a” na segunda letra.
SELECT * FROM Esporte 
WHERE paisOrigem LIKE '_a%';

-- Exibir os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT * FROM Esporte WHERE numJogadores BETWEEN 4 AND 11;

-- Remover os registros onde id seja 1, 3 e 5.
DELETE FROM Esporte WHERE id IN(1,3,5);


-- TABELA Desenhos Animados

CREATE DATABASE desenho;

USE desenho;

CREATE TABLE DesenhosAnimados (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    data_lancamento DATE,
    emissora_original VARCHAR(50),
    classificacao INT,
	statusDesenho VARCHAR(15),
    nota INT
    CONSTRAINT chNota CHECK(nota >= 1 AND nota <= 5 )
) AUTO_INCREMENT = 10;

INSERT INTO DesenhosAnimados (titulo, data_lancamento, emissora_original, classificacao, statusDesenho, nota) VALUES
('Tom e Jerry', '1940-02-10', 'MGM', 0, 'Exibindo', 5),
('Os Simpsons', '1989-12-17', 'FOX', 12, 'cancelado', 5),
('Bob Esponja', '1999-05-01', 'Nickelodeon', 0, 'cancelado', 4),
('Dragon Ball Z', '1989-04-26', 'Fuji TV', 10, 'Exibindo', 5),
('O Laboratório de Dexter', '1996-04-28', 'Cartoon Network', 0, 'Exibindo', 4),
('Ben 10', '2005-12-27', 'Cartoon Network', 0, 'Finalizado', 4);

-- Exibir todos os dados da tabela.
SELECT * FROM DesenhosAnimados;

-- Exibir todos os desenhos com a classificação menor ou igual a 14 anos.
SELECT * FROM DesenhosAnimados WHERE classificacao <= 14;

-- Exibir todos os desenhos de uma mesma emissora original.
SELECT * FROM DesenhosAnimados WHERE emissora_original = 'Cartoon Network';

-- Modificar o campo status, para que aceite apenas o status ‘exibindo’, ‘finalizado’, ‘cancelado’; tente inserir algum outro valor para ver se a regra foi aplicada.
ALTER TABLE DesenhosAnimados ADD CONSTRAINT chStatus
CHECK(statusDesenho = 'Exibindo' OR statusDesenho = 'Finalizado' OR statusDesenho = 'cancelado');

INSERT INTO DesenhosAnimados (titulo, data_lancamento, emissora_original, classificacao, statusDesenho, nota) VALUES
('As aventuras de Flynn', '1999-12-12', 'Fox', 10, 'Em andamento', 10);

-- Modificar o status ‘exibindo’ para ‘finalizado’ de 2 desenhos pelo ID.
UPDATE DesenhosAnimados SET statusDesenho = 'finalizado'
WHERE id IN(10,13);

-- Deletar a linha do desenho de ID 12.
DELETE FROM DesenhosAnimados WHERE id = 12;

-- Exibir apenas os desenhos que comecem com uma determinada letra.
SELECT * FROM DesenhosAnimados WHERE titulo LIKE 'o%';

-- Renomear a coluna classificacao para classificacaoIndicativa.
ALTER TABLE DesenhosAnimados RENAME COLUMN classificacao TO classificacaoIndicativa;

-- Atualizar a nota e data de lançamento do desenho de ID 11.
UPDATE DesenhosAnimados SET nota = 2 WHERE id = 11;

UPDATE DesenhosAnimados SET data_lancamento = '1928-12-12' WHERE id = 11;

-- Limpar todos os dados da tabela.
TRUNCATE TABLE DesenhosAnimados;

-- Remover a regra do status do desenho.
ALTER TABLE DesenhosAnimados DROP CONSTRAINT chStatus;

-- TABELA Despensa do Scooby-Doo

CREATE DATABASE estoque;

USE estoque;

CREATE TABLE MisteriosSA (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    dataCompra DATE,
    preco DECIMAL(10,2),
    peso DECIMAL(10,2),
    dataRetirada DATE
);

INSERT INTO MisteriosSA (nome, dataCompra, preco, peso) VALUES
('Biscoito', '2026-08-01', 5.99, 200.00),
('Salsicha', '2026-08-02', 12.50, 500.00),
('Queijo', '2026-08-03', 18.90, 300.00),
('Presunto', '2026-08-04', 14.75, 250.00),
('Bolacha', '2026-08-05', 6.50, 150.00),
('Cereal', '2026-08-06', 11.99, 400.00);

-- Verificar se os valores foram inseridos corretamente.
SELECT * FROM MisteriosSA;

-- Exibir os nomes, as datas de compra e retirada e o id dos alimentos ordenados a partir da data de compra mais antiga.
SELECT nome, DataCompra, dataRetirada, id FROM MisteriosSA ORDER BY dataCompra;

-- Alguém comeu uma caixa de biscoitos, atualizar a data de retirada da caixa de “Biscoitos Scooby” que foi comprada a mais tempo.
UPDATE MisteriosSA SET dataRetirada = '2026-07-12' WHERE idComida = 1;

-- Alterar o nome da coluna id para idComida.
ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;

-- Alterar o tipo do check para que os alimentos só possam ser “Biscoitos Scooby” ou “Cachorro-quente”.
ALTER TABLE MisteriosSA ADD CONSTRAINT chNome
CHECK(nome = "Biscoitos Scooby" OR nome = "Cachorro-Quente");


-- TABELA Heróis

CREATE DATABASE vingadores;

USE vingadores;

CREATE TABLE heroi (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    versao VARCHAR(45),
    habilidade VARCHAR(45),
    altura INT
);

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES 
('Homem de Ferro', 'Vingadores: Ultimato', 'Inteligência e tecnologia', 185),
('Capitão América', 'Vingadores: Ultimato', 'Superforça e resistência', 188),
('Thor', 'Thor: Ragnarok', 'Controle dos raios e superforça', 190),
('Hulk', 'Vingadores: Era de Ultron', 'Superforça', 244),
('Homem-Aranha', 'Homem-Aranha: Sem Volta para Casa', 'Sentido aranha e agilidade', 178);

-- Exibir os dados inseridos na tabela.
SELECT * FROM heroi;

-- Adicionar um campo de regeneracao, onde ele aceitará apenas os valores booleanos de TRUE ou FALSE.
ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

-- Modificar o campo versao para aceitar até 100 caracteres.
ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

-- Remover o herói de id 3 pois ele se morreu em batalha.
DELETE FROM heroi WHERE id = 3;

-- Chegou reforços, inserir um novo herói para a equipe.
INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
('Groot', 'Guardiões da Galáxia', 'Força', 320);

-- Exibir todos os dados inseridos na tabela onde o nome do herói começa com “C” ou “H”.
SELECT * FROM heroi WHERE nome LIKE 'C%' OR nome LIKE 'H%';

-- Exibir todos os dados inseridos na tabela onde o nome do herói não contém a letra “A” no campo nome.
SELECT * FROM heroi WHERE nome != 'a%';

-- Exibir apenas o nome do herói onde a altura for maior que 190.
SELECT nome FROM heroi WHERE altura >= 189;

-- Exibir todos os dados da tabela de forma decrescente pelo nome onde a altura do herói for maior que 180.
SELECT * FROM heroi WHERE altura >= 180 ORDER BY nome;

-- Limpar os dados da tabela.
TRUNCATE TABLE heroi;


-- TABELA sprint1

USE sprint1;

CREATE TABLE Revista (
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);


INSERT INTO Revista (nome, categoria) VALUES
('Revista Veja','Política'),
('Revista Brasil', 'Notícias Gerais'),
('Revista Magazine', 'Moda e Cultura'),
('MAD', 'Comédia');

-- Exibir todos os dados da tabela.
SELECT * FROM Revista;

-- Atualizar os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
UPDATE Revista SET categoria = 'Noticias Gerais'
WHERE idRevista IN(1,2);

UPDATE Revista SET categoria = 'Comédia e GEEK'
WHERE idRevista = 4;

SELECT * FROM Revista;

-- Inserir mais 3 registros completos.
INSERT INTO Revista (nome, categoria) VALUES
('Revista Brasilzao','Política'),
('Revista Mais Mulheres', 'Debates Femininos'),
('Revista Futebol', 'Futebol');

-- Exibir novamente os dados da tabela.
SELECT * FROM Revista;

-- Exibir a descrição da estrutura da tabela.
DESCRIBE Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);	

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria.
DESCRIBE Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN peridiocidade VARCHAR(15);

-- Exibir os dados da tabela.
SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN peridiocidade;



-- TABELA Carro

USE sprint1;

CREATE TABLE Carro (
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
) AUTO_INCREMENT = 1000;
 
INSERT INTO Carro (nome, placa) VALUES
('Astra', 'EMC8123'),
('Corsa', 'ABC1234'),
('Corolla', 'FPA9402'),
('Tiggo 8', 'FAA2766'); 

-- Exibir todos os dados da tabela.
SELECT * FROM Carro;

-- Inserir mais 3 registros sem a placa dos carros.
INSERT INTO Carro (nome) VALUES
('Spin'),
('BYD Dolphin'),
('Camaro');

-- Exibir novamente os dados da tabela.
SELECT * FROM Carro;

-- Exibir a descrição da estrutura da tabela.
DESCRIBE Carro;

-- Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.
ALTER TABLE Carro MODIFY COLUMN nome VARCHAR(28);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna.
DESCRIBE Carro;

-- Acrescentar a coluna ano à tabela, que é char(4).
ALTER TABLE Carro ADD COLUMN ano CHAR(4);

-- Atualizar todos os dados nulos da tabela.
UPDATE Carro SET ano = 2014 WHERE idCarro BETWEEN 1000 AND 1007;

UPDATE Carro SET ano = 2018 WHERE idCarro BETWEEN 1008 AND 1010;