-- Reseta (apaga) todos os dados e recria inserts para TODAS as tabelas do schema atual.
-- Banco alvo (pelo application.properties): postgres://localhost:5432/eden_db
-- Rodar:
--   PGPASSWORD='123456' psql -h localhost -U postgres -d eden_db -f backend/eden/src/main/resources/sql/reset_and_seed.sql

BEGIN;

-- Apaga tudo e reseta IDs (identity) respeitando dependências
TRUNCATE TABLE
  users_address_list,
  address,
  order_item,
  orders,
  order_address,
  shopping_cart_item,
  shopping_cart,
  product,
  users
RESTART IDENTITY CASCADE;

-- USERS
INSERT INTO users (name, email, password, birth_day, gender, role, status, created_at)
VALUES
  ('João Silva',  'joao@example.com',  'senha123', DATE '1995-03-10', 'MALE',   'USER',  'ACTIVE', NOW()),
  ('Maria Santos','maria@example.com', 'senha456', DATE '1998-07-22', 'FEMALE', 'USER',  'ACTIVE', NOW()),
  ('Pedro Oliveira','pedro@example.com','senha789', DATE '1992-11-05', 'MALE',  'USER',  'ACTIVE', NOW()),
  ('Ana Costa',   'ana@example.com',   'senha000', DATE '2000-01-15', 'FEMALE', 'USER',  'ACTIVE', NOW()),
  ('Carlos Mendes','carlos@example.com','senha111', DATE '1990-09-30', 'MALE',  'ADMIN', 'ACTIVE', NOW());

-- ADDRESS (e vínculo na tabela de junção users_address_list)
INSERT INTO address (user_id, street, number, neighborhood, city, state, country, zip_code)
VALUES
  (1, 'Rua das Flores',     123, 'Centro',      'São Paulo',      'SP', 'Brasil', '01234-567'),
  (2, 'Avenida Principal',  456, 'Copacabana',  'Rio de Janeiro', 'RJ', 'Brasil', '20000-000'),
  (3, 'Rua Central',       789, 'Savassi',     'Belo Horizonte', 'MG', 'Brasil', '30140-011'),
  (4, 'Alameda dos Anjos',  321, 'Asa Sul',     'Brasília',       'DF', 'Brasil', '70000-000'),
  (5, 'Rua Comercial',     654, 'Comércio',    'Salvador',       'BA', 'Brasil', '40000-000');

