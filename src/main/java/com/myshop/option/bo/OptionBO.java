package com.myshop.option.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.option.domain.Option;
import com.myshop.option.mapper.OptionMapper;

@Service
public class OptionBO {

	@Autowired
	private OptionMapper optionMapper;
	
	public List<Option> getOptionListByProductId(int productId) {
		return optionMapper.selectOptionListByProductId(productId);
	}
	
	public List<String> getOptionNameListByProductId(int productId) {
		return optionMapper.selectOptionNameListByProductId(productId);
	}
}
