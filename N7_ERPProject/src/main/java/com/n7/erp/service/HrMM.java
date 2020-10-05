package com.n7.erp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CosNaming.NameHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.Authority;
import com.n7.erp.bean.Company;
import com.n7.erp.bean.Member;
import com.n7.erp.bean.entity.NameHoliday;
import com.n7.erp.bean.entity.NameHrCode;
import com.n7.erp.bean.hr.Academic;
import com.n7.erp.bean.hr.ApplyHoliday;
import com.n7.erp.bean.hr.Attendance;
import com.n7.erp.bean.hr.Career;
import com.n7.erp.bean.hr.Certification;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.bean.hr.Payroll;
import com.n7.erp.bean.hr.ViewPay;
import com.n7.erp.dao.HRIDeptDao;
import com.n7.erp.dao.IBaiscDao;
import com.n7.erp.dao.IHrDao;
import com.n7.erp.dao.IMemberDao;
import com.n7.erp.userClass.PagingVO;

@Service
public class HrMM {

	ModelAndView mav = new ModelAndView();

	@Autowired
	private IHrDao hDao;
	@Autowired
	private IMemberDao mDao;
	@Autowired
	private HRIDeptDao dDao;
	@Autowired
	private IBaiscDao bDao;

	String view = "";

	public HR_Card getHrCardInfo(String id) {
		HR_Card hrCard = hDao.getHrCardDetail(id);
		return hrCard;
	}

	public List<Certification> getCertificationInfo(String id, String type, String cCode) {
		String hc_hrcode = hDao.getHrCodeFromID(id);
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("code", hc_hrcode);
		hMap.put("type", type);
		hMap.put("cCode", cCode);
		hMap.put("column", "hct");
		List<Certification> ctfList = hDao.getCertificationInfo(hMap);
		return ctfList;
	}

	public List<Career> getCareerInfo(String id, String type, String cCode) {
		String hc_hrcode = hDao.getHrCodeFromID(id);
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("code", hc_hrcode);
		hMap.put("type", type);
		hMap.put("cCode", cCode);
		hMap.put("column", "hcr");
		List<Career> crList = hDao.getCareerInfo(hMap);
		return crList;
	}

	public List<Academic> getAcademicInfo(String id, String type, String cCode) {
		String hc_hrcode = hDao.getHrCodeFromID(id);
		HashMap<String, String> hMap = new HashMap<String, String>();
		System.out.println(hc_hrcode);
		hMap.put("code", hc_hrcode);
		hMap.put("type", type);
		hMap.put("cCode", cCode);
		hMap.put("column", "hac");
		List<Academic> acList = hDao.getAcademicInfo(hMap);
		System.out.println(acList);
		return acList;
	}

	public void registAcademic(HttpServletRequest request, String id) {
		HashMap<String, String> acMap = new HashMap<String, String>();
		String hc_hrcode = hDao.getHrCodeFromID(id);
		String cCode = request.getSession().getAttribute("cCode").toString();
		acMap.put("hrcode", hc_hrcode);
		acMap.put("cCode", cCode);
		Integer cnt = hDao.selectAcademic(acMap);
		System.out.println(cnt);
		for (int i = 0; i < request.getParameterValues("hac_school").length; i++) {
			Academic ac = new Academic();
			ac.setHac_ccode(cCode);
			ac.setHac_hrcode(hc_hrcode);
			ac.setHac_school(request.getParameterValues("hac_school")[i]);
			ac.setHac_major(request.getParameterValues("hac_major")[i]);
			ac.setHac_year(request.getParameterValues("hac_year")[i]);
			if (i < cnt) {
				ac.setHac_num(request.getParameterValues("hac_num")[i]);
				hDao.updateAcademic(ac);
				System.out.println("update : " + i);
			} else {
				hDao.registAcademic(ac);
			}
		}
		System.out.println("Academic");
	}

