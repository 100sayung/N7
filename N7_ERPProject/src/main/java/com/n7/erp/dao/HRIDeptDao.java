package com.n7.erp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.n7.erp.bean.ConsultingBoard;
import com.n7.erp.bean.entity.NameHrCode;
import com.n7.erp.bean.hr.Deduct;
import com.n7.erp.bean.hr.Department;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.bean.hr.Payroll;
import com.n7.erp.bean.hr.ViewPay;


public interface HRIDeptDao {

	@Insert("INSERT INTO HR_DEPT VALUES(#{HDP_dept},#{HDP_position},#{hdp_ccode}, 0, HR_DEPT_SEQ.nextval, DEFAULT)")
	boolean deptregistinsert(Department dept);

	@Select("SELECT * FROM HR_DEPT WHERE HDP_CCODE = #{cCode}")
	ArrayList<Department> deptpayselect(String cCode);
	
	@Update("UPDATE HR_DEPT SET HDP_PAY=#{pay} WHERE HDP_NUM=#{dept} AND HDP_CCODE = #{cCode}")
	boolean deptpayupdate(HashMap<String, String> hMap);

	String payselect(HashMap<String, String> hMap);

	@Delete("DELETE FROM HR_DEPT WHERE HDP_NUM=#{deptnum} AND HDP_CCODE = #{cCode}")
	boolean deptdelete(HashMap<String, String> delMap);

	@Select("SELECT * FROM HR_DEPT WHERE HDP_CCODE = #{cCode}")
	ArrayList<Department> deptafterselect(String cCode);

	@Select("SELECT * FROM MHR WHERE HC_CCODE=#{cCode}")
	ArrayList<HR_Card> searchpay(String cCode);

	@Select("SELECT * FROM HR_DEDUCTION WHERE HDD_CCODE = #{cCode}")
	ArrayList<Deduct> moveDeduct(String cCode);

	@Update("UPDATE HR_DEDUCTION SET HDD_AMOUNT=#{denum} WHERE HDD_NAME=#{deduct} AND HDD_CCODE = #{cCode}")
	boolean modifyDeduction(HashMap<String, String> duMap);

	String findDeduction(HashMap<String, String> duMap);

	@Select("SELECT DISTINCT HDP_POSITION FROM HR_DEPT WHERE HDP_CCODE = #{cCode}")
	ArrayList<Department> distinctposition(String cCode);
	@Select("SELECT DISTINCT HDP_DEPT FROM HR_DEPT WHERE HDP_CCODE = #{cCode}")
	ArrayList<Department> distinctdept(String cCode);

	@Select("SELECT * FROM HR_DEPT WHERE HDP_DEPT=#{disdept} AND HDP_POSITION=#{disposition} AND HDP_CCODE = #{cCode}")
	ArrayList<Department> findDeptPosition(HashMap<String, String> fdpMap);
	@Select("SELECT * FROM HR_DEPT WHERE HDP_DEPT=#{disdept} AND HDP_CCODE = #{cCode}")
	ArrayList<Department> findDisdept(HashMap<String, String> fdpMap);
	@Select("SELECT * FROM HR_DEPT WHERE HDP_POSITION=#{disposition} AND HDP_CCODE = #{cCode}")
	ArrayList<Department> findDisposition(HashMap<String, String> fdpMap);


	ArrayList<NameHrCode> getMyLeaderUsingGradeDept(HashMap<String, String> hMap);

	@Select("SELECT * FROM HR_DEPT WHERE HDP_CCODE = #{cCode}")
	ArrayList<Department> getDeptAuthlist(String cCode);

	@Update("UPDATE HR_DEPT SET HDP_AUTH = #{hdp_auth} WHERE HDP_CCODE = #{hdp_ccode} AND HDP_POSITION = #{hdp_position} AND HDP_DEPT = #{hdp_dept}")
	void updateDeptAuth(Department dept);




	@Select("SELECT HC_ID,M_NAME,HC_DEPT,HC_POSITION,HDP_PAY,HDD_AMOUNT,HC_HRCODE FROM HR_CD_D")
	ArrayList<ViewPay> searchwages();

	HR_Card detailpay(String hc);

	ViewPay paysearch(String hc);

	@Select("SELECT * FROM HR_DEDUCTION WHERE HDD_CCODE=#{code}")
	ArrayList<Deduct> deduct(String code);

	@Select("SELECT M_NAME FROM MEMBER WHERE M_ID=#{hc}")
	String findname(String hc);

	Payroll findincentive(String hrcode);

	String findpay(ViewPay pay);

	@Insert("INSERT INTO HR_PAYROLL VALUES(#{HP_PAYDATE},#{HP_CCODE},#{HC_HRCODE},#{HP_TAX},#{HP_INCEN},#{HP_INSURANCE},#{HP_REALMONEY})")
	boolean insertpay(ViewPay pay);

	boolean updatepay(ViewPay pay);

	@Select("SELECT * FROM HR_CDD_PAY WHERE HP_PAYDATE=#{month} AND HC_HRCODE=#{hrcode}")
	Payroll findmonth(HashMap<String, String> hMap);

	ArrayList<ViewPay> checkingidname(String checkpayid);
	
	//09-25 append
	@Select("SELECT HDP_POSITION FROM HR_DEPT WHERE HDP_DEPT=#{dept} AND HDP_CCODE=#{cCode}")
	ArrayList<Department> deptsearchposition(HashMap<String, String> hMap);
	
	@Select("SELECT COUNT(*) FROM HR_DEPT WHERE HDP_DEPT=#{au_name} AND HDP_CCODE = #{cCode}")
	int checkDept(@Param("au_name")String au_name, @Param("cCode") String cCode);
}
