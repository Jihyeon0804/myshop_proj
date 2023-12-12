package com.myshop.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myshop.product.domain.Product;

@Repository
public interface ProductMapper {

	public List<Product> selectProductList();
	
	public Product selectProductById(int id);
	
	public List<Product> selectProductByCategoryId(int categoryId);
	
	public List<Product> selectProductByCategoryIdSubclassId(
			@Param("categoryId") int categoryId,
			@Param("subclassId") int subclassId);
}
