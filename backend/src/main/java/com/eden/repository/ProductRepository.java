package com.eden.repository;

import com.eden.models.ProductModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<ProductModel, Integer> {
    Optional<ProductModel> findById(Integer id);
    Optional<ProductModel> findProductByName(String name);
    List<ProductModel> findAllProductsByCategory(String category);

}
