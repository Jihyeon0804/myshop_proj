package com.myshop.option.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.option.entity.OptionEntity;
import com.myshop.option.repository.OptionRepository;

@Service
public class OptionBO {

	@Autowired
	private OptionRepository optionRepository;
	
	public List<OptionEntity> getOptionList(int optionId) {
		return optionRepository.findByOptionId(optionId);
	}
	
	public OptionEntity getOption(int id) {
		return optionRepository.findById(id).orElse(null);
	}
}
