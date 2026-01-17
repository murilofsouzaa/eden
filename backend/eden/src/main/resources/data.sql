TRUNCATE TABLE shopping_cart_item, shopping_cart, order_item, orders, order_address, product, users CASCADE;

-- ==================== INSERIR USUÁRIOS ====================
INSERT INTO users (id, name, birth_day, gender, email, password, role, status, created_at) VALUES
  (1, 'João', '1990-01-01', 'MALE', 'joao@email.com', 'senha123', 'USER', 'ACTIVE', NOW()),
  (2, 'Maria', '1992-02-02', 'FEMALE', 'maria@email.com', 'senha123', 'USER', 'ACTIVE', NOW()),
  (3, 'Pedro', '1988-03-03', 'MALE', 'pedro@email.com', 'senha123', 'USER', 'ACTIVE', NOW()),
  (4, 'Ana', '1995-04-04', 'FEMALE', 'ana@email.com', 'senha123', 'USER', 'ACTIVE', NOW()),
  (5, 'Carlos', '1985-05-05', 'MALE', 'carlos@email.com', 'senha123', 'USER', 'ACTIVE', NOW()),
  (6, 'Lucia', '1993-06-06', 'FEMALE', 'lucia@email.com', 'senha123', 'USER', 'ACTIVE', NOW()),
  (7, 'Roberto', '1987-07-07', 'MALE', 'roberto@email.com', 'senha123', 'USER', 'ACTIVE', NOW());

-- ==================== INSERIR ENDEREÇOS ====================
INSERT INTO address (user_id, street, number, neighborhood, city, state, country, zip_code) VALUES
(1, 'Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', 'Brasil', '01310-100'),
(2, 'Avenida Paulista', 1500, 'Bela Vista', 'São Paulo', 'SP', 'Brasil', '01310-200'),
(3, 'Rua Augusta', 789, 'Consolação', 'São Paulo', 'SP', 'Brasil', '01305-100'),
(4, 'Rua Oscar Freire', 456, 'Jardins', 'São Paulo', 'SP', 'Brasil', '01426-001'),
(5, 'Avenida Rebouças', 2020, 'Pinheiros', 'São Paulo', 'SP', 'Brasil', '05402-100'),
(6, 'Rua Haddock Lobo', 595, 'Cerqueira César', 'São Paulo', 'SP', 'Brasil', '01414-001'),
(7, 'Rua da Consolação', 3000, 'Consolação', 'São Paulo', 'SP', 'Brasil', '01416-000');

INSERT INTO shopping_cart (id, user_id, status, created_at) VALUES
(1, 1, true, NOW()),
(2, 2, true, NOW()),
(3, 3, true, NOW()),
(4, 4, true, NOW()),
(5, 5, true, NOW()),
(6, 6, true, NOW()),
(7, 7, true, NOW());

-- ==================== INSERIR PRODUTOS ====================
ALTER TABLE product DROP CONSTRAINT IF EXISTS product_category_check;

ALTER TABLE product ADD CONSTRAINT product_category_check 
  CHECK (category IN ('SHIRTS', 'T_SHIRTS', 'REGATTA', 'PANTS', 'LEGGING', 'SHORTS', 'SET', 'SHOES', 'CAPS', 'SWEATSHIRTS'));

