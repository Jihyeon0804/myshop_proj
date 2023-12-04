package com.myshop.product.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myshop.product.domain.Product;

@Repository
public interface ProductMapper {

	public List<Product> selectProductList();
	
	public Product selectProductById(int id);
}
