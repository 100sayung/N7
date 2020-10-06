package com.n7.erp.bean.ps;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@Alias("Return")
public class Return {
	private String r_documentcode; 
	private String r_ccode; 
	private String r_ieseqnum; 
	private String r_itcode;
	private String r_clcode;
	private String r_writer; 
	private String r_date; 
	private int r_amount; 
	private int r_unlit;
	private int r_budget;
	private String r_name; 
	private String r_reason; 
}
