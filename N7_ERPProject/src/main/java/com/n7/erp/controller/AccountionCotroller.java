package com.n7.erp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.ac.A_company;
import com.n7.erp.bean.ac.Account;
import com.google.gson.Gson;
import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.ac.ApprovalDocument;
import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.ac.SaleInfo;
import com.n7.erp.bean.ac.approvalLine;
import com.n7.erp.bean.ac.shipment;
import com.n7.erp.service.AccountMM;
import com.n7.erp.userClass.PagingVO;

@RestController
@RequestMapping(value = "/rest")
public class AccountionCotroller {
	@Autowired
	AccountMM am;

	ModelAndView mav;

	@PostMapping(value = "/Account/insertcomlist", produces = "application/json;charset=utf-8")
	public Map<String, List<A_company>> insertcomlist(A_company ac, HttpSession session) {
		Map<String, List<A_company>> aMap = am.insertcomlist(ac, session);
		return aMap;
	}

	@PostMapping(value = "/Account/searchcode", produces = "application/json;charset=utf-8")
	public Map<String, List<A_company>> searchcode(String use, String code, HttpSession session) {
		Map<String, List<A_company>> aMap = am.searchcode(use, code, session);
		return aMap;
	}

	@PostMapping(value = "/Account/getList", produces = "application/json;charset=utf-8")
	public Map<String, List<SaleInfo>> getList(String code) {
		System.out.println(code);
		Map<String, List<SaleInfo>> sMap = am.getList(code);
		return sMap;
	}

	/*
	 * @PostMapping(value = "/selectsale",produces="application/json;charset=utf-8"
	 * ) public Map<String, List<SaleInfo>> selectsale( String search) {
	 * System.out.println(search); Map<String, List<SaleInfo>>
	 * sMap=am.selectsale(search); return sMap; }
	 */
	@PostMapping(value = "/Account/saleinsert")
	public ModelAndView saleinsert(HttpServletRequest request, SaleInfo si, HttpSession session) {
		mav = am.saleinsert(request, si, session);
		return mav;
	}

	@PostMapping(value = "/Account/trensCom", produces = "application/json;charset=utf-8")
	public Map<String, List<A_company>> trensCom(String USE, String CODE, HttpSession session) {
		Map<String, List<A_company>> aMap = am.trensCom(USE, CODE, session);
		return aMap;
	}

	@PostMapping(value = "/Account/deleteSale", produces = "application/json;charset=utf-8")
	public Map<String, List<SaleInfo>> deleteSale(String CNT, String ARR, HttpSession session) {
		int cnt = Integer.parseInt(CNT);
		String[] strArray = ARR.split(",");
		Map<String, List<SaleInfo>> aMap = am.deleteSale(cnt, strArray, session);
		return aMap;
	}

	@PostMapping(value = "/Account/addApproval", produces = "application/json;charset=utf-8")
	public Map<String, List<approvalLine>> addApprovale(String CNT, String ARR) {
		int cnt = Integer.parseInt(CNT);
		String[] strArray = ARR.split(",");
		Map<String, List<approvalLine>> aMap = am.addApproval(cnt, strArray);
		return aMap;
	}

	@PostMapping(value = "/Account/approLinecom", produces = "application/json;charset=utf-8")
	public Map<String, List<approvalLine>> approLinecom(String code1) {
		String[] code01 = code1.split(",");

		System.out.println(code01[0]);
		Map<String, List<approvalLine>> aMap = am.approLinecom(code01);
		return aMap;
	}

	@PostMapping(value = "/Account/searchName", produces = "application/json;charset=utf-8")
	public Map<String, List<approvalLine>> searchName(String name) {
		Map<String, List<approvalLine>> aMap = am.searchName(name);
		return aMap;
	}

	@PostMapping(value = "/Account/serchcomlist", produces = "application/json;charset=utf-8")
	public Map<String, List<A_company>> serchcomlist(String use, HttpSession session) {
		Map<String, List<A_company>> aMap = am.serchcomlist(use, session);
		return aMap;
	}

	@GetMapping(value = "/Account/getsaleList", produces = "application/json;charset=utf-8")
	public Map<String, List<SaleInfo>> getsaleList(HttpSession session) {
		Map<String, List<SaleInfo>> sMap = am.getsaleList(session);
		return sMap;
	}

	@GetMapping(value = "/Account/getMyInfo", produces = "application/json;charset=utf-8")
	public Map<String, List<approvalLine>> getMyInfo(HttpSession session) {
		Map<String, List<approvalLine>> mMap = am.getMyInfo(session);
		return mMap;
	}

	@GetMapping(value = "/Account/getshipment", produces = "application/json;charset=utf-8")
	public Map<String, List<shipment>> getshipment(HttpSession session) {
		Map<String, List<shipment>> aMap = am.getshipment(session);
		return aMap;
	}

	@PostMapping(value = "/Account/getpkind", produces = "application/json;charset=utf-8")
	public Map<String, List<SaleInfo>> getpkind(String pkind) {
		Map<String, List<SaleInfo>> sMap = am.getpkind(pkind);
		return sMap;
	}

	@PostMapping(value = "/Account/selectSearch", produces = "application/json;charset=utf-8")
	public Map<String, List<SaleInfo>> selectSearch(String select, String choice) {
		System.out.println(select);
		System.out.println(choice);
		Map<String, List<SaleInfo>> sMap = am.selectSearch(select, choice);
		return sMap;
	}

