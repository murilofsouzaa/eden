-- Limpar todas as tabelas (com ordem de dependência)
TRUNCATE TABLE shopping_cart CASCADE;
TRUNCATE TABLE cart_item CASCADE;
TRUNCATE TABLE "order" CASCADE;
TRUNCATE TABLE order_item CASCADE;
TRUNCATE TABLE order_address CASCADE;
TRUNCATE TABLE product CASCADE;
TRUNCATE TABLE "user" CASCADE;

-- Resetar sequences
ALTER SEQUENCE user_id_seq RESTART WITH 1;
ALTER SEQUENCE product_id_seq RESTART WITH 1;
ALTER SEQUENCE shopping_cart_id_seq RESTART WITH 1;
ALTER SEQUENCE order_id_seq RESTART WITH 1;

-- Inserir Usuários
INSERT INTO "user" (username, email, password, gender, status, created_at, updated_at) VALUES
('joao_silva', 'joao@example.com', 'senha123', 'MALE', 'ACTIVE', NOW(), NOW()),
('maria_santos', 'maria@example.com', 'senha456', 'FEMALE', 'ACTIVE', NOW(), NOW()),
('pedro_oliveira', 'pedro@example.com', 'senha789', 'MALE', 'ACTIVE', NOW(), NOW()),
('ana_costa', 'ana@example.com', 'senha000', 'FEMALE', 'ACTIVE', NOW(), NOW()),
('carlos_mendes', 'carlos@example.com', 'senha111', 'MALE', 'ACTIVE', NOW(), NOW());

