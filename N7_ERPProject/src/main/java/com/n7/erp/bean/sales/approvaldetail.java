package com.n7.erp.bean.sales;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("appdetail")
@Accessors(chain = true)

//출하공통, 출하결재, 미수금 등록 bean
public class approvaldetail {
   private String bs_docunum; //문서번호(출하번호)
   private String bs_ccode;
   private String bs_docuname; 
   private String bs_approver1; //원래 이거였음-ad_apcode0
   private String bs_date; //날짜  //private String bs_date;
//   private String bs_toapprover; //결재자 
   private String bs_bonum;
   private String bs_itcode;
   private String bs_clcode;
   private String bs_approver2;
   private String bs_approver3;
   private String bs_basedate; //예상남기일
   private int bs_unit; //단가
   private int bs_quantity; //수량
   private int bs_price; //현미수액
   private String bs_status; //상태코드
   private String bs_proname; //제품명
   private String bs_credit; //외상, 완납
    private String bs_ect; //기타
    private String bu_person; //등록자
    private String bs_name; //제목
    private String bs_apcode1; //사원코드?
    private String bs_apcode2;
    private String bs_apcode3;

}