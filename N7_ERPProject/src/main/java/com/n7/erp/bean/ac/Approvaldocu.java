package com.n7.erp.bean.ac;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("ap")
@Accessors(chain=true)
public class Approvaldocu {
	private String ap_docunum;
	private String ap_ccode;
	private String ap_docuname;
	private String ap_fromapprover;
	private String ap_toapprover;
	private String ap_date;
	private String ap_status;

}
