package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("approvaldocu")
@Accessors(chain = true)
@Data
public class ApprovalDocu { //결재문서양식
	String ap_docunum;
	String ap_ccode;
	String ap_docuname;
	String ap_fromapprover;
	String ap_toapprover;
	///--------
	String ap_date; //DATE가 아니라 STRING 형식임!!!!!!!!!! 수정해야할이유있으면 말해주세요!!!!
	///---------
	String ap_status;
}
