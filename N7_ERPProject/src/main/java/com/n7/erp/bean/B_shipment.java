package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@Alias("shipment")
public class B_shipment {

	private String bs_docunum;
	private String bs_ccode;
	private String bs_bonum;
	private String bs_itcode;
	private String bs_clcode;
	private String bs_name;
	private String bs_approval1;
	private String bs_approval2;
	private String bs_approval3;
	private String bs_date;
	private int bs_unit;
	private int bs_quantity;
	private int bs_price;
	private String bs_status;
	private String bs_proname;
	private String it_code;
	private String it_ccode;
	private String it_pname;
	private String it_size;
	private String it_unit;
	private int it_pstock;
	private String it_cpcode;

}
