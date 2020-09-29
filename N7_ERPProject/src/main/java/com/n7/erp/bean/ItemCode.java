package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("itemcode")
@Data
@Accessors(chain=true)
public class ItemCode {
	private String it_code;
	private String it_ccode;
	private String it_pname;
	private String it_size;
	private String it_unit;
	private int it_pstock;
	private String it_cpcode;
}
