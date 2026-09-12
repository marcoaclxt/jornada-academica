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
(3, 'Lucas', 'Basquete', 10);

-- Exibir todos os dados da tabela.
SELECT * FROM Atleta;

-- Exibir apenas os nomes e a quantidade de medalhas dos atletas.
SELECT nome, qtdMedalha FROM Atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
SELECT * FROM Atleta
WHERE modalidade = "Natação";

-- Exibir os dados da tabela ordenados pela modalidade.
SELECT * FROM Atleta
ORDER BY modalidade;

-- Exibir os dados da tabela ordenados pela quantidade de medalhas, em ordem decrescente.
SELECT qtdMedalha FROM Atleta 
ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela dos atletas cujo nome contenha a letra s.
SELECT * FROM Atleta 
WHERE nome LIKE '%s%';

-- Exibir os dados da tabela dos atletas cujo nome comece com uma determinada letra.
SELECT * FROM Atleta 
WHERE nome LIKE 'M%';

-- Exibir os dados da tabela dos atletas cujo nome termine com a letra o.
SELECT * FROM Atleta 
WHERE nome LIKE '%o';

-- Exibir os dados da tabela dos atletas cujo nome tenha a penúltima letra r.
SELECT * FROM Atleta 
WHERE nome LIKE '%r_';

-- Eliminar a tabela.
DROP TABLE Atleta;

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

-- Exibir apenas os títulos e os artistas das músicas.
SELECT titulo, artista FROM Musica;

-- Exibir apenas os dados das músicas de um determinado gênero.
SELECT idMusica, titulo, genero FROM Musica
WHERE genero = 'Trap';

-- Exibir apenas os dados das músicas de um determinado artista.
SELECT idMusica, titulo, genero FROM Musica
WHERE artista = "Victor Faria";

-- Exibir os dados da tabela ordenados pelo título da música.
SELECT * FROM Musica
ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
SELECT * FROM Musica 
ORDER BY artista DESC;

-- Exibir os dados da tabela das músicas cujo título comece com uma determinada letra.
SELECT * FROM Musica 
WHERE titulo LIKE 'M%';

-- Exibir os dados da tabela das músicas cujo artista termine com uma determinada letra.
SELECT * FROM Musica 
WHERE artista LIKE '%O';

-- Exibir os dados da tabela das músicas cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Musica
WHERE genero LIKE '_e%';

-- Exibir os dados da tabela das músicas cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Musica
WHERE titulo LIKE '%a_';

-- Eliminar a tabela.
DROP TABLE Musica;

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

-- Exibir apenas os títulos e os diretores dos filmes.
SELECT titulo, diretor FROM Filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
SELECT * FROM Filme
WHERE genero = 'Drama';

-- Exibir apenas os dados dos filmes de um determinado diretor.
SELECT * FROM Filme
WHERE diretor = 'Christopher Nolan';

-- Exibir os dados da tabela ordenados pelo título do filme.
SELECT * FROM Filme
ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
SELECT * FROM Filme
ORDER BY diretor DESC;

-- Exibir os dados da tabela dos filmes cujo título comece com uma determinada letra.
SELECT * FROM Filme 
WHERE titulo LIKE 'O%';

-- Exibir os dados da tabela dos filmes cujo diretor termine com uma determinada letra.
SELECT * FROM Filme
WHERE diretor LIKE '%n';

-- Exibir os dados da tabela dos filmes cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Filme
WHERE genero LIKE '_C%';

-- Exibir os dados da tabela dos filmes cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Filme
WHERE titulo LIKE '%I_';

-- Eliminar a tabela.
DROP TABLE Filme;

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

-- Exibir apenas as especialidades dos professores.
SELECT especialidade FROM Professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT * FROM Professor
WHERE especialidade = 'História';

-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM Professor
ORDER BY nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT * FROM Professor
ORDER BY dtNasc DESC;

-- Exibir os dados da tabela dos professores cujo nome comece com uma determinada letra.
SELECT * FROM Professor
WHERE nome LIKE 'r%';

-- Exibir os dados da tabela dos professores cujo nome termine com uma determinada letra.
SELECT * FROM Professor
WHERE nome LIKE '%a';

-- Exibir os dados da tabela dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Professor
WHERE nome LIKE '_a%';

-- Exibir os dados da tabela dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Professor
WHERE nome LIKE '%o_';

-- Eliminar a tabela.
DROP TABLE Professor;

-- Exercicio Jogo

CREATE TABLE Jogo (
idJogo INT PRIMARY KEY,
nome VARCHAR(50),
comentario VARCHAR(200),
ranking INT
);

INSERT INTO Jogo VALUES
(1, 'The Witcher 3: Wild Hunt', 'Um RPG épico com uma história incrível, decisões difíceis e um mundo aberto vasto para explorar.', 1),
(2, 'Red Dead Redemption 2', 'Narrativa fantástica no velho oeste, com gráficos deslumbrantes e um mundo extremamente vivo.', 2),
(3, 'Zelda: Breath of the Wild', 'Revolucionou os jogos de mundo aberto entregando uma liberdade de exploração sem precedentes.', 3),
(4, 'God of War', 'Combate brutal e uma história emocionante sobre a relação entre pai e filho na mitologia nórdica.', 4),
(5, 'Minecraft', 'O jogo sandbox definitivo, onde o único limite para construir e explorar é a sua própria criatividade.', 5),
(6, 'Hollow Knight', 'Um metroidvania desafiador, com uma arte desenhada à mão belíssima e uma atmosfera única.', 6),
(7, 'Stardew Valley', 'Uma experiência muito relaxante e viciante. Perfeito para gerenciar sua fazenda e fazer amizades.', 7),
(8, 'Hades', 'Roguelike incrivelmente polido, com combate fluido, excelente trilha sonora e personagens cativantes.', 8);

-- Exibir todos os dados da tabela.
SELECT * FROM Jogo;

-- Exibir apenas os nomes dos jogos.
SELECT nome FROM Jogo;

-- Exibir apenas o comentário de um determinado jogo.
SELECT comentario FROM Jogo
WHERE nome = 'Hades';

-- Exibir os dados da tabela ordenados pelo nome do jogo.
SELECT * FROM Jogo
ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo ranking em ordem decrescente.
SELECT * FROM Jogo
ORDER BY ranking DESC;

-- Exibir os dados da tabela dos jogos cujo nome comece com uma determinada letra.
SELECT * FROM Jogo
WHERE nome LIKE 'S%';

-- Exibir os dados da tabela dos jogos cujo nome termine com uma determinada letra.
SELECT * FROM Jogo
WHERE nome LIKE '%T';

-- Exibir os dados da tabela dos jogos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Jogo
WHERE nome LIKE '_i%';

-- Exibir os dados da tabela dos jogos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Jogo
WHERE nome LIKE '%a_';

-- Exibir os dados da tabela dos jogos cujo nome seja diferente de Minecraft.
SELECT * FROM Jogo
WHERE nome != 'Minecraft';

-- Eliminar a tabela.
DROP TABLE Jogo;