INSERT INTO product (id, title, description, price, img_URL, stock, category, gender, status, created_at, updated_at) VALUES
(1, 'Legging Preta Gymshark', 'Legging fitness de alta qualidade, tecido respirável e confortável', 129.90, '/clothes/news/leggin-preta-gymshark.jpeg', 50, 'LEGGING', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(2, 'Legging Cinza Gymshark', 'Legging fitness cinza, perfeita para treinos intensos', 129.90, '/clothes/news/legging-cinza-gymshark.jpeg', 45, 'LEGGING', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(3, 'Legging Verde Gymshark', 'Legging fitness verde musgo, design moderno e confortável', 129.90, '/clothes/news/legging-verge-gymshark.jpeg', 40, 'LEGGING', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(4, 'Blusa Preta Feminina Gym', 'Blusa preta feminina para treinos, alta performance', 89.90, '/clothes/news2/blusa-preta-feminina-gym.jpeg', 45, 'SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(5, 'Regata Preta Feminina Gymshark', 'Regata fitness preta, tecido leve e respirável', 79.90, '/clothes/news/regata-preta-feminia-gymshark.jpeg', 60, 'REGATTA', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(6, 'Regata Branca Feminina', 'Regata básica branca feminina, essencial e versátil', 69.90, '/clothes/news/regata-preta-feminia-gymshark.jpeg', 55, 'REGATTA', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(7, 'Calça Oversized Feminina', 'Calça oversized feminina, estilo urbano e confortável', 159.90, '/clothes/news/calça-overzied-feminina.jpeg', 35, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(8, 'Calça Oversized Feminina Traseira', 'Calça oversized feminina com design único nas costas', 159.90, '/clothes/news/calça-oversized-feminia-tras.jpeg', 30, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(9, 'Calça Oversized Feminina Lado', 'Calça oversized feminina vista lateral, estilo moderno', 159.90, '/clothes/news/calça-overzied-feminina-lado.jpeg', 30, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(10, 'Tênis Feminino Academia', 'Tênis feminino para treinos, conforto e estabilidade', 249.90, '/clothes/news/feminine-gym-shoes.jpeg', 25, 'SHOES', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(11, 'Moletom Vermelho Feminino', 'Moletom feminino vermelho, alta performance', 199.90, '/clothes/news2/moletom-vermelho-femininio.jpeg', 35, 'SWEATSHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(12, 'Boné Bege Feminino Gym', 'Boné feminino bege gym, estilo casual e moderno', 59.90, '/clothes/bone-feminino-gym-bege.jpeg', 35, 'CAPS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(13, 'Conjunto Feminino Preto Fitness', 'Conjunto top e short preto, perfeito para academia', 149.90, '/clothes/mulher-short-top-preto.jpeg', 30, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(14, 'Conjunto Feminino Verde Treino', 'Conjunto top e short verde, versátil e confortável', 149.90, '/clothes/mulher-short-top-verde.jpeg', 28, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(15, 'Conjunto Feminino Branco Azulado', 'Conjunto top e short branco azulado, estilo moderno', 159.90, '/clothes/mulher-short-top-branco-azulado.jpeg', 25, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(16, 'Conjunto Feminino Azul Claro', 'Conjunto top e short azul claro, conforto e estilo', 149.90, '/clothes/asiatica-top-short-azul-claro.jpeg', 30, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
(17, 'Camisa Compressão Longa Preta', 'Camisa de compressão para treinos intensos', 119.90, '/clothes/homem-camisa-de-compressao-longa-preta.jpeg', 55, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(18, 'Camisa Social Azul Marinho', 'Camisa social azul marinho, elegância e conforto', 139.90, '/clothes/modelo-camisa-gymsahrk-branca.jpeg', 30, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(19, 'Camisa Compressão Longa Branca', 'Camisa de compressão longa branca, alta performance', 129.90, '/clothes/homem-camisa-de-compressao-longa-branca.jpeg', 40, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(20, 'Short Branco Gymshark', 'Short fitness branco, ideal para treinos e corridas', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(21, 'Bermuda Masculina Cinza', 'Bermuda casual cinza, conforto para o dia a dia', 99.90, '/clothes/news/bermuda-masculina-cinza.jpeg', 45, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(22, 'Short Branco Gymshark Alternativo', 'Short branco alta performance', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(23, 'Tênis Masculino Branco', 'Tênis branco versátil, conforto e estilo', 279.90, '/clothes/news/tenis-masculino-branco.jpeg', 30, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(24, 'Tênis Esportivo Preto', 'Tênis esportivo preto, performance e design', 259.90, '/clothes/news/tenis-masculino-branco.jpeg', 28, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(25, 'Moletom Preto Masculino', 'Moletom masculino preto, conforto e estilo', 199.90, '/clothes/news2/sweartshirt-masculine-black.jpeg', 35, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(26, 'Boné Preto Masculino', 'Boné masculino preto, clássico e versátil', 59.90, '/clothes/bone-masculino-preto.jpeg', 50, 'CAPS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
(27, 'Conjunto Masculino Azul', 'Conjunto top compressão e short azul, treino intenso', 169.90, '/clothes/news2/conjunto-azul-masculino.jpeg', 25, 'SET', 'MASCULINE', 'AVAILABLE', NOW(), NOW());

-- ==================== INSERIR ITENS DO CARRINHO ====================
INSERT INTO shopping_cart_item (cart_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 129.90),
(2, 4, 1, 79.90),
(3, 18, 1, 139.90),
(4, 25, 1, 199.90),
(5, 23, 1, 279.90),
(6, 24, 1, 259.90),
(7, 20, 1, 89.90);

ALTER TABLE product DROP CONSTRAINT IF EXISTS product_category_check;

ALTER TABLE product ADD CONSTRAINT product_category_check 
  CHECK (category IN ('SHIRTS', 'T_SHIRTS', 'REGATTA', 'PANTS', 'LEGGING', 'SHORTS', 'SET', 'SHOES', 'CAPS', 'SWEATSHIRTS'));

INSERT INTO product (title, description, price, img_URL, stock, category, gender, status, created_at, updated_at) VALUES
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
('Camisa Compressão Longa Preta', 'Camisa de compressão para treinos intensos', 119.90, '/clothes/homem-camisa-de-compressao-longa-preta.jpeg', 55, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Social Azul Marinho', 'Camisa social azul marinho, elegância e conforto', 139.90, '/clothes/modelo-camisa-gymsahrk-branca.jpeg', 30, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Longa Branca', 'Camisa de compressão longa branca, alta performance', 129.90, '/clothes/homem-camisa-de-compressao-longa-branca.jpeg', 40, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHORTS
('Short Branco Gymshark', 'Short fitness branco, ideal para treinos e corridas', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Bermuda Masculina Cinza', 'Bermuda casual cinza, conforto para o dia a dia', 99.90, '/clothes/news/bermuda-masculina-cinza.jpeg', 45, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Short Branco Gymshark Alternativo', 'Short branco alta performance', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHOES
('Tênis Masculino Branco', 'Tênis branco versátil, conforto e estilo', 279.90, '/clothes/news/tenis-masculino-branco.jpeg', 30, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Tênis Esportivo Preto', 'Tênis esportivo preto, performance e design', 259.90, '/clothes/news/tenis-masculino-branco.jpeg', 28, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SWEATSHIRTS
('Moletom Preto Masculino', 'Moletom masculino preto, conforto e estilo', 199.90, '/clothes/news2/sweartshirt-masculine-black.jpeg', 35, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

('Boné Preto Masculino', 'Boné masculino preto, clássico e versátil', 59.90, '/clothes/bone-masculino-preto.jpeg', 50, 'CAPS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

('Conjunto Masculino Azul', 'Conjunto top compressão e short azul, treino intenso', 169.90, '/clothes/news2/conjunto-azul-masculino.jpeg', 25, 'SET', 'MASCULINE', 'AVAILABLE', NOW(), NOW());


INSERT INTO order_address (id, user_id, street, number, neighborhood, city, state, country, zip_code) VALUES
(1, 1, 'Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', 'Brasil', '01310-100'),
(2, 2, 'Avenida Paulista', 1500, 'Bela Vista', 'São Paulo', 'SP', 'Brasil', '01310-200'),
(3, 3, 'Rua Augusta', 789, 'Consolação', 'São Paulo', 'SP', 'Brasil', '01305-100'),
(4, 4, 'Rua Oscar Freire', 456, 'Jardins', 'São Paulo', 'SP', 'Brasil', '01426-001'),
(5, 5, 'Avenida Rebouças', 2020, 'Pinheiros', 'São Paulo', 'SP', 'Brasil', '05402-100'),
(6, 6, 'Rua Haddock Lobo', 595, 'Cerqueira César', 'São Paulo', 'SP', 'Brasil', '01414-001'),
(7, 7, 'Rua da Consolação', 3000, 'Consolação', 'São Paulo', 'SP', 'Brasil', '01416-000');

-- ==================== INSERIR PEDIDOS ====================
INSERT INTO orders (id, user_id, created_at, status, order_address_id, shopping_cart_id) VALUES
(1, 1, '2025-12-01 10:30:00', 'DELIVERED', 1, 1),
(2, 2, '2025-12-05 14:20:00', 'DELIVERED', 2, 2),
(3, 3, '2025-12-10 09:15:00', 'DELIVERED', 3, 3),
(4, 4, '2025-12-15 16:45:00', 'DELIVERED', 4, 4),
(5, 5, '2025-12-20 11:00:00', 'DELIVERED', 5, 5),
(6, 6, '2026-01-02 13:30:00', 'SHIPPED', 6, 6),
(7, 7, '2026-01-05 10:00:00', 'SHIPPED', 7, NULL);

-- ==================== INSERIR ITENS DOS PEDIDOS ====================
INSERT INTO order_item (order_id, product_id, quantity, unit_price) VALUES
-- Pedido 1 - João
(1, 18, 25, 119.90),  -- Camisa Compressão Cinza Preta
(1, 20, 18, 89.90),   -- Short Branco Gymshark
(1, 22, 15, 99.90),   -- Short Branco Gymshark Alternativo

-- Pedido 2 - Maria
(2, 1, 25, 129.90),   -- Legging Preta Gymshark
(2, 4, 18, 79.90),    -- Blusa Preta Feminina Gym
(2, 10, 15, 249.90),  -- Tênis Feminino Academia

-- Pedido 3 - Pedro
(3, 18, 22, 119.90),  -- Camisa Compressão Cinza Preta
(3, 25, 20, 69.90),   -- Moletom Preto Masculino
(3, 24, 16, 259.90),  -- Tênis Esportivo Preto

-- Pedido 4 - Ana
(4, 25, 19, 69.90),   -- Moletom Preto Masculino
(4, 20, 17, 89.90),   -- Short Branco Gymshark
(4, 22, 14, 99.90),   -- Short Branco Gymshark Alternativo

-- Pedido 5 - Carlos
(5, 18, 20, 119.90),  -- Camisa Compressão Cinza Preta
(5, 24, 18, 259.90),  -- Tênis Esportivo Preto
(5, 7, 12, 159.90),   -- Calça Oversized Feminina

-- Pedido 6 - Lucia
(6, 24, 15, 259.90),  -- Tênis Esportivo Preto
(6, 22, 19, 99.90),   -- Short Branco Gymshark Alternativo
(6, 1, 2, 129.90),    -- Legging Preta Gymshark

-- Pedido 7 - Roberto (novo)
(7, 20, 21, 89.90),   -- Short Branco Gymshark
(7, 18, 16, 119.90),  -- Camisa Compressão Cinza Preta
(7, 25, 18, 69.90);   -- Moletom Preto Masculino
