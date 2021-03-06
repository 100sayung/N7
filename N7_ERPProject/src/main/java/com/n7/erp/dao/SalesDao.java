package com.n7.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.n7.erp.bean.sales.A_company;
import com.n7.erp.bean.sales.Businessbean;
import com.n7.erp.bean.sales.Salesbean;
import com.n7.erp.bean.sales.Shippingbean;
import com.n7.erp.bean.sales.Uncollectedbean;
import com.n7.erp.bean.sales.approvalLine;
import com.n7.erp.bean.sales.approvaldetail;

@Mapper
@Component
public interface SalesDao {

   List<Salesbean> orderitem(@Param("cCode") String cCode); //수주품목

   boolean orderregistrationinput(Salesbean s); //수주등록

   List<Salesbean> orderregistrationsearch(@Param("search") String search, @Param("choice") String choice, @Param("cCode") String cCode); //수주검색

   boolean orderregistrationdelete(@Param("check") String check, @Param("cCode") String cCode); //수주삭제

   boolean shippingrequestinput(Shippingbean ss); //출하등록

   //boolean shippingdelete(String check); //출하삭제

   List<Shippingbean> shippingitem(@Param("cCode") String cCode); //출하품목

   List<Shippingbean> shippingrequestsearch(@Param("search") String search, @Param("choice") String choice, @Param("cCode") String cCode); //출하검색

   boolean shippingrequestdelete(@Param("check") String check, @Param("cCode") String cCode); //출하삭제

   List<Shippingbean> approvalplan(@Param("cCode") String cCode); //출하결재창

   Shippingbean approvalplanchoice(@Param("check") String check, @Param("cCode") String cCode);

   List<Businessbean> businessitem(@Param("cCode") String cCode);

   List<com.n7.erp.bean.sales.approvalLine> approvalLine();

   List<com.n7.erp.bean.sales.approvalLine> searchName(String name);

//   List<com.n7.erp.bean.sales.approvalLine> addApproval(approvaldetail app); //String code01

   List<com.n7.erp.bean.sales.approvalLine> addApproval(String code);

   com.n7.erp.bean.sales.approvalLine approLinecom1(String code01);

   //com.n7.erp.bean.sales.approvalLine approLinecom2(String code02);

   List<com.n7.erp.bean.sales.approvalLine> getMyInfo(String code);

   boolean approvalinput(approvaldetail app); //결재창 등록

   boolean approvalinput2(approvaldetail app); //결재창 등록2

   boolean uncollectedmoneyinput(approvaldetail ap); //미수금 등록

   List<approvaldetail> uncollectedmoneyitem(@Param("cCode") String cCode); //미수금 품목

   List<approvaldetail> uncollectedmoneyitem2(@Param("cCode") String cCode); //미수금품목2

   List<approvaldetail> uncollectedmoneysearch(@Param("search") String search, @Param("choice") String choice, @Param("cCode") String cCode); //미수금 검색

   List<approvaldetail> creditsearch(@Param("cCode") String cCode); //외상

   List<approvaldetail> fullpaymentsearch(@Param("cCode") String cCode); //완납

   boolean fullpaymentprocess(@Param("check") String check, @Param("cCode") String cCode); //완납처리

   boolean businessactivitiesinput(Businessbean b); //영업활동 등록

   List<Businessbean> businessactivitiessearch(@Param("search") String search, @Param("choice") String choice, @Param("cCode") String cCode); //영업활동 검색

   boolean businessactivitiesdelete(@Param("check") String check, @Param("cCode") String cCode);

   Shippingbean getbonum(@Param("check") String check, @Param("cCode") String cCode); //삭제

   boolean approvaldetailinput(approvaldetail app); //결재 상세 등록

   List<Salesbean> getbonumm(String cCode); //수주번호

   approvaldetail sRequest(@Param("bs_docunum") String bs_docunum, @Param("cCode") String cCode); // 내가올린 결재안상세

   com.n7.erp.bean.sales.approvalLine getApprinfo(String code); //결재안에서 결재자 표시

   approvaldetail sRequest2(@Param("bs_docunum") String bs_docunum, @Param("cCode") String cCode); //내가 받은 결재안 상세

   approvaldetail approvaldetailinput(@Param("bs_docunum") String bs_docunum, @Param("cCode") String cCode); //결재 상세 el문

   approvaldetail downapprovaldetailinput(@Param("bs_docunum") String bs_docunum, @Param("cCode") String cCode);

   List<Salesbean> getsearchCode(@Param("code") String code,@Param("cCode") String cCode);

   int compareCode(@Param("check")String check,@Param("cCode") String cCode);

   com.n7.erp.bean.sales.approvalLine getbodept(@Param("cCode") String cCode, @Param("hrCode") String hrCode);

}
