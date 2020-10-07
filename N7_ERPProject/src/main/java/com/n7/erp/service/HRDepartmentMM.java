package com.n7.erp.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.n7.erp.bean.hr.Deduct;
import com.n7.erp.bean.hr.Department;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.bean.hr.Payroll;
import com.n7.erp.bean.hr.ViewPay;
import com.n7.erp.dao.HRIDeptDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class HRDepartmentMM {

	@Autowired
	private HRIDeptDao Ddao;

	ModelAndView mav = new ModelAndView();

	public ModelAndView deptregistinsert(Department dept, String cCode) {
		String view = null;
		dept.setHdp_ccode(cCode);
		String check=Ddao.checkingDept(dept);
		if(check==null) {
			if(dept.getHDP_dept()!="" && dept.getHDP_position()!="") {
				if (Ddao.deptregistinsert(dept)) {
					view = "hr/deptregistpage";
				}
			}else {
				view="hr/deptregistpage";
			}
		}else {
			view="hr/deptregistpage";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView deptpayselect(String cCode) {
		String view = null;
		ArrayList<Department> dept = Ddao.deptpayselect(cCode);

		Gson gson = new Gson();
		String json = gson.toJson(dept);
		System.out.println(json);

		if (dept != null) {
			mav.addObject("dept", json);
			view = "/hr/deptpay";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView distictdp(String cCode) {
		String view = null;
		ArrayList<Department> distinctdept = Ddao.distinctdept(cCode);
		ArrayList<Department> distinctposition = Ddao.distinctposition(cCode);
		Gson gson = new Gson();
		String position = gson.toJson(distinctposition);
		System.out.println(position);
		if (distinctposition != null) {
			mav.addObject("distinctposition", position);
			String dept = gson.toJson(distinctdept);
			System.out.println(dept);
			if (distinctdept != null) {
				mav.addObject("distinctdept", dept);
				view = "/hr/deptpay";
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public String deptpayupdate(String dept, Integer pay, String cCode) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("dept", dept);
		hMap.put("pay", pay.toString());
		hMap.put("cCode", cCode);
		if (Ddao.deptpayupdate(hMap)) {
			String resultdept = Ddao.payselect(hMap);
			if (resultdept != null) {
				return resultdept;
			}
		}
		return null;
	}

	public String deptdelete(Integer deptnum, String cCode) {
		String json = null;
		HashMap<String, String> delMap = new HashMap<String, String>();
		delMap.put("deptnum", deptnum.toString());
		delMap.put("cCode", cCode);
		if (Ddao.deptdelete(delMap)) {
			ArrayList<Department> deList = Ddao.deptafterselect(cCode);
			Gson gson = new Gson();
			json = gson.toJson(deList);
		}
		return json;
	}

	public ModelAndView searchpay(String cCode) {
		ArrayList<HR_Card> deList = Ddao.searchpay(cCode);
		String view="/hr/searchpaymm";
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView moveDeduct(String cCode) {
		String view = null;
		ArrayList<Deduct> duList = Ddao.moveDeduct(cCode);
		if (duList != null) {
			Gson gson = new Gson();
			String json = gson.toJson(duList);
			mav.addObject("deduct", json);
		}
		mav.setViewName(view);
		return mav;
	}

	public String modifyDeduction(String deduct, Integer denum, String cCode) {
		HashMap<String, String> duMap = new HashMap<String, String>();
		duMap.put("deduct", deduct);
		duMap.put("denum", denum.toString());
		duMap.put("cCode", cCode);
		if (Ddao.modifyDeduction(duMap)) {
			System.out.println("????");
			String Deduction = Ddao.findDeduction(duMap);
			if (Deduction != null) {
				return Deduction;
			}
		}
		return null;
	}

	public String findDeptPosition(String disdept, String disposition, String cCode) {
		ArrayList<Department> deptList = new ArrayList<Department>();
		String json = null;
		HashMap<String, String> fdpMap = new HashMap<String, String>();
		fdpMap.put("disdept", disdept);
		fdpMap.put("disposition", disposition);
		fdpMap.put("cCode", cCode);

		if (disdept != "" && disposition == "") {
			deptList = Ddao.findDisdept(fdpMap);
			if (deptList != null) {
				Gson gson = new Gson();
				json = gson.toJson(deptList);
				return json;
			}
		} else if (disposition != "" && disdept == "") {
			deptList = Ddao.findDisposition(fdpMap);
			if (deptList != null) {
				Gson gson = new Gson();
				json = gson.toJson(deptList);
				return json;
			}
		} else if (disdept != "" && disposition != "") {
			deptList = Ddao.findDeptPosition(fdpMap);
			if (deptList != null) {
				Gson gson = new Gson();
				json = gson.toJson(deptList);
				return json;
			}
		}
		return null;
	}

	public String getDeptList(String cCode) {
		ArrayList<Department> distinctdept = Ddao.distinctposition(cCode);
		ArrayList<Department> distinctposition = Ddao.distinctdept(cCode);
		ArrayList<String> deptList = new ArrayList<String>();
		ArrayList<String> positionList = new ArrayList<String>();
		for (int i = 0; i < distinctdept.size(); i++) {
			positionList.add(distinctdept.get(i).getHDP_position());
		}
		for (int i = 0; i < distinctposition.size(); i++) {
			deptList.add(distinctposition.get(i).getHDP_dept());
		}
		HashMap<String, ArrayList<String>> deptAll = new HashMap<String, ArrayList<String>>();
		deptAll.put("deptList", deptList);
		deptAll.put("positionList", positionList);
		Gson gson = new Gson();
		String result = gson.toJson(deptAll);
		return result;
	}

	public String getDeptAuthList(String cCode) {
		ArrayList<Department> deptlist = Ddao.getDeptAuthlist(cCode); // 占쎄텢占쎈뼄 占쎌뵠野껓옙 占쎌읈筌ｋ떯�늿占쎈선占쎌궎占쎈뮉椰꾧퀣�뿫
		String result = new Gson().toJson(deptlist);
		return result;
	}

	public void updateDeptAuth(String cCode, HttpServletRequest request) {
		for (int i = 0; i < request.getParameterValues("HDP_dept").length; i++) {
			Department dept = new Department();
			dept.setHdp_auth(request.getParameterValues("hdp_auth")[i]);
			dept.setHdp_ccode(cCode);
			dept.setHDP_num(request.getParameterValues("HDP_num")[i]);
			System.out.println(dept);
			Ddao.updateDeptAuth(dept);
			System.out.println(i);
		}
	}

	public String searchwages() {
		ArrayList<ViewPay> mList = new ArrayList<ViewPay>();
		mList = Ddao.searchwages();
		Gson json = new Gson();
		String gson = json.toJson(mList);
		return gson;
	}

	public ModelAndView detailpay(String hc) {
		mav = new ModelAndView();
		HR_Card card = Ddao.detailpay(hc);
		ViewPay pay = Ddao.paysearch(hc);
		String code = card.getHc_ccode();
		String hrcode = card.getHc_hrcode();
		String name = Ddao.findname(hc);
		ArrayList<Deduct> deduct = Ddao.deduct(code);
		Payroll incentive = Ddao.findincentive(hrcode);
		mav.addObject("incentive", incentive);
		mav.addObject("name", name);
		mav.addObject("deduct", deduct);
		mav.addObject("pay", pay);
		mav.addObject("card", card);
		return mav;
	}
	
	@Transactional
	public ModelAndView payroll(ViewPay pay) {
		String view = null;
		String selectpay = Ddao.findpay(pay);
		if (selectpay == null) {
			if (Ddao.insertpay(pay)) {
				view = "/hr/searchpaymm";
			} else {
				view = "/hr/payinputmodify";
			}
		} else if (selectpay != null) {
			if (Ddao.updatepay(pay)) {
				view = "/hr/searchpaymm";
			} else {
				view = "/hr/payinputmodify";
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public String findmonth(String month, String hrcode) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("month", month);
		hMap.put("hrcode", hrcode);
		Payroll pay = Ddao.findmonth(hMap);
		if (pay != null) {
			Gson gson = new Gson();
			String json = gson.toJson(pay);
			return json;
		}
		return null;
	}

	public String findcheckpayid(String checkpayid) {
		StringBuilder sb=new StringBuilder();
		if(checkpayid!=null) {
			ArrayList<ViewPay> ViewList=Ddao.checkingidname(checkpayid);
				sb.append("<tr><td>아이디</td><td>이름</td><td>부서</td><td>직급</td><td>급여</td><td>기본공제액</td><td>기본수령액</td><td colspan='2'></td></tr>");
			for(int i=0;i<ViewList.size();i++) {
				int result=ViewList.get(i).getHDP_PAY()-ViewList.get(i).getHDD_AMOUNT();
				sb.append("<tr id='\""+ViewList.get(i).getHC_ID()+"\"'>");
				sb.append("<td>"+ViewList.get(i).getHC_ID()+"</td>");
				sb.append("<td>"+ViewList.get(i).getM_NAME()+"</td>");
				sb.append("<td>"+ViewList.get(i).getHC_DEPT()+"</td>");
				sb.append("<td>"+ViewList.get(i).getHC_POSITION()+"</td>");
				sb.append("<td>"+ViewList.get(i).getHDP_PAY()+"</td>");
				sb.append("<td>"+ViewList.get(i).getHDD_AMOUNT()+"</td>");
				sb.append("<td>"+result+"</td>");
				sb.append("<td><button type='button' class='infobtn' onclick='clickwages(\""+ViewList.get(i).getHC_ID()+"\")'>입력수정</button></td>");
				sb.append("<td><button type='button' class='infobtn' onclick='wages(\""+ViewList.get(i).getHC_ID()+"\")'>삭제</button></td></tr>");
			}
			Gson gson=new Gson();
			String total=gson.toJson(sb.toString());
			return total;
		}else if(checkpayid==null) {

		}
		return null;
	}

	public String deptsearchposition(String dept, String cCode) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("dept", dept);
		hMap.put("cCode", cCode);
		ArrayList<Department> dList=Ddao.deptsearchposition(hMap);
		Gson gson=new Gson();
		String json=gson.toJson(dList);
		return json;
	}
}
