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

-- Products (image paths reference files inside frontend/src/assets)
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
	('Emerald Seamless Legging', 'Legging feminina seamless com compressão moderada e acabamento opaco.',
	 259.00, 'clothes/women/gymshark-green-legging.jpeg', 28, 'LEGGING', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-09-18 13:25:00', TIMESTAMP '2025-12-11 12:10:00'),
	('Cloudy Oversized Tee', 'Camiseta oversized feminina em algodão orgânico e barra desfiada.',
	 199.90, 'clothes/women/gymshark-white-oversized-woman.jpeg', 32, 'SHIRTS', 'FEMININE', 'AVAILABLE',
	 TIMESTAMP '2025-08-30 10:05:00', NULL),
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
