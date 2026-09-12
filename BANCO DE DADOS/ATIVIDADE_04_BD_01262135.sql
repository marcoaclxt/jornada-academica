USE sprint1;

CREATE TABLE aluguel (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30),
    sobrenome VARCHAR(30),
    valorTotal INT,
    statusAluguel VARCHAR(45)
);

INSERT INTO aluguel (nome, sobrenome, valorTotal, statusAluguel) VALUES
('Marco', 'Antonio', 250.00, 'finalizado'),
('Ana', 'Beatriz', 450.50, 'em_andamento'),
('Carlos', 'Eduardo', 120.90, 'finalizado'),
('Fernanda', 'Silva', 890.00, 'em_andamento'),
('Lucas', 'Oliveira', 310.20, 'cancelado'),
('Juliana', 'Costa', 150.00, 'pendente');

-- Mostre o nome completo do cliente (campo nome + campo sobrenome), usando CONCAT, com o alias cliente.
SELECT CONCAT(nome, ' ', sobrenome) AS cliente FROM aluguel;

-- Mostre o valor total do aluguel.
SELECT valorTotal FROM aluguel;

-- Mostre uma coluna chamada situacao, construída com CASE, que exiba: ORDENAR PELO NOME DO CLIENTE
SELECT 

CONCAT(nome, ' ', sobrenome) AS cliente,

CASE 
WHEN statusAluguel = 'finalizado' THEN 'Concluido'
WHEN statusAluguel = 'em_andamento' THEN 'Em Andamento'
ELSE 'Cancelado'
END AS situacao  FROM aluguel ORDER BY cliente;




-- BIBLIOTECA




create database biblioteca;
use biblioteca;

create table livro(
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigo char(4),
    titulo varchar(45),
    autor varchar(60) DEFAULT('Sem Autor'),
    anoPublicacao DATE
);

INSERT INTO livro (codigo, titulo, anoPublicacao) VALUES
(1234, "Aventuras de Marco", '1924-03-12');

INSERT INTO livro (codigo, titulo, autor, anoPublicacao) VALUES
(1234, "Aventuras de Marco", 'Marco Antonio', '1924-03-12');

SELECT * FROM livro;

UPDATE livro SET autor = "Leticia Grigrio" WHERE id = 1;

select titulo, autor from livro where id = 1;

delete from livro where id = 2;

desc livro;

ALTER TABLE livro ADD COLUMN editora varchar(60);

select * from livro where autor like '%a';

alter table livro drop column editora;



-- USUARIO



create table usuario(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(60) NOT NULL,
    tipo varchar(45)
);

insert into usuario (nome, tipo) values
('Marco Antonio', 'Docente'),
('Leticia Grigio', 'Visitante');

alter table usuario add constraint chTipo check(tipo = 'docente' OR tipo = 'discente' OR tipo = 'visitante');

update usuario set tipo = "Docente" where codigo in(1,2);

select * from usuario where nome like '%m_';

alter table usuario add column telefone varchar(12);

alter table usuario modify column telefone varchar(70);


select nome as nome_completo from usuario;

select concat('O livro ', titulo, ' é do autor ', autor) as detalhes from livro;

select titulo, anoPublicacao,

case 
 when anoPublicacao < '2000-01-01' then 'Antigo'
 else 'Moderno'
 end as classificacao
 
 from livro;
 
 
 select * from livro order by titulo;
 
 select * from usuario where tipo != 'Docente';
 
 truncate table livro;
 
 drop database biblioteca;
 
 
 
 
 -- loja de roupas
 
 
 
 use sprint1;
 
 create table produto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(45),
    categoria varchar(45),
    tamanho char(3),
    preco DECIMAL(10, 2),
    disponivel char(1),
    dataCadastro datetime
 );
 
 INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, dataCadastro) VALUES
