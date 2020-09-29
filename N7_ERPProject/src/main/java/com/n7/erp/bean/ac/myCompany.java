package com.n7.erp.bean.ac;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("myCom")
@Accessors(chain=true)
public class myCompany {
	private String c_code;
	private String c_name;
	private String c_ceo;
	private String c_num;
	private String c_addr;
	private String c_kind;
	private String c_kind2;
	private String c_comnum;
	
}
