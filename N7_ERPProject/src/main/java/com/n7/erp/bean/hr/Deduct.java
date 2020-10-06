package com.n7.erp.bean.hr;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Alias("deduct")
@Data
public class Deduct {
	private String HDD_NAME;
	private int HDD_AMOUNT;
	private String hdd_ccode;
}
