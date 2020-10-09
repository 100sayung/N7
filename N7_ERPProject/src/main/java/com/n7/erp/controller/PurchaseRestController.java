package com.n7.erp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ItemCode;
import com.n7.erp.bean.ps.Order;
import com.n7.erp.bean.ps.Purchase;
import com.n7.erp.bean.ps.PurchaseApproval;
import com.n7.erp.bean.ps.Return;
import com.n7.erp.bean.ps.approvalLine;
import com.n7.erp.service.PurchaseMM;

@RestController
@RequestMapping(value="/rest")
public class PurchaseRestController {
	@Autowired
	PurchaseMM pm;

	ModelAndView mav;

	//구매
	@PostMapping(value = "/Purchrase/pregistration", produces= "application/json;charest=utf-8" )
	public ModelAndView pregistration(HttpServletRequest request, Purchase ps, HttpSession session) {
		System.out.println(ps);
		mav= pm.pregistration(request, ps, session);
		return mav;
	}

	@GetMapping(value = "/Purchase/pference", produces= "application/json;charest=utf-8" )
	public Map<String, List<Purchase>> pference(HttpSession session) {
		System.out.println("들어감?");
		//System.out.println("pageNum="+pageNum);
		Map<String, List<Purchase>> pMap= pm.pFrerence(session);
		return pMap;
	}

	@PostMapping(value = "/Purchase/pfsearch", produces= "application/json;charest=utf-8" )
	public Map<String, List<Purchase>> pfsearch(String search, String choice, HttpSession session) {
		System.out.println("들어가라");
		System.out.println(search);
		System.out.println(choice);
		Map<String, List<Purchase>> pMap= pm.pfsearch(search, choice, session);
		return pMap;
	}

	@PostMapping(value = "/Purchase/pfdelete", produces= "application/json;charest=utf-8" )
	public Map<String, List<Purchase>> pfdelete(String check, HttpSession session) {
		System.out.println("check="+check);
		Map<String, List<Purchase>> pMap= pm.pfdelete(check, session);
		return pMap;
	}
	
	//결재
	@PostMapping(value = "/Purchase/addApproval",produces="application/json;charset=utf-8" )
	public  Map<String, List<approvalLine>> addApprovale(String CNT, String ARR) {
		int cnt = Integer.parseInt(CNT);
		String [] strArray = ARR.split(",");
		Map<String, List<approvalLine>> aMap=pm.addApproval(cnt,strArray);
		return aMap;
	}
	
	@PostMapping(value = "/Purchase/approLinecom",produces="application/json;charset=utf-8")
	public  Map<String, List<approvalLine>> approLinecom(String code1) {
		String [] code01 = code1.split(",");
		Map<String, List<approvalLine>> aMap=pm.approLinecom(code01);
		return aMap;
	}
	
	@PostMapping(value = "/Purchase/searchName",produces="application/json;charset=utf-8" )
	public  Map<String, List<approvalLine>> searchName(String name) {
		Map<String, List<approvalLine>> aMap=pm.searchName(name);
		return aMap;
	}

	@PostMapping(value = "/Purchase/purchaseApproval", produces= "application/json;charest=utf-8" )
	public ModelAndView pprogramwrite(HttpServletRequest request, PurchaseApproval pa, HttpSession session) {
		mav= pm.purchaseApproval(request, pa, session);
		return mav;
	}
	
	@PostMapping(value = "/Purchase/approvalcheck", produces= "application/json;charest=utf-8" )
	public Map<String, List<Purchase>> approvalcheck(String check, HttpSession session) {
		Map<String, List<Purchase>> pMap= pm.approvalcheck(check, session);
		return pMap;
	}

	// 내가올린 결재안 상세보기
	@GetMapping(value = "/Purchase/getMyInfo",produces="application/json;charset=utf-8" )
	public  Map<String, List<approvalLine>> getMyInfo(HttpSession session) {
	     Map<String, List<approvalLine>> mMap=pm.getMyInfo(session);
	     return mMap;
	}
	