	@PostMapping(value = "/Account/comparecode", produces = "application/json;charset=utf-8")
	public Map<String, List<ApprovalDocu>> comparecode(String code, HttpSession session) {
		System.out.println(code);
		Map<String, List<ApprovalDocu>> sMap = am.comparecode(code, session);
		return sMap;
	}
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////

// 분개전표 작성
	@PostMapping(value = "Account/actempoInsert", produces = "application/json;charset=utf-8")
	public int acCart(Account ac, HttpSession session) {
		int a = am.actempoInsert(ac, session);
		return a; // DAO
	}

// 페이징
	@GetMapping(value = "/Account/documentPagenumber")
	public String documentPagenumber() {
		int result = am.countDocument();
		return Integer.toString(result);
	}

//// 내가올린 결재안 목록(페이징x)
//@GetMapping(value = "Account/apupPaymentList", produces = "application/json;charset=utf-8")
//public Map<String, List<ApprovalDocu>> apupPaymentList(HttpSession session) {
//Map<String, List<ApprovalDocu>> pMap = am.apupPaymentList(session);
//return pMap;
//}

// 내가올린 결재안 목록(페이징o)
	@GetMapping(value = "Account/apupPaymentList", produces = "application/json;charset=utf-8")
	public String apupPaymentList(HttpSession session, String nowPage, String cntPerPage) {
		int total = am.countDocument();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		}

		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		int start = vo.getStart();
		int end = vo.getEnd();
		System.out.println(vo);
		String result = new Gson().toJson(am.apupPaymentList(session, vo, start, end));

		return result;
	}

// 내가올린 결재안 상세보기
	@GetMapping(value = "Account/apRequest", produces = "application/json;charset=utf-8")
	public ModelAndView apRequest(String j_docunum, HttpSession session) {
		mav = am.apRequest(j_docunum, session);
		System.out.println(j_docunum);
		return mav;
	}

//// 내가받은 결재안 목록(페이징x)
//@GetMapping(value = "Account/apdownPaymentList", produces = "application/json;charset=utf-8")
//public Map<String, List<ApprovalDocu>> apdownPaymentList(HttpSession session) {
//Map<String, List<ApprovalDocu>> pMap = am.apdownPaymentList(session);
//return pMap;
//}

// 내가받은 결재안 목록(페이징o)
	@GetMapping(value = "Account/apdownPaymentList", produces = "application/json;charset=utf-8")
	public String apdownPaymentList(HttpSession session, String nowPage, String cntPerPage) {
		int total = am.countDocument();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		}
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		int start = vo.getStart();
		int end = vo.getEnd();
		System.out.println(vo);
		String result = new Gson().toJson(am.apdownPaymentList(session, vo, start, end));

		return result;
	}

// 내가받은 결재안 상세보기
	@GetMapping(value = "Account/apRequest2", produces = "application/json;charset=utf-8")
	public ModelAndView apRequest2(String j_docunum, HttpSession session) {
		mav = am.apRequest2(j_docunum, session);
		System.out.println(j_docunum);
		return mav;
	}

//// 임시저장 결재안 목록
//@GetMapping(value = "Account/acTemporaryList", produces = "application/json;charset=utf-8")
//public Map<String, List<Account>> acTemporaryList(HttpSession session) {
//Map<String, List<Account>> aMap = am.acTemporaryList(session);
//return aMap;
//}
// 임시저장 결재안 목록(페이징o)
	@GetMapping(value = "Account/acTemporaryList", produces = "application/json;charset=utf-8")
	public String acTemporaryList(HttpSession session, String nowPage, String cntPerPage) {
		int total = am.countDocument();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		}
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		int start = vo.getStart();
		int end = vo.getEnd();
		System.out.println(vo);
		String result = new Gson().toJson(am.acTemporaryList(session, vo, start, end));
		return result;
	}

// 임시저장 결재안 상세보기
	@GetMapping(value = "Account/acRequest", produces = "application/json;charset=utf-8")
	public ModelAndView acRequest(String j_docunum, HttpSession session) {
		mav = am.acRequest(j_docunum, session);
		System.out.println(j_docunum);
		return mav;
	}

// 내문서결재요청(업데이트)
	@PostMapping(value = "Account/acSign", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView acSign(Account ac, ApprovalDocu ap, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		System.out.println("acSign 결재요청");
		mav = am.acSign(ac, ap, req, rep, session);
		return mav; // DAO
	}

// 다른사람이 내문서 결재(업데이트)
	@PostMapping(value = "Account/acSign2", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView acSign2(Account ac, ApprovalDocu ap, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		mav = am.acSign2(ac, ap, req, rep, session);
		return mav; // DAO
	}

// 결재안 삭제
	@RequestMapping(value = "Account/acDelete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int acDelete(String j_docunum, Account ac, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		System.out.println(j_docunum);
		int a = am.acDelete(j_docunum, ac, req, rep, session);
		return (int) a; // DAO
	}

// 반려(업데이트)
	@RequestMapping(value = "Account/acBack", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView acBack(Account ac, ApprovalDocu ap, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		System.out.println(ac.getJ_docunum());
		mav = am.acBack(ac, ap, req, rep, session);
		return mav; // DAO
	}

// 내가올린결재안에서 이름찾아오기
	@PostMapping(value = "/Account/getApprinfo", produces = "application/json;charset=utf-8")
	public Map<String, List<approvalLine>> getApprinfo(String CNT, String ARR, HttpSession session) {
		int cnt = Integer.parseInt(CNT);
		String[] strArray = ARR.split(",");
		Map<String, List<approvalLine>> mMap = am.getApprinfo(cnt, strArray, session);
		return mMap;
	}

}
