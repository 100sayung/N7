package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain=true)
@Alias("ieport")
@Data
public class IePort {

	private String ie_seqnum;
	private String ie_cpcode;
	private String ie_date;
	private String ie_hrcode;
	private String ie_etc;
	private String ie_status;
	private String ie_clcode;
	private String ie_ocode;
	private String ie_itcode;
	private int ie_qty;
	private int ie_price;
	
}
