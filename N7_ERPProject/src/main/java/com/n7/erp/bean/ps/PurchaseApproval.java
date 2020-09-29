package com.n7.erp.bean.ps;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@Alias("pApproval")
public class PurchaseApproval {
	private String p_documentcode;
	private String p_ccode;
	private String p_title;
	private String p_day;
	private String p_clcode;
	private String p_date;
	private String p_productnum;
	private String p_etc;
	private String p_apcode1;
	private String p_apcode2;
	private String p_apcode3;
	private String p_approver1;
	private String p_approver2;
	private String p_approver3;
	private String p_name;
	private String p_itcode;
	private int p_unlit;
	private int p_amount;
	private int p_budget;
}

