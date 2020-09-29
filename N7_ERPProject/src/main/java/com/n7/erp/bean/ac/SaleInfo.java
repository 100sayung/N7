package com.n7.erp.bean.ac;




import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("saleInfo")
@Accessors(chain=true)
public class SaleInfo {
   private String s_num;
   private String s_ccode;
   private String s_clcode;
   private String s_kind;
   private String s_company;
   private String s_comnum;
   private String s_date;
   private String s_employee;
   private String s_pkind;
   private String s_cnt;
	private String s_price;
	private String s_price2;
	private String s_tax;
	private String s_total;
	private String s_memo;
	private String s_saleSelect;
   
}
