package com.n7.erp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.hr.ApplyHoliday;
import com.n7.erp.bean.hr.Department;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.bean.hr.ViewPay;
import com.n7.erp.service.AccountMM;
import com.n7.erp.service.HRDepartmentMM;
import com.n7.erp.service.HrMM;

@Controller
public class HRHomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	ModelAndView mav;

	@Autowired private HRDepartmentMM dm;
	@Autowired private HrMM hm;
		@Autowired private AccountMM am;

	@GetMapping(value="/hr/hrModifyDetail")
	public ModelAndView moveModifyDetail(@RequestParam String id) {
		mav.setViewName("/hr/hrModifyDetail");
		return mav;
	}
	@PostMapping(value="/hr/newacademic/{id}")
	public String registAcademic(HttpServletRequest request, @PathVariable("id") String id) throws Exception{
		hm.registAcademic(request, id);
		return "redirect:/hr/hrModifyDetail?id="+id;
	}
	@PostMapping(value="/hr/newcareer/{id}")
	public String registCareer(HttpServletRequest request, @PathVariable("id") String id) throws Exception{
		hm.registCareer(request, id);
		return "redirect:/hr/hrModifyDetail?id="+id;
	}
	@PostMapping(value="/hr/newcertification/{id}")
	public String registCertification(HttpServletRequest request, @PathVariable("id") String id) throws Exception{
		hm.registCertification(request, id);
		return "redirect:/hr/hrModifyDetail?id="+id;
	}
	@PostMapping(value="/hr/newhrcard/{id}")
	public String registHRCard(HR_Card hrCard, @PathVariable("id") String id, HttpSession session) {
		hm.registHRCard(hrCard, id, session.getAttribute("cCode").toString());
		return "redirect:/hr/hrModifyDetail?id="+id;
	}

	@GetMapping(value="/hr/movehrcardpage")
	public ModelAndView moveHrCard(HttpSession session) {
		mav = hm.hrCard(session);
		return mav;
	}

	@GetMapping(value = "/hr/attendance")
	public ModelAndView moveAttendance(HttpSession session) {
		mav = hm.checkMemberHrCard(session, "/hr/attendance");
		return mav;
	}
	@GetMapping(value = "/hr/employeestatus")
	public ModelAndView moveEmployeeStatus(HttpSession session) {
		mav = hm.checkMemberHrCard(session, "/hr/employeestatus");
		return mav;
	}
	@GetMapping(value="/hr/retiremm")
	public ModelAndView moveRetireMM(HttpSession session) {
		mav = hm.checkMemberHrCard(session, "/hr/retiremm");
		return mav;
	}


	@RequestMapping(value = "/hr/deptregistpage", method = RequestMethod.GET)
	public String deptregistpage() {
		return "/hr/deptregistpage";
	}

	@RequestMapping(value = "/hr/deduct", method = RequestMethod.GET)
	public ModelAndView moveDeduct(HttpSession session) {
		mav = dm.moveDeduct(session.getAttribute("cCode").toString());

		return mav;
	}

	@RequestMapping(value = "/hr/searchpaymm", method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView moveSearchPay(ViewPay pay,HttpSession session) {
		System.out.println("findhrcode="+pay.getHC_HRCODE());
		System.out.println("findccode="+pay.getHC_CCODE());
		System.out.println("findpaydate="+pay.getHP_PAYDATE());
		if(pay.getHP_PAYDATE()==""||pay.getHP_PAYDATE()==null) {
			if(pay.getHC_HRCODE()==null) {
				mav = dm.searchpay(session.getAttribute("cCode").toString());
			}else if(pay.getHC_HRCODE()!=null){
				String view="/hr/payinputmodify";
				mav.setViewName(view);
			}
			return mav;
		}else if(pay.getHP_PAYDATE()!="" || pay.getHP_PAYDATE()!=null){
			mav=dm.payroll(pay);
		}
		return mav;
	}

	@RequestMapping(value = "/hr/deptpay", method = RequestMethod.GET)
	public ModelAndView moveDeptPay(HttpSession session) {
		mav = dm.deptpayselect(session.getAttribute("cCode").toString());
		mav = dm.distictdp(session.getAttribute("cCode").toString());
		return mav;
	}

	@RequestMapping(value = "/hr/modifydeptpay", method = RequestMethod.POST)
	public @ResponseBody String modifyDeptPay(@Param(value = "dept") String dept, @Param(value = "pay") Integer pay, HttpSession session) {
		System.out.println(dept + "," + pay);
		String update = dm.deptpayupdate(dept, pay, session.getAttribute("cCode").toString());
		return update;
	}

	@RequestMapping(value = "/hr/deptdelete", method = RequestMethod.POST)
	public @ResponseBody String deptdelete(Integer deptnum, HttpSession session) {
		String d = dm.deptdelete(deptnum, session.getAttribute("cCode").toString());
		return d;
	}

	@RequestMapping(value = "/hr/deptregistinsert", method = RequestMethod.POST)
	public ModelAndView deptregistinsert(Department dept, HttpSession session) {
		mav = dm.deptregistinsert(dept, session.getAttribute("cCode").toString());
		return mav;
	}

	@RequestMapping(value = "/hr/distinct", method = RequestMethod.POST)
	public @ResponseBody String distinct(String disdept, String disposition, HttpSession session) {
		String result = dm.findDeptPosition(disdept, disposition, session.getAttribute("cCode").toString());
		return result;
	}

	@RequestMapping(value = "/hr/modifydeduction", method = RequestMethod.POST)
	public @ResponseBody String modifyDeduction(HttpSession session, @Param(value = "deduct") String deduct,
			@Param(value = "denum") Integer denum) {
		System.out.println(deduct + "," + denum);
		String duction = dm.modifyDeduction(deduct, denum, session.getAttribute("cCode").toString());
		return duction;
	}

	@PostMapping(value="/hr/applyholiday")
	public ModelAndView applyHoliday(ApplyHoliday apholi, HttpSession session) {
		mav = hm.applyHoliday(apholi, session);
		return mav;
	}

	@GetMapping(value="/hr/receiptholiday")
	public String moveReceiptHoliady() {
		return "/hr/receiptholiday";
	}



	@RequestMapping(value = "/hr/searchwages", method = RequestMethod.POST)
	public @ResponseBody String searchwages() {
		String wages = dm.searchwages();
		return wages;
	}
	@RequestMapping(value = "/hr/paydetai", method = RequestMethod.GET)
	public String detailpay(@RequestParam("hc") String hc) {
		mav=dm.detailpay(hc);
		return "/hr/searchpaymm";
	}
	@RequestMapping(value = "/hr/payinputmodify", method = RequestMethod.GET)
	public ModelAndView detail() {
		String view="/hr/payinputmodify";
		mav.setViewName(view);
		return mav;
	}
	@RequestMapping(value = "/hr/paydetail", method = RequestMethod.GET)
	public ModelAndView paydetail() {
		String view=null;
		view="/hr/paydetail";
		mav.setViewName(view);
		return mav;
	}
	@PostMapping(value = "/hr/findmonth")
	public @ResponseBody String findmonth(String month,String hrcode,HttpSession session) {
		mav=new ModelAndView();
		String result=dm.findmonth(month,hrcode);
		if(result==null) {
			return "1";
		}
		return result;
	}
	@GetMapping(value="/hr/holidayap")
	public ModelAndView holidayAp(HttpSession session) {
		mav=am.approvalLine(session);
		return mav;
	}

	@GetMapping(value="/hr/holidaydetail")
	public ModelAndView getHolidayDetail(String docunum, HttpSession session) {
		mav = hm.getHolidayDetail(docunum, session);
		return mav;
	}
	@RequestMapping(value = "/hr/findcheckpayid", method = RequestMethod.POST)
	public @ResponseBody String findcheckpayid(String checkpayid) {
		String result=dm.findcheckpayid(checkpayid);
		return result;
	}
	@RequestMapping(value = "/hr/deptsearchposition", method = RequestMethod.GET)
	public @ResponseBody String deptsearchposition(String dept,HttpSession session) {
		
		String result=dm.deptsearchposition(dept,session.getAttribute("cCode").toString());
		return result;
	}
}