('Camiseta Básica Preta', 'Camiseta', 'M', 49.90, 1, '2026-09-01 10:15:00'),
('Calça Jeans Skinny', 'Calça', '40', 139.50, 1, '2026-09-02 14:30:00'),
('Jaqueta Corta Vento Impermeável', 'Jaqueta', 'G', 199.99, 0, '2026-09-03 09:45:00'),
('Moletom Canguru Flanelado', 'Moletom', 'GG', 159.90, 1, '2026-09-03 16:20:00'),
('Short Tactel de Praia', 'Short', 'P', 39.90, 1, '2026-09-04 11:10:00'),
('Blusa de Tricô Fina', 'Blusa', 'M', 89.00, 0, '2026-09-05 08:00:00');

 INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, dataCadastro) VALUES
('Camiseta Básica Azul', 'Camiseta', 'M', 49.90, 1, '2026-01-01 10:15:00'),
('Calça Cargo Skinny', 'Calça', '40', 139.50, 1, '2026-04-02 14:30:00'),
('Blusa de Tricô Grossa', 'Blusa', 'M', 89.00, 0, '2026-02-05 08:00:00');

select * from produto where nome like 'camiseta%';

select * from produto where tamanho != 'M';

select * from produto where dataCadastro > '2026-08-18';

select * from produto where disponivel = 1 and categoria in( 'Camiseta', 'Blusa');

select concat(nome, ' ', preco) as produto_preco from produto;

select * from produto where nome NOT LIKE '%Blusa%';

select *, 

case 
	when disponivel = 1 then 'Disponivel'
    else 'Indisponivel'
    end as StatusProd

 from produto;
 
 select * from produto where preco > 100 and nome LIKE '%Calça%' ;
 
 select * from produto where nome NOT LIKE '%Camiseta%';
 
 select * from produto where id IN(1,3,5);
 
 select * from produto where tamanho NOT IN ('P', 'M');
 
select * from produto where dataCadastro < '2025-08-18';

select nome, preco as produto_valor from produto;

select concat(nome, ' ', categoria, ' ', preco) as info_completa from produto;

select * from produto where disponivel = 1 and tamanho in('M');

select * from produto where nome LIKE 'C%';


update produto set preco = 270 where nome LIKE 'Jaqueta';

update produto set disponivel = '0' where nome like '%Blusa%';

update produto set tamanho = 'M' where nome LIKE '%Short%';

update produto set categoria = 'Camiseta' where nome like '%Camiseta%';

update produto set disponivel = '1' where dataCadastro > '2026-08-20';

update produto set nome = "Short Esportivo Unissex" where id = 4;

update produto set disponivel = '0' where nome in('BLusa','Moletom');

update produto set dataCadastro = '2026-09-06' where id > 0;

INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, dataCadastro) VALUES
('Camiseta Básica Preta', 'Camiseta', 'P', 39.90, 1, '2026-01-01 10:15:00'),
('Calça Cargo Skinny Rosa', 'Calça', '42', 119.50, 1, '2026-04-02 14:30:00'),
('Camiseta Básica Azul Marinho', 'Camiseta', 'P', 39.90, 1, '2026-01-01 10:15:00'),
('Calça Cargo Skinny Rosa Choque', 'Calça', '42', 119.50, 1, '2026-04-02 14:30:00'),
('Camiseta Básica Preta', 'Camiseta', 'P', 39.90, 1, '2026-01-01 10:15:00'),
('Calça Cargo Larga', 'Calça', '42', 119.50, 1, '2026-04-02 14:30:00'),
('Blusa de Tricô Extra Fina', 'Blusa', 'G', 129.00, 0, '2026-02-05 08:00:00');

select * from produto where disponivel = 0 and categoria in('Jaqueta');

select * from produto where tamanho in('GG','P') order by preco desc;

select nome, tamanho from produto where MONTH(dataCadastro) = 08 and YEAR(dataCadastro) = 2026;

select * from produto where nome like '%A';

select * from produto where categoria not in('Camiseta','Calça', 'Short');

