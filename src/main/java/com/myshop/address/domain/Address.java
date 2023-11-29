package com.myshop.address.domain;

import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Address {

	@JsonProperty("common")
	private Map<String, Object> header;
	
	@JsonProperty("juso")
	private List<Map<String, Object>> address;
}
