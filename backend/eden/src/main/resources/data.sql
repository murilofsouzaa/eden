-- Limpar todas as tabelas primeiro
TRUNCATE TABLE shopping_cart_item, shopping_cart, order_item, orders, order_address, product, users CASCADE;

-- Remover check constraint se existir
ALTER TABLE product DROP CONSTRAINT IF EXISTS product_category_check;

-- Adicionar novo constraint com todas as categorias
ALTER TABLE product ADD CONSTRAINT product_category_check 
  CHECK (category IN ('SHIRTS', 'T_SHIRTS', 'REGATTA', 'PANTS', 'LEGGING', 'SHORTS', 'SET', 'SHOES', 'CAPS', 'SWEATSHIRTS'));

-- Resetar sequences
ALTER SEQUENCE users_id_seq RESTART WITH 1;
ALTER SEQUENCE product_id_seq RESTART WITH 1;
ALTER SEQUENCE shopping_cart_id_seq RESTART WITH 1;
ALTER SEQUENCE orders_id_seq RESTART WITH 1;
ALTER SEQUENCE order_address_id_seq RESTART WITH 1;

-- ==================== INSERIR USUÁRIOS ====================
INSERT INTO users (name, email, password, birth_day, gender, role, status, created_at) VALUES
('João Silva', 'joao@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1995-03-15', 'MALE', 'USER', 'ACTIVE', NOW()),
('Maria Santos', 'maria@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1998-07-22', 'FEMALE', 'USER', 'ACTIVE', NOW()),
('Pedro Oliveira', 'pedro@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1992-11-08', 'MALE', 'USER', 'ACTIVE', NOW()),
('Ana Costa', 'ana@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1996-05-30', 'FEMALE', 'USER', 'ACTIVE', NOW()),
('Carlos Mendes', 'carlos@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1990-09-12', 'MALE', 'USER', 'ACTIVE', NOW()),
('Lúcia Ferreira', 'lucia@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1994-01-25', 'FEMALE', 'USER', 'ACTIVE', NOW()),
('Roberto Lima', 'roberto@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1988-12-03', 'MALE', 'USER', 'ACTIVE', NOW());

