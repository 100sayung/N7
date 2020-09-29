package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("ieport")
@Accessors(chain=true)
public class IePort {

	private String ie_itcode;
	private String ie_account;
	private String ie_date;
	private String ie_etc;
	private int ie_status;
	private String ie_pnum;
	private int ie_price;
	private String ie_hrcode;
	private int ie_qty;
	private String ie_cpcode;
	
}
