package com.n7.erp.bean.hr;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("viewpay")
@Accessors(chain = true)
@Data
public class ViewPay {
	private int HDP_PAY;
	private String HP_PAYDATE;
	private String HC_CCODE;
	private String HC_HRCODE;
	private String HC_ID;
	private String HC_DEPT;
	private String HC_POSITION;
	private String HDP_AUTH;
	private int HDD_AMOUNT;
	private String M_NAME;
	private String HP_TAX;
	private String HP_INCEN;
	private String HP_INSURANCE;
	private String HP_REALMONEY;
	private String HP_MONTHLYBONUS;
}