-- Como o join table tem constraint UNIQUE (address_list_id), fazemos 1 endereço por usuário
INSERT INTO users_address_list (user_id, address_list_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- PRODUCTS
-- img_url aponta para as imagens em frontend/public/clothes (paths url-encoded)
INSERT INTO product (title, description, price, img_url, stock, category, status, created_at, updated_at)
VALUES
  ('Camiseta Básica Branca',  'Camiseta 100% algodão confortável',              39.90,  '/clothes/_.jpeg', 50, 'T_SHIRTS',    'AVAILABLE', NOW(), NOW()),
  ('Calça Jeans Premium',     'Calça jeans azul escuro com ajuste perfeito',   119.90, '/clothes/_%20%281%29.jpeg', 35, 'PANTS', 'AVAILABLE', NOW(), NOW()),
  ('Jaqueta de Couro',        'Jaqueta moderna com visual premium',            299.90, '/clothes/Nike%20Men%27s%20Rise%20365%20Tank%20Top%20Black%20S.jpeg', 20, 'SWEATSHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Vestido Floral Verão',    'Leve e confortável para dias quentes',           89.90, '/clothes/ALO%20Alosoft%20Heart%20Throb%20Bra%20in%20Black.jpeg', 25, 'SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Shorts de Algodão',       'Ideal para o calor e uso casual',                59.90, '/clothes/2%20en%201%20Double%20Layer%20Shorts%20Poche%20Int%C3%A9rieure%20%C3%80%20Fermeture%20-%20Temu%20France.jpeg', 40, 'PANTS', 'AVAILABLE', NOW(), NOW()),
  ('Blusa Elegante',          'Blusa elegante para ocasiões especiais',        149.90, '/clothes/_.jpeg', 30, 'SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Polo Masculina Clássica', 'Polo clássica em cores variadas',                79.90, '/clothes/_%20%281%29.jpeg', 45, 'SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Saia Midi Elegante',      'Saia midi elegante em tecido leve',              99.90, '/clothes/Nike%20Men%27s%20Rise%20365%20Tank%20Top%20Black%20S.jpeg', 28, 'SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Jaqueta Bomber Modern',   'Jaqueta bomber moderna e confortável',          179.90, '/clothes/ALO%20Alosoft%20Heart%20Throb%20Bra%20in%20Black.jpeg', 22, 'SWEATSHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Legging Premium Fitness', 'Legging com suporte e conforto',                109.90, '/clothes/2%20en%201%20Double%20Layer%20Shorts%20Poche%20Int%C3%A9rieure%20%C3%80%20Fermeture%20-%20Temu%20France.jpeg', 50, 'PANTS', 'AVAILABLE', NOW(), NOW()),
  ('Moletom Confortável',     'Moletom macio para dias frios',                 129.90, '/clothes/_.jpeg', 25, 'SWEATSHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Sapato Casual Preto',     'Sapato casual para o dia a dia',                199.90, '/clothes/_%20%281%29.jpeg', 18, 'SHOES', 'AVAILABLE', NOW(), NOW());

-- SHOPPING CART (1 por user)
INSERT INTO shopping_cart (user_id, status, created_at)
VALUES
  (1, true, NOW()),
  (2, true, NOW()),
  (3, true, NOW()),
  (4, true, NOW()),
  (5, true, NOW());

-- SHOPPING CART ITEMS
INSERT INTO shopping_cart_item (cart_id, product_id, quantity, unit_price)
VALUES
  (1, 1, 2, 39.90),
  (1, 3, 1, 299.90),
  (2, 2, 1, 119.90),
  (2, 5, 3, 59.90),
  (3, 4, 1, 89.90),
  (4, 7, 2, 79.90),
  (5, 9, 1, 179.90);

-- ORDER ADDRESS (1 por user, constraint UNIQUE user_id)
INSERT INTO order_address (user_id, street, number, neighborhood, city, state, country, zip_code)
VALUES
  (1, 'Rua das Flores',     123, 'Centro',     'São Paulo',      'SP', 'Brasil', '01234-567'),
  (2, 'Avenida Principal',  456, 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000'),
  (3, 'Rua Central',       789, 'Savassi',    'Belo Horizonte', 'MG', 'Brasil', '30140-011'),
  (4, 'Alameda dos Anjos',  321, 'Asa Sul',    'Brasília',       'DF', 'Brasil', '70000-000'),
  (5, 'Rua Comercial',     654, 'Comércio',   'Salvador',       'BA', 'Brasil', '40000-000');

-- ORDERS
-- status é SMALLINT (ordinal do enum):
-- CREATED=0, PAID=1, PREPARING=2, SHIPPED=3, DELIVERED=4, CANCELED=5
-- Constraints: UNIQUE(user_id) e UNIQUE(order_address_id)
INSERT INTO orders (user_id, shopping_cart_id, order_address_id, status, created_at)
VALUES
  (1, 1, 1, 0, NOW()),
  (2, 2, 2, 1, NOW()),
  (3, 3, 3, 4, NOW()),
  (4, 4, 4, 0, NOW()),
  (5, 5, 5, 1, NOW());

-- ORDER ITEMS
INSERT INTO order_item (order_id, product_id, quantity, unit_price)
VALUES
  (1, 1, 2, 39.90),
  (1, 3, 1, 299.90),
  (2, 2, 1, 119.90),
  (2, 5, 3, 59.90),
  (3, 4, 1, 89.90),
  (4, 7, 2, 79.90),
  (5, 9, 1, 179.90);

COMMIT;
