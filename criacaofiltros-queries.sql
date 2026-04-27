-- 1. Usuários após 01/03/2023
SELECT * FROM Usuario
WHERE data_cadastro > '2023-03-01';

-- 2. Jogos com preço > 100
SELECT * FROM Jogo
WHERE preco > 100;

-- 3. Desenvolvedoras após 2000
SELECT * FROM Desenvolvedora
WHERE ano_fundacao > 2000;

-- 4. Jogos da Valve
SELECT Jogo.titulo, Jogo.preco
FROM Jogo
JOIN Desenvolvedora
ON Jogo.id_desenvolvedora = Desenvolvedora.id
WHERE Desenvolvedora.nome = 'Valve Corporation';

-- 5. Preço médio
SELECT AVG(preco) AS preco_medio
FROM Jogo;

-- 6. Total gasto por Carlos Silva
SELECT SUM(Jogo.preco) AS preco_total
FROM Usuario
JOIN Biblioteca
ON Usuario.id = Biblioteca.id_usuario
JOIN Jogo
ON Biblioteca.id_jogo = Jogo.id
WHERE Usuario.nome = 'Carlos Silva';

-- 7. Jogo mais caro da Rockstar
SELECT Jogo.titulo, Jogo.preco
FROM Jogo
JOIN Desenvolvedora
ON Jogo.id_desenvolvedora = Desenvolvedora.id
WHERE Desenvolvedora.nome = 'Rockstar Games'
ORDER BY Jogo.preco DESC
LIMIT 1;

-- 8. Jogos RPG
SELECT Jogo.titulo
FROM Jogo
JOIN JogoCategoria
ON Jogo.id = JogoCategoria.id_jogo
JOIN Categoria
ON JogoCategoria.id_categoria = Categoria.id
WHERE Categoria.nome = 'RPG';

-- 9. Usuários e jogos
SELECT Usuario.nome, Jogo.titulo
FROM Usuario
JOIN Biblioteca
ON Usuario.id = Biblioteca.id_usuario
JOIN Jogo
ON Biblioteca.id_jogo = Jogo.id;

-- 10. Total de jogos dos EUA
SELECT COUNT(*) AS total_jogos
FROM Jogo
JOIN Desenvolvedora
ON Jogo.id_desenvolvedora = Desenvolvedora.id
WHERE Desenvolvedora.pais = 'EUA';