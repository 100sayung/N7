package com.n7.erp.bean.ac;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("rs")
@Accessors(chain=true)
public class ApprovalDocument {
	
	private String rs_ccode;
	private String rs_clcode;	
	private String rs_date;
	private String rs_title;
	private String rs_apcode0;
	private String rs_apcode1;
	private String rs_apcode2;
	private String rs_apname0;
	private String rs_apname1;
	private String rs_apname2;
	private String rs_num;
	private String rs_kind;
	private String rs_company;
	private String rs_comnum;
	private String rs_sdate;
	private String rs_employee;
	private String rs_dept;
	private String rs_pkind;
	private String rs_cnt;
	private String rs_price;
	private String rs_price2;
	private String rs_tax;
	private String rs_total;
	private String rs_memo;
	private String rs_status;
	private String rs_reason;
}
