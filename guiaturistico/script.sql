/* DDL - Comandos para criar e estruturar as tabelas */

/* DROPS - Remove tabelas existentes para evitar conflitos */

-- Remover a tabela de relacionamentos
DROP TABLE IF EXISTS itinerary_place; 

-- Remover a tabela de lugares
DROP TABLE IF EXISTS place; 

-- Remover a tabela de itinerários
DROP TABLE IF EXISTS itinerary;

/* DDL */

/* Tabela PLACE - Armazena informações sobre os lugares turísticos */
-- Tabela PLACE
CREATE TABLE place (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Chave primária
    cidade NVARCHAR(255) NOT NULL, -- Nome da cidade onde o lugar está localizado
    descricao NVARCHAR(255) NOT NULL, -- Descrição do lugar
    entrada NVARCHAR(10) CHECK (entrada IN ('PAGO', 'GRATUITO')), -- Tipo de entrada
    estado NVARCHAR(255) NOT NULL, -- Estado onde o lugar está localizado
    nome NVARCHAR(255) NOT NULL, -- Nome do lugar
    rua NVARCHAR(255) NOT NULL, -- Nome da rua onde o lugar está localizado
    tipo NVARCHAR(20) CHECK (tipo IN ('MUSEU', 'MONUMENTO', 'TEATRO', 'ESTATUA', 'PARQUE', 'OUTRO')), -- Tipo do lugar
    url_imagem NVARCHAR(255) -- URL da imagem do lugar
);

-- Tabela ITINERARY
CREATE TABLE itinerary (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Chave primária
    data_criacao DATE, -- Data de criação do itinerário
    nome NVARCHAR(255) NOT NULL, -- Nome do itinerário
    pais NVARCHAR(255) CHECK (pais IN ('BRASIL', 'ARGENTINA', 'EUA', 'CANADA', 'FRANCA', 'ALEMANHA', 'ITALIA', 'ESPANHA', 'PORTUGAL', 'AUSTRALIA', 'JAPAO', 'CHINA', 'INDIA', 'MEXICO', 'AFRICA_DO_SUL', 'REINO_UNIDO')) -- País do itinerário
);

-- Tabela ITINERARY_PLACE
CREATE TABLE itinerary_place (
    itinerary_id INT NOT NULL, -- ID do itinerário
    place_id INT NOT NULL, -- ID do lugar
    PRIMARY KEY (itinerary_id, place_id), -- Chave primária composta
    CONSTRAINT FK_itinerary FOREIGN KEY (itinerary_id) REFERENCES itinerary(id), -- Chave estrangeira referenciando itinerary
    CONSTRAINT FK_place FOREIGN KEY (place_id) REFERENCES place(id) -- Chave estrangeira referenciando place
);

-- INSERÇÕES DE DADOS

-- Inserir dados na tabela PLACE
INSERT INTO place (nome, descricao, cidade, estado, rua, tipo, entrada, url_imagem) VALUES 
('Cristo Redentor', 'Estátua icônica no Rio de Janeiro', 'Rio de Janeiro', 'RJ', 'Rua Cosme Velho', 'ESTATUA', 'PAGO', 'https://abrir.link/ZLXgi'),
('Museu do Ipiranga', 'Museu histórico localizado em São Paulo', 'São Paulo', 'SP', 'Parque da Independência', 'MUSEU', 'PAGO', 'https://abrir.link/rztKU'),
('Torre Eiffel', 'Famoso marco em Paris', 'Paris', 'Ile-de-France', 'Champ de Mars', 'MONUMENTO', 'PAGO', 'https://abrir.link/NdfEB'),
('Museu do Louvre', 'Museu de arte famoso em Paris', 'Paris', 'Ile-de-France', 'Rue de Rivoli', 'MUSEU', 'PAGO', 'https://abrir.link/fYLhP');

-- Inserir dados na tabela ITINERARY
INSERT INTO itinerary (nome, pais, data_criacao) VALUES 
('Exploração do Brasil', 'BRASIL', '2024-10-24'),
('Tour pela Europa', 'FRANCA', '2024-10-24');

-- Inserir dados na tabela ITINERARY_PLACE (relacionando itinerários e lugares)
INSERT INTO itinerary_place (itinerary_id, place_id) VALUES 
(1, 1), -- Relaciona o primeiro itinerário ao Cristo Redentor
(1, 2), -- Relaciona o primeiro itinerário ao Museu do Ipiranga
(2, 3), -- Relaciona o segundo itinerário à Torre Eiffel
(2, 4); -- Relaciona o segundo itinerário ao Museu do Louvre

/* Selecionar todos os registros das tabelas */

/* Selecionar todos os lugares cadastrados */
SELECT * FROM place;

/* Selecionar todos os itinerários cadastrados */
SELECT * FROM itinerary;

/* Selecionar todos os relacionamentos entre itinerários e lugares */
SELECT * FROM itinerary_place;
