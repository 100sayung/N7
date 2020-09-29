package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("category")
@Data
@Accessors(chain=true)
public class Category {

	private String ct_name;
	private String ct_code;
	private String ct_cpcode;
	
}
