package com.eden.mapper;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import com.eden.dto.product.ProductResponse;
import com.eden.dto.product.ProductVariantResponse;
import com.eden.model.product.Product;
import com.eden.model.product.ProductImage;
import com.eden.model.product.ProductVariant;

public class ProductMapper {

    public static ProductResponse toResponse (Product product){
        return new ProductResponse(
                product.getId(),
                product.getTitle(),
                product.getDescription(),
                product.getImageUrl(),
                buildGallery(product),
                product.getCreatedAt(),
                product.getUpdatedAt(),
                product.getVariants()
                        .stream()
                        .map(ProductMapper::toVariantResponse)
                        .collect(Collectors.toList())
                );
    }

    public static List<ProductResponse> toResponseList(List<Product> products){
        return products.stream()
                .map(ProductMapper::toResponse)
                .toList();
    }

    private static List<String> buildGallery(Product product) {
        return product.getImages()
                .stream()
                .sorted(Comparator.comparing(ProductImage::isMain).reversed())
                .map(ProductImage::getUrl)
                .toList();
    }

    private static ProductVariantResponse toVariantResponse(ProductVariant variant) {
        return new ProductVariantResponse(
                variant.getId(),
                variant.getSku(),
                variant.getColor(),
                variant.getSize(),
                variant.getPrice(),
                variant.getStock(),
                variant.getCategory(),
                variant.getGender(),
                variant.getStatus(),
                variant.isDefaultVariant()
        );
    }
}
