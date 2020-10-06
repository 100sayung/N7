package com.n7.erp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.n7.erp.bean.hr.Academic;
import com.n7.erp.bean.hr.Career;
import com.n7.erp.bean.hr.Certification;
import com.n7.erp.bean.hr.Department;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.service.HRDepartmentMM;
import com.n7.erp.service.HrMM;
import com.n7.erp.service.MyInfoMM;

@RestController // @ResponseBody 생략가능
@RequestMapping(value = "/rest")
public class MyInfoRestController {

	@Autowired private MyInfoMM imm;
	@Autowired private HrMM hm;
	@Autowired private HRDepartmentMM deptmm;

	//myInfo에 내 정보 출력
	@GetMapping(value="/myinfo/myinfo")
	public String getMyInfo(HttpSession session) {

		String json =  imm.getMyInfo(session);
		return json;
	}

	//내 출결 확인
	@GetMapping(value="/myinfo/myattendance")
	public String getMyAttendance(HttpSession session, String day, String yearmonth) {
		String result = hm.getMyAttendance(session, day, yearmonth);
		return result;
	}
	//내 출결 확인(달력 출력용)
	@GetMapping(value="/myinfo/allmyattendance")
	public String getAllMyAttendance(HttpSession session, String yearmonth) {
		String result = hm.getAllMyAttendance(session, yearmonth);
		return result;
	}

	//myHoliday에 내가 신청한 휴가 출력
	@GetMapping(value="/myinfo/myholiday")
	public String getMyHoliday(HttpSession session) {

		String json = hm.getMyHoliday(session);
		return json;
	}


	//내정보출력 메소드 -->
	@GetMapping(value="/myinfo/hrexistfromid")
	public boolean haveHRCodeFromID(HttpSession session) {
		String m_id = session.getAttribute("id").toString();
		boolean flag = hm.haveHRCodeFromId(m_id);
		return flag;
	}

	@GetMapping(value="/myinfo/certification")
	public List<Certification> getCTFInfo(HttpServletRequest request) {
		String m_id = request.getSession().getAttribute("id").toString();
		List<Certification> ctfList = hm.getCertificationInfo(m_id, request.getServletPath().substring(13), request.getSession().getAttribute("cCode").toString());
		return ctfList;
		//substring 바꿔야할듯
	}
	//인사카드 정보 출력
	@GetMapping(value="/myinfo/hrcard")
	public HR_Card getHRCInfo(HttpServletRequest request) {
		String m_id = request.getSession().getAttribute("id").toString();
		HR_Card hrCard = hm.getHrCardInfo(m_id);
		return hrCard;
	}
	//학력 리스트 출력
	@GetMapping(value="/myinfo/academic")
	public List<Academic> getACInfo(HttpServletRequest request) {
		String m_id = request.getSession().getAttribute("id").toString();
		List<Academic> acList = hm.getAcademicInfo(m_id, request.getServletPath().substring(13), request.getSession().getAttribute("cCode").toString());
		return acList;
	}
	//이력 리스트 출력
	@GetMapping(value="/myinfo/career")
	public List<Career> getCRInfo(HttpServletRequest request) {
		String m_id = request.getSession().getAttribute("id").toString();
		List<Career> crList = hm.getCareerInfo(m_id, request.getServletPath().substring(13), request.getSession().getAttribute("cCode").toString());
		return crList;
	}
	@GetMapping(value = "/myinfo/deptlist")
	public String getDeptList(HttpSession session) {
		Department dept = new Department();
		String result = deptmm.getDeptList(session.getAttribute("cCode").toString());
		return result;
	}

}
