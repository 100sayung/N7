package com.n7.erp.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.n7.erp.bean.Member;
import com.n7.erp.bean.hr.Academic;
import com.n7.erp.bean.hr.Career;
import com.n7.erp.bean.hr.Certification;
import com.n7.erp.bean.hr.Department;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.service.HRDepartmentMM;
import com.n7.erp.service.HrMM;
import com.n7.erp.userClass.PagingVO;

@RestController // @ResponseBody 占쎄문占쎌셽揶쏉옙占쎈뮟
@RequestMapping(value = "/rest")
public class HRRestController {

	@Autowired
	private HrMM hm;
	@Autowired private HRDepartmentMM deptmm;
	//占쎌쁽野꺿뫗弛� �뵳�딅뮞占쎈뱜 �빊�뮆�젾
	@GetMapping(value="/hr/certification")
	public List<Certification> getCTFInfo(String m_id, HttpServletRequest request) {
		List<Certification> ctfList = hm.getCertificationInfo(m_id, request.getServletPath().substring(9), request.getSession().getAttribute("cCode").toString());
		return ctfList;
	}
	//占쎌뵥占쎄텢燁삳�諭� 占쎌젟癰귨옙 �빊�뮆�젾
	@GetMapping(value="/hr/hrcard")
	public HR_Card getHRCInfo(String m_id, HttpServletRequest request) {
		HR_Card hrCard = hm.getHrCardInfo(m_id);
		return hrCard;
	}
	//占쎈린占쎌젾 �뵳�딅뮞占쎈뱜 �빊�뮆�젾
	@GetMapping(value="/hr/academic")
	public List<Academic> getACInfo(String m_id, HttpServletRequest request) {
		List<Academic> acList = hm.getAcademicInfo(m_id, request.getServletPath().substring(9), request.getSession().getAttribute("cCode").toString());
		return acList;
	}
	//占쎌뵠占쎌젾 �뵳�딅뮞占쎈뱜 �빊�뮆�젾
	@GetMapping(value="/hr/career")
	public List<Career> getCRInfo(String m_id, HttpServletRequest request) {
		List<Career> crList = hm.getCareerInfo(m_id, request.getServletPath().substring(9), request.getSession().getAttribute("cCode").toString());
		return crList;
	}
	//占쎈였 占쎄텣占쎌젫占쎈릭筌롫똻苑� 占쎈쑓占쎌뵠占쎄숲筌욑옙占쎌뒭疫뀐옙
	@PostMapping(value="/hr/removeinfo")
	public String removeInfo(HttpSession session, String num, String type) {
		String result = hm.removeInfo(session, num, type);
		return result;
	}

	//id嚥≪뮆占쏙옙苑� hrCard揶쏉옙 鈺곕똻�삺占쎈릭占쎈뮉筌욑옙 占쎈툧占쎈릭占쎈뮉筌욑옙 筌ｋ똾寃뺧옙釉�!!!
	@GetMapping(value="/hr/hrcodefromid")
	public boolean haveHRCodeFromID(String m_id) {
		boolean flag = hm.haveHRCodeFromId(m_id);
		return flag;
	}
	//id嚥≪뮆占쏙옙苑� member占쎌젟癰귨옙 揶쏉옙占쎌죬占쎌긾!
	@GetMapping(value="/hr/memberfromid")
	public Member getMemberInfo(String m_id) {
		System.out.println(m_id);
		Member mb = hm.getMemberInfo(m_id);
		return mb;
	}

	//HRCARD !!!~\
	@GetMapping(value="/hr/hrcardpagenumber")
	public String hrCardPageNumber(HttpSession session) {
		int result = hm.countHrCard(session);
		return Integer.toString(result);
	}

