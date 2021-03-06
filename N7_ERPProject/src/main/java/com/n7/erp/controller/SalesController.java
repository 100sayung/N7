package com.n7.erp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.sales.A_company;
import com.n7.erp.bean.sales.Businessbean;
import com.n7.erp.bean.sales.Salesbean;
import com.n7.erp.bean.sales.Shippingbean;
import com.n7.erp.bean.sales.Uncollectedbean;
import com.n7.erp.bean.sales.approvalLine;
import com.n7.erp.bean.sales.approvaldetail;
import com.n7.erp.service.Salesmm;



@RestController
@RequestMapping(value="/rest")
public class SalesController {

   @Autowired
   Salesmm sm;

   ModelAndView mav;

   @GetMapping(value = "/sales/orderitem") //수주 DB데이터 긁어온 거
   public @ResponseBody Map<String, List<Salesbean>> orderitem(HttpSession session) {
     System.out.println("여긴들어와?1");
     Map<String, List<Salesbean>> sMap=sm.orderitem(session);
      return sMap;
   }

   @PostMapping(value = "/sales/orderregistrationinput",produces="application/json;charset=utf-8") //수주등록
   public ModelAndView orderregistrationinput(Salesbean s, HttpSession session) {
     System.out.println("슈밤111111");
     mav=sm.orderregistrationinput(s, session);
      return mav;
   }

   @PostMapping(value = "/sales/orderregistrationsearch") //수주검색
   public Map<String, List<Salesbean>> orderregistrationsearch(String search, String choice, HttpSession session) {
     Map<String, List<Salesbean>> sMap=sm.orderregistrationsearch(search, choice, session);
      return sMap;
   }

   @PostMapping(value = "/sales/orderregistrationdelete") //수주삭제
   public Map<String, List<Salesbean>> orderregistrationdelete(String check, HttpSession session) {
      Map<String, List<Salesbean>> sMap=sm.orderregistrationdelete(check, session);
      return sMap;
   }


   @PostMapping(value = "/sales/shippingrequestinput",produces="application/json;charset=utf-8") //출하의뢰등록
   public ModelAndView shippingrequestinput(Shippingbean ss, HttpSession session) { //HttpServletrequest request
     //String bs_quantity = request.getParameter("bs_quantity");
     //Map<String, List<Shippingbean>> sMap=sm.shippingrequestinput(ss, session);
     mav=sm.shippingrequestinput(ss, session);
      return mav;
   }
   
   @GetMapping(value = "/sales/shippingitem") //출하 DB데이터 긁어온 거
   public @ResponseBody Map<String, List<Shippingbean>> shippingitem(Shippingbean ss, HttpSession session) {
     Map<String, List<Shippingbean>> sMap=sm.shippingitem(session);
      return sMap;
   }

   @PostMapping(value = "/sales/shippingrequestsearch") //출하검색
   public Map<String, List<Shippingbean>> shippingrequestsearch(String search, String choice, HttpSession session) {
     Map<String, List<Shippingbean>> sMap=sm.shippingrequestsearch(search, choice, session);
      return sMap;
   }

   @PostMapping(value = "/sales/shippingrequestdelete") //출하삭제
   public Map<String, List<Shippingbean>> shippingrequestdelete(String check, HttpSession session) {
      Map<String, List<Shippingbean>> sMap=sm.shippingrequestdelete(check, session);
      return sMap;
   }
   @PostMapping(value = "/sales/approvalcheck") //출하삭제
   public Map<String, List<Shippingbean>> approvalcheck(String check, HttpSession session) {
	   Map<String, List<Shippingbean>> sMap=sm.approvalcheck(check, session);
	   return sMap;
   }
   
   //결재라인
   @PostMapping(value = "/sales/addApproval",produces="application/json;charset=utf-8" )
   public  Map<String, List<approvalLine>> addApproval(String CNT, String ARR) {
      int cnt = Integer.parseInt(CNT);
      String [] strArray = ARR.split(",");
      Map<String, List<approvalLine>> sMap=sm.addApproval(cnt,strArray);
      return sMap;
   }
   @PostMapping(value = "/sales/approLinecom",produces="application/json;charset=utf-8")
   public  Map<String, List<approvalLine>> approLinecom(String code1, String code2) {
      String [] code01 = code1.split(",");
//      String [] code02 = code2.split(",");

      System.out.println(code01[0]);
//    System.out.println(code02[0]);
      Map<String, List<approvalLine>> sMap=sm.approLinecom(code01);
      return sMap;
   }
   @PostMapping(value = "/sales/searchName",produces="application/json;charset=utf-8" )
   public  Map<String, List<approvalLine>> searchName(String name) {
      Map<String, List<approvalLine>> sMap=sm.searchName(name);
      return sMap;
   }

   @GetMapping(value = "/sales/getMyInfo",produces="application/json;charset=utf-8" )
   public  Map<String, List<approvalLine>> getMyInfo(HttpSession session) {
      Map<String, List<approvalLine>> mMap=sm.getMyInfo(session);
      return mMap;
   }

   @PostMapping(value = "/sales/approvalinput",produces="application/json;charset=utf-8") //출하 결재창 등록
   public ModelAndView approvalinput(approvaldetail app, HttpSession session) {
     System.out.println("슈밤111111");
     mav=sm.approvalinput(app, session);
      return mav;
   }

