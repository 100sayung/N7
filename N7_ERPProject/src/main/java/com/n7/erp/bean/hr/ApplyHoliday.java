package com.n7.erp.bean.hr;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("applyholiday")
@Accessors(chain = true)
@Data
public class ApplyHoliday { //휴가신청양식
	String hap_docunum;
	String hap_ccode;
	String hap_hrcode;
	String hap_docuname;
	String hap_fromapprover;
	String hap_toapprover;
	String hap_applydate;
	String hap_type;
	String hap_reason;
	String hap_startday;
	String hap_endday;
	String hap_status;
}
