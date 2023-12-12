package com.myshop.option.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myshop.option.domain.Option;

@Repository
public interface OptionMapper {

	public List<Option> selectOptionListByProductId(int productId);
	
	public List<String> selectOptionNameListByProductId(int productId);
}
