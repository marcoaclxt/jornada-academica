-- comentario

/*
comentario

sadasdaasdasd
asdasd
asdasd
*/


/*
MySQl é um banco relacional.
Tabelas que se relacionam entre elas.
Cada tabela é composta por colunas e linhas.
Toda tabela tem que ter uma coluna que não se repete.
Essa coluna é chamada de chave primária.(PK - Primary Key) - Como se fosse um ID.

Todos os comandos são em inglês.
*/


-- criando um banco de dados.
CREATE DATABASE sprint1;

-- usando o banco de dados.
USE sprint1;

-- criando uma tabela no banco de dados.
CREATE TABLE empresa (
id INT PRIMARY KEY, -- Tipo número inteiro.
nome VARCHAR(45), -- Tipo texto limitado.
cnpj CHAR(14) -- Tipo texto 
);

-- descrever a tabela empresa.
DESCRIBE empresa;
DESC empresa;

-- inserindo dados na tabela empresa.
INSERT INTO empresa VALUE 
(1, 'Safra', '123.456.0001/3');

-- visualizar os dados inseridos
SELECT * from empresa;

-- inserir mais de um registro na tabela empresa.
INSERT INTO empresa VALUES
(2, 'Itau', '954.234.1230/3'),
(3, 'Solutis', '234.123.4646/9');

-- exibir apenas o nome da empresa.
SELECT nome from empresa;

-- exibir apenas o nome e o cnpj da empresa.
SELECT nome, cnpj from empresa;

-- exibir dados apenas da empresa safra.
SELECT * FROM empresa WHERE nome = 'Safra';

-- exibir dados apenas da empresa de ID 1.
SELECT * FROM empresa WHERE id = 1;

-- exibir dados apenas da empresa de ID 2 e 3.
SELECT * FROM empresa 
WHERE id = 2
OR id = 3;

-- exibir o nome da empresa que começa com a letra S
SELECT nome FROM empresa 
WHERE nome LIKE 'S%';

-- exibir o nome da empresa que termina com a letra A
SELECT nome FROM empresa 
WHERE nome LIKE '%a';

-- exibir o nome da empresa que contenha a letra A
SELECT nome FROM empresa 
WHERE nome LIKE '%a%';

-- exibir o nome da empresa que tem a letra A na penultima posição.
SELECT nome FROM empresa 
WHERE nome LIKE '%a_';

-- exibir o nome da empresa que tem a letra W na segunda posição.
SELECT nome FROM empresa 
WHERE nome LIKE '_o%';

-- exibir todos os dados menos da empresa Solutis.
SELECT * FROM empresa
WHERE nome != 'Solutis';

-- exibir as empresas em ordem alfabética 
SELECT * FROM empresa
ORDER BY nome ASC;

-- exibir as empresas em ordem decrescente 
SELECT * FROM empresa
ORDER BY nome DESC;

-- excluir a tabela
DROP TABLE empresa;
