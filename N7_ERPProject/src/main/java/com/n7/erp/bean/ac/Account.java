package com.n7.erp.bean.ac;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("account")
@Accessors(chain=true)
@Data
public class Account{
	
	private String j_docunum;		//문서번호  A0001~
	private String j_ccode;			//회사코드 
	private String j_title;			//문서제목
	private String j_account;		//계정과목
	private String j_group;			//비용구분
	private String j_debit;			//차변금액
	private String j_credit;		//대변금액
	private String j_sumup;			//적요
	private String j_section;		//귀속부서
	private String j_centre;		//활동센터
	private String j_company; 		//관계회사
	private String j_none;			//결재자1 = 기안자 이름
	private String j_ntwo;			//결재자2
	private String j_nthr;			//결재자3
	private String j_grade;			//결재등급
	private String j_reasion;		//반려사유
	private String j_date;			//결재올린날짜
	
}
