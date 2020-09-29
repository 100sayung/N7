package com.n7.erp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.google.gson.JsonElement;
import com.n7.erp.bean.Member;
import com.n7.erp.bean.entity.NameHoliday;
import com.n7.erp.bean.hr.Academic;
import com.n7.erp.bean.hr.ApplyHoliday;
import com.n7.erp.bean.hr.Attendance;
import com.n7.erp.bean.hr.Career;
import com.n7.erp.bean.hr.Certification;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.bean.hr.Payroll;
import com.n7.erp.userClass.PagingVO;

public interface IHrDao {
	@Select("SELECT * FROM HR_CARD WHERE HC_ID = #{m_id}")
	HR_Card getHrCardDetail(String id);

	@Select("SELECT HC_HRCODE FROM HR_CARD WHERE HC_ID = #{m_id}")
	String getHrCodeFromID(String id);

	@Select("SELECT * FROM HR_${type} WHERE ${column}_HRCODE = #{code} AND ${column}_CCODE = #{cCode}")
	List<Certification> getCertificationInfo(HashMap<String, String> hMap);

	@Select("SELECT * FROM HR_${type} WHERE ${column}_HRCODE = #{code} AND ${column}_CCODE = #{cCode}")
	List<Academic> getAcademicInfo(HashMap<String, String> hMap);

	@Select("SELECT * FROM HR_${type} WHERE ${column}_HRCODE = #{code} AND ${column}_CCODE = #{cCode}")
	List<Career> getCareerInfo(HashMap<String, String> hMap);

	@Select("SELECT M_NAME FROM MHR WHERE HC_HRCODE=#{hap_fromapprover}")
	String getFromApprover(String hap_fromapprover);

	@Select("SELECT M_NAME FROM MHR WHERE HC_HRCODE=#{hap_toapprover}")
	String getToApprover(String hap_toapprover);

	// HC_CODE ���떊�뿉 �빐蹂대뒗以�

	@Select("SELECT C_NAME FROM COMPANY WHERE C_CODE = #{cCode}")
	String getCName(String cCode);

	@Select("SELECT COUNT(*) FROM HR_ACADEMIC WHERE Hac_HRCODE = #{hrcode} AND HAC_CCODE = #{cCode}")
	Integer selectAcademic(HashMap<String, String> acMap);

	@Select("SELECT COUNT(*) FROM HR_CARD WHERE HC_ID = #{hc_id}")
	boolean selectHRCard(String hc_id);

	@Select("SELECT COUNT(*) FROM HR_CAREER WHERE Hcr_HRCODE = #{hrcode} AND HCR_CCODE = #{cCode}")
	Integer selectCareer(HashMap<String, String> crMap);

	@Select("SELECT COUNT(*) FROM HR_CERTIFICATION WHERE Hct_HRCODE = #{hrcode} AND HCT_CCODE = #{ccode}")
	Integer selectCertification(HashMap<String, String> ctfMap);

	@Insert("INSERT INTO HR_CARD VALUES(#{hc_hrcode}||HR_CARD_SEQ.NEXTVAL, #{hc_ccode}, #{hc_id}, #{hc_dept}, #{hc_position}, #{hc_joindate}, DEFAULT, DEFAULT, DEFAULT)")
	void registHRCard(HR_Card hrCard);

	void registAcademic(Academic ac);

	void registCareer(Career cr);

	void registCertification(Certification ctf);

	void updateAcademic(Academic ac);

	void updateCareer(Career cr);

	void updateCertification(Certification ctf);

	void updateHRCard(HR_Card hrCard);

	@Select("SELECT COUNT(*) FROM HR_CARD WHERE HC_ID = #{m_id}")
	boolean haveHRCodeFromId(String m_id);

	@Select("SELECT * FROM MEMBER WHERE M_ID = #{m_id}")
	Member getMemberInfo(String m_id);

	@Insert("INSERT INTO HR_ATTENDANCE VALUES(#{cCode}, #{hrCode}, #{time}, #{type})")
	boolean logAttendance(HashMap<String, String> logAtMap);

	@Insert("UPDATE HR_CARD SET HC_STATUS = #{type} WHERE HC_CCODE = #{cCode} AND HC_HRCODE = #{hrCode}")
	void logStatusToHrCard(HashMap<String, String> logAtMap);

	@Insert("INSERT INTO HR_APPLYHOLIDAY VALUES(#{hap_docunum}||HR_APPLYHOLIDAY_SEQ.currval, #{hap_ccode}, #{hap_hrcode}, #{hap_docuname},"
			+ "#{hap_fromapprover}, #{hap_toapprover}, DEFAULT, #{hap_type}, #{hap_reason}, #{hap_startday}, #{hap_endday}, DEFAULT)")
	void registHoliday(ApplyHoliday apholi);

