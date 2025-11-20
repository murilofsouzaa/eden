package com.eden.services;

import com.eden.dto.product.ProductRequestDTO;
import com.eden.dto.product.ProductResponseDTO;
import com.eden.dto.product.ProductUpdateDTO;
import com.eden.models.ProductModel;
import com.eden.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public ProductResponseDTO getProductById(Integer id){
        ProductModel productModel = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        return new ProductResponseDTO(
                productModel.getId(),
                productModel.getName(),
                productModel.getDescription(),
                productModel.getPrice(),
                productModel.getCategory(),
                productModel.getImageURL(),
                productModel.getQuantity(),
                productModel.getStatus()
        );
    }

    public ProductResponseDTO getByName(String name){
        ProductModel productModel = productRepository.findProductByName(name)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        return new ProductResponseDTO(
                productModel.getId(),
                productModel.getName(),
                productModel.getDescription(),
                productModel.getPrice(),
                productModel.getCategory(),
                productModel.getImageURL(),
                productModel.getQuantity(),
                productModel.getStatus()
        );
    }

    public List<ProductResponseDTO> getAll() {
        return productRepository.findAll()
                .stream().map(productModel ->
                        new ProductResponseDTO(
                                productModel.getId(),
                                productModel.getName(),
                                productModel.getDescription(),
                                productModel.getPrice(),
                                productModel.getCategory(),
                                productModel.getImageURL(),
                                productModel.getQuantity(),
                                productModel.getStatus()
                        )).toList();
    }

    public ProductResponseDTO add(ProductUpdateDTO productRequestDTO) {
        ProductModel productModel = new ProductModel();
        productModel.setName(productRequestDTO.name());
        productModel.setDescription(productRequestDTO.description());
        productModel.setPrice(productRequestDTO.price());
        productModel.setCategory(productRequestDTO.category());
        productModel.setImageURL(productRequestDTO.image());

        productRepository.save(productModel);

        return new ProductResponseDTO(
                productModel.getId(),
                productModel.getName(),
                productModel.getDescription(),
                productModel.getPrice(),
                productModel.getCategory(),
                productModel.getImageURL(),
                productModel.getQuantity(),
                productModel.getStatus()
        );
    }

    public ProductResponseDTO update(ProductRequestDTO productRequestDTO) {
        ProductModel productModel = new ProductModel();
        productModel.setName(productRequestDTO.name());
        productModel.setDescription(productRequestDTO.description());
        productModel.setPrice(productRequestDTO.price());
        productModel.setCategory(productRequestDTO.category());
        productModel.setImageURL(productRequestDTO.image());

        productRepository.save(productModel);

        return new ProductResponseDTO(
                productModel.getId(),
                productModel.getName(),
                productModel.getDescription(),
                productModel.getPrice(),
                productModel.getCategory(),
                productModel.getImageURL(),
                productModel.getQuantity(),
                productModel.getStatus()
        );
    }

    public ProductResponseDTO updateById(Integer id, ProductUpdateDTO productUpdateDTO) {
        ProductModel productModel = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        productModel.setName(productUpdateDTO.name());
        productModel.setDescription(productUpdateDTO.description());
        productModel.setPrice(productUpdateDTO.price());
        productModel.setCategory(productUpdateDTO.category());
        productModel.setImageURL(productUpdateDTO.image());

        productRepository.save(productModel);

        return new ProductResponseDTO(
                productModel.getId(),
                productModel.getName(),
                productModel.getDescription(),
                productModel.getPrice(),
                productModel.getCategory(),
                productModel.getImageURL(),
                productModel.getQuantity(),
                productModel.getStatus()
        );
    }


    public void delete(Integer id) {
        ProductModel productModel = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        productRepository.delete(productModel);
    }


}
