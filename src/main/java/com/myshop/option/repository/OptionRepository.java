package com.myshop.option.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.myshop.option.entity.OptionEntity;

@Repository
public interface OptionRepository extends JpaRepository<OptionEntity, Integer> {

	public List<OptionEntity> findByOptionId(int optionId);
}
