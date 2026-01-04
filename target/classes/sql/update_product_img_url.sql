-- Atualiza os caminhos de imagem dos produtos para arquivos servidos pelo Vite/Spring (frontend/public)
-- As imagens estão em: frontend/public/clothes
-- O valor salvo no banco deve ser um path absoluto do site, ex: /clothes/arquivo.jpeg

BEGIN;

-- Mapeamento por título (mais estável que por ID):
-- Observação: os paths estão URL-encoded para lidar com espaços e acentos.
-- (Ciclo de 5 imagens) - ajuste livremente se quiser um mapeamento específico.
UPDATE product SET img_url = '/clothes/_.jpeg'
WHERE title ILIKE 'Camiseta Básica Branca%';

UPDATE product SET img_url = '/clothes/_%20%281%29.jpeg'
WHERE title ILIKE 'Calça Jeans Premium%';

UPDATE product SET img_url = '/clothes/Nike%20Men%27s%20Rise%20365%20Tank%20Top%20Black%20S.jpeg'
WHERE title ILIKE 'Jaqueta de Couro%';

UPDATE product SET img_url = '/clothes/ALO%20Alosoft%20Heart%20Throb%20Bra%20in%20Black.jpeg'
WHERE title ILIKE 'Vestido Floral%';

UPDATE product SET img_url = '/clothes/2%20en%201%20Double%20Layer%20Shorts%20Poche%20Int%C3%A9rieure%20%C3%80%20Fermeture%20-%20Temu%20France.jpeg'
WHERE title ILIKE 'Shorts de Algodão%';

UPDATE product SET img_url = '/clothes/_.jpeg'
WHERE title ILIKE 'Blusa Elegante%';

UPDATE product SET img_url = '/clothes/_%20%281%29.jpeg'
WHERE title ILIKE 'Polo Masculina%';

UPDATE product SET img_url = '/clothes/Nike%20Men%27s%20Rise%20365%20Tank%20Top%20Black%20S.jpeg'
WHERE title ILIKE 'Saia Midi%';

UPDATE product SET img_url = '/clothes/ALO%20Alosoft%20Heart%20Throb%20Bra%20in%20Black.jpeg'
WHERE title ILIKE 'Jaqueta Bomber%';

UPDATE product SET img_url = '/clothes/2%20en%201%20Double%20Layer%20Shorts%20Poche%20Int%C3%A9rieure%20%C3%80%20Fermeture%20-%20Temu%20France.jpeg'
WHERE title ILIKE 'Legging Premium%';

UPDATE product SET img_url = '/clothes/_.jpeg'
WHERE title ILIKE 'Moletom%';

UPDATE product SET img_url = '/clothes/_%20%281%29.jpeg'
WHERE title ILIKE 'Sapato%';

COMMIT;
