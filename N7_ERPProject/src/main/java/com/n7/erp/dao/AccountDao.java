package com.n7.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.n7.erp.bean.ac.A_company;
import com.n7.erp.bean.ac.Account;
import com.n7.erp.bean.ac.ApprovalDocument;
import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.ac.SaleInfo;
import com.n7.erp.bean.ac.approvalLine;
import com.n7.erp.bean.ac.myCompany;
import com.n7.erp.bean.ac.shipment;
import com.n7.erp.userClass.PagingVO;

@Mapper
@Component
public interface AccountDao {

	boolean insertcomlist(A_company ac);

	List<A_company> getComList(String cl_ccode);

	List<A_company> getCompanyList(@Param("use")String use,@Param("cCode") String cCode);

	List<A_company> getsearchCode(@Param("use")String use, @Param("code") String code, @Param("cCode") String cCode);

	boolean saleinsert(SaleInfo si);
	
	boolean saleinsert2(SaleInfo si);

	List<SaleInfo> getsaleList(String cCode);

	List<SaleInfo> getList(String code);

	List<SaleInfo> getTaxbill(String check);

	A_company getcomInfo(@Param("comnum")String comnum,@Param("cCode") String cCode);

	myCompany getmyCompany(String cCode);

	boolean deleteSale(@Param("code") String code,@Param("cCode") String cCode);

	boolean deleteSale2(String code, String cCode);
	
	List<approvalLine> approvalLine(String cCode);

	List<approvalLine> searchName(String name);

	com.n7.erp.bean.ac.approvalLine addApproval(String code);
	
	com.n7.erp.bean.ac.approvalLine approLinecom1(String code01);

	/*
	 * com.n7.erp.bean.ac.approvalLine approLinecom2(String code02);
	 */
	void saleListDelete(ApprovalDocument ad);

	List<SaleInfo> getpkind(String pkind);

	List<SaleInfo> getsaleList2();

	List<SaleInfo> saleDetaile(@Param("check")String check,@Param("cCode") String cCode);

	List<SaleInfo> saleDetaile2(@Param("check")String check,@Param("cCode") String cCode);


	List<SaleInfo> selectSreach(@Param("select") String select,@Param("choice") String choice);

	boolean approvaldocu(ApprovalDocument ad);

	boolean approdocument(ApprovalDocument ad);

	boolean approdocument2(ApprovalDocument ad);

	A_company getcomcode(String s_comnum);

	List<ApprovalDocu> comparecode(@Param("code") String code,@Param("cCode") String cCode);

	List<com.n7.erp.bean.ac.approvalLine> getMyInfo(String code);

	SaleInfo getDate(String s_num);

	List<shipment> getshipment(String cCode);

	boolean trensCom(@Param("use")String use,@Param("code") String code,@Param("cCode")String cCode);

//	public List<ApprovalDocu> apupPaymentList(@Param("hrCode") String hrCode, @Param("cCode") String cCode); //내가 올린 결재안(페이징x)
	public List<ApprovalDocu> apupPaymentList(@Param("hrCode") String hrCode, @Param("cCode") String cCode, 
			@Param("vo") PagingVO vo, @Param("start")int start, @Param("end")int end); //내가 올린 결재안

//	public List<ApprovalDocu> apdownPaymentList(@Param("hrCode") String hrCode, @Param("cCode") String cCode); //내가 받은 결재안
	public List<ApprovalDocu> apdownPaymentList(@Param("hrCode") String hrCode, @Param("cCode") String cCode, 
			@Param("vo") PagingVO vo, @Param("start")int start, @Param("end")int end); //내가 받은 결재안
	
//	public List<Account> acTemporaryList(@Param("hrCode") String hrCode,@Param("cCode") String cCode); //임시저장 결재함
	public List<Account> acTemporaryList(@Param("hrCode") String hrCode, @Param("cCode") String cCode, 
			@Param("vo") PagingVO vo, @Param("start")int start, @Param("end")int end); //임시저장 결재함
	
	public Account apRequest(@Param("j_docunum") String j_docunum,@Param("cCode") String cCode); // 내가올린 결재안상세

	public Account apRequest2(@Param("j_docunum") String j_docunum,@Param("cCode") String cCode); // 내가받은결재안상세
	
	public Account acRequest(@Param("j_docunum") String j_docunum,@Param("cCode") String cCode); // 임시저장 결재안상세

	public boolean actempoInsert(Account ac); //처음에 임시저장으로 insert할때

	public boolean acSign(Account ac); //결재자1이 결재자 2, 3, 결재등급, 기타등등 업데이트

	public boolean acSign2(Account ac); //결재자 2,3이 결재할때

	public int acCheck(@Param("j_docunum") String j_docunum,@Param("cCode") String cCode); //결재안 삭제 위한 체크

	public boolean acDelete(@Param("j_docunum") String j_docunum,@Param("cCode") String cCode); //결재안 삭제 임시저장이면 할수있음

	public boolean acBack(Account ac); //결재안 반려

	public boolean apCart2(ApprovalDocu ap); //공통결재함에 insert(결재자1이 임시저장에서 결재해야함)

	public boolean apSign2(ApprovalDocu ap); //공통결재함에서 toapprover update

	public boolean apBack2(ApprovalDocu ap); //공통결재함 반려

	com.n7.erp.bean.ac.approvalLine getApprinfo(String code); //결재안에서 결재자 표시

	public int countDocument();

//	public List<ApprovalDocu> selectUpdocument(PagingVO vo);


//	List<SaleInfo> saledetails(String check);

	/* List<SaleInfo> selectsale(String search); */

}