select nome as 'Nome Produto', preco as 'Preço' from produto where preco > 50 and preco < 150;


select *, concat(nome, ' ', preco) as info from produto;

select *,

case
when disponivel = 0 then 'Em Falta'
end as StatusProd from produto where disponivel = 0;

select * from produto where nome like "% %";

select nome as nome_produto,
preco as preco_atual,
dataCadastro,
concat(nome, ' ', categoria, ' ', preco),
disponivel as status_disponibilidade

from produto where nome not like '%Blusa%' and tamanho in('M','G') and disponivel = 1 and dataCadastro > '2025-08-15';





-- TABELA JOGO


use sprint1;

create table jogo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeJogo varchar(60) NOT NULL,
    genero varchar(45) NOT NULL,
    preco DECIMAL(10, 2),
    plataforma varchar(10),
    dataLancamento date,
    dataCadastro datetime DEFAULT CURRENT_TIMESTAMP,
    modoOnline CHAR(1) NOT NULL,
    
    CONSTRAINT chModo CHECK (modoOnline IN ('S', 'N'))
);

-- jogo completo
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('The Witcher 3', 'RPG', 199.90, 'PC', '2015-05-19', 'S');

-- jogo gratuito
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('Club Penguin', 'MMO social', NULL, 'PC', '2005-10-24', 'S');

INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('Lego Batman: The Videogame','ação-aventura', 89.99, 'PS2', '2008-09-23', 'N');

-- jogo de 1999
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('Grand Theft Auto 2', 'ação-aventura', 50.00, 'PS1', '1999-10-22', 'N');

-- jogo para pc
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('League of Legennds', 'MOBA', NULL, 'PC', '2009-10-27', 'S');

-- jogos de mesmo nome
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('God of War', 'Hack And Slash', 50.00, 'PS2', '2005-03-22', 'N');
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('God of War', 'RPG', 130, 'PS5', '2018-04-20', 'N');

-- sem genero
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('Pac-Man Museum+', '', 74.50, 'PC', '2022-05-27', 'S');

-- jogos favoritos
INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES
('Hollow Knight', 'MetroidVania', 46.99, 'PC', '2017-02-24', 'N'),
('Hollow Knight SilkSong', 'MetroidVania', 60.00, 'PC', '2025-09-04', 'N'),
('Dark Souls II: Scholar of the First Sin', 'SoulsLike', 199.90, 'PC', '2015-04-01', 'S'),
('Dark Souls III', 'SoulsLike', 229.90, 'PC', '2016-04-12', 'S'),
('Terraria', 'Indie', 32.99, 'PC', '2011-05-16', 'S'),
('Cyberpunk 2077', 'RPG', 199.90, 'PC', '2020-12-09', 'N'),
('Cuphead', 'Plataforma Indie', 36.99, 'PC', '2017-09-29', 'N'),
('Resident Evil 4', 'Survival Horror', 169.00, 'PC', '2023-03-23', 'N'),
('Resident Evil 7', 'Survival Horror', 89.90, 'PC', '2017-01-24', 'N'),
('Dispatch', 'Indie', 90.00, 'PC', '2025-10-22', 'N'),
('Disco Elysium - The Final Cut', 'RPG', 39.99, 'PC', '2019-10-15', 'N'),
('The Last of Us Part I', 'Ação e Aventura', 249.90, 'PC', '2023-03-28', 'N'),
('Transformice', 'RPG', NULL, 'GBA', '2004-01-29', 'S');

select * from jogo;

select nomeJogo, preco from jogo;

select * from jogo where preco > 100;

select * from jogo where plataforma = 'PC';

select * from jogo order by preco;

select * from jogo order by preco desc;

select * from jogo where year(dataLancamento) > 2020; 

select nomeJogo, preco as 'Valor' from jogo;

select concat(nomeJogo, ' ', plataforma) from jogo;

select nomeJogo,

