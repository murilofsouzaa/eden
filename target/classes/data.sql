-- Resetar sequences
ALTER SEQUENCE users_id_seq RESTART WITH 1;
ALTER SEQUENCE product_id_seq RESTART WITH 1;
ALTER SEQUENCE shopping_cart_id_seq RESTART WITH 1;
ALTER SEQUENCE orders_id_seq RESTART WITH 1;
ALTER SEQUENCE address_id_seq RESTART WITH 1;

-- ==================== INSERIR USUÁRIOS ====================
INSERT INTO users (username, email, password, gender, status, created_at, updated_at) VALUES
('joao_silva', 'joao@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MALE', 'ACTIVE', NOW(), NOW()),
('maria_santos', 'maria@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'FEMALE', 'ACTIVE', NOW(), NOW()),
('pedro_oliveira', 'pedro@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MALE', 'ACTIVE', NOW(), NOW()),
('ana_costa', 'ana@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'FEMALE', 'ACTIVE', NOW(), NOW()),
('carlos_mendes', 'carlos@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MALE', 'ACTIVE', NOW(), NOW()),
('lucia_ferreira', 'lucia@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'FEMALE', 'ACTIVE', NOW(), NOW()),
('roberto_lima', 'roberto@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'MALE', 'ACTIVE', NOW(), NOW());

-- ==================== INSERIR ENDEREÇOS ====================
INSERT INTO address (street, city, state, zip_code, country, number, complement, created_at, updated_at) VALUES
('Rua das Flores', 'São Paulo', 'SP', '01234-567', 'Brasil', '123', 'Apto 401', NOW(), NOW()),
('Avenida Principal', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil', '456', '', NOW(), NOW()),
('Rua Central', 'Belo Horizonte', 'MG', '30140-011', 'Brasil', '789', 'Casa 2', NOW(), NOW()),
('Alameda dos Anjos', 'Brasília', 'DF', '70000-000', 'Brasil', '321', '', NOW(), NOW()),
('Rua Comercial', 'Salvador', 'BA', '40000-000', 'Brasil', '654', 'Loja 5', NOW(), NOW()),
('Rua das Palmeiras', 'Curitiba', 'PR', '80000-000', 'Brasil', '111', 'Apto 202', NOW(), NOW()),
('Avenida Paulista', 'São Paulo', 'SP', '01310-100', 'Brasil', '1000', 'Conj 501', NOW(), NOW());

-- ==================== RELACIONAMENTO USUÁRIOS-ENDEREÇOS ====================
INSERT INTO users_address_list (user_id, address_list_id) VALUES
(1, 1),
(1, 7),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- ==================== INSERIR PRODUTOS ====================
INSERT INTO product (title, description, price, img_url, stock, category, gender, status, created_at, updated_at) VALUES
-- Produtos Femininos
('Legging Preta Gymshark', 'Legging fitness de alta qualidade, tecido respirável e confortável', 129.90, '/clothes/news/leggin-preta-gymshark.jpeg', 50, 'BOTTOM', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Legging Cinza Gymshark', 'Legging fitness cinza, perfeita para treinos intensos', 129.90, '/clothes/news/legging-cinza-gymshark.jpeg', 45, 'BOTTOM', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Legging Verde Gymshark', 'Legging fitness verde musgo, design moderno e confortável', 129.90, '/clothes/news/legging-verge-gymshark.jpeg', 40, 'BOTTOM', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Regata Preta Feminina Gymshark', 'Regata fitness preta, tecido leve e respirável', 79.90, '/clothes/news/regata-preta-feminia-gymshark.jpeg', 60, 'TOP', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Calça Oversized Feminina', 'Calça oversized feminina, estilo urbano e confortável', 159.90, '/clothes/news/calça-overzied-feminina.jpeg', 35, 'BOTTOM', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Calça Oversized Feminina Traseira', 'Calça oversized feminina com design único nas costas', 159.90, '/clothes/news/calça-oversized-feminia-tras.jpeg', 30, 'BOTTOM', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Calça Oversized Feminina Lado', 'Calça oversized feminina vista lateral, estilo moderno', 159.90, '/clothes/news/calça-overzied-feminina-lado.jpeg', 30, 'BOTTOM', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Tênis Feminino Academia', 'Tênis feminino para treinos, conforto e estabilidade', 249.90, '/clothes/news/feminine-gym-shoes.jpeg', 25, 'SHOES', 'FEMININE', 'ACTIVE', NOW(), NOW()),

-- Produtos Masculinos
('Camisa Compressão Cinza Preta Gymshark', 'Camisa de compressão para treinos intensos', 119.90, '/clothes/news/camisa-compressao-cinza-preta-gymshark.jpeg', 55, 'TOP', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Regata Masculina Branca', 'Regata básica branca, essencial para o guarda-roupa', 69.90, '/clothes/news/regata-masculina-branca.jpeg', 70, 'TOP', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Short Branco Gymshark', 'Short fitness branco, ideal para treinos e corridas', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'BOTTOM', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Bermuda Masculina Cinza', 'Bermuda casual cinza, conforto para o dia a dia', 99.90, '/clothes/news/bermuda-masculina-cinza.jpeg', 45, 'BOTTOM', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Calça Bege Masculina', 'Calça casual bege, versatilidade e estilo', 149.90, '/clothes/news/calca-bege-masculina.jpeg', 40, 'BOTTOM', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Tênis Masculino Branco', 'Tênis branco versátil, conforto e estilo', 279.90, '/clothes/news/tenis-masculino-branco.jpeg', 30, 'SHOES', 'MASCULINE', 'ACTIVE', NOW(), NOW());

-- ==================== INSERIR CARRINHOS DE COMPRAS ====================
INSERT INTO shopping_cart (user_id, created_at, updated_at) VALUES
(1, NOW(), NOW()),
(2, NOW(), NOW()),
(3, NOW(), NOW()),
(4, NOW(), NOW()),
(5, NOW(), NOW()),
(6, NOW(), NOW());

-- ==================== INSERIR ITENS NOS CARRINHOS ====================
INSERT INTO shopping_cart_item (shopping_cart_id, product_id, quantity, created_at, updated_at) VALUES
-- Carrinho do João (id=1) - Produtos masculinos
(1, 9, 2, NOW(), NOW()),  -- Camisa Compressão
(1, 11, 1, NOW(), NOW()), -- Short Branco
(1, 14, 1, NOW(), NOW()), -- Tênis Masculino

-- Carrinho da Maria (id=2) - Produtos femininos
(2, 1, 1, NOW(), NOW()),  -- Legging Preta
(2, 4, 2, NOW(), NOW()),  -- Regata Preta Feminina
(2, 8, 1, NOW(), NOW()),  -- Tênis Feminino

-- Carrinho do Pedro (id=3) - Produtos masculinos
(3, 10, 3, NOW(), NOW()), -- Regata Branca
(3, 12, 1, NOW(), NOW()), -- Bermuda Cinza

-- Carrinho da Ana (id=4) - Produtos femininos
(4, 2, 1, NOW(), NOW()),  -- Legging Cinza
(4, 3, 1, NOW(), NOW()),  -- Legging Verde
(4, 5, 1, NOW(), NOW()),  -- Calça Oversized

-- Carrinho do Carlos (id=5) - Produtos masculinos
(5, 13, 1, NOW(), NOW()), -- Calça Bege
(5, 9, 1, NOW(), NOW()),  -- Camisa Compressão

-- Carrinho da Lucia (id=6) - Produtos femininos
(6, 7, 1, NOW(), NOW()),  -- Calça Oversized Lado
(6, 4, 1, NOW(), NOW());  -- Regata Preta

-- ==================== INSERIR PEDIDOS ====================
INSERT INTO orders (user_id, status, total_amount, created_at, updated_at) VALUES
(1, 'DELIVERED', 489.70, NOW() - INTERVAL '10 days', NOW() - INTERVAL '5 days'),
(2, 'DELIVERED', 559.60, NOW() - INTERVAL '8 days', NOW() - INTERVAL '3 days'),
(3, 'SHIPPED', 309.60, NOW() - INTERVAL '5 days', NOW() - INTERVAL '2 days'),
(4, 'PENDING', 449.70, NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days'),
(5, 'CONFIRMED', 269.80, NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day'),
(7, 'DELIVERED', 399.60, NOW() - INTERVAL '15 days', NOW() - INTERVAL '8 days');

-- ==================== INSERIR ITENS DOS PEDIDOS ====================
INSERT INTO order_item (order_id, product_id, quantity, unit_price, created_at, updated_at) VALUES
-- Pedido 1 (João - DELIVERED)
(1, 9, 2, 119.90, NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),
(1, 11, 1, 89.90, NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),
(1, 14, 1, 279.90, NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),

-- Pedido 2 (Maria - DELIVERED)
(2, 1, 1, 129.90, NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days'),
(2, 4, 2, 79.90, NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days'),
(2, 8, 1, 249.90, NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days'),

-- Pedido 3 (Pedro - SHIPPED)
(3, 10, 3, 69.90, NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days'),
(3, 12, 1, 99.90, NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days'),

-- Pedido 4 (Ana - PENDING)
(4, 2, 1, 129.90, NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days'),
(4, 3, 1, 129.90, NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days'),
(4, 5, 1, 159.90, NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days'),

-- Pedido 5 (Carlos - CONFIRMED)
(5, 13, 1, 149.90, NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day'),
(5, 9, 1, 119.90, NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day'),

-- Pedido 6 (Roberto - DELIVERED)
(6, 11, 2, 89.90, NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days'),
(6, 10, 2, 69.90, NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days'),
(6, 14, 1, 279.90, NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days');

-- ==================== INSERIR ENDEREÇOS DOS PEDIDOS ====================
INSERT INTO order_address (order_id, street, city, state, zip_code, country, number, complement, created_at, updated_at) VALUES
(1, 'Rua das Flores', 'São Paulo', 'SP', '01234-567', 'Brasil', '123', 'Apto 401', NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),
(2, 'Avenida Principal', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil', '456', '', NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days'),
(3, 'Rua Central', 'Belo Horizonte', 'MG', '30140-011', 'Brasil', '789', 'Casa 2', NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days'),
(4, 'Alameda dos Anjos', 'Brasília', 'DF', '70000-000', 'Brasil', '321', '', NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days'),
(5, 'Rua Comercial', 'Salvador', 'BA', '40000-000', 'Brasil', '654', 'Loja 5', NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day'),
(6, 'Avenida Paulista', 'São Paulo', 'SP', '01310-100', 'Brasil', '1000', 'Conj 501', NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days');
