-- Sample data for Eden commerce platform

-- Users
INSERT INTO users (name, birth_day, gender, email, password, role, status, created_at) VALUES
	('Lara Costa', DATE '1995-04-12', 'FEMALE', 'lara.costa@eden.com',
	 '$2a$10$7EqJtq98hPqEX7fNZaFWoO7hU0E1Ee7dZpFPchGoCk6Qd8l4f7OWG', 'USER', 'ACTIVE', TIMESTAMP '2025-11-12 10:00:00'),
	('Diego Martins', DATE '1990-08-22', 'MALE', 'diego.martins@eden.com',
	 '$2a$10$wHDiJxJ6R9YvQ7a6YcM6Ze6eDu0k7O7h4N6LI8yOnl9Q7rE5dCJ3q', 'ADMIN', 'ACTIVE', TIMESTAMP '2025-10-05 09:15:00'),
	('Marina Lopes', DATE '1998-01-30', 'FEMALE', 'marina.lopes@eden.com',
	 '$2a$10$M31ZLLu4U9hsBqI5O8lVQe1t2BWM6WQTaE3HpZSnA8m4eCk2UXN0C', 'USER', 'INACTIVE', TIMESTAMP '2025-06-18 14:00:00');

-- Addresses
INSERT INTO address (user_id, street, number, neighborhood, city, state, country, zip_code) VALUES
	((SELECT id FROM users WHERE email = 'lara.costa@eden.com'), 'Rua das Palmeiras', 120, 'Jardins', 'São Paulo', 'SP', 'Brasil', '01425-000'),
	((SELECT id FROM users WHERE email = 'lara.costa@eden.com'), 'Av. Atlântica', 855, 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil', '22010-000'),
	((SELECT id FROM users WHERE email = 'diego.martins@eden.com'), 'Rua Professor Jesuino Arruda', 45, 'Itaim Bibi', 'São Paulo', 'SP', 'Brasil', '04532-081'),
	((SELECT id FROM users WHERE email = 'marina.lopes@eden.com'), 'Rua da Consolação', 998, 'Consolação', 'São Paulo', 'SP', 'Brasil', '01302-907');

-- Order addresses (one per user due to the unique constraint)
INSERT INTO order_address (user_id, street, number, neighborhood, city, state, country, zip_code) VALUES
	((SELECT id FROM users WHERE email = 'lara.costa@eden.com'), 'Rua das Palmeiras', 120, 'Jardins', 'São Paulo', 'SP', 'Brasil', '01425-000'),
	((SELECT id FROM users WHERE email = 'diego.martins@eden.com'), 'Rua Professor Jesuino Arruda', 45, 'Itaim Bibi', 'São Paulo', 'SP', 'Brasil', '04532-081');

-- Products (image paths reference files inside frontend/public)
INSERT INTO product (title, description, price, img_url, stock, category, gender, status, created_at, updated_at) VALUES
	('Gymshark Black Compression Tee', 'Camiseta de compressão com tecido respirável para treinos intensos.',
	 149.90, 'clothes/men/gymshark-black-compression-shirt-masculine.jpg', 35, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-12-01 08:00:00', TIMESTAMP '2026-01-05 18:30:00'),
	('Gymshark Blue Oversized Hoodie', 'Moletom oversized azul marinho com toque macio e conforto térmico.',
	 279.50, 'clothes/men/gymshark-blue-oversized-masculine.jpeg', 18, 'SWEATSHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-11-25 11:15:00', NULL),
	('White Performance Joggers', 'Calça jogger branca com ajuste anatômico e bolsos com zíper.',
	 229.00, 'clothes/men/white-pants-masculine.jpeg', 22, 'PANTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-10-10 09:40:00', TIMESTAMP '2025-12-20 16:20:00'),
	('Lima Flex Training Shorts', 'Shorts verde lima com tecido leve e elástico quadridirecional.',
	 189.90, 'clothes/men/gymshark-green-shorts-masculine.jpeg', 40, 'SHORTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-12-05 07:45:00', NULL),
	('Black Long Compression Shirt', 'Camiseta longa de compressão com recortes ergonômicos e toque frio.',
	 169.90, 'clothes/men/black-long-compressed-shirt-masculine.jpeg', 27, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-10-28 08:30:00', NULL),
	('Onyx Compression Long Tee', 'Modelo manga longa com suporte muscular gradiente e acabamento fosco.',
	 189.90, 'clothes/men/gmyshark-black-long-compression-t-shirt-masculine.jpeg', 18, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-11-08 09:10:00', NULL),
	('Carbon Compression Performance Tee', 'Camiseta justa com painel respirável e proteção UV 50.',
	 179.90, 'clothes/men/gymshark-black-compression-t-shirt-masculine.jpeg', 31, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-11-12 07:55:00', NULL),
	('Elite Compression Pro Top', 'Modelo elite com gola alongada, ajuste progressivo e detalhes refletivos.',
	 199.90, 'clothes/men/gymshark-black-long-compression-shit-masculine-elite.jpeg', 19, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-12-14 06:45:00', TIMESTAMP '2026-01-03 17:00:00'),
	('Gymshark Black Oversized Tee', 'Camiseta oversized preta com barra alongada e tecido de algodão premium.',
	 219.90, 'clothes/men/gymshark-black-oversized-masculine.jpeg', 25, 'SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-11-02 12:15:00', NULL),
	('Shadow Pro Training Shorts', 'Short preto com painéis laterais perfurados e cordão embutido.',
	 169.90, 'clothes/men/gymshark-black-short-masculine.jpeg', 34, 'SHORTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-12-03 09:05:00', NULL),
	('Gymshark Green Oversized Tee', 'Camiseta oversized verde com malha de gramatura média.',
	 209.90, 'clothes/men/gymshark-green-oversized-masculine.jpeg', 21, 'SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-11-18 10:25:00', NULL),
	('Plum Seamless Performance Tee', 'Camiseta seamless em tom ameixa com textura canelada e ventilação integrada.',
	 189.90, 'clothes/men/gymshark-plum-brown-shirt-masculine.jpeg', 29, 'T_SHIRTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-10-22 08:40:00', NULL),
	('Regatta Green Essential Tee', 'Camiseta regata verde intensa com recorte atlético e toque macio.',
	 169.90, 'clothes/men/gymshark-regatta-green-masculine', 33, 'REGATTA', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-09-29 07:20:00', NULL),
	('Arctic Court Shorts', 'Short branco com barras reforçadas e bolso invisível para chaves.',
	 179.90, 'clothes/men/gymshark-white-shorts-masculine.jpeg', 26, 'SHORTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-12-07 15:10:00', NULL),
	('White Performance Joggers Front View', 'Versão frontal dos joggers brancos destacando o ajuste cônico.',
	 229.00, 'clothes/men/white-pants-masculine-front.jpeg', 20, 'PANTS', 'MASCULINE', 'AVAILABLE',
	 TIMESTAMP '2025-10-12 10:05:00', NULL),
	('Emerald Seamless Legging', 'Legging feminina seamless com compressão moderada e acabamento opaco.',
	 259.00, 'clothes/women/gymshark-green-legging.jpeg', 28, 'LEGGING', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-18 13:25:00', TIMESTAMP '2025-12-11 12:10:00'),
	('Cloudy Oversized Tee', 'Camiseta oversized feminina em algodão orgânico e barra desfiada.',
	 199.90, 'clothes/women/gymshark-white-oversized-woman.jpeg', 32, 'SHIRTS', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-08-30 10:05:00', NULL),
	('Black Sculpt Seamless Set', 'Conjunto seamless preto com top suporte médio e legging cintura alta.',
	 329.00, 'clothes/women/gymshar-black-set-women.jpeg', 24, 'SET', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-05 09:50:00', NULL),
	('Crimson Wine Pants (Back)', 'Visão traseira da calça vinho com recortes respiráveis e bolso interno.',
	 239.00, 'clothes/women/gymshark,red-wine-pants-women-back.jpeg', 17, 'PANTS', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-07 11:00:00', NULL),
	('Midnight Sculpt Legging', 'Legging preta com compressão localizada e cintura dupla para suporte extra.',
	 249.00, 'clothes/women/gymshark-black-legging.jpeg', 30, 'LEGGING', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-12 08:05:00', NULL),
	('Blue Ocean Motion Legging', 'Legging azul oceano com acabamento gelado e recortes ondulados.',
	 259.00, 'clothes/women/gymshark-blue-ocean-legging.jpeg', 27, 'LEGGING', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-14 09:35:00', NULL),
	('Grey Studio Seamless Set', 'Conjunto cinza com textura jacquard e ventilação estratégica.',
	 319.00, 'clothes/women/gymshark-grey-set-women.jpeg', 23, 'SET', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-20 12:00:00', NULL),
	('Red Wine Performance Pants', 'Calça vinho com corte fluido e abertura lateral para mobilidade.',
	 239.00, 'clothes/women/gymshark-red-wine-pants-women.jpeg', 19, 'PANTS', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-22 13:10:00', NULL),
	('Brown Lounge Seamless Set', 'Conjunto marrom com malha acetinada e top de decote quadrado.',
	 329.00, 'clothes/women/gymshark-set-brown-women.jpeg', 21, 'SET', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-24 14:25:00', NULL),
	('Black Oversized City Tee', 'Camiseta oversized feminina preta com logo discreto e ombro deslocado.',
	 209.00, 'clothes/women/gymshark-woman-oversized-black.jpeg', 28, 'SHIRTS', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-08-28 16:15:00', NULL),
	('Prada Hydrate Bottle', 'Garrafa térmica em alumínio escovado com tampa rosqueável.',
	 129.00, 'acessories/prada-water-bottle.jpeg', 55, 'WATER_BOTTLE', 'UNISSEX', 'AVAILABLE',
	 TIMESTAMP '2025-07-22 15:15:00', NULL);

-- Shopping carts
INSERT INTO shopping_cart (user_id, status, created_at) VALUES
	((SELECT id FROM users WHERE email = 'lara.costa@eden.com'), true, TIMESTAMP '2026-01-10 08:15:00'),
	((SELECT id FROM users WHERE email = 'diego.martins@eden.com'), true, TIMESTAMP '2026-01-09 19:45:00'),
	((SELECT id FROM users WHERE email = 'marina.lopes@eden.com'), false, TIMESTAMP '2025-12-18 17:05:00');

-- Shopping cart items
INSERT INTO shopping_cart_item (cart_id, product_id, quantity, unit_price) VALUES
	((SELECT id FROM shopping_cart WHERE user_id = (SELECT id FROM users WHERE email = 'lara.costa@eden.com')),
	 (SELECT id FROM product WHERE title = 'Gymshark Black Compression Tee'), 2, 149.90),
	((SELECT id FROM shopping_cart WHERE user_id = (SELECT id FROM users WHERE email = 'lara.costa@eden.com')),
	 (SELECT id FROM product WHERE title = 'Prada Hydrate Bottle'), 1, 129.00),
	((SELECT id FROM shopping_cart WHERE user_id = (SELECT id FROM users WHERE email = 'diego.martins@eden.com')),
	 (SELECT id FROM product WHERE title = 'Gymshark Blue Oversized Hoodie'), 1, 279.50),
	((SELECT id FROM shopping_cart WHERE user_id = (SELECT id FROM users WHERE email = 'diego.martins@eden.com')),
	 (SELECT id FROM product WHERE title = 'White Performance Joggers'), 1, 229.00),
	((SELECT id FROM shopping_cart WHERE user_id = (SELECT id FROM users WHERE email = 'marina.lopes@eden.com')),
	 (SELECT id FROM product WHERE title = 'Emerald Seamless Legging'), 1, 259.00);

-- Orders (one per user because of the unique constraint on user_id)
INSERT INTO orders (user_id, shopping_cart_id, order_address_id, status, created_at) VALUES
	((SELECT id FROM users WHERE email = 'lara.costa@eden.com'),
	 (SELECT id FROM shopping_cart WHERE user_id = (SELECT id FROM users WHERE email = 'lara.costa@eden.com')),
	 (SELECT id FROM order_address WHERE user_id = (SELECT id FROM users WHERE email = 'lara.costa@eden.com')),
	 'PAID', TIMESTAMP '2026-01-12 09:45:00'),
	((SELECT id FROM users WHERE email = 'diego.martins@eden.com'),
	 (SELECT id FROM shopping_cart WHERE user_id = (SELECT id FROM users WHERE email = 'diego.martins@eden.com')),
	 (SELECT id FROM order_address WHERE user_id = (SELECT id FROM users WHERE email = 'diego.martins@eden.com')),
	 'SHIPPED', TIMESTAMP '2026-01-11 14:20:00');

-- Order items
INSERT INTO order_item (order_id, product_id, quantity, unit_price) VALUES
	((SELECT id FROM orders WHERE user_id = (SELECT id FROM users WHERE email = 'lara.costa@eden.com')),
	 (SELECT id FROM product WHERE title = 'Gymshark Black Compression Tee'), 2, 149.90),
	((SELECT id FROM orders WHERE user_id = (SELECT id FROM users WHERE email = 'lara.costa@eden.com')),
	 (SELECT id FROM product WHERE title = 'Prada Hydrate Bottle'), 1, 129.00),
	((SELECT id FROM orders WHERE user_id = (SELECT id FROM users WHERE email = 'diego.martins@eden.com')),
	 (SELECT id FROM product WHERE title = 'Gymshark Blue Oversized Hoodie'), 1, 279.50),
	((SELECT id FROM orders WHERE user_id = (SELECT id FROM users WHERE email = 'diego.martins@eden.com')),
	 (SELECT id FROM product WHERE title = 'White Performance Joggers'), 1, 229.00);
