package com.eden.services;

import com.eden.models.ProductModel;

import java.math.BigDecimal;

public interface IProductDiscountCalculator {
    public BigDecimal calculateProductDiscount(ProductModel product, double discountRate);
}