	public void registCareer(HttpServletRequest request, String id) {
		HashMap<String, String> crMap = new HashMap<String, String>();
		String hc_hrcode = hDao.getHrCodeFromID(id);
		String cCode = request.getSession().getAttribute("cCode").toString();
		crMap.put("hrcode", hc_hrcode);
		crMap.put("cCode", cCode);
		Integer cnt = hDao.selectCareer(crMap);
		for (int i = 0; i < request.getParameterValues("hcr_cname").length; i++) {
			Career cr = new Career();
			cr.setHcr_ccode(cCode);
			cr.setHcr_name(request.getParameterValues("hcr_cname")[i]);
			cr.setHcr_content(request.getParameterValues("hcr_content")[i]);
			cr.setHcr_startperiod(request.getParameterValues("hcr_startperiod")[i]);
			cr.setHcr_endperiod(request.getParameterValues("hcr_endperiod")[i]);
			cr.setHcr_position(request.getParameterValues("hcr_position")[i]);
			cr.setHcr_hrcode(hc_hrcode);
			if (i < cnt) {
				cr.setHcr_num(request.getParameterValues("hra_num")[i]);
				hDao.updateCareer(cr);
			} else {
				hDao.registCareer(cr);
			}
		}
		System.out.println("Career");
	}

	public void registCertification(HttpServletRequest request, String id) {
		HashMap<String, String> ctfMap = new HashMap<String, String>();
		String cCode = request.getSession().getAttribute("cCode").toString();
		String hc_hrcode = hDao.getHrCodeFromID(id);
		ctfMap.put("hrcode", hc_hrcode);
		ctfMap.put("cCode", cCode);
		Integer cnt = hDao.selectCertification(ctfMap);
		System.out.println(cnt);
		for (int i = 0; i < request.getParameterValues("hct_agency").length; i++) {
			Certification ctf = new Certification();
			ctf.setHct_ccode(cCode);
			ctf.setHct_hrcode(hc_hrcode);
			ctf.setHct_agency(request.getParameterValues("hct_agency")[i]);
			ctf.setHct_date(request.getParameterValues("hct_date")[i]);
			ctf.setHct_name(request.getParameterValues("hct_name")[i]);
			if (i < cnt) {
				ctf.setHct_num(request.getParameterValues("hct_num")[i]);
				hDao.updateCertification(ctf);
			} else {
				hDao.registCertification(ctf);
			}
		}
	}

	public void registHRCard(HR_Card hrCard, String id, String cCode) {
		System.out.println(id);
		hrCard.setHc_id(id);
		hrCard.setHc_ccode(cCode);
		System.out.println(hrCard.getHc_joindate());
		hrCard.setHc_hrcode(hrCard.getHc_joindate().toString().replace("-", ""));
		if (hDao.selectHRCard(id)) {
			hDao.updateHRCard(hrCard);
		} else {
			hDao.registHRCard(hrCard);
		}
	}

	public boolean haveHRCodeFromId(String m_id) {
		boolean flag = hDao.haveHRCodeFromId(m_id);
		return flag;
	}

	public Member getMemberInfo(String m_id) {
		Member mb = hDao.getMemberInfo(m_id);
		return mb;
	}

	public ModelAndView hrCard(HttpSession session) {
		String m_ccode = session.getAttribute("cCode").toString();
		mav.setViewName("/hr/hrCard");
		if (checkMemberHrCardCnt(m_ccode)) {
			mav.addObject("msg", "인사카드를 등록해주세요.");
		}

		return mav;
	}


	public String logAttendance(String cCode, String id, String status, String time) {
		String hrCode = hDao.getHrCodeFromID(id);
		System.out.println(time);
		System.out.println(status);
		HashMap<String, String> logAtMap = new HashMap<String, String>();
		logAtMap.put("hrCode", hrCode);
		logAtMap.put("cCode", cCode);
		logAtMap.put("time", time);
		String type;
		if (status.equals("in")) {
			type = "1";
		} else {
			type = "0";
		}
		logAtMap.put("type", type);
		System.out.println("type " + logAtMap.get("type"));
		hDao.logAttendance(logAtMap);
		hDao.logStatusToHrCard(logAtMap);
		return type;
	}

	public ModelAndView applyHoliday(ApplyHoliday apholi, HttpSession session) {
		String id = session.getAttribute("id").toString();
		String cCode = session.getAttribute("cCode").toString();
		String hrCode = hDao.getHrCodeFromID(id);

		// �뇦猿됲�ｏ옙�궨占쎈닱筌뤾쑨�맋�뜝�럥�렧�뜝�럥六쇽옙寃ュ뜝�룞�삕�땻占� �뜝�럥苡삣슖�댙�삕
		ApprovalDocu docu = new ApprovalDocu();
		docu.setAp_ccode(cCode).setAp_docuname(apholi.getHap_docuname()).setAp_docunum("H");
		docu.setAp_fromapprover(hrCode).setAp_toapprover(apholi.getHap_toapprover());

		apholi.setHap_ccode(cCode).setHap_hrcode(hrCode);
		apholi.setHap_fromapprover(hrCode).setHap_docunum("H");

		if (bDao.registHolidayApprovalDocu(docu)) {
			hDao.registHoliday(apholi);
		}
		mav.setViewName("/myInfo/myHoliday");
		return mav;
	}

