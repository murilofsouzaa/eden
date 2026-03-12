package com.eden.service.product;

import com.eden.dto.product.CreateProductRequest;
import com.eden.dto.product.ProductResponse;
import com.eden.dto.product.UpdateProductRequest;
import com.eden.model.order.OrderStatus;
import com.eden.mapper.ProductMapper;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductGender;
import com.eden.model.product.ProductStatus;
import com.eden.repository.ProductRepository;
import com.eden.repository.OrderItemRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class    ProductService {

    final private ProductRepository productRepository;
    final private OrderItemRepository orderItemRepository;

    public ProductService(ProductRepository productRepository,
        OrderItemRepository orderItemRepository
    ){
        this.productRepository = productRepository;
        this.orderItemRepository = orderItemRepository;
    }

    public ProductResponse createProduct(CreateProductRequest createProductRequest){
        LocalDateTime createdAt = LocalDateTime.now();
        isFieldsNull(
            createProductRequest.title(),
            createProductRequest.description(),
            createProductRequest.price(),
            createProductRequest.imgURL(),
            createProductRequest.stock(),
            createProductRequest.category(),
            createdAt
        );

        Product product = new Product();
        product.setTitle(createProductRequest.title());
        product.setDescription(createProductRequest.description());
        product.setPrice(createProductRequest.price());
        product.setStock(createProductRequest.stock());
        product.setCategory(createProductRequest.category());
        product.setStatus(createProductRequest.status());
        product.setCreatedAt(createdAt);
        product.setImgURL(createProductRequest.imgURL());

        productRepository.save(product);

        return ProductMapper.toResponse(product);
    }

        public ProductResponse updateProduct(Long id, UpdateProductRequest updateProductRequest){
            Product updateProduct = productRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found!"));
             isProductIdNull(updateProduct.getId());

            isFieldsNull(
                updateProductRequest.title(),
                updateProductRequest.description(),
                updateProductRequest.price(),
                updateProductRequest.imgURL(),
                updateProductRequest.stock(),
                updateProductRequest.category(),
                updateProductRequest.updatedAt()
            );

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

        isProductIdNull(product.getId());

        productRepository.delete(product);

        return ProductMapper.toResponse(product);
    }

    public ProductResponse getProductById(Long id){
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found!"));

        isProductIdNull(product.getId());

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

    public List<ProductResponse> getAllProductsByGender(ProductGender gender){
        List<Product> products = productRepository.findByGender(gender);
        return ProductMapper.toResponseList(products);
    }

    public List<ProductResponse> getAllAcessories(){
        List<Product> products = productRepository.findByCategoryIn(
            List.of(
                ProductCategories.BAGS,
                ProductCategories.CAPS,
                ProductCategories.BELTS,
                ProductCategories.HATS,
                ProductCategories.WATER_BOTTLE,
                ProductCategories.ACCESSORY
            )
        );
        return ProductMapper.toResponseList(products);
    }   

    public List<ProductResponse> getBestSellers(OrderStatus status){
        List<Product> products = orderItemRepository.findTopBestSellers(status);
        return ProductMapper.toResponseList(products);
    }

    private void isProductIdNull(Long id){
        if(id == null){
            throw new IllegalArgumentException("Id cannot be null");
        }else if (id.toString().equals("")){
            throw new IllegalArgumentException("The id cannot be empty");
        }
    }

    private void isFieldsNull(String title, String description, BigDecimal price, String imgURL, int stock,
                              ProductCategories category, LocalDateTime createdAt){

        if(title == null){
            throw new IllegalArgumentException("Title cannot be null");
        }
        if(description == null){
            throw new IllegalArgumentException("Description cannot be null");
        }
        if(price == null){
            throw new IllegalArgumentException("Price cannot be null");
        }
        if(imgURL == null){
            throw new IllegalArgumentException("Image URL cannot be null");
        }
        if(stock < 0){
            throw new IllegalArgumentException("Stock cannot be negative");
        }
        if(category == null){
            throw new IllegalArgumentException("Category cannot be null");
        }
        if(createdAt == null){
            throw new IllegalArgumentException("CreatedAt cannot be null");
        }

    }

}

