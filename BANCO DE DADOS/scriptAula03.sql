/*
RECAPTULANDO OS CONCEITOS

UPDATE - Atualiza dados - DML
DELETE - Exclui um registro

ALTER TABLE - Altera a estrutura da tabela - DDL
	MODIFY - Modifica um atributo
    ADD - Adiciona uma coluna
    DROP - Exclui um atributo
    RENAME - Muda o nome do atributo

DROP TABLE - Exclui a tabela
TRUNCATE TABLE - Apaga os dados da tabela - DDL

CONSTRAINT - Restrição de um atributo
	CHECK - Valida valores permitidos
    
SELECT 
	IFNULL() - Função para validar dados nulos
*/

-- USE sprint1;

CREATE TABLE sprint1.usuario (
id INT PRIMARY KEY AUTO_INCREMENT, -- Funciona apenas em tipos numericos inteiros
nome VARCHAR(45) NOT NULL, -- Nome é obrigatório
dtNasc DATE,
peso DECIMAL(4,1),
altura FLOAT,
plano VARCHAR(45),
email VARCHAR(100) UNIQUE,
CONSTRAINT chPlano CHECK(plano IN ('Mensal','Semanal','Avulso')),
nivel INT,
CONSTRAINT chNivel CHECK(nivel >= 1 AND nivel <=5),
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
) AUTO_INCREMENT = 500;


INSERT INTO sprint1.usuario (nome, dtNasc, peso, altura, plano, nivel, email) VALUES
('Jorge', '2000-06-09', 75, 1.85, 'Mensal', 2, 'jorge@sptech.school'),
('Maria', '2009-07-26', 56.8, 1.65, 'Avulso', 2, 'maria@sptech.school'),
('Marcio', '2010-07-12', 27.9, 1.95, 'Avulso', 1, 'marcio@sptech.school'),
('Marco', '2007-10-26', 89, 1.95, 'Mensal', 5, 'marco@sptech.school'),
('Luciana', '2002-05-05', 56.8, 1.65, 'Avulso', 1, 'luciana@sptech.school');

SELECT * FROM sprint1.usuario;

SELECT
nome AS 'Nome do Usuário:', -- ALIAS
dtCadastro AS Data_Cadastro -- ACEITA DAS DUAS FORMAS
FROM sprint1.usuario; 

-- Concatenar dois valores
SELECT
CONCAT('O aluno ', nome, ' Utiliza o plano ', plano) AS Info
FROM sprint1.usuario;

DESC sprint1.usuario;

INSERT INTO sprint1.usuario (nome, dtNasc, peso, altura, plano, nivel, email) VALUES
('Marcos', '2002-06-09', 75, 1.85, 'Mensal', 2, 'jorge@sptech.scshool');

-- IF e ELSE no MySQL
-- CASE 

SELECT
nome,
CASE
	WHEN nivel = 1 THEN 'Nivel baby'
    WHEN nivel <= 2 THEN 'Nivel mini monster'
    ELSE 'Nivel 1'
END AS 'Nivel',
nivel
FROM sprint1.usuario;


SELECT * FROM sprint1.usuario WHERE id IN(501,503);

SELECT * FROM sprint1.usuario WHERE id NOT IN (501,503);

SELECT * FROM sprint1.usuario WHERE id > 500 AND id < 505;

SELECT * FROM sprint1.usuario WHERE id BETWEEN 500 AND 505;

SELECT * FROM sprint1.usuario WHERE dtNasc > '2008-01-01';


TRUNCATE sprint1.usuario;