	public String getMyLeaderUsingGrade(HttpSession session, String string) {

		String id = session.getAttribute("id").toString();
		String cCode = session.getAttribute("cCode").toString();
		String myDept = hDao.getHrCardDetail(id).getHc_dept();

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("authority", string);
		hMap.put("cCode", cCode);
		hMap.put("myDept", myDept);
		ArrayList<NameHrCode> nlist = dDao.getMyLeaderUsingGradeDept(hMap);
		String result = new Gson().toJson(nlist);
		return result;
	}

	public String getMyAttendance(HttpSession session, String day, String yearmonth) {
		Attendance at = new Attendance();

		String id = session.getAttribute("id").toString();
		String cCode = session.getAttribute("cCode").toString();
		String hrCode = hDao.getHrCodeFromID(id);

		int dayInt = Integer.parseInt(day);
		if (dayInt < 10) {
			day = "0" + day;
		}

		String month = "";
		if (yearmonth.substring(6).equals("1월")) {
			month = "Jan";
		} else if (yearmonth.substring(6).equals("2월")) {
			month = "Feb";
		} else if (yearmonth.substring(6).equals("3월")) {
			month = "Mar";
		} else if (yearmonth.substring(6).equals("4월")) {
			month = "Apr";
		} else if (yearmonth.substring(6).equals("5월")) {
			month = "May";
		} else if (yearmonth.substring(6).equals("6월")) {
			month = "Jun";
		} else if (yearmonth.substring(6).equals("7월")) {
			month = "Jul";
		} else if (yearmonth.substring(6).equals("8월")) {
			month = "Aug";
		} else if (yearmonth.substring(6).equals("9월")) {
			month = "Sep";
		} else if (yearmonth.substring(6).equals("10월")) {
			month = "Oct";
		} else if (yearmonth.substring(6).equals("11월")) {
			month = "Nov";
		} else if (yearmonth.substring(6).equals("12월")) {
			month = "Dec";
		}
		String dateStandard = "%" + month + " " + day + " " + yearmonth.substring(0, 4) + "%";
		System.out.println(dateStandard);

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("hrCode", hrCode);
		hMap.put("cCode", cCode);
		hMap.put("dateStandard", dateStandard);

		ArrayList<Attendance> atList = hDao.getMyAttendance(hMap);
		String result = new Gson().toJson(atList);
		return result;
	}

	public String getAllMyAttendance(HttpSession session, String yearmonth) {
		String cCode = session.getAttribute("cCode").toString();
		String hrCode = session.getAttribute("hrCode").toString();
		String month = monthConvert(yearmonth.substring(6));
		String date = "%" + month + "%" + yearmonth.substring(0, 4) + "%";
		System.out.println(date);
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("hrCode", hrCode);
		hMap.put("cCode", cCode);
		hMap.put("date", date);

		ArrayList<Attendance> atList = hDao.getAllMyAttendance(hMap);
		String result = new Gson().toJson(atList);
		return result;
	}

	public String getMyHoliday(HttpSession session) {
		String id = session.getAttribute("id").toString();
		String cCode = session.getAttribute("cCode").toString();
		String hrCode = hDao.getHrCodeFromID(id);

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("hrCode", hrCode);
		hMap.put("cCode", cCode);

		ArrayList<ApplyHoliday> ahList = hDao.getMyHoliday(hMap);
		String result = new Gson().toJson(ahList);
		return result;
	}

	public String getCurAttendance(String id) {
		String curAttendance = hDao.getHrCardDetail(id).getHc_status();

		return curAttendance;

	}

