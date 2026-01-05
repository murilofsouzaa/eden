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
('Camiseta Básica Branca', 'Camiseta 100% algodão confortável', 39.90, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500&h=500&fit=crop', 50, 'CAMISETA', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Calça Jeans Premium', 'Calça jeans azul escuro com ajuste perfeito', 119.90, 'https://images.unsplash.com/photo-1542272604-787c62d465d1?w=500&h=500&fit=crop', 35, 'CALCA', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Jaqueta de Couro', 'Jaqueta de couro legítimo com forro interno', 299.90, 'https://images.unsplash.com/photo-1595777707802-41a3a8a4fab2?w=500&h=500&fit=crop', 20, 'JAQUETA', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Vestido Floral', 'Vestido floral perfeito para o verão', 89.90, 'https://images.unsplash.com/photo-1595777707802-41a3a8a4fab2?w=500&h=500&fit=crop', 25, 'VESTIDO', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Shorts de Algodão', 'Shorts confortável ideal para o calor', 59.90, 'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500&h=500&fit=crop', 40, 'SHORT', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Blusa Elegant', 'Blusa elegante para ocasiões especiais', 149.90, 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=500&h=500&fit=crop', 30, 'BLUSA', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Polo Masculina', 'Polo clássica em cores variadas', 79.90, 'https://images.unsplash.com/photo-1560751588-543cb1ba47f0?w=500&h=500&fit=crop', 45, 'CAMISETA', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Saia Midi', 'Saia midi elegante em tecido leve', 99.90, 'https://images.unsplash.com/photo-1574794066290-cb0edd64d981?w=500&h=500&fit=crop', 28, 'SAIA', 'FEMININE', 'ACTIVE', NOW(), NOW()),
('Jaqueta Bomber', 'Jaqueta bomber moderna e confortável', 179.90, 'https://images.unsplash.com/photo-1551028719-00167b16ebc5?w=500&h=500&fit=crop', 22, 'JAQUETA', 'MASCULINE', 'ACTIVE', NOW(), NOW()),
('Legging Premium', 'Legging de alta qualidade com suporte', 109.90, 'https://images.unsplash.com/photo-1506629082632-121e5dfc5d53?w=500&h=500&fit=crop', 50, 'CALCA', 'FEMININE', 'ACTIVE', NOW(), NOW());

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
(1, 3, 1, NOW(), NOW()),
(2, 2, 1, NOW(), NOW()),
(2, 5, 3, NOW(), NOW()),
(3, 4, 1, NOW(), NOW()),
(4, 7, 2, NOW(), NOW()),
(5, 9, 1, NOW(), NOW());

-- Inserir Endereços (associados aos pedidos)
-- Os endereços serão criados junto com os pedidos

-- Inserir Pedidos
INSERT INTO "order" (user_id, status, total_amount, created_at, updated_at) VALUES
(1, 'PENDING', 319.70, NOW(), NOW()),
(2, 'CONFIRMED', 239.70, NOW(), NOW()),
(3, 'DELIVERED', 89.90, NOW(), NOW()),
(4, 'PENDING', 159.80, NOW(), NOW()),
(5, 'CONFIRMED', 179.90, NOW(), NOW());

-- Inserir Itens dos Pedidos
INSERT INTO order_item (order_id, product_id, quantity, unit_price, created_at, updated_at) VALUES
(1, 1, 2, 39.90, NOW(), NOW()),
(1, 3, 1, 299.90, NOW(), NOW()),
(2, 2, 1, 119.90, NOW(), NOW()),
(2, 5, 3, 59.90, NOW(), NOW()),
(3, 4, 1, 89.90, NOW(), NOW()),
(4, 7, 2, 79.90, NOW(), NOW()),
(5, 9, 1, 179.90, NOW(), NOW());

-- Inserir Endereços dos Pedidos
INSERT INTO order_address (order_id, street, city, state, zip_code, country, number, complement, created_at, updated_at) VALUES
(1, 'Rua das Flores', 'São Paulo', 'SP', '01234-567', 'Brasil', '123', 'Apto 401', NOW(), NOW()),
(2, 'Avenida Principal', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil', '456', '', NOW(), NOW()),
(3, 'Rua Central', 'Belo Horizonte', 'MG', '30140-011', 'Brasil', '789', 'Casa 2', NOW(), NOW()),
(4, 'Alameda dos Anjos', 'Brasília', 'DF', '70000-000', 'Brasil', '321', '', NOW(), NOW()),
(5, 'Rua Comercial', 'Salvador', 'BA', '40000-000', 'Brasil', '654', 'Loja 5', NOW(), NOW());
