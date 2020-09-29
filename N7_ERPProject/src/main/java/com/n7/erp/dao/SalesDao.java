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
   
//   boolean insertcomlist(A_company ac);

//   List<A_company> getComList(String cl_code);

//   List<A_company> getCompanyList();

//   List<A_company> getsearchCode(A_company ac);

//   boolean deleteCom(String code);
   
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

//   List<Shippingbean> shippingquantity(String check, String cCode); //출하수량비교

//   boolean approvaldelete(String check); //결재완료 삭제


}
