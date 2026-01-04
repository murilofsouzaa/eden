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
-- img_url aponta para as imagens em frontend/public/clothes
INSERT INTO product (title, description, price, img_url, stock, category, status, created_at, updated_at)
VALUES
  ('Conjunto Fitness Feminino Azul',         'Conjunto top e short fitness azul claro premium',                    149.90,  '/clothes/asiatica-top-short-azul-claro.jpeg', 30, 'SWEATSHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Regata Masculina Preta',                 'Regata esportiva preta ideal para treinos intensos',                  79.90,  '/clothes/guy-black-regata.jpeg', 45, 'T_SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Regata Masculina Branca',                'Regata branca premium com tecido respirável',                         79.90,  '/clothes/guy-white-regata.jpeg', 50, 'T_SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Camisa Compressão Longa Branca',         'Camisa de compressão manga longa branca para alta performance',      129.90,  '/clothes/homem-camisa-de-compressao-longa-branca.jpeg', 35, 'SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Camisa Compressão Longa Preta',          'Camisa de compressão manga longa preta tecnologia Dry-Fit',          129.90,  '/clothes/homem-camisa-de-compressao-longa-preta.jpeg', 40, 'SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Camiseta Gymshark Branca',               'Camiseta fitness Gymshark branca com corte moderno',                  89.90,  '/clothes/modelo-camisa-gymsahrk-branca.jpeg', 55, 'T_SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Camiseta Gymshark Preta',                'Camiseta fitness Gymshark preta estilo premium',                      89.90,  '/clothes/modelo-camisa-gymsahrk-preta.jpeg', 60, 'T_SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Camiseta Gymshark Verde',                'Camiseta fitness Gymshark verde vibrante',                            89.90,  '/clothes/modelo-camisa-gymsahrk-verde.jpeg', 45, 'T_SHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Short Gymshark Verde',                   'Short fitness Gymshark verde com ajuste perfeito',                    79.90,  '/clothes/modelo-short-gymshark-verde.jpeg', 40, 'PANTS', 'AVAILABLE', NOW(), NOW()),
  ('Conjunto Fitness Branco Azulado',        'Conjunto feminino fitness branco com detalhes azulados',             139.90,  '/clothes/mulher-short-top-branco-azulado.jpeg', 35, 'SWEATSHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Conjunto Fitness Feminino Preto',        'Conjunto top e short preto elegante para treinos',                   139.90,  '/clothes/mulher-short-top-preto.jpeg', 50, 'SWEATSHIRTS', 'AVAILABLE', NOW(), NOW()),
  ('Conjunto Fitness Feminino Verde',        'Conjunto fitness verde completo para alta performance',              139.90,  '/clothes/mulher-short-top-verde.jpeg', 38, 'SWEATSHIRTS', 'AVAILABLE', NOW(), NOW());

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
  (1, 1, 2, 149.90),
  (1, 3, 1, 79.90),
  (2, 2, 1, 79.90),
  (2, 5, 2, 129.90),
  (3, 4, 1, 129.90),
  (4, 7, 2, 89.90),
  (5, 9, 1, 79.90);

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
  (1, 1, 2, 149.90),
  (1, 3, 1, 79.90),
  (2, 2, 1, 79.90),
  (2, 5, 2, 129.90),
  (3, 4, 1, 129.90),
  (4, 7, 2, 89.90),
  (5, 9, 1, 79.90);

COMMIT;
