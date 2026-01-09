-- Limpar todas as tabelas primeiro
TRUNCATE TABLE shopping_cart_item, shopping_cart, order_item, orders, product, users CASCADE;

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

-- Produtos Femininos - REGATA
('Regata Preta Feminina Gymshark', 'Regata fitness preta, tecido leve e respirável', 79.90, '/clothes/news/regata-preta-feminia-gymshark.jpeg', 60, 'REGATTA', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Regata Branca Feminina', 'Regata básica branca feminina, essencial e versátil', 69.90, '/clothes/news/regata-branca-feminina.jpeg', 55, 'REGATTA', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - PANTS
('Calça Oversized Feminina', 'Calça oversized feminina, estilo urbano e confortável', 159.90, '/clothes/news/calça-overzied-feminina.jpeg', 35, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Calça Oversized Feminina Traseira', 'Calça oversized feminina com design único nas costas', 159.90, '/clothes/news/calça-oversized-feminia-tras.jpeg', 30, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Calça Oversized Feminina Lado', 'Calça oversized feminina vista lateral, estilo moderno', 159.90, '/clothes/news/calça-overzied-feminina-lado.jpeg', 30, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - SHOES
('Tênis Feminino Academia', 'Tênis feminino para treinos, conforto e estabilidade', 249.90, '/clothes/news/feminine-gym-shoes.jpeg', 25, 'SHOES', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - SWEATSHIRTS
('Moletom Cinza Feminino', 'Moletom feminino confortável, perfeito para dias frios', 189.90, '/clothes/news2/moletom-cinza-feminino.jpeg', 40, 'SWEATSHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Moletom Azul Feminino', 'Moletom azul feminino, estilo casual e confortável', 199.90, '/clothes/news2/moletom-azul-feminino.jpeg', 35, 'SWEATSHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - CAPS
('Boné Rosa Feminino', 'Boné feminino rosa, estilo casual e moderno', 59.90, '/clothes/news/bone-rosa-feminino.jpeg', 35, 'CAPS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Boné Bege Feminino Gym', 'Boné feminino bege para academia, estilo esportivo', 59.90, '/clothes/bone-feminino-gym-bege.jpeg', 40, 'CAPS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Femininos - SET (Top + Short)
('Conjunto Feminino Rosa Fitness', 'Conjunto top e short rosa, perfeito para academia', 149.90, '/clothes/mulher-short-top-verde.jpeg', 30, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Feminino Preto Treino', 'Conjunto top e short preto, versátil e confortável', 149.90, '/clothes/mulher-short-top-preto.jpeg', 28, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Feminino Branco Azulado', 'Conjunto top e short branco azulado, estilo moderno', 159.90, '/clothes/mulher-short-top-branco-azulado.jpeg', 25, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Feminino Azul Claro', 'Conjunto top e short azul claro, conforto e estilo', 149.90, '/clothes/asiatica-top-short-azul-claro.jpeg', 30, 'SET', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHIRTS
('Camisa Compressão Cinza Preta Gymshark', 'Camisa de compressão para treinos intensos', 119.90, '/clothes/news/camisa-compressao-cinza-preta-gymshark.jpeg', 55, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Social Azul Marinho', 'Camisa social azul marinho, elegância e conforto', 139.90, '/clothes/news/camisa-social-azul.jpeg', 30, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Longa Branca', 'Camisa de compressão longa branca, alta performance', 129.90, '/clothes/homem-camisa-de-compressao-longa-branca.jpeg', 40, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Compressão Longa Preta', 'Camisa de compressão longa preta, conforto e estilo', 129.90, '/clothes/homem-camisa-de-compressao-longa-preta.jpeg', 40, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Gymshark Branca', 'Camisa Gymshark branca, design moderno', 99.90, '/clothes/modelo-camisa-gymsahrk-branca.jpeg', 50, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Gymshark Preta', 'Camisa Gymshark preta, qualidade premium', 99.90, '/clothes/modelo-camisa-gymsahrk-preta.jpeg', 50, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Camisa Gymshark Verde', 'Camisa Gymshark verde, estilo único', 99.90, '/clothes/modelo-camisa-gymsahrk-verde.jpeg', 45, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - REGATA
('Regata Masculina Branca', 'Regata básica branca, essencial para o guarda-roupa', 69.90, '/clothes/news/regata-masculina-branca.jpeg', 70, 'REGATTA', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Regata Preta Masculina', 'Regata preta masculina, versátil e confortável', 69.90, '/clothes/guy-black-regata.jpeg', 65, 'REGATTA', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Regata Branca Guy', 'Regata branca masculina, estilo casual', 69.90, '/clothes/guy-white-regata.jpeg', 65, 'REGATTA', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - PANTS
('Calça Bege Masculina', 'Calça casual bege, versatilidade e estilo', 149.90, '/clothes/news/calca-bege-masculina.jpeg', 40, 'PANTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHORTS
('Short Branco Gymshark', 'Short fitness branco, ideal para treinos e corridas', 89.90, '/clothes/news/short-branco-gymshark.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Bermuda Masculina Cinza', 'Bermuda casual cinza, conforto para o dia a dia', 99.90, '/clothes/news/bermuda-masculina-cinza.jpeg', 45, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Short Gymshark Verde', 'Short Gymshark verde, alta performance', 89.90, '/clothes/modelo-short-gymshark-verde.jpeg', 50, 'SHORTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SHOES
('Tênis Masculino Branco', 'Tênis branco versátil, conforto e estilo', 279.90, '/clothes/news/tenis-masculino-branco.jpeg', 30, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Tênis Esportivo Preto', 'Tênis esportivo preto, performance e design', 259.90, '/clothes/news/tenis-esportivo-preto.jpeg', 28, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SWEATSHIRTS
('Moletom Preto Masculino', 'Moletom masculino preto, conforto e estilo', 199.90, '/clothes/news/moletom-preto-masculino.jpeg', 35, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Moletom Boys Lies Branco', 'Moletom Boys Lies branco, design exclusivo', 219.90, '/clothes/news2/boys-lies-moletom-masculino-branco.jpeg', 30, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Moletom Gym Preto Masculino', 'Moletom gym preto masculino, alta qualidade', 209.90, '/clothes/news2/moletom-gym-preto-masculino.jpeg', 32, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Moletom Preto Masculino Básico', 'Moletom masculino preto básico, essencial', 189.90, '/clothes/news2/sweartshirt-masculine-black.jpeg', 40, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - CAPS
('Boné Preto Masculino', 'Boné masculino preto, clássico e versátil', 59.90, '/clothes/bone-masculino-preto.jpeg', 50, 'CAPS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),

-- Produtos Masculinos - SET (Top + Short)
('Conjunto Masculino Cinza Preto', 'Conjunto top compressão e short cinza preto, treino intenso', 169.90, '/clothes/news2/conjunto-roupa-masculino.jpeg', 25, 'SET', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Conjunto Masculino Azul', 'Conjunto top e short azul, conforto e estilo', 159.90, '/clothes/news2/conjunto-azul-masculino.jpeg', 30, 'SET', 'MASCULINE', 'AVAILABLE', NOW(), NOW());

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
