package com.n7.erp.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	//遺��꽌 �벑濡�
	public ModelAndView deptregistinsert(Department dept, String cCode) {
		String view = null;
		System.out.println(dept.getHDP_dept());
		dept.setHdp_ccode(cCode);
		if(dept.getHDP_dept()!="" && dept.getHDP_position()!="") {
			if (Ddao.deptregistinsert(dept)) {
				view = "hr/deptregistpage";
			}
		}else {
			mav.addObject("failure", "부서 및 직책이 입력되지 않았습니다 입력해주세요.");
			view="hr/deptregistpage";
		}
		mav.setViewName(view);
		return mav;
	}

	// 遺��꽌,吏곴툒 湲됱뿬 蹂�寃� �럹�씠吏� �씠�룞�떆 遺��꽌,吏곴툒 紐⑸줉 異쒕젰
	public ModelAndView deptpayselect(String cCode) {
		String view = null;
		ArrayList<Department> dept = Ddao.deptpayselect(cCode);
		System.out.println("泥ル쾲吏� =" + dept.size());

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

	// 寃��깋�븷�븣 遺��꽌 吏곴툒<select>李� 紐⑸줉
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

	// 遺��꽌,吏곴툒 蹂�寃�
	public String deptpayupdate(String dept, Integer pay, String cCode) {
		System.out.println(dept);
		System.out.println(pay);
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("dept", dept);
		hMap.put("pay", pay.toString());
		hMap.put("cCode", cCode);
		System.out.println(hMap.get("pay"));
		if (Ddao.deptpayupdate(hMap)) {
			System.out.println("popopo");
			String resultdept = Ddao.payselect(hMap);
			System.out.println("�븘�븘 = " + resultdept);
			if (resultdept != null) {
				return resultdept;
			}
		}
		return null;
	}

	// 遺��꽌/吏곴툒 �궘�젣
	public String deptdelete(Integer deptnum, String cCode) {
		String json = null;
		HashMap<String, String> delMap = new HashMap<String, String>();
		delMap.put("deptnum", deptnum.toString());
		delMap.put("cCode", cCode);
		if (Ddao.deptdelete(delMap)) {
			ArrayList<Department> deList = Ddao.deptafterselect(cCode);
			System.out.println(deList);
			Gson gson = new Gson();
			json = gson.toJson(deList);
		}
		return json;
	}

	public ModelAndView searchpay(String cCode) {
		ArrayList<HR_Card> deList = Ddao.searchpay(cCode);
		System.out.println("紐⑸줉="+deList);
		String view="/hr/searchpaymm";
		mav.setViewName(view);
		return mav;
	}

	// 怨듭젣�궗�빆 愿�由� �럹�씠吏� �씠�룞 and 怨듭젣 紐⑸줉 異쒕젰
	public ModelAndView moveDeduct(String cCode) {
		String view = null;
		ArrayList<Deduct> duList = Ddao.moveDeduct(cCode);
		System.out.println("怨듭젣 = " + duList.size());
		if (duList != null) {
			Gson gson = new Gson();
			String json = gson.toJson(duList);
			System.out.println(json);
			mav.addObject("deduct", json);
		}
		mav.setViewName(view);
		return mav;
	}

	// 怨듭젣 湲덉븸 �닔�젙
	public String modifyDeduction(String deduct, Integer denum, String cCode) {
		HashMap<String, String> duMap = new HashMap<String, String>();
		duMap.put("deduct", deduct);
		duMap.put("denum", denum.toString());
		duMap.put("cCode", cCode);
		System.out.println(duMap);
		if (Ddao.modifyDeduction(duMap)) {
			System.out.println("????");
			String Deduction = Ddao.findDeduction(duMap);
			System.out.println(Deduction);
			if (Deduction != null) {
				return Deduction;
			}
		}
		return null;
	}

	// 遺��꽌 吏곴툒寃��깋 湲곕뒫
	public String findDeptPosition(String disdept, String disposition, String cCode) {
		System.out.println(disdept + "," + disposition);
		System.out.println(disdept);
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

		ArrayList<Department> distinctdept = Ddao.distinctdept(cCode);
		ArrayList<Department> distinctposition = Ddao.distinctposition(cCode);
		System.out.println(distinctdept);
		ArrayList<String> deptList = new ArrayList<String>();
		ArrayList<String> positionList = new ArrayList<String>();
		for (int i = 0; i < distinctdept.size(); i++) {
			deptList.add(distinctdept.get(i).getHDP_dept());
		}
		for (int i = 0; i < distinctposition.size(); i++) {
			positionList.add(distinctposition.get(i).getHDP_position());
		}
		HashMap<String, ArrayList<String>> deptAll = new HashMap<String, ArrayList<String>>();
		deptAll.put("deptList", deptList);
		deptAll.put("positionList", positionList);
		Gson gson = new Gson();
		String result = gson.toJson(deptAll);
		System.out.println(result);
		return result;
	}

	public String getDeptAuthList(String cCode) {
		ArrayList<Department> deptlist = Ddao.getDeptAuthlist(cCode); // �궗�떎 �씠寃� �쟾泥닿툈�뼱�삤�뒗嫄곗엫
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

	// 湲됱뿬議고쉶 �럹�씠吏� 紐⑸줉
	public String searchwages() {
		ArrayList<ViewPay> mList = new ArrayList<ViewPay>();
		mList = Ddao.searchwages();
		System.out.println(mList);
		Gson json = new Gson();
		String gson = json.toJson(mList);
		return gson;
	}

	// 湲됱뿬紐낆꽭�꽌
	public ModelAndView detailpay(String hc) {
		System.out.println("�삤�굹�뿬?" + hc);
		mav = new ModelAndView();
		HR_Card card = Ddao.detailpay(hc);
		ViewPay pay = Ddao.paysearch(hc);
		String code = card.getHc_ccode();
		String hrcode = card.getHc_hrcode();
		String name = Ddao.findname(hc);
		System.out.println(name);
		ArrayList<Deduct> deduct = Ddao.deduct(code);
		Payroll incentive = Ddao.findincentive(hrcode);
		mav.addObject("incentive", incentive);
		mav.addObject("name", name);
		mav.addObject("deduct", deduct);
		mav.addObject("pay", pay);
		mav.addObject("card", card);
		return mav;
	}

	// 湲됱뿬 紐낆꽭�꽌 �엯�젰 諛� �닔�젙
	public ModelAndView payroll(ViewPay pay) {
		System.out.println("DJ?");
		String view = null;
		String selectpay = Ddao.findpay(pay);
		if (selectpay == null) {
			// �씤�꽌�듃
			if (Ddao.insertpay(pay)) {
				view = "/hr/searchpaymm";
			} else {
				view = "/hr/payinputmodify";
			}
		} else if (selectpay != null) {
			// �뾽�뜲�씠�듃
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
		System.out.println("banana");
		if (pay != null) {
			Gson gson = new Gson();
			String json = gson.toJson(pay);
			System.out.println("json=" + json);
			return json;
		}
		return null;
	}
	//급여명세서 아이디나 이름으로 검색
	public String findcheckpayid(String checkpayid) {
		System.out.println("checkpayid="+checkpayid);
		StringBuilder sb=new StringBuilder();
		if(checkpayid!=null) {
			ArrayList<ViewPay> ViewList=Ddao.checkingidname(checkpayid);
			System.out.println("성공?"+ViewList);
				sb.append("<tr><td>아이디</td><td>이름</td><td>부서</td><td>직책</td><td>급여</td><td>기본공제액</td><td>기본수령액</td></tr>");
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
				sb.append("<td><button type='button' onclick='clickwages(\""+ViewList.get(i).getHC_ID()+"\")'>입력 수정하기</button></td>");
				sb.append("<td><button type='button' onclick='wages(\""+ViewList.get(i).getHC_ID()+"\")'>상세보기</button></td></tr>");
			}
			System.out.println("배열로="+sb.toString());
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
		System.out.println(dept+","+cCode);
		System.out.println("[[[="+dList);
		return json;
	}
}