	@Select("SELECT * FROM HR_ATTENDANCE WHERE HA_HRCODE = #{hrCode} AND HA_CCODE = #{cCode} AND HA_TIME LIKE #{dateStandard} ORDER BY HA_TIME")
	ArrayList<Attendance> getMyAttendance(HashMap<String, String> hMap);

	ArrayList<Attendance> getEmployeeAttendance(HashMap<String, String> hMap);

	@Select("SELECT * FROM HR_APPLYHOLIDAY WHERE HAP_CCODE = #{cCode} AND HAP_HRCODE = #{hrCode}")
	ArrayList<ApplyHoliday> getMyHoliday(HashMap<String, String> hMap);

	@Select("SELECT HR_CARD.HC_DEPT, HR_CARD.HC_POSITION, HR_CARD.HC_HRCODE, HR_CARD.HC_WORK, MEMBER.M_NAME "
			+ "FROM HR_CARD INNER JOIN MEMBER ON HR_CARD.HC_ID = MEMBER.M_ID WHERE HC_CCODE = #{cCode} AND HC_WORK = #{status}")
	ArrayList<HR_Card> getCheckRetired(HashMap<String, String> hMap);

	@Select("SELECT COUNT(*) FROM HR_CARD WHERE HC_ID=#{m_id}")
	boolean haveHrCode(String m_id);

	@Select("SELECT * FROM HR_ATTENDANCE WHERE HA_HRCODE = #{hrCode} AND HA_CCODE = #{cCode} AND HA_TIME LIKE #{date} ORDER BY HA_TIME")
	ArrayList<Attendance> getAllMyAttendance(HashMap<String, String> hMap);

	@Update("UPDATE HR_CARD SET HC_WORK = #{hc_work} WHERE HC_CCODE = #{hc_ccode} AND HC_HRCODE = #{hc_hrcode}")
	void updateRetired(HR_Card hrCard);

	@Select("SELECT HR_CARD.HC_DEPT, HR_CARD.HC_POSITION, HR_CARD.HC_STATUS, MEMBER.M_NAME "
			+ "FROM HR_CARD INNER JOIN MEMBER ON HR_CARD.HC_ID = MEMBER.M_ID WHERE HC_CCODE = #{cCode} ORDER BY HC_WORK")
	ArrayList<HR_Card> getEmployeeStatus(String cCode);

	ArrayList<NameHoliday> getEmployeeHoliday(HashMap<String, String> hMap);

	ArrayList<NameHoliday> getMyHolidayView(HashMap<String, String> hMap);

	boolean checkMemberHrCardCnt(String cCode);


	@Select("SELECT * FROM MEMBER WHERE M_CCODE = #{cCode} AND M_NAME = #{name}")
	ArrayList<Member> getSearchFromName(HashMap<String, String> hMap);

	ArrayList<HR_Card> getHrCodeFromStatus(HashMap<String, String> hMap);

	@Select("SELECT * FROM HR_APPLYHOLIDAY WHERE HAP_DOCUNUM = #{docunum} AND HAP_CCODE = #{cCode}")
	ApplyHoliday getDetailHoliday(HashMap<String, String> hMap);

	@Select("SELECT * FROM MHR WHERE HC_HRCODE=#{hrCode}")
	HR_Card selectcheckpay(String hrCode);

	@Select("SELECT * FROM HR_CDD_PAY WHERE HC_HRCODE=#{hrCode} AND HP_PAYDATE=#{month}")
	Payroll getMyPaySelect(HashMap<String, String> hMap);

	@Update("UPDATE HR_APPLYHOLIDAY SET HAP_STATUS = #{status} WHERE HAP_CCODE = #{cCode} AND HAP_DOCUNUM = #{docunum}")
	void registHolidayStatus(HashMap<String, String> hMap);

	@Select("SELECT HDP_POSITION FROM HR_DEPT WHERE HDP_CCODE = #{cCode} AND HDP_DEPT = #{dept}")
	ArrayList<String> getPositionFromDept(HashMap<String, String> hMap);

	@Delete("DELETE FROM HR_ACADEMIC WHERE hac_ccode = #{cCode} AND HAC_NUM = #{num}")
	void removeAcademicInfo(HashMap<String, String> hMap);

	@Delete("DELETE FROM HR_CAREER WHERE HCR_ccode = #{cCode} AND HCR_NUM = #{num}")
	void removeCareerInfo(HashMap<String, String> hMap);

	@Delete("DELETE FROM HR_CERTIFICATION WHERE hct_ccode = #{cCode} AND HCT_NUM = #{num}")
	void removeCertificationInfo(HashMap<String, String> hMap);


	int countHrCard(String cCode);
	List<Member> selectHrCard(PagingVO vo);
	List<Member> selectNoHrCard(PagingVO vo);
	int countNoHrCard(String cCode);
}
