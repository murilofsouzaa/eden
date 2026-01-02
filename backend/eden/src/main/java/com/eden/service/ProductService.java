package com.eden.service;

import com.eden.dto.product.CreateProductRequest;
import com.eden.dto.product.ProductResponse;
import com.eden.dto.product.UpdateProductRequest;
import com.eden.mapper.ProductMapper;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductStatus;
import com.eden.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class    ProductService {

    final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    public ProductResponse createProduct(CreateProductRequest createProductRequest){
        Product product = new Product();
        product.setTitle(createProductRequest.title());
        product.setDescription(createProductRequest.description());
        product.setPrice(createProductRequest.price());
        product.setStock(createProductRequest.stock());
        product.setCategory(createProductRequest.category());
        product.setStatus(createProductRequest.status());
        product.setCreatedAt(LocalDateTime.now());
        product.setImgURL(createProductRequest.imgURL());

        productRepository.save(product);

        return ProductMapper.toResponse(product);
    }

        public ProductResponse updateProduct(Long id, UpdateProductRequest updateProductRequest){
            Product updateProduct = productRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found!"));

            updateProduct.setTitle(updateProductRequest.title());
            updateProduct.setDescription(updateProductRequest.description());
            updateProduct.setPrice(updateProductRequest.price());
            updateProduct.setStock(updateProductRequest.stock());
            updateProduct.setCategory(updateProductRequest.category());
            updateProduct.setImgURL(updateProductRequest.imgURL());
            updateProduct.setStatus(updateProductRequest.status());
            updateProduct.setUpdatedAt(updateProductRequest.updatedAt());

            productRepository.save(updateProduct);

            return ProductMapper.toResponse(updateProduct);
    }

    public ProductResponse deleteProduct(Long id){
        Product product  = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found!"));

        productRepository.delete(product);

        return ProductMapper.toResponse(product);
    }

    public ProductResponse getProductById(Long id){
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found!"));

        return ProductMapper.toResponse(product);
    }

    public List<ProductResponse> getAllProducts() {
        List<Product> products = productRepository.findAll();
        return ProductMapper.toResponseList(products);
    }

    public List<ProductResponse> getAllAvailableProducts(){
        List<Product> products = productRepository.findByStatus(ProductStatus.AVAILABLE);
        return ProductMapper.toResponseList(products);
    }

    public List<ProductResponse> getAllProductsByCategory(ProductCategories category){
        List<Product> products = productRepository.findByCategory(category);
                return ProductMapper.toResponseList(products);
    }

    public List<ProductResponse> getAllProductsBetweenPrice (BigDecimal minPrice, BigDecimal maxPrice){
       List<Product> products = productRepository.findByPriceBetween(minPrice, maxPrice);
        return ProductMapper.toResponseList(products);
    }

    public List<ProductResponse> getAllProductsByTextPart(String part){
       List<Product> products = productRepository.findByTitleContainingIgnoreCase(part);
        return ProductMapper.toResponseList(products);

    }

}

