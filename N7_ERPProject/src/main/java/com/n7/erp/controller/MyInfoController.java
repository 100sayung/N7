package com.n7.erp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.hr.Department;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.service.HrMM;
import com.n7.erp.service.MemberMM;




@Controller
public class MyInfoController {
	
	ModelAndView mav;
	
	@Autowired
	private MemberMM mm;
	@Autowired
	private HrMM hm;
	//이동관련
	@GetMapping(value="/myinfo/checkattendance")
	public ModelAndView moveCheckAttendance(HttpSession session) {
		mav = hm.checkMyHrCard(session, "myInfo/checkAttendance");
		return mav;
	}
	@GetMapping(value="/myinfo/applyholiday")
	public ModelAndView moveApplyHoliday(HttpSession session) {
		mav = hm.checkMyHrCard(session, "/myInfo/applyHoliday");
		return mav;
	}
	@GetMapping(value="/myinfo/myattendance")
	public ModelAndView moveMyAttendance(HttpSession session) {
		mav = hm.checkMyHrCard(session, "/myInfo/myAttendance");
		return mav;
	}
	@GetMapping(value="/myinfo/myholiday")
	public ModelAndView moveMyHoliday(HttpSession session) {
		mav = hm.checkMyHrCard(session, "myInfo/myHoliday");
		return mav;
	}
	
	@GetMapping(value="/myinfo/mydocument")
	public String mydocument() {
		return "myInfo/mydocument";
	}
	
	//여기까지 이동관련
	
	
	//myinfo 내정보 스스로 등록 메소드
	@PostMapping(value="/myinfo/newacademic")
	public String registAcademic(HttpServletRequest request){
		String id = request.getSession().getAttribute("id").toString();
		hm.registAcademic(request, id);
		return "redirect:/myinfo/myinfo";
	}
	//새로운 이력 정보 등록
	@PostMapping(value="/myinfo/newcareer")
	public String registCareer(HttpServletRequest request){
		String id = request.getSession().getAttribute("id").toString();
		hm.registCareer(request, id);
		return "myInfo/myInfo";
	}
	//새로운 자격증 정보 등록
	@PostMapping(value="/myinfo/newcertification")
	public String registCertification(HttpServletRequest request) throws Exception{
		String id = request.getSession().getAttribute("id").toString();
		hm.registCertification(request, id);
		return "myInfo/myInfo";
	}
	//새로운 인사카드 등록
	@PostMapping(value="/myinfo/newhrcard")
	public String registHRCard(HR_Card hrCard, HttpSession session) {
		hm.registHRCard(hrCard, session.getAttribute("id").toString(), session.getAttribute("cCode").toString());
		return "myInfo/myInfo";
	}
	
	//내 급여 명세서 이동
	@RequestMapping(value="/myinfo/myPaycheck", method = RequestMethod.GET)
	public ModelAndView moveMyPayCheck(HttpSession session) {
		mav=hm.moveMyPayCheck(session);
		return mav;
	}
	
	//내 급여 명세서 출력
	@RequestMapping(value = "/myinfo/paycheckselect" ,method = RequestMethod.POST)
	public @ResponseBody String mypayselect(HttpSession session,@RequestParam("month") String month) {
		Department dept = new Department();
		String hrCode=session.getAttribute("hrCode").toString();
		String result=hm.getMyPaySelect(hrCode,month);
		return result;
	}
}