   @PostMapping(value = "/sales/uncollectedmoneyinput", produces = "application/json;charset=utf-8") // 미수금 등록
   public ModelAndView uncollectedmoneyinput(approvaldetail ap, HttpSession session) {
      System.out.println("들어가닝");
      mav = sm.uncollectedmoneyinput(ap, session);
      return mav;
   }

   @GetMapping(value = "/sales/uncollectedmoneyitem") //미수금 DB데이터 긁어온 거
   public @ResponseBody Map<String, List<approvaldetail>> uncollectedmoneyitem(HttpSession session) {
      System.out.println("여긴들어와?444444");
      Map<String, List<approvaldetail>> sMap=sm.uncollectedmoneyitem(session);
      return sMap;
   }

   @PostMapping(value = "/sales/uncollectedmoneysearch") //미수금 검색
   public Map<String, List<approvaldetail>> uncollectedmoneysearch(String search, String choice, HttpSession session) {
     Map<String, List<approvaldetail>> sMap=sm.uncollectedmoneysearch(search, choice, session);
      return sMap;
   }

   @GetMapping(value = "/sales/creditsearch") //외상
   public Map<String, List<approvaldetail>> creditsearch(HttpSession session) {
     Map<String, List<approvaldetail>> sMap=sm.creditsearch(session);
      return sMap;
   }

   @GetMapping(value = "/sales/fullpaymentsearch") //완납
   public Map<String, List<approvaldetail>> fullpaymentsearch(HttpSession session) {
     Map<String, List<approvaldetail>> sMap=sm.fullpaymentsearch(session);
      return sMap;
   }

   @PostMapping(value = "/sales/fullpaymentprocess") //완납 처리
   public Map<String, List<approvaldetail>> fullpaymentprocess(String check, HttpSession session) {
      System.out.println(check);
      Map<String, List<approvaldetail>> sMap=sm.fullpaymentprocess(check, session);
      return sMap;
   }

   @PostMapping(value = "/sales/businessactivitiesinput",produces="application/json;charset=utf-8") //영업활동 등록
   public ModelAndView businessactivitiesinput(Businessbean b, HttpSession session) {
      System.out.println("슈댕");
      mav=sm.businessactivitiesinput(b, session);
      return mav;
   }


   @PostMapping(value = "/sales/businessactivitiessearch") //영업활동 검색
   public Map<String, List<Businessbean>> businessactivitiessearch(String search, String choice, HttpSession session) {
     Map<String, List<Businessbean>> sMap=sm.businessactivitiessearch(search, choice, session);
      return sMap;
   }

   @PostMapping(value = "/sales/businessactivitiesdelete") //영업삭제
   public Map<String, List<Businessbean>> businessactivitiesdelete(String check, HttpSession session) {
      Map<String, List<Businessbean>> sMap=sm.businessactivitiesdelete(check, session);
      return sMap;
   }

   //올린 결재함 el
   @PostMapping(value = "/sales/approvaldetailinput",produces="application/json;charset=utf-8") //결재 상세보기 등록
   public ModelAndView approvaldetailinput(String bs_docunum, HttpSession session) {
      mav=sm.approvaldetailinput(bs_docunum, session);
      return mav;
   }

   //받은 결재함 el
   @PostMapping(value = "/sales/downapprovaldetailinput",produces="application/json;charset=utf-8") //결재 상세보기 등록
   public ModelAndView downapprovaldetailinput(String bs_docunum, HttpSession session) {
      mav=sm.downapprovaldetailinput(bs_docunum, session);
      return mav;
   }

    //내가 올린거 상세
   @GetMapping(value = "/sales/sRequest", produces = "application/json;charset=utf-8")
   public ModelAndView sRequest(String bs_docunum, HttpSession session) {
      mav = sm.sRequest(bs_docunum, session);
      System.out.println(bs_docunum);
      return mav;
   }

	// 내가받은 결재안 상세보기
		@GetMapping(value = "/sales/sRequest2", produces = "application/json;charset=utf-8")
		public ModelAndView sRequest2(String bs_docunum, HttpSession session) {
			mav = sm.sRequest2(bs_docunum, session);
			System.out.println(bs_docunum);
			return mav;
		}

	// 내가올린결재안에서 이름찾아오기
		@PostMapping(value = "/sales/getApprinfo", produces = "application/json;charset=utf-8")
		public Map<String, List<approvalLine>> getApprinfo(String CNT, String ARR, HttpSession session) {
			int cnt = Integer.parseInt(CNT);
			String[] strArray = ARR.split(",");
			Map<String, List<approvalLine>> sMap = sm.getApprinfo(cnt, strArray, session);
			return sMap;
		}


	@PostMapping(value = "/sales/searchcode", produces = "application/json;charset=utf-8")
	   public Map<String, List<Salesbean>> searchcode(String code, HttpSession session) {
	      Map<String, List<Salesbean>> sMap = sm.searchcode(code, session);
	      return sMap; 
	 }

	@PostMapping(value = "/sales/serchbonumlist", produces = "application/json;charset=utf-8")
	   public Map<String, List<Salesbean>> serchcomlist(HttpSession session) {
	      Map<String, List<Salesbean>> sMap = sm.serchbonumlist(session);
	      return sMap;
	}
	
	//부서명 찾아오기
	@GetMapping(value = "/sales/getbodept", produces = "application/json;charset=utf-8")
	//@ResponseBody
	public Map<String, List<approvalLine>> getbodept(HttpSession session) {
	   Map<String, List<approvalLine>> sMap = sm.getbodept(session);
	   System.out.println("부서명 찾아오기 ");
	   return sMap;
	}

}