	 @GetMapping(value = "/Purchase/pRequest", produces = "application/json;charset=utf-8")
	 public ModelAndView pRequest(String p_documentcode, HttpSession session) {
		mav = pm.pRequest(p_documentcode, session);
		System.out.println(p_documentcode);
		return mav;
	}

	// 내가받은 결재안 상세보기
	 @GetMapping(value = "/Purchase/pRequest2", produces = "application/json;charset=utf-8")
	 public ModelAndView pRequest2(String p_documentcode, HttpSession session) {
		mav = pm.pRequest2(p_documentcode, session);
		System.out.println(p_documentcode);
		return mav;
	}

	 @PostMapping(value = "/Purchase/getApprovalInfo", produces = "application/json;charset=utf-8")
	 public Map<String, List<approvalLine>> getApprinfo(String CNT, String ARR, HttpSession session) {
		int cnt = Integer.parseInt(CNT);
		String[] strArray = ARR.split(",");
		Map<String, List<approvalLine>> mMap = pm.getApprovalInfo(cnt, strArray, session);
		return mMap;
	}

	//반품
	@PostMapping(value = "/Purchase/rRegistration", produces= "application/json;charest=utf-8" )
	public ModelAndView rRegistration(Return rt, HttpSession session) {
		mav= pm.rRegistration(rt, session);
		return mav;
	}

	@GetMapping(value = "/Purchase/rInfo", produces= "application/json;charest=utf-8" )
	public Map<String, List<Return>> rInfo(HttpSession session) {
		Map<String, List<Return>> rMap= pm.rInfo(session);
		System.out.println("들어가");
		return rMap;
	}

	@PostMapping(value = "/Purchase/rdelete", produces= "application/json;charest=utf-8" )
	public Map<String, List<Return>> rdelete(String check_list, HttpSession session) {
		System.out.println("check_list:"+check_list);
		Map<String, List<Return>> rMap= pm.rDelete(check_list, session);
		return rMap;
	}

	@PostMapping(value = "/Purchase/retrunsearch", produces= "application/json;charest=utf-8" )
	public Map<String, List<Return>> retrunsearch(String search, String choice, HttpSession session) {
		System.out.println("choice="+choice);
		System.out.println("search="+search);
		Map<String, List<Return>> rMap= pm.rSearch(search, choice, session);
		return rMap;
	}

	//입고현황
	@GetMapping(value = "/Purchase/stocklist", produces= "application/json;charest=utf-8" )
	public Map<String, List<IePort>> stocklist(HttpSession session) {
		Map<String, List<IePort>> sMap= pm.stocklist(session);
		return sMap;
	}
	
	//재고현황
	@GetMapping(value = "/Purchase/getstocklist", produces= "application/json;charest=utf-8" )
	public Map<String, List<ItemCode>> getstocklist(HttpSession session) {
		Map<String, List<ItemCode>> sMap= pm.getstocklist(session);
		return sMap;
	}
	
	//발주
	@PostMapping(value = "/Purchase/orderinsert", produces= "application/json;charest=utf-8" )
	public ModelAndView orderinsert(Order od, HttpSession session) {
		mav= pm.orderinsert(od, session);
		return mav;
	}
	
	@GetMapping(value = "/Purchase/orderInfo", produces= "application/json;charest=utf-8" )
	public Map<String, List<Order>> orderInfo(HttpSession session) {
		System.out.println("들어감?");
		Map<String, List<Order>> pMap= pm.orderInfo(session);
		return pMap;
	}
	
	@PostMapping(value = "/Purchase/orderSearch", produces= "application/json;charest=utf-8" )
	public Map<String, List<Order>> orderSearch(String search, String choice, HttpSession session) {
		System.out.println("들어가라");
		System.out.println(search);
		System.out.println(choice);
		Map<String, List<Order>> pMap= pm.orderSearch(search, choice, session);
		return pMap;
	}

	@GetMapping(value = "/Purchase/orderpinfo", produces= "application/json;charest=utf-8" )
	public Map<String, List<ApprovalDocu>> orderpinfo(HttpSession session) {
		System.out.println("들어감?");
		Map<String, List<ApprovalDocu>> pMap= pm.orderpinfo(session);
		return pMap;
	}



}
