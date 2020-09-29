package com.n7.erp.dao;

import org.apache.ibatis.annotations.Insert;

import com.n7.erp.bean.ApprovalDocu;

public interface IBaiscDao {

	//결재문서양식에 !!휴가!! 정보기록함!!
	@Insert("INSERT INTO APPROVALDOCU VALUES(#{ap_docunum}||HR_APPLYHOLIDAY_SEQ.nextval,"
			+ "#{ap_ccode}, #{ap_docuname}, #{ap_fromapprover}, #{ap_toapprover}, DEFAULT, DEFAULT)")
	boolean registHolidayApprovalDocu(ApprovalDocu docu);
}
