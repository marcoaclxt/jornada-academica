CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE Atleta (
idAtleta  INT PRIMARY KEY, 
nome VARCHAR(40), 
modalidade VARCHAR(40),
qtdMedalha INT
);

INSERT INTO Atleta VALUES 
(1, 'Marco', 'Natação', 200),
(2, 'Pedro', 'Futebol', 30),
(3, 'Lucas', 'Basquete', 10),
(4, 'João', 'Vôlei', 120),
(5, 'Victor', 'Tênis', 2),
(6, 'Bruna', 'Futebol', 0),
(7, 'Victor', 'Tênis', 2),
(8, 'Luciana', 'Natação', 340),
(9, 'Gustavo', 'Tênis', 12);

-- Exibir todos os dados da tabela.
SELECT * FROM Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1.
UPDATE Atleta SET qtdMedalha = '2'
WHERE idAtleta = '5';

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3.
UPDATE Atleta SET qtdMedalha = '21'
WHERE idAtleta = '2' OR idAtleta = '3';

-- Atualizar o nome do atleta com o id=4.
UPDATE Atleta SET nome = 'João Victor'
WHERE idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date.
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

-- Atualizar a data de nascimento de todos os atletas.
UPDATE Atleta SET dtNasc = '1972-10-02'
WHERE idAtleta = 1;

UPDATE Atleta SET dtNasc = '1987-01-01'
WHERE idAtleta = 2;

UPDATE Atleta SET dtNasc = '2001-08-21'
WHERE idAtleta = 3;

UPDATE Atleta SET dtNasc = '2001-11-11'
WHERE idAtleta = 4;

UPDATE Atleta SET dtNasc = '2007-12-12'
WHERE idAtleta = 5;

UPDATE Atleta SET dtNasc = '1989-04-21'
WHERE idAtleta = 6;

UPDATE Atleta SET dtNasc = '2002-02-22'
WHERE idAtleta = 7;

UPDATE Atleta SET dtNasc = '1991-08-21'
WHERE idAtleta = 8;

UPDATE Atleta SET dtNasc = '2009-09-09'
WHERE idAtleta = 9;

-- Excluir o atleta com o id=5.
DELETE FROM Atleta WHERE idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação.
SELECT * FROM Atleta 
WHERE modalidade != 'natação';

-- Exibir os dados dos atletas que têm a quantidade de medalhas maior ou igual a 3.
SELECT * FROM Atleta 
WHERE qtdMedalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60.
ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade.
DESCRIBE Atleta;

-- Limpar os dados da tabela.
TRUNCATE TABLE Atleta;

-- ATIVIDADE MUSICA

CREATE TABLE Musica (
idMusica  INT PRIMARY KEY, 
titulo VARCHAR(40), 
artista VARCHAR(40),
genero VARCHAR(40)
);

INSERT INTO Musica VALUES
(1, 'Desejos', 'Marco Antonio', 'Sertanejo'),
(2, 'Amor', 'Leticia Grigio', 'MPB'),
(3, 'Musica boa', 'Rafael Campos', 'Funk'),
(4, 'Festa Legal', 'Esther Muniz', 'Rock'),
(5, 'Boas Festas', 'Victor Faria', 'Trap'),
(6, 'Mas Festas', 'Victor Faria', 'Trap'),
(7, 'Aquelas Festas', 'Victor Faria', 'Trap');

-- Exibir todos os dados da tabela.
SELECT * FROM Musica;

-- Adicionar o campo curtidas do tipo int na tabela.
ALTER TABLE Musica ADD COLUMN curtidas INT;

-- Atualizar o campo curtidas de todas as músicas inseridas.
UPDATE Musica SET curtidas = 120 
WHERE idMusica IN (1, 6, 7);

UPDATE Musica SET curtidas = 520 
WHERE idMusica IN (2, 3, 4);

UPDATE Musica SET curtidas = 4520 
WHERE idMusica IN (5);

-- Modificar o campo artista do tamanho 40 para o tamanho 80.
ALTER TABLE Musica MODIFY COLUMN artista VARCHAR(60);

-- Atualizar a quantidade de curtidas da música com id=1.
UPDATE Musica SET curtidas = 100
WHERE idMusica = 1;

-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3.
UPDATE Musica SET curtidas = 12
WHERE idMusica = 2 OR idMusica = 3;

-- Atualizar o nome da música com o id=5.
UPDATE Musica SET titulo = 'Sertanejo daqueles muito bons'
WHERE idMusica = 5;

-- Excluir a música com o id=4.
DELETE FROM Musica WHERE idMusica = 4;

-- Exibir as músicas onde o gênero é diferente de funk.
SELECT * FROM Musica
WHERE genero != 'Funk';

-- Exibir os dados das músicas que têm curtidas maior ou igual a 20.
SELECT * FROM Musica
WHERE curtidas >= 20;

-- Descrever os campos da tabela mostrando a atualização do campo artista.
DESCRIBE Musica;

-- Limpar os dados da tabela.
TRUNCATE TABLE Musica;

-- Exercicio Filme

CREATE TABLE Filme (
idFilme INT PRIMARY KEY,
titulo VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40)
);

INSERT INTO Filme VALUES
(1, 'A Origem', 'Ficção Científica', 'Christopher Nolan'),
(2, 'Interestelar', 'Ficção Científica', 'Christopher Nolan'),
(3, 'O Cavaleiro das Trevas', 'Ação', 'Christopher Nolan'),
(4, 'Jurassic Park', 'Ficção Científica', 'Steven Spielberg'),
(5, 'E.T. O Extraterrestre', 'Ficção Científica', 'Steven Spielberg'),
(6, 'O Resgate do Soldado Ryan', 'Drama', 'Steven Spielberg'),
(7, 'Matrix', 'Ficção Científica', 'Lana Wachowski'),
(8, 'O Poderoso Chefão', 'Drama', 'Francis Ford Coppola'),
(9, 'Clube da Luta', 'Drama', 'David Fincher'),
(10, 'O Senhor dos Anéis', 'Fantasia', 'Peter Jackson');

