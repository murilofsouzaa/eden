-- Inserir usuários
INSERT INTO users (name, email, password, birth_day, gender, role, status, created_at) VALUES
('João Silva', 'joao.silva@email.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1990-05-15', 'MALE', 'USER', 'ACTIVE', NOW()),
('Maria Santos', 'maria.santos@email.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1995-08-22', 'FEMALE', 'USER', 'ACTIVE', NOW()),
('Pedro Costa', 'pedro.costa@email.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1988-12-03', 'MALE', 'ADMIN', 'ACTIVE', NOW()),
('Ana Oliveira', 'ana.oliveira@email.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1992-03-18', 'FEMALE', 'USER', 'ACTIVE', NOW()),
('Carlos Ferreira', 'carlos.ferreira@email.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '1985-07-30', 'MALE', 'USER', 'INACTIVE', NOW());

-- Inserir endereços
INSERT INTO address (street, number, neighborhood, city, state, zip_code, country, user_id) VALUES
('Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', '01310-100', 'Brasil', 1),
('Av. Paulista', 1500, 'Bela Vista', 'São Paulo', 'SP', '01310-200', 'Brasil', 1),
('Rua Augusta', 456, 'Consolação', 'São Paulo', 'SP', '01305-000', 'Brasil', 2),
('Av. Ipiranga', 789, 'República', 'São Paulo', 'SP', '01046-010', 'Brasil', 3),
('Rua Oscar Freire', 321, 'Jardins', 'São Paulo', 'SP', '01426-001', 'Brasil', 4);

-- Inserir produtos (roupas e acessórios)
INSERT INTO product (title, description, price, stock, category, status, img_url, created_at) VALUES
('Camiseta Básica Branca', 'Camiseta 100% algodão, confortável e versátil', 49.90, 150, 'T_SHIRTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400', NOW()),
('Camiseta Preta Premium', 'Camiseta premium com acabamento de qualidade', 79.90, 100, 'T_SHIRTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=400', NOW()),
('Camisa Social Azul', 'Camisa social slim fit, ideal para trabalho', 129.90, 80, 'SHIRTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400', NOW()),
('Camisa Xadrez Vermelha', 'Camisa xadrez casual, perfeita para o dia a dia', 99.90, 120, 'SHIRTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400', NOW()),
('Calça Jeans Slim', 'Calça jeans slim fit com elastano', 159.90, 90, 'PANTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400', NOW()),
('Calça Cargo Bege', 'Calça cargo estilo militar, muitos bolsos', 189.90, 60, 'PANTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400', NOW()),
('Tênis Esportivo Nike', 'Tênis confortável para corrida e caminhada', 299.90, 50, 'SHOES', 'AVAILABLE', 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400', NOW()),
('Bota Chelsea Marrom', 'Bota chelsea em couro legítimo', 399.90, 30, 'SHOES', 'AVAILABLE', 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?w=400', NOW()),
('Boné Snapback Preto', 'Boné estilo snapback com logo bordado', 69.90, 200, 'CAPS', 'AVAILABLE', 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=400', NOW()),
('Boné Trucker Azul', 'Boné trucker com tela respirável', 59.90, 180, 'CAPS', 'AVAILABLE', 'https://images.unsplash.com/photo-1575428652377-a2d80e2277fc?w=400', NOW()),
('Moletom Com Capuz Cinza', 'Moletom quentinho com capuz e bolso canguru', 149.90, 70, 'SWEATSHIRTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400', NOW()),
('Moletom Oversized Preto', 'Moletom oversized streetwear', 179.90, 55, 'SWEATSHIRTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=400', NOW()),
('Camiseta Listrada', 'Camiseta listrada estilo navy', 69.90, 0, 'T_SHIRTS', 'UNAVAILABLE', 'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=400', NOW()),
('Sapato Social Preto', 'Sapato social em couro para ocasiões formais', 249.90, 40, 'SHOES', 'AVAILABLE', 'https://images.unsplash.com/photo-1614252369475-531eba835eb1?w=400', NOW()),
('Calça Jogger Preta', 'Calça jogger moderna e confortável', 139.90, 95, 'PANTS', 'AVAILABLE', 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=400', NOW());

-- Inserir carrinhos de compras
INSERT INTO shopping_cart (status, created_at, user_id) VALUES
(true, NOW(), 1),
(true, NOW(), 2),
(false, NOW() - INTERVAL '5 days', 3),
(true, NOW(), 4);

-- Inserir itens no carrinho
INSERT INTO shopping_cart_item (quantity, unit_price, cart_id, product_id) VALUES
(2, 49.90, 1, 1),
(1, 159.90, 1, 5),
(3, 69.90, 2, 9),
(1, 299.90, 2, 7),
(2, 149.90, 4, 11),
(1, 179.90, 4, 12);

-- Inserir endereços de pedido
INSERT INTO order_address (street, number, neighborhood, city, state, zip_code, country, user_id) VALUES
('Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', '01310-100', 'Brasil', 1),
('Rua Augusta', 456, 'Consolação', 'São Paulo', 'SP', '01305-000', 'Brasil', 2),
('Av. Ipiranga', 789, 'República', 'São Paulo', 'SP', '01046-010', 'Brasil', 3);

-- Inserir pedidos
INSERT INTO orders (created_at, status, user_id, order_address_id, shopping_cart_id) VALUES
(NOW() - INTERVAL '10 days', 5, 1, 1, NULL),
(NOW() - INTERVAL '7 days', 4, 2, 2, NULL),
(NOW() - INTERVAL '3 days', 2, 3, 3, 3);

-- Inserir itens do pedido
INSERT INTO order_item (quantity, unit_price, order_id, product_id) VALUES
-- Pedido 1
(1, 49.90, 1, 1),
(2, 79.90, 1, 2),
(1, 299.90, 1, 7),
-- Pedido 2
(3, 69.90, 2, 9),
(1, 159.90, 2, 5),
(1, 149.90, 2, 11),
-- Pedido 3
(2, 129.90, 3, 3),
(1, 399.90, 3, 8);

-- Associar endereços aos usuários
INSERT INTO users_address_list (user_id, address_list_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);
