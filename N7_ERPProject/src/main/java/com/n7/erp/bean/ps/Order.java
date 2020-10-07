package com.n7.erp.bean.ps;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("order")
@Accessors(chain = true)
public class Order {
	private String o_code;
	private String o_ccode;
	private String o_status;
	private String o_pdocucode;
}
