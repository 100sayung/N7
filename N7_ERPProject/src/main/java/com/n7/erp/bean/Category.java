package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("category")
@Accessors(chain=true)
@Data
public class Category {

	private String ct_name;
	private String ct_code;
	private String ct_cpcode;
	
}
