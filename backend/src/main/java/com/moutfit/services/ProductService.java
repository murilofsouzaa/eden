package com.moutfit.services;

import com.moutfit.dto.product.ProductRequestDTO;
import com.moutfit.dto.product.ProductResponseDTO;
import com.moutfit.dto.product.ProductUpdate;
import com.moutfit.models.Product;
import com.moutfit.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product getProductById(Integer id){
        return productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));

    }

    public ProductResponseDTO add(ProductRequestDTO productRequestDTO) {
        Product product = new Product();
        product.setName(productRequestDTO.name());
        product.setDescription(productRequestDTO.description());
        product.setPrice(productRequestDTO.price());
        product.setCategory(productRequestDTO.category());
        product.setImage(productRequestDTO.image());

        productRepository.save(product);

        return new ProductResponseDTO(
                product.getId(),
                product.getName(),
                product.getDescription(),
                product.getPrice(),
                product.getCategory(),
                product.getImage(),
                product.getQuantity()
        );
    }



    public void remove(Integer id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        productRepository.delete(product);
    }

    public ProductResponseDTO findByName(String name){
        Product product = productRepository.findProductByName(name)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        return new ProductResponseDTO(
                product.getId(),
                product.getName(),
                product.getDescription(),
                product.getPrice(),
                product.getCategory(),
                product.getImage(),
                product.getQuantity()
        );
    }

    public List<ProductResponseDTO> findAll() {
         return productRepository.findAll()
                .stream().map(product ->
                        new ProductResponseDTO(
                                product.getId(),
                                product.getName(),
                                product.getDescription(),
                                product.getPrice(),
                                product.getCategory(),
                                product.getImage(),
                                product.getQuantity()
                        )).toList();
    }
}