	public String getEmployeeAttendance(HttpSession session, String day, String yearmonth) {

		String id = session.getAttribute("id").toString();
		String cCode = session.getAttribute("cCode").toString();

		// �뇦猿볦삕�뜝�럡�돰�뜝�럩諭� �뜝�럩留꾢뜝�럥�돵�뜝�럡�맋 �뜝�럥�렧�뜝�럥六� 嶺뚮씭�뒧獄��뼅臾얍뜝占�
		int dayInt = Integer.parseInt(day);
		if (dayInt < 10) {
			day = "0" + day;
		}
		String month = monthConvert(yearmonth.substring(6));
		String dateStandard = "%" + month + " " + day + " " + yearmonth.substring(0, 4) + "%";
		System.out.println(dateStandard);

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", cCode);
		hMap.put("dateStandard", dateStandard);

		ArrayList<Attendance> atList = hDao.getEmployeeAttendance(hMap);
		String result = new Gson().toJson(atList);
		return result;
	}

	public String getCheckRetired(String cCode, String status) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", cCode);
		hMap.put("status", status);
		ArrayList<HR_Card> hList = hDao.getCheckRetired(hMap);
		System.out.println(hList);
		String result = new Gson().toJson(hList);
		System.out.println("�뜝�럥占쎈���삕占쎈츩�뜝�럥諭쒒쨹恝�삕" + result);
		return result;
	}

	public String getDetailHoliday(String cCode, String docunum) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("docunum", docunum);
		hMap.put("cCode", cCode);
		String result = new Gson().toJson(hDao.getDetailHoliday(hMap));
		return result;
	}

	public void updateRetired(String cCode, String hrCode, String work) {
		HR_Card hrCard = new HR_Card();
		hrCard.setHc_ccode(cCode);
		hrCard.setHc_hrcode(hrCode);
		hrCard.setHc_work(work);
		hDao.updateRetired(hrCard);
	}

//	public String getEmployeeStatus(HttpSession session) {
//		String cCode = session.getAttribute("cCode").toString();
//		ArrayList<HR_Card> hlist = hDao.getEmployeeStatus(cCode);
//		String result = new Gson().toJson(hlist);
//		return result;
//	}

	public String getEmployeeHoliday(HttpSession session, String yearmonth) {
		String cCode = session.getAttribute("cCode").toString();
		System.out.println(yearmonth);
		String month = yearmonth.substring(6);
		month = month.substring(0, month.length() - 1);
		if (Integer.parseInt(month) < 10) {
			month = "0" + month;
		}
		String date = yearmonth.substring(0, 4) + "-" + month + "%";
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", cCode);
		hMap.put("date", date);
		ArrayList<NameHoliday> holiList = hDao.getEmployeeHoliday(hMap);
		System.out.println(holiList);
		String result = new Gson().toJson(holiList);
		return result;
	}

	public String getEmployeeHoliday(String cCode, String yearmonth, String hrCode) {
		System.out.println(yearmonth);
		String month = yearmonth.substring(6);
		month = month.substring(0, month.length() - 1);
		if (Integer.parseInt(month) < 10) {
			month = "0" + month;
		}
		String date = yearmonth.substring(0, 4) + "-" + month + "%";
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", cCode);
		hMap.put("date", date);
		hMap.put("hrCode", hrCode);
		ArrayList<NameHoliday> holiList = hDao.getMyHolidayView(hMap);
		System.out.println(holiList);
		String result = new Gson().toJson(holiList);
		return result;
	}

	private String monthConvert(String number) {
		String month = "";
		if (number.equals("1월")) {
			month = "Jan";
		} else if (number.equals("2월")) {
			month = "Feb";
		} else if (number.equals("3월")) {
			month = "Mar";
		} else if (number.equals("4월")) {
			month = "Apr";
		} else if (number.equals("5월")) {
			month = "May";
		} else if (number.equals("6월")) {
			month = "Jun";
		} else if (number.equals("7월")) {
			month = "Jul";
		} else if (number.equals("8월")) {
			month = "Aug";
		} else if (number.equals("9월")) {
			month = "Sep";
		} else if (number.equals("10월")) {
			month = "Oct";
		} else if (number.equals("11월")) {
			month = "Nov";
		} else if (number.equals("12월")) {
			month = "Dec";
		}
		return month;
	}

	public ModelAndView checkMemberHrCard(HttpSession session, String address) {
		String cCode = session.getAttribute("cCode").toString();
		if (checkMemberHrCardCnt(cCode)) {
			mav.setViewName(address);
		} else {
			mav.setViewName("redirect:/hr/movehrcardpage");
		}
		return mav;
	}

	private boolean checkMemberHrCardCnt(String cCode) {
		if (hDao.checkMemberHrCardCnt(cCode)) {
			return false;
		} else {
			return true;
		}
	}