-- ==================== INSERIR PRODUTOS ====================
INSERT INTO product (title, description, price, img_url, stock, category, gender, status, created_at, updated_at) VALUES
-- Produtos Femininos - LEGGING
('Legging Preta Gymshark', 'Legging fitness de alta qualidade, tecido respirável e confortável', 129.90, '/clothes/news/leggin-preta-gymshark.jpeg', 50, 'LEGGING', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Legging Cinza Gymshark', 'Legging fitness cinza, perfeita para treinos intensos', 129.90, '/clothes/news/legging-cinza-gymshark.jpeg', 45, 'LEGGING', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Legging Verde Gymshark', 'Legging fitness verde musgo, design moderno e confortável', 129.90, '/clothes/news/legging-verge-gymshark.jpeg', 40, 'LEGGING', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - SHIRTS
('Blusa Preta Feminina Gym', 'Blusa preta feminina para treinos, alta performance', 89.90, '/clothes/news2/blusa-preta-feminina-gym.jpeg', 45, 'SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - REGATA
('Regata Preta Feminina Gymshark', 'Regata fitness preta, tecido leve e respirável', 79.90, '/clothes/news/regata-preta-feminia-gymshark.jpeg', 60, 'REGATTA', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Regata Branca Feminina', 'Regata básica branca feminina, essencial e versátil', 69.90, '/clothes/news/regata-preta-feminia-gymshark.jpeg', 55, 'REGATTA', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - PANTS
('Calça Oversized Feminina', 'Calça oversized feminina, estilo urbano e confortável', 159.90, '/clothes/news/calça-overzied-feminina.jpeg', 35, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Calça Oversized Feminina Traseira', 'Calça oversized feminina com design único nas costas', 159.90, '/clothes/news/calça-oversized-feminia-tras.jpeg', 30, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Calça Oversized Feminina Lado', 'Calça oversized feminina vista lateral, estilo moderno', 159.90, '/clothes/news/calça-overzied-feminina-lado.jpeg', 30, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - SHOES
('Tênis Feminino Academia', 'Tênis feminino para treinos, conforto e estabilidade', 249.90, '/clothes/news/feminine-gym-shoes.jpeg', 25, 'SHOES', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - SWEATSHIRTS
('Moletom Vermelho Feminino', 'Moletom feminino vermelho, alta performance', 199.90, '/clothes/news2/moletom-vermelho-femininio.jpeg', 35, 'SWEATSHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - CAPS
('Boné Bege Feminino Gym', 'Boné feminino bege gym, estilo casual e moderno', 59.90, '/clothes/bone-feminino-gym-bege.jpeg', 35, 'CAPS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - SET (Top + Short)
('Conjunto Feminino Preto Fitness', 'Conjunto top e short preto, perfeito para academia', 149.90, '/clothes/mulher-short-top-preto.jpeg', 30, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Feminino Verde Treino', 'Conjunto top e short verde, versátil e confortável', 149.90, '/clothes/mulher-short-top-verde.jpeg', 28, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Feminino Branco Azulado', 'Conjunto top e short branco azulado, estilo moderno', 159.90, '/clothes/mulher-short-top-branco-azulado.jpeg', 25, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Feminino Azul Claro', 'Conjunto top e short azul claro, conforto e estilo', 149.90, '/clothes/asiatica-top-short-azul-claro.jpeg', 30, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHIRTS
('Camisa Compressão Longa Preta', 'Camisa de compressão para treinos intensos', 119.90, '/clothes/homem-camisa-de-compressao-longa-preta.jpeg', 55, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Social Azul Marinho', 'Camisa social azul marinho, elegância e conforto', 139.90, '/clothes/news/camisa-social-azul.jpeg', 30, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Longa Branca', 'Camisa de compressão longa branca, alta performance', 129.90, '/clothes/homem-camisa-de-compressao-longa-branca.jpeg', 40, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Longa Preta Alternativa', 'Camisa de compressão longa preta, conforto e estilo', 129.90, '/clothes/news/camisa-compressao-cinza-preta-gymshark.jpeg', 40, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Gymshark Preta Modelo', 'Camisa Gymshark preta, design moderno', 99.90, '/clothes/modelo-camisa-gymsahrk-preta.jpeg', 50, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Gymshark Verde', 'Camisa Gymshark verde, estilo único', 99.90, '/clothes/modelo-camisa-gymsahrk-verde.jpeg', 50, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - REGATA
('Regata Masculina Branca', 'Regata básica branca, essencial para o guarda-roupa', 69.90, '/clothes/news/regata-masculina-branca.jpeg', 70, 'REGATTA', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Regata Preta Guy', 'Regata preta masculina, versátil e confortável', 69.90, '/clothes/guy-black-regata.jpeg', 65, 'REGATTA', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Regata Branca Guy', 'Regata branca masculina, estilo casual', 69.90, '/clothes/guy-white-regata.jpeg', 65, 'REGATTA', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - PANTS
('Calça Bege Masculina', 'Calça casual bege, versatilidade e estilo', 149.90, '/clothes/news/calca-bege-masculina.jpeg', 40, 'PANTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHORTS
('Short Branco Gymshark', 'Short fitness branco, ideal para treinos e corridas', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Bermuda Masculina Cinza', 'Bermuda casual cinza, conforto para o dia a dia', 99.90, '/clothes/news/bermuda-masculina-cinza.jpeg', 45, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Short Branco Gymshark Alternativo', 'Short branco alta performance', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHOES
('Tênis Masculino Branco', 'Tênis branco versátil, conforto e estilo', 279.90, '/clothes/news/tenis-masculino-branco.jpeg', 30, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Tênis Esportivo Preto', 'Tênis esportivo preto, performance e design', 259.90, '/clothes/news/tenis-esportivo-preto.jpeg', 28, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SWEATSHIRTS
('Moletom Preto Masculino', 'Moletom masculino preto, conforto e estilo', 199.90, '/clothes/news2/sweartshirt-masculine-black.jpeg', 35, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - CAPS
('Boné Preto Masculino', 'Boné masculino preto, clássico e versátil', 59.90, '/clothes/bone-masculino-preto.jpeg', 50, 'CAPS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SET (Top + Short)
('Conjunto Masculino Azul', 'Conjunto top compressão e short azul, treino intenso', 169.90, '/clothes/news2/conjunto-azul-masculino.jpeg', 25, 'SET', 'MASCULINE', 'AVAILABLE', NOW(), NOW());

-- ==================== INSERIR CARRINHOS DE COMPRAS ====================
INSERT INTO shopping_cart (user_id, status, created_at) VALUES
(1, true, NOW()),
(2, true, NOW()),
(3, true, NOW()),
(4, true, NOW()),
(5, true, NOW()),
(6, true, NOW());

-- ==================== INSERIR ITENS NOS CARRINHOS ====================
INSERT INTO shopping_cart_item (cart_id, product_id, quantity, unit_price) VALUES
-- Carrinho do João (id=1) - Produtos masculinos
(1, 18, 2, 119.90),  -- Camisa Compressão Cinza Preta
(1, 29, 1, 89.90),   -- Short Branco Gymshark
(1, 32, 1, 279.90),  -- Tênis Masculino Branco

-- Carrinho da Maria (id=2) - Produtos femininos
(2, 1, 1, 129.90),   -- Legging Preta
(2, 4, 2, 79.90),    -- Regata Preta Feminina
(2, 9, 1, 249.90),   -- Tênis Feminino Academia

-- Carrinho do Pedro (id=3) - Produtos masculinos
(3, 25, 3, 69.90),   -- Regata Masculina Branca
(3, 30, 1, 99.90),   -- Bermuda Masculina Cinza

-- Carrinho da Ana (id=4) - Produtos femininos
(4, 2, 1, 129.90),   -- Legging Cinza
(4, 3, 1, 129.90),   -- Legging Verde
(4, 6, 1, 159.90),   -- Calça Oversized Feminina

-- Carrinho do Carlos (id=5) - Produtos masculinos
(5, 28, 1, 149.90),  -- Calça Bege Masculina
(5, 18, 1, 119.90),  -- Camisa Compressão

-- Carrinho da Lucia (id=6) - Produtos femininos
(6, 8, 1, 159.90),   -- Calça Oversized Lado
(6, 4, 1, 79.90);    -- Regata Preta Feminina

-- ==================== INSERIR ENDEREÇOS DE ENTREGA ====================
INSERT INTO order_address (user_id, street, number, neighborhood, city, state, country, zip_code) VALUES
(1, 'Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', 'Brasil', '01310-100'),
(2, 'Avenida Paulista', 1500, 'Bela Vista', 'São Paulo', 'SP', 'Brasil', '01310-200'),
(3, 'Rua Augusta', 789, 'Consolação', 'São Paulo', 'SP', 'Brasil', '01305-100'),
(4, 'Rua Oscar Freire', 456, 'Jardins', 'São Paulo', 'SP', 'Brasil', '01426-001'),
(5, 'Avenida Rebouças', 2020, 'Pinheiros', 'São Paulo', 'SP', 'Brasil', '05402-100'),
(6, 'Rua Haddock Lobo', 595, 'Cerqueira César', 'São Paulo', 'SP', 'Brasil', '01414-001'),
(7, 'Rua da Consolação', 3000, 'Consolação', 'São Paulo', 'SP', 'Brasil', '01416-000');

-- ==================== INSERIR PEDIDOS ====================
INSERT INTO orders (user_id, created_at, status, order_address_id, shopping_cart_id) VALUES
(1, '2025-12-01 10:30:00', 'DELIVERED', 1, 1),
(2, '2025-12-05 14:20:00', 'DELIVERED', 2, 2),
(3, '2025-12-10 09:15:00', 'DELIVERED', 3, 3),
(4, '2025-12-15 16:45:00', 'DELIVERED', 4, 4),
(5, '2025-12-20 11:00:00', 'DELIVERED', 5, 5),
(6, '2026-01-02 13:30:00', 'SHIPPED', 6, 6),
(7, '2026-01-05 10:00:00', 'SHIPPED', 7, NULL);

-- ==================== INSERIR ITENS DOS PEDIDOS ====================
INSERT INTO order_item (order_id, product_id, quantity, unit_price) VALUES
-- Pedido 1 - João
(1, 18, 25, 119.90),  -- Camisa Compressão Cinza Preta - BEST SELLER MASCULINO
(1, 29, 18, 89.90),   -- Short Branco Gymshark - BEST SELLER MASCULINO
(1, 22, 15, 99.90),   -- Camisa Gymshark Branca

-- Pedido 2 - Maria
(2, 1, 12, 129.90),   -- Legging Preta Gymshark
(2, 4, 8, 79.90),     -- Regata Preta Feminina
(2, 9, 5, 249.90),    -- Tênis Feminino Academia

-- Pedido 3 - Pedro
(3, 18, 22, 119.90),  -- Camisa Compressão - BEST SELLER MASCULINO
(3, 25, 20, 69.90),   -- Regata Masculina Branca - BEST SELLER MASCULINO
(3, 31, 16, 259.90),  -- Tênis Esportivo Preto

-- Pedido 4 - Ana
(4, 25, 19, 69.90),   -- Regata Masculina Branca - BEST SELLER MASCULINO
(4, 29, 17, 89.90),   -- Short Branco Gymshark - BEST SELLER MASCULINO
(4, 22, 14, 99.90),   -- Camisa Gymshark Branca

-- Pedido 5 - Carlos
(5, 18, 20, 119.90),  -- Camisa Compressão - BEST SELLER MASCULINO
(5, 31, 18, 259.90),  -- Tênis Esportivo Preto - BEST SELLER MASCULINO
(5, 28, 12, 149.90),  -- Calça Bege Masculina

-- Pedido 6 - Lucia
(6, 31, 15, 259.90),  -- Tênis Esportivo Preto - BEST SELLER MASCULINO
(6, 22, 19, 99.90),   -- Camisa Gymshark Branca - BEST SELLER MASCULINO
(6, 1, 9, 129.90),    -- Legging Preta

-- Pedido 7 - Roberto (novo)
(7, 29, 21, 89.90),   -- Short Branco Gymshark - BEST SELLER MASCULINO
(7, 18, 16, 119.90),  -- Camisa Compressão - BEST SELLER MASCULINO
(7, 25, 18, 69.90);   -- Regata Masculina Branca - BEST SELLER MASCULINO
