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

-- Inserir Produtos (todas as categorias possíveis do enum)
INSERT INTO product (title, description, price, img_URL, stock, category, gender, status, created_at, updated_at) VALUES
('Shirt Basic White', '100% cotton basic shirt', 39.90, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500&h=500&fit=crop', 50, 'SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Shirt Slim Fit', 'Slim fit shirt for daily use', 49.90, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?w=500&h=500&fit=crop', 40, 'SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

('T-Shirt Classic', 'Classic T-shirt with soft fabric', 29.90, 'https://images.unsplash.com/photo-1520975916090-3105956dac38?w=500&h=500&fit=crop', 60, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('T-Shirt Crop', 'Comfortable crop t-shirt', 34.90, 'https://images.unsplash.com/photo-1520975378300-8028d7f8d3fd?w=500&h=500&fit=crop', 55, 'T_SHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

('Pants Denim Dark', 'Denim pants with perfect fit', 119.90, 'https://images.unsplash.com/photo-1542272604-787c62d465d1?w=500&h=500&fit=crop', 35, 'PANTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Pants Legging Premium', 'High quality legging pants', 109.90, 'https://images.unsplash.com/photo-1506629082632-121e5dfc5d53?w=500&h=500&fit=crop', 50, 'PANTS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

('Shoes Running', 'Lightweight running shoes', 199.90, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&h=500&fit=crop', 25, 'SHOES', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Shoes Casual', 'Casual shoes for everyday', 179.90, 'https://images.unsplash.com/photo-1519741491150-6b2d1d84cf90?w=500&h=500&fit=crop', 28, 'SHOES', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

('Cap Classic', 'Classic cap adjustable', 59.90, 'https://images.unsplash.com/photo-1526642732334-54e7a86f9f4b?w=500&h=500&fit=crop', 45, 'CAPS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Cap Sport', 'Sport cap breathable', 64.90, 'https://images.unsplash.com/photo-1526642802781-99c49d08e9a6?w=500&h=500&fit=crop', 42, 'CAPS', 'FEMININE', 'AVAILABLE', NOW(), NOW()),

('Sweatshirt Hoodie', 'Soft hoodie sweatshirt', 139.90, 'https://images.unsplash.com/photo-1490481651871-ab68de25d43a?w=500&h=500&fit=crop', 33, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE', NOW(), NOW()),
('Sweatshirt Oversized', 'Oversized sweatshirt', 149.90, 'https://images.unsplash.com/photo-1490481743850-a1d74e923102?w=500&h=500&fit=crop', 30, 'SWEATSHIRTS', 'FEMININE', 'AVAILABLE', NOW(), NOW());

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
