-- ======================================================
-- 1. CRIAÇÃO DO BANCO DE DADOS (Diagrama ER)
-- ======================================================
CREATE DATABASE IF NOT EXISTS temporadakart2024;
USE temporadakart2024;

CREATE TABLE equipe (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nome_equipe VARCHAR(100)
);

CREATE TABLE patrocinio (
    id_patrocinio INT AUTO_INCREMENT PRIMARY KEY,
    nome_patrocinio VARCHAR(100)
);

CREATE TABLE equipe_patrocinio (
    id_equipe INT,
    id_patrocinio INT,
    PRIMARY KEY (id_equipe, id_patrocinio),
    FOREIGN KEY (id_equipe) REFERENCES equipe(id_equipe),
    FOREIGN KEY (id_patrocinio) REFERENCES patrocinio(id_patrocinio)
);

CREATE TABLE piloto (
    id_piloto INT AUTO_INCREMENT PRIMARY KEY,
    nome_piloto VARCHAR(100),
    peso DECIMAL(5,2),
    nacionalidade VARCHAR(50),
    id_equipe INT,
    FOREIGN KEY (id_equipe) REFERENCES equipe(id_equipe)
);

CREATE TABLE temporada (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    numero_temporada INT
);

CREATE TABLE etapas (
    id_etapa INT AUTO_INCREMENT PRIMARY KEY,
    numero_etapa INT,
    cidade_etapa VARCHAR(100),
    data_etapa DATE,
    id_temporada INT,
    FOREIGN KEY (id_temporada) REFERENCES temporada(id_temporada)
);

-- ======================================================
-- 2. INSERÇÃO DE DADOS (Conforme GUIA DA TEMPORADA)
-- ======================================================

-- Inserindo Temporada
INSERT INTO temporada (numero_temporada) VALUES (1);

-- Inserindo Equipes
INSERT INTO equipe (nome_equipe) VALUES 
('Escuderia Veloz'),
('Rápidos & Furiosos'),
('Fênix Racing'),
('Equipe Tempestade'),
('Corredores de Aço');

-- Inserindo Patrocinadores
INSERT INTO patrocinio (nome_patrocinio) VALUES 
('MotorTech Brasil'),
('Velocidade Extrema'),
('Alta Performance'),
('Turbo Racing'),
('Pneus ProDrive');

-- Criando Vínculos Equipe/Patrocinador
INSERT INTO equipe_patrocinio (id_equipe, id_patrocinio) VALUES 
(1,1), (2,2), (3,3), (4,4), (5,5);

-- Inserindo Pilotos
INSERT INTO piloto (nome_piloto, peso, nacionalidade, id_equipe) VALUES 
('Lucas Andrade', 70.5, 'Brasil', 1),
('Renato Figueiredo', 75, 'Brasil', 1),
('Mateus Silva', 68, 'Brasil', 2),
('Bruno Almeida', 78.3, 'Brasil', 2),
('Carla Pereira', 60, 'Portugal', 3),
('Gabriela Torres', 58.5, 'Brasil', 3),
('João Costa', 80.5, 'Brasil', 4),
('Thiago Santos', 72.5, 'Brasil', 4),
('Mariana Gomes', 62, 'Portugal', 5),
('Beatriz Lopes', 63.2, 'Portugal', 5);

-- Inserindo Etapas (Com as cidades originais do PDF)
INSERT INTO etapas (numero_etapa, cidade_etapa, data_etapa, id_temporada) VALUES
(1, 'São Paulo', '2024-01-15', 1),
(2, 'Rio de Janeiro', '2024-02-20', 1),
(3, 'Campo Grande', '2024-03-18', 1),
(4, 'Londrina', '2024-04-22', 1),
(5, 'Porto Alegre', '2024-05-10', 1);

-- ======================================================
-- 3. MANIPULAÇÕES (Exigências da Atividade)
-- ======================================================

-- Desativar modo seguro para permitir Updates e Deletes
SET SQL_SAFE_UPDATES = 0;

-- Atualização das cidades Campo Grande -> Salvador e Londrina -> Goiânia
UPDATE etapas 
SET cidade_etapa = 'Salvador' 
WHERE cidade_etapa = 'Campo Grande';

UPDATE etapas 
SET cidade_etapa = 'Goiânia' 
WHERE cidade_etapa = 'Londrina';

-- Exclusão do Patrocinador da equipe 'Corredores de Aço'
-- Primeiro removemos a relação para não dar erro de Foreign Key
DELETE FROM equipe_patrocinio 
WHERE id_equipe = (SELECT id_equipe FROM equipe WHERE nome_equipe = 'Corredores de Aço');

-- Depois removemos o patrocinador 'Pneus ProDrive'
DELETE FROM patrocinio 
WHERE nome_patrocinio = 'Pneus ProDrive';

-- ======================================================
-- 4. EXIBIÇÃO DOS DADOS DOS PILOTOS
-- ======================================================
SELECT 
    p.nome_piloto AS 'Piloto', 
    p.peso AS 'Peso (kg)', 
    p.nacionalidade AS 'País', 
    e.nome_equipe AS 'Equipe'
FROM piloto p
INNER JOIN equipe e ON p.id_equipe = e.id_equipe;