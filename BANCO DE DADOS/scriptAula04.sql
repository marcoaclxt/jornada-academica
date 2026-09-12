CREATE DATABASE ligaPokemon;
USE ligaPokemon;

CREATE TABLE treinador (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    idade TINYINT,
    telefone CHAR(11),
    dataCadastro DATETIME
); -- AUTO_INCREMENT = 100;

ALTER TABLE treinador AUTO_INCREMENT = 100;

INSERT INTO treinador VALUES
(DEFAULT, 'Ash Ketchum', 12, '11966547236', NOW()),
(DEFAULT, 'Misty', 12, NULL, NOW()),
(DEFAULT, 'Brock', 15, '11965478413', NOW()),
(DEFAULT, 'Lance', 60, NULL, NOW()),
(DEFAULT, 'Serena', 14, '11963215467', NOW());

SELECT * FROM treinador;

SELECT 
nome, 
DATE_FORMAT(dataCadastro, '%d/%m/%Y') dataCadastro
FROM treinador;

SELECT * FROM treinador WHERE telefone IS NULL;


SELECT * FROM treinador WHERE telefone IS NOT NULL;


SELECT nome, IFNULL(telefone, 'Telefone não informado.') validaTelefone FROM treinador;

SELECT nome, ISNULL(telefone) semTelefone FROM treinador;

SELECT nome, NULLIF(idade, 12) 'idade diferente de 12' FROM treinador;



ALTER TABLE treinador
ADD COLUMN cidade VARCHAR(50),
DROP COLUMN telefone;

DESC treinador;

UPDATE treinador SET nome = 'Ash',
idade = 13, cidade = 'Pallet' WHERE id = 100;

SELECT * FROM treinador WHERE id = 100;


UPDATE treinador SET cidade = 'São Paulo' WHERE cidade IS NULL; -- A SEGURANÇA NAO VAI DEIXAR RODAR.

SELECT * FROM treinador;


CREATE TABLE pokemon (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    tipo VARCHAR(45) DEFAULT 'Água',
    nivel TINYINT,
    hp INT,
    atk INT
);


INSERT INTO pokemon (nome, nivel, hp, atk) VALUES
('Squirtle', 2, 30, 10),
('Greninja', 50, 120, 140),
('Lapras', 40, 90, 100);

SELECT * FROM pokemon;

INSERT INTO pokemon (nome, nivel, hp, atk, tipo) VALUES
('Pikachu', 100, 100, 70, 'Elétrico'),
('Zapdos', 70, 500, 300, 'Elétrico'),
('Alakazan', 25, 120, 70, 'Psiquico');


SELECT 
nome,
hp + atk AS poderTotal
FROM pokemon;

SELECT 
nome,
hp - atk AS Total
FROM pokemon;

SELECT 
nome,
hp * 2 dobraDaVida,
atk /2 AS ataqueReduzido
FROM pokemon;

SELECT 
nome,
hp / atk AS poderTotal
FROM pokemon;


SELECT nome,
NOW() dataHoraAtual,
CURDATE() dataAtual
FROM pokemon;


SELECT nome,
YEAR(dataCadastro) anoCadastro,
MONTH(dataCadastro) mesCadastro,
DAY(dataCadastro) diaCadastro,
CURDATE() dataAtual
FROM treinador;



SELECT nome,
TIMESTAMPDIFF(DAY, dataCadastro, '2026-09-24') AS diasCadastro, 
TIMESTAMPDIFF(MONTH, dataCadastro, '2026-10-24') AS mesesCadastro,
TIMESTAMPDIFF(YEAR, dataCadastro, '2029-09-24') AS anosCadastro 
FROM treinador;

SELECT 
TIMESTAMPDIFF(YEAR, '2007-10-26', NOW());

SELECT
DATEDIFF('2006-09-24', NOW()) dataDias; 



ALTER TABLE 