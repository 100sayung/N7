package com.n7.erp.bean.ps;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("Purchase")
@Accessors(chain = true)
public class Purchase {
	private String p_documentcode; 
	private String p_productnum;
	private String p_ccode; 
	private String p_day; 
	private String p_clcode; 
	private String p_writer; 
	private String p_itcode; 
	private String p_name; 
	private int p_budget; 
	private String it_code;
	private String it_pname;
	private String it_size;
	private String it_unit;
	private String p_account;
	private int p_amount;
	private int p_sum;
	private String p_date;
	private int p_situation;
	private String p_num;
	private int p_unlit;
	
}
