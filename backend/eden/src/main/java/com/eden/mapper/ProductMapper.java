package com.eden.mapper;

import com.eden.dto.product.ProductResponse;
import com.eden.model.product.Product;

import java.util.List;

public class ProductMapper {

    public static ProductResponse toResponse (Product product){
        return new ProductResponse(
                product.getId(),
                product.getTitle(),
                product.getDescription(),
                product.getPrice(),
                product.getStock(),
                product.getCategory(),
                product.getStatus(),
                product.getCreatedAt(),
                product.getImgURL()
                );
    }

    public static List<ProductResponse> toResponseList(List<Product> products){
        return products.stream()
                .map(ProductMapper::toResponse)
                .toList();
    }
}
