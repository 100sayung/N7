package com.n7.erp.bean.hr;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Alias("payroll")
@Data
public class Payroll {
	private String HP_PAYDATE;
	private String HP_CCODE;
	private String HP_HRCODE;
	private String HP_TAX;
	private String HP_INCEN;
	private String HP_INSURANCE;
	private String HP_REALMONEY;
	private String HDP_PAY;
}