-- Exibir todos os dados da tabela.
SELECT * FROM Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela.
ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);

-- Atualizar o campo protagonista de todos os filmes inseridos.
UPDATE Filme SET protagonista = 'Senhor Gustavo'
WHERE idFilme = 1;

UPDATE Filme SET protagonista = 'Senhora Julia'
WHERE idFilme = 2;

UPDATE Filme SET protagonista = 'Leticia Grigio'
WHERE idFilme = 3;

UPDATE Filme SET protagonista = 'Marco Antonio'
WHERE idFilme = 4;

UPDATE Filme SET protagonista = 'Padre Ancelloti'
WHERE idFilme = 5;

UPDATE Filme SET protagonista = 'Julio Ribeiro'
WHERE idFilme = 6;

UPDATE Filme SET protagonista = 'Valentim Gentil'
WHERE idFilme = 7;

UPDATE Filme SET protagonista = 'Maria Ribeiro'
WHERE idFilme = 8;

UPDATE Filme SET protagonista = 'Camargo Aranha'
WHERE idFilme = 9;

UPDATE Filme SET protagonista = 'john Maya'
WHERE idFilme = 10;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150.
ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR(150);

-- Atualizar o diretor do filme com id=5.
UPDATE Filme SET diretor = "Marco Antonio"
WHERE idFilme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7.
UPDATE Filme SET diretor = "Leonardo Scorza"
WHERE idFilme = 2 OR idFilme = 7;

-- Atualizar o título do filme com o id=6.
UPDATE Filme SET titulo = "As aventuras do Marco Antonio"
WHERE idFilme = 6;

-- Excluir o filme com o id=3.
DELETE FROM Filme WHERE idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama.
SELECT * FROM Filme
WHERE genero != 'Drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’.
SELECT * FROM Filme
WHERE genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor.
DESCRIBE Filme;

-- Limpar os dados da tabela.
TRUNCATE TABLE Filme;


-- Exercicio Professor

CREATE TABLE Professor (
idProfessor INT PRIMARY KEY,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc DATE
);

INSERT INTO Professor VALUES
(1, 'Carlos Silva', 'Matemática', '1980-05-15'),
(2, 'Ana Souza', 'Matemática', '1975-11-22'),
(3, 'Marcos Oliveira', 'Física', '1982-03-10'),
(4, 'Juliana Santos', 'História', '1990-08-05'),
(5, 'Roberto Costa', 'História', '1985-12-30'),
(6, 'Fernanda Lima', 'Química', '1978-07-18'),
(7, 'Ricardo Mendes', 'Biologia', '1981-02-14'),
(8, 'Camila Pereira', 'Biologia', '1987-09-25'),
(9, 'Paulo Almeida', 'Geografia', '1979-04-12'),
(10, 'Luciana Rocha', 'Geografia', '1992-01-08'),
(11, 'Thiago Fernandes', 'Inglês', '1984-06-20'),
(12, 'Beatriz Ribeiro', 'Literatura', '1989-10-03');

-- Exibir todos os dados da tabela.
SELECT * FROM Professor;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’.
ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50);

ALTER TABLE Professor ADD CONSTRAINT chFuncao 
CHECK(funcao = 'monitor' OR funcao = 'assistente' OR funcao = 'titular');

-- Atualizar os professores inseridos e suas respectivas funções.
UPDATE Professor SET funcao = 'titular' 
WHERE idProfessor IN (1, 3, 6, 9);

UPDATE Professor SET funcao = 'assistente' 
WHERE idProfessor IN (2, 4, 7, 10, 11);

UPDATE Professor SET funcao = 'monitor' 
WHERE idProfessor IN (5, 8, 12);

-- Inserir um novo professor.
INSERT INTO Professor VALUES
(13, 'Marco Antonio', 'Programação BackEnd', '2007-10-26', 'titular');

-- Excluir o professor onde o idProfessor é igual a 5.
DELETE FROM Professor WHERE idProfessor = 5;

-- Exibir apenas os nomes dos professores titulares.
SELECT nome FROM Professor
WHERE funcao = 'titular';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores.
SELECT especialidade, dtNasc FROM Professor
WHERE funcao = 'monitor';

-- Atualizar a data de nascimento do idProfessor igual a 3.
UPDATE Professor SET dtNasc = '1972-03-17'
WHERE idProfessor = 3;

-- Limpar a tabela Professor.
TRUNCATE TABLE Professor;

-- Exercicio Curso

CREATE TABLE Curso (
idCurso INT PRIMARY KEY,
nome VARCHAR(50),
sigla VARCHAR(3),
coordenador VARCHAR(60)
);

INSERT INTO Curso VALUES
(1, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Prof. Marcio'),
(2, 'Ciência da Computação', 'CCO', 'Profa. Rebeca'),
(3, 'Sistemas da Informação', 'SIS', 'Prof. Marcos');

-- Exibir todos os dados da tabela.
SELECT * FROM Curso;

-- Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM Curso
WHERE sigla = 'ADS';

-- Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM Curso
ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM Curso
ORDER BY coordenador DESC;

-- Exibir os dados da tabela dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM Curso
WHERE nome LIKE 'A%';

-- Exibir os dados da tabela dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso
WHERE nome LIKE '%o';

-- Exibir os dados da tabela dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Curso
WHERE nome LIKE '_i%';

-- Exibir os dados da tabela dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Curso
WHERE nome LIKE '%a_';

-- Elimine a tabela.
DROP TABLE Curso;