case
when preco IS NULL then 'Gratuito'
when preco = "" then 'Gratuito'
else preco
end as preco from jogo;

select nomeJogo,
case
when genero IS NULL then 'Não informado'
when genero = '' then 'Não informado'
else genero
end as genero
from jogo;

select nomeJogo, dataLancamento, dataCadastro, concat('R$ ', preco) from jogo;

select dataLancamento as 'Lançamento' from jogo;

select modoOnline as 'Modo Online' from jogo;

select concat(nomeJogo, ' - ', genero) as infos from jogo;

select 
case 
when preco is null then concat('O jogo ', nomeJogo, ' com a data de lançamento ', dataLancamento, ' está Gratis')
when preco is not null then concat('O jogo ', nomeJogo, ' com a data de lançamento ', dataLancamento, ' está custando R$ ', preco)
end as infos from jogo;

select nomeJogo, 

case 
when preco > 199 then 'Caro'
else 'Acessível' 
end as classificacao
from jogo;

select nomeJogo,

case
when modoOnline = 'N' then 'Offline'
else 'Possui'
end as 'Online?' from jogo;

select nomeJogo, preco, 
case 
when modoOnline = 'N' then 'Não tem Modo Online'
else 'Tem modo online'
end as Disponibilidade
 from jogo;
 
 select nomeJogo,
 
 case
 when YEAR(dataLancamento) = 2026 then 'Lançamento Recente'
else 'Lançamento Antigo'
end as 'Recente?'
from jogo;

select nomeJogo,

case
when preco IS NULL then 'Gratuito'
when preco = 0 then 'Gratuito'
else preco
end as preco from jogo;

select * from jogo order by plataforma;

select nomeJogo,

case
when preco >= 101 then 'Caro'
when preco <= 100 and preco >= 51 then 'Intermediário'
when preco <= 50 then 'Economico'
else 'Gratis'
end as Classificacao
from jogo;

 select nomeJogo,
 
 case
 when YEAR(dataLancamento) < 2015 then 'Clássicos/Antigos'
else 'Lançamento Recentes'
end as 'Recente?'
from jogo;

select * from jogo where modoOnline = 'S' and preco is not null;

select * from jogo where preco IS NULL or preco = '' order by nomeJogo;

select nomeJogo as nome,
plataforma,

case
when preco is null then 'Gratuito'
else preco
end as 'Valor:',

case
when preco >= 101 then 'Caro'
when preco <= 100 and preco >= 51 then 'Intermediário'
when preco <= 50 then 'Economico'
else 'Gratis'
end as Classificacao

from jogo;


delete from jogo where id = 1;

delete from jogo where preco is null;

delete from jogo where genero is null or genero = '';

delete from jogo where year(dataLancamento) <= 2010;

select * from jogo;

delete from jogo where id > 0;

INSERT INTO jogo (nomeJogo, genero, preco, plataforma, dataLancamento, modoOnline)
VALUES ('The Witcher 3', 'RPG', 199.90, 'PC', '2015-05-19', 'S');


alter table jogo add column classificacaoIndicativa varchar(45);

alter table jogo add column tamanhoJogo decimal(10,2);

alter table jogo add column desenvolvedora varchar(60);

alter table jogo add column modoHistoria varchar(45);

alter table jogo add constraint chModoH check(modoHistoria = 'S' or modoHistoria = 'N');

alter table jogo modify column nomeJogo varchar(70);

alter table jogo modify column plataforma varchar(45);

alter table jogo modify column preco decimal(12,2);

-- não é possível renomear ela pois existem constraints. Vou dropar o check e tentar novamente

alter table jogo drop constraint chModo;

alter table jogo rename column modoOnline to modoDoJogo;

alter table jogo drop column desenvolvedora;


alter table jogo drop column qtdVendas;

-- ao tentar excluir aparece o erro abaixo:
-- Error Code: 1091. Can't DROP 'qtdVendas'; check that column/key exists	0.000 sec

alter table jogo add unique(nomeJogo);