package com.n7.erp.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.n7.erp.bean.Member;

public interface IMemberDao {
	boolean access(Member mb);
	boolean join(Member mb);
	//boolean fileInsert(Map<String, String> fMap);
	@Select("SELECT M_CCODE FROM MEMBER WHERE M_ID=#{m_id}")
	String bringCCode(Member mb);

	ArrayList<Member> getHRCard(String m_ccode);
	@Select("SELECT * FROM MEMBER WHERE M_ID = #{id}")
	Member getMemberDetail(String id);

	@Select("SELECT * FROM MEMBER WHERE M_ID LIKE #{m_id}")
	ArrayList<Member> getSearchFromId(String m_id);

	@Update("UPDATE MEMBER SET M_GRADE = #{m_grade} WHERE M_ID = #{m_id}")
	boolean updateChangeGrade(Member mb);

	@Select("SELECT * FROM MEMBER")
	ArrayList<Member> getAllMember();

	@Update("UPDATE MEMBER SET M_GRADE = 'X' WHERE M_ID = #{m_id}")
	void forceWithDrawal(String string);

	@Select("SELECT * FROM MEMBER WHERE M_EMAIL = #{userEmail}")
	Member findId(String userEmail);
	@Select("SELECT * FROM MEMBER WHERE M_EMAIL = #{userEmail} AND M_ID = #{userId}")
	Member findPassword(@Param("userEmail") String userEmail,@Param("userId") String userId);
	@Select("UPDATE MEMBER SET M_PW = #{userPassword} WHERE M_ID = #{userId}")
	void modifyPassword(@Param("userPassword")String userPassword, @Param("userId")String userId);
	@Select("SELECT COUNT(*) FROM MEMBER WHERE M_ID = #{m_id}")
	int getDupleID(String m_id);
	@Select("SELECT COUNT(*) FROM COMPANY WHERE C_CODE = #{cCode}")
	int getDupleCCode(String cCode);
	@Delete("DELETE FROM O_RETURN WHERE R_CCODE = #{cCode}")
	void deleteO_return(String cCode);
	@Delete("DELETE FROM S_IEPORT WHERE IE_CPCODE = #{cCode}")
	void deleteS_ieport(String cCode);
	@Delete("DELETE FROM O_PURCHASEPROGRAM WHERE P_CCODE = #{cCode}")
	void deleteO_purchaseprogram(String cCode);
	@Delete("DELETE FROM O_PURCHASEPROGRAMCOMMOM WHERE P_CCODE = #{cCode}")
	void deleteO_purchaseprogramcommom(String cCode);
	@Delete("DELETE FROM O_PURCHASELIST WHERE P_CCODE = #{cCode}")
	void deleteO_purchaselist(String cCode);
	@Delete("DELETE FROM O_ORDER WHERE O_CCODE = #{cCode}")
	void deleteO_order(String cCode);
	@Delete("DELETE FROM B_SHIPMENT WHERE BS_CCODE = #{cCode}")
	void deleteB_shipment(String cCode);
	@Delete("DELETE FROM AC_SALESTATEMENTLIST WHERE RS_CCODE = #{cCode}")
	void deleteAc_salestatementlist(String cCode);
	@Delete("DELETE FROM AC_REALSALESTATEMENTLIST WHERE RS_CCODE = #{cCode}")
	void deleteAc_realsalestatementlist(String cCode);
	@Delete("DELETE FROM B_UNCOLLECTEDMONEY WHERE BS_CCODE = #{cCode}")
	void deleteB_uncollectedmoney(String cCode);
	@Delete("DELETE FROM B_SHIPREGIST WHERE BS_CCODE = #{cCode}")
	void deleteB_shipregist(String cCode);
	@Delete("DELETE FROM S_ITEMCODE WHERE IT_CPCODE = #{cCode}")
	void deleteS_itemcode(String cCode);
	@Delete("DELETE FROM HR_APPLYHOLIDAY WHERE HAP_CCODE = #{cCode}")
	void deleteHr_applyholiday(String cCode);
	@Delete("DELETE FROM B_ACTIVITIES WHERE BA_CCODE = #{cCode}")
	void deleteB_activites(String cCode);
	@Delete("DELETE FROM HR_ATTENDANCE WHERE HA_CCODE = #{cCode}")
	void deleteHr_attendance(String cCode);
	@Delete("DELETE FROM HR_ACADEMIC WHERE HAC_CCODE = #{cCode}")
	void deleteHr_academic(String cCode);
	@Delete("DELETE FROM HR_PAYROLL WHERE HP_CCODE = #{cCode}")
	void deleteHr_payroll(String cCode);
	@Delete("DELETE FROM HR_CERTIFICATION WHERE HCT_CCODE = #{cCode}")
	void deleteHr_certification(String cCode);
	@Delete("DELETE FROM HR_CAREER WHERE HCR_CCODE = #{cCode}")
	void deleteHr_career(String cCode);
	@Delete("DELETE FROM HR_CARD WHERE HC_CCODE = #{cCode}")
	void deleteHr_card(String cCode);
	@Delete("DELETE FROM O_PURCHASECOMMOM WHERE P_CCODE = #{cCode}")
	void deleteO_purchasecommom(String cCode);
	@Delete("DELETE FROM B_ORDER WHERE BO_CCODE = #{cCode}")
	void deleteB_order(String cCode);
	@Delete("DELETE FROM AC_SALESTATEMENT WHERE S_CCODE = #{cCode}")
	void deleteAc_salestatement(String cCode);
	@Select("DELETE FROM HR_DEPT WHERE HDP_CCODE = #{cCode}")
	void deleteHr_dept(String cCode);
	@Select("DELETE FROM HR_DEDUCATION WHERE HDD_CCODE = #{cCode}")
	void deleteHr_deduction(String cCode);
	@Delete("DELETE FROM S_CATEGORY WHERE CT_CPCODE = #{cCode}")
	void deleteS_category(String cCode);
	@Delete("DELETE FROM APPROVALDOCU WHERE AP_CCODE = #{cCode}")
	void deleteApprovaldocu(String cCode);
	@Delete("DELETE FROM AC_COMPANYLIST WHERE CL_CCODE = #{cCode}")
	void deleteAc_companylist(String cCode);
	
	@Select("SELECT M_GRADE FROM MEMBER WHERE M_ID = #{id}")
	String checkGrade(String id);
	boolean turnback(@Param("num")String num,@Param("cCode") String cCode);
	
	boolean ectupdate1(@Param("num") String num,@Param("ect") String ect,@Param("cCode") String cCode);
	
	boolean ectupdate2(@Param("num") String num,@Param("ect") String ect,@Param("cCode") String cCode);
	
	boolean ectupdate3(@Param("num") String num,@Param("ect") String ect,@Param("cCode") String cCode);
	boolean approvalagree(@Param("num")String num,@Param("cCode") String cCode);
}