	@GetMapping(value="/hr/hrcardlist")
	public String hrCardList(String nowPage, String cntPerPage, HttpSession session) {
		int total = hm.countHrCard(session);
		if(nowPage == null) {
			nowPage = "1";
		}

		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), session.getAttribute("cCode").toString());

		String result = new Gson().toJson(hm.selectHrCard(vo));
		return result;
	}
	@GetMapping(value="/hr/nohrcardpagenumber")
	public String noHrCardPageNumber(HttpSession session) {
		int result = hm.countNoHrCard(session);
		return Integer.toString(result);
	}

	@GetMapping(value="/hr/nohrcardlist")
	public String noHrCardList(String nowPage, String cntPerPage, HttpSession session) {
		int total = hm.countNoHrCard(session);
		if(nowPage == null) {
			nowPage = "1";
		}

		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), session.getAttribute("cCode").toString());

		String result = new Gson().toJson(hm.selectNoHrCard(vo));
		return result;
	}

	//HRCARD !!!~\

	//�겫占쏙옙苑뚧에占� 筌욊낯肄됧첎占쏙옙議뉛옙�궎疫뀐옙
	@GetMapping(value="/hr/positionfromdept")
	public String getPositionFromDept(HttpSession session, String dept) {
		String result = hm.getPositionFromDept(session, dept);
		return result;
	}

	//占쎌뵥占쎄텢燁삳�諭� 占쎌뵠�뵳占� 野껓옙占쎄퉳 �빊�뮆�젾
	@GetMapping(value="/hr/searchfromname",  produces = "application/text; charset=utf8")
	public String getSearchFromName(HttpSession session, String name) {
		String result = hm.getSearchFromName(session, name);
		return result;
	}
	@GetMapping(value="/hr/searchstatusfromname",  produces = "application/text; charset=utf8")
	public String getSearchStatusFromName(HttpSession session, String name) {
		String result = hm.getSearchStatusFromName(session, name);
		return result;
	}
	@GetMapping(value="/hr/searchfromstatus",  produces = "application/text; charset=utf8")
	public String getSearchFromStatus(HttpSession session, String status) {
		String result = hm.getSearchFromStatus(session, status);
		return result;
	}

	//
	@GetMapping(value = "/hr/deptlist")
	public String getDeptList(HttpSession session) {
		Department dept = new Department();
		String result = deptmm.getDeptList(session.getAttribute("cCode").toString());
		return result;
	}
	//�겫占쏙옙苑� 占쎈쾻疫뀐옙 野껓옙占쎄퉳
	@GetMapping(value = "/hr/deptauthlist")
	public String getDeptAuthList(HttpSession session) {
		String result = deptmm.getDeptAuthList(session.getAttribute("cCode").toString());
		return result;
	}
	//占쎌몧揶쏉옙占쎈뻿筌ｏ옙
	@GetMapping(value = "/hr/myleaderlist")
	public String getMyLeaderUsingGrade(HttpSession session){
		String leaderList = hm.getMyLeaderUsingGrade(session, "1");
		return leaderList;
	}

	@GetMapping(value="/hr/ourdept")
	public String getOurDept(HttpSession session) {
		String result = hm.getOurDept(session);
		return result;
	}

	//域뱀눛源��꽴占썹뵳占�

	//�빊�뮄猿먲옙踰묉에占�
	@PostMapping(value = "/hr/attendance")
	public String logAttendance(HttpSession session, String status, String time) {
		String result = hm.logAttendance(session.getAttribute("cCode").toString(), session.getAttribute("id").toString(), status,time);
		return result;
	}
	//占쎌겱占쎌삺占쎄맒占쎄묶占쎌넇占쎌뵥
	@GetMapping(value="/hr/currentattendance")
	public String getCurAttendance(HttpSession session) {
		String result = hm.getCurAttendance(session.getAttribute("id").toString());
		return result;
	}

	//占쎄텢占쎌뜚�빊�뮄猿먫�곌퀬�돳
	@GetMapping(value="/hr/employeeattendance")
	public String getMyAttendance(HttpSession session, String day, String yearmonth) {
		String result = hm.getEmployeeAttendance(session, day, yearmonth);
		return result;
	}

	//域뱀눖龜鈺곌퀬�돳
	@GetMapping(value="/hr/employeestatus")
	public String getEmployeeStatus(HttpSession session) {
		String result = hm.getEmployeeStatus(session);
		return result;
	}
	//占쎄텢占쎌뜚 占쎌몧揶쏉옙 鈺곌퀬�돳
	@GetMapping(value="/hr/employeeholiday")
	public String getEmployeeHoliday(HttpSession session, String yearmonth) {
		String result = hm.getEmployeeHoliday(session, yearmonth);
		return result;
	}

	@GetMapping(value="/hr/myholidayview")
	public String getMyHolidayView(HttpSession session, String yearmonth) {
		String cCode = session.getAttribute("cCode").toString();
		String hrCode = session.getAttribute("hrCode").toString();
		String result = hm.getEmployeeHoliday(cCode, yearmonth, hrCode);
		return result;
	}
	//占쎌몧揶쏉옙 占쎈뱟占쎌뵥/獄쏆꼶�젻
	@PostMapping(value="/hr/holidaystatus")
	public String registHoliday(HttpSession session, String yesno, String docunum) {
		hm.registHolidayStatus(session, docunum, yesno);
		return "ok";
	}



	//占쎄텢占쎌뜚 占쎌몧/占쎈닚筌욑옙 占쎄맒占쎄묶 鈺곌퀬�돳
	@GetMapping(value="/hr/checkretired")
	public String getCheckRetired(HttpSession session, String status) {
		String result = hm.getCheckRetired(session.getAttribute("cCode").toString(), status);
		return result;
	}
	@PostMapping(value="/hr/updateretired")
	public void updateRetired(HttpSession session, String hrCode, String work) {
		hm.updateRetired(session.getAttribute("cCode").toString(), hrCode, work);
	}

	@GetMapping(value="/hr/detailholiday")
	public String getDetailHoliday(HttpSession session, String docunum) {
		String result = hm.getDetailHoliday(session.getAttribute("cCode").toString(), docunum);
		return result;
	}
	
	@GetMapping(value="/hr/attendanceDelete")
	public String getAttendanceDelete(HttpSession session, String hrcode, String time) {
		String result=hm.DeleteAttendance(session.getAttribute("cCode").toString(), hrcode, time);
		return result;
	}	
	
	@GetMapping(value="/hr/attendanceUpdate")
	public String getAttendanceUpdate(HttpSession session, String hrcode, String time, String textTime) {
		String result=hm.Updateattendance(session.getAttribute("cCode"),hrcode,time,textTime);
		return result;
	}
}