-- Inserir Produtos (Roupas com imagens e gender)
INSERT INTO product (title, description, price, img_URL, stock, category, gender, status, created_at, updated_at) VALUES
-- MASCULINE - SHIRTS (Camisas)
('Camisa Gymshark Branca', 'Camisa de treino premium branca', 89.90, '/clothes/modelo-camisa-gymsahrk-branca.jpeg', 50, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Gymshark Preta', 'Camisa de treino premium preta', 89.90, '/clothes/modelo-camisa-gymsahrk-preta.jpeg', 45, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Gymshark Verde', 'Camisa de treino premium verde', 89.90, '/clothes/modelo-camisa-gymsahrk-verde.jpeg', 40, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Branca', 'Camisa de compressão manga longa branca', 119.90, '/clothes/homem-camisa-de-compressao-longa-branca.jpeg', 30, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Preta', 'Camisa de compressão manga longa preta', 119.90, '/clothes/homem-camisa-de-compressao-longa-preta.jpeg', 30, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- MASCULINE - T_SHIRTS (Regatas/Camisetas)
('Regata Preta', 'Regata masculina confortável', 59.90, '/clothes/guy-black-regata.jpeg', 35, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Regata Branca', 'Regata masculina básica', 59.90, '/clothes/guy-white-regata.jpeg', 40, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- MASCULINE - PANTS (Calças/Shorts)
('Short Gymshark Verde', 'Short de treino verde premium', 79.90, '/clothes/modelo-short-gymshark-verde.jpeg', 25, 'PANTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- MASCULINE - SHOES (Sapatos)
('Tênis Esportivo Preto', 'Tênis de alta performance para treinos', 299.90, '/clothes/tenis-masculino-preto.jpeg', 20, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Tênis Running Branco', 'Tênis confortável para corrida', 279.90, '/clothes/tenis-masculino-branco.jpeg', 25, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- MASCULINE - CAPS (Bonés)
('Boné Preto Clássico', 'Boné ajustável estilo urbano', 49.90, '/clothes/bone-masculino-preto.jpeg', 60, 'CAPS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Boné Branco Premium', 'Boné premium com logo bordado', 54.90, '/clothes/bone-masculino-branco.jpeg', 55, 'CAPS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- FEMININE - SHIRTS (Camisas)
('Camisa Fitness Rosa', 'Camisa feminina de treino rosa', 79.90, '/clothes/mulher-camisa-fitness-rosa.jpeg', 35, 'SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Lilás', 'Camisa de compressão feminina lilás', 99.90, '/clothes/mulher-camisa-compressao-lilas.jpeg', 30, 'SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- FEMININE - T_SHIRTS (Regatas/Tops)
('Conjunto Top e Short Preto', 'Conjunto feminino preto para treino', 149.90, '/clothes/mulher-short-top-preto.jpeg', 20, 'T_SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Top e Short Verde', 'Conjunto feminino verde para treino', 149.90, '/clothes/mulher-short-top-verde.jpeg', 22, 'T_SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Top e Short Branco Azulado', 'Conjunto feminino branco azulado', 149.90, '/clothes/mulher-short-top-branco-azulado.jpeg', 25, 'T_SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Top e Short Azul Claro', 'Conjunto feminino azul claro', 149.90, '/clothes/asiatica-top-short-azul-claro.jpeg', 18, 'T_SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- FEMININE - PANTS (Calças/Shorts)
('Legging Fitness Preta', 'Legging de alta compressão preta', 89.90, '/clothes/mulher-legging-preta.jpeg', 40, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Short Ciclista Rosa', 'Short ciclista confortável rosa', 69.90, '/clothes/mulher-short-ciclista-rosa.jpeg', 35, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- FEMININE - SHOES (Sapatos)
('Tênis Fitness Rosa', 'Tênis feminino para academia rosa', 259.90, '/clothes/tenis-feminino-rosa.jpeg', 28, 'SHOES', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Tênis Running Branco Feminino', 'Tênis de corrida feminino branco', 269.90, '/clothes/tenis-feminino-branco.jpeg', 32, 'SHOES', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- FEMININE - CAPS (Bonés)
('Boné Feminino Branco', 'Boné ajustável feminino branco', 44.90, '/clothes/bone-feminino-branco.jpeg', 50, 'CAPS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Viseira Esportiva Rosa', 'Viseira feminina para corrida rosa', 39.90, '/clothes/viseira-feminina-rosa.jpeg', 45, 'CAPS', 'FEMININE', 'AVAILABLE', NOW(), NOW());

-- Inserir Carrinhos de Compras
INSERT INTO shopping_cart (user_id, created_at, updated_at) VALUES
(1, NOW(), NOW()),
(2, NOW(), NOW()),
(3, NOW(), NOW()),
(4, NOW(), NOW()),
(5, NOW(), NOW());

-- Inserir Itens nos Carrinhos
INSERT INTO cart_item (shopping_cart_id, product_id, quantity, created_at, updated_at) VALUES
(1, 1, 2, NOW(), NOW()),
(1, 4, 1, NOW(), NOW()),
(2, 8, 1, NOW(), NOW()),
(2, 6, 3, NOW(), NOW()),
(3, 13, 1, NOW(), NOW()),
(4, 14, 2, NOW(), NOW()),
(5, 19, 1, NOW(), NOW());

-- Inserir Endereços (associados aos pedidos)
-- Os endereços serão criados junto com os pedidos

-- Inserir Pedidos
INSERT INTO "order" (user_id, status, total_amount, created_at, updated_at) VALUES
(1, 'PENDING', 358.70, NOW(), NOW()),
(2, 'CONFIRMED', 239.60, NOW(), NOW()),
(3, 'DELIVERED', 79.90, NOW(), NOW()),
(4, 'PENDING', 159.80, NOW(), NOW()),
(5, 'CONFIRMED', 89.90, NOW(), NOW());

-- Inserir Itens dos Pedidos
INSERT INTO order_item (order_id, product_id, quantity, unit_price, created_at, updated_at) VALUES
(1, 1, 2, 89.90, NOW(), NOW()),
(1, 4, 1, 119.90, NOW(), NOW()),
(2, 8, 1, 79.90, NOW(), NOW()),
(2, 6, 3, 59.90, NOW(), NOW()),
(3, 13, 1, 79.90, NOW(), NOW()),
(4, 14, 2, 79.90, NOW(), NOW()),
(5, 19, 1, 89.90, NOW(), NOW());

-- Inserir Endereços dos Pedidos
INSERT INTO order_address (order_id, street, city, state, zip_code, country, number, complement, created_at, updated_at) VALUES
(1, 'Rua das Flores', 'São Paulo', 'SP', '01234-567', 'Brasil', '123', 'Apto 401', NOW(), NOW()),
(2, 'Avenida Principal', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil', '456', '', NOW(), NOW()),
(3, 'Rua Central', 'Belo Horizonte', 'MG', '30140-011', 'Brasil', '789', 'Casa 2', NOW(), NOW()),
(4, 'Alameda dos Anjos', 'Brasília', 'DF', '70000-000', 'Brasil', '321', '', NOW(), NOW()),
(5, 'Rua Comercial', 'Salvador', 'BA', '40000-000', 'Brasil', '654', 'Loja 5', NOW(), NOW());