//
//	public String getSearchFromName(HttpSession session, String name) {
//		String cCode = session.getAttribute("cCode").toString();
//
//		name = "%" + name + "%";
//		HashMap<String, String> hMap = new HashMap<String, String>();
//		ArrayList<Member> hrCardList = new ArrayList<>();
//		hMap.put("cCode", cCode);
//		hMap.put("name", name);
//		hrCardList = hDao.getSearchFromName(hMap);
//		return list;
//	}

	public ModelAndView checkMyHrCard(HttpSession session, String address) {
		if (hDao.haveHrCode(session.getAttribute("id").toString())) {
			mav.setViewName(address);
		} else {
			System.out.println("占쎄땀占쎌젟癰귣�以� 癰귣�沅→묾占�");
			mav.setViewName("redirect:/myInfo/myInfo");
		}
		return mav;
	}

	// �뜝�럡�� �뼨��留⑵굢占� 嶺뚮ㅏ援욆땻占썲뜝�럡�맋 �뜝�럩逾졾뜝�럥吏�
	public ModelAndView moveMyPayCheck(HttpSession session) {
		String hrCode = session.getAttribute("hrCode").toString();
		HR_Card check = hDao.selectcheckpay(hrCode);
		System.out.println("�뤆�룆占썬굦逾� �뜝�럡�룎�뜝�럩湲�=" + check);
		if (check != null) {
			mav.addObject("paycheck", check);
			view = "/myInfo/myPaycheck";
		} else {
			view = "/myInfo/myInfo";
		}
		mav.setViewName(view);
		return mav;
	}

	public String getMyPaySelect(String hrCode, String month) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("hrCode", hrCode);
		hMap.put("month", month);
		Payroll pay = hDao.getMyPaySelect(hMap);
		System.out.println("�뼨轅몃궚�젆源띿삕占쎄텛 pay=" + pay);
		if (pay != null) {
			Gson gson = new Gson();
			String json = gson.toJson(pay);
			return json;
		}
		return "1";
	}

	public ModelAndView getHolidayDetail(String docunum, HttpSession session) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		String hrCode = session.getAttribute("hrCode").toString();
		hMap.put("cCode", session.getAttribute("cCode").toString());
		hMap.put("docunum", docunum);
		ApplyHoliday apholi = hDao.getDetailHoliday(hMap);
		//09-24 change
		String fromapprover=hDao.getFromApprover(apholi.getHap_fromapprover());
		String toapprover=hDao.getToApprover(apholi.getHap_toapprover());
		mav.addObject("fromapprover", fromapprover);
		mav.addObject("toapprover", toapprover);
		//
		mav.addObject("apholi", apholi);
		mav.addObject("hrCode", hrCode);
		mav.setViewName("/hr/holidayDetail");
		return mav;
	}

	public void registHolidayStatus(HttpSession session, String docunum, String yesno) {
		System.out.println(docunum);
		System.out.println(yesno);
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", session.getAttribute("cCode").toString());
		hMap.put("docunum", docunum);
		if (yesno.equals("ok")) {
			hMap.put("status", "3");
			System.out.println(hMap);
			hDao.registHolidayStatus(hMap);
			hDao.registDocuStatsu(hMap);
		} else if (yesno.equals("no")) {
			hMap.put("status", "4");
			System.out.println(hMap);
			hDao.registHolidayStatus(hMap);
			hDao.registDocuStatsu(hMap);
		}

	}

	public String getSearchStatusFromName(HttpSession session, String name) {

		String cCode = session.getAttribute("cCode").toString();

		name = "%" + name + "%";
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", cCode);
		hMap.put("name", name);
		ArrayList<Member> memberList = new ArrayList<>();
		memberList = hDao.getSearchFromName(hMap);
		ArrayList<HR_Card> hrCardList = new ArrayList<HR_Card>();
		for (int i = 0; i < memberList.size(); i++) {
			HR_Card hCard = new HR_Card();
			hCard = hDao.getHrCardDetail(memberList.get(i).getM_id());
			hCard.setM_name(memberList.get(i).getM_name());
			hrCardList.add(hCard);
		}
		String list = new Gson().toJson(hrCardList);
		return list;
	}

	public String getSearchFromStatus(HttpSession session, String status) {
		ArrayList<HR_Card> hrCardList = new ArrayList<HR_Card>();
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", session.getAttribute("cCode").toString());
		hMap.put("status", status);
		hrCardList = hDao.getHrCodeFromStatus(hMap);
		String list = new Gson().toJson(hrCardList);
		return list;
	}

	public String getPositionFromDept(HttpSession session, String dept) {
		ArrayList<String> positionList = new ArrayList<String>();
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", session.getAttribute("cCode").toString());
		hMap.put("dept", dept);
		positionList = hDao.getPositionFromDept(hMap);
		String list = new Gson().toJson(positionList);
		return list;
	}

	public String removeInfo(HttpSession session, String num, String type) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("cCode", session.getAttribute("cCode").toString());
		hMap.put("num", num);
		System.out.println(type);
		switch (type) {
		case "Academic":
			hDao.removeAcademicInfo(hMap);
			break;
		case "Career":
			hDao.removeCareerInfo(hMap);
			break;
		case "Certification":
			hDao.removeCertificationInfo(hMap);
			break;
		}
		return "good";
	}


	public int countHrCard(HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		return hDao.countHrCard(cCode);
	}
	public List<Member> selectHrCard(PagingVO vo){
		return hDao.selectHrCard(vo);
	}
	public int countNoHrCard(HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		return hDao.countNoHrCard(cCode);
	}
	public List<Member> selectNoHrCard(PagingVO vo){
		return hDao.selectNoHrCard(vo);
	}

	public String getSearchFromName(HttpSession session, String name) {
		HashMap<String, String> hMap= new HashMap<String, String>();
		hMap.put("cCode", session.getAttribute("cCode").toString());
		hMap.put("name", name);
		String result = new Gson().toJson(hDao.getSearchFromName(hMap));
		return result;
	}

	public String getOurDept(HttpSession session) {
		List<Authority> auth = hDao.getOurDept(session.getAttribute("cCode").toString());
		String result = new Gson().toJson(auth);
		return result;
	}
	public String DeleteAttendance(String cCode, String hrcode, String time) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("cCode", cCode);
		hMap.put("hrcode", hrcode);
		hMap.put("time", time);
		hDao.DeleteAttendance(hMap);
		String day=time.substring(0,15);
		ArrayList<Attendance> aList=hDao.getEmployeeAttendanceTwo(day);
		String result=new Gson().toJson(aList);
		return result;
	}

	public String Updateattendance(Object cCode, String hrcode, String time, String textTime) {
		String front=time.substring(0, 8);
		String back=time.substring(16,0);

		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("cCode", cCode);
		hMap.put("hrcode", hrcode);
		hMap.put("time", time);
		hMap.put("textTime", textTime);
		boolean attendace=hDao.selectAttendance(hMap);
		if(attendace) {
			hDao.updateAttendance(hMap);
		}
		return null;
	}

	
	public int countEmployeeStatus(HttpSession session, String status) {
		String cCode = session.getAttribute("cCode").toString();
		return hDao.countEmployeeStatus(cCode, status);
	}
	public List<HR_Card> selectEmployeeStatus(PagingVO vo){
		System.out.println(hDao.selectEmployeeStatus(vo));
		return hDao.selectEmployeeStatus(vo);
	}

	public int countwages(HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		return hDao.countWages(cCode);
	}
	public List<ViewPay> selectwages(PagingVO vo){
		return hDao.selectWages(vo);
	}

	public ModelAndView getReceipHoliDay(String docunum, HttpSession session) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		String hrCode = session.getAttribute("hrCode").toString();
		hMap.put("cCode", session.getAttribute("cCode").toString());
		hMap.put("docunum", docunum);
		ApplyHoliday apholi = hDao.getDetailHoliday(hMap);
		String fromapprover=hDao.getFromApprover(apholi.getHap_fromapprover());
		String toapprover=hDao.getToApprover(apholi.getHap_toapprover());
		mav.addObject("fromapprover", fromapprover);
		mav.addObject("toapprover", toapprover);
		mav.addObject("apholi", apholi);
		mav.addObject("hrCode", hrCode);
		mav.setViewName("/hr/receipholidayDetail");
		return mav;
	}


}
