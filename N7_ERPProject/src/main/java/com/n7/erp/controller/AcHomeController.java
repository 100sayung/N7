package com.n7.erp.controller;

import java.util.Locale;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.n7.erp.bean.ac.ApprovalDocument;
import com.n7.erp.service.AccountMM;

@Controller
public class AcHomeController {

	@Autowired
	AccountMM am;

	ModelAndView mav;

	@RequestMapping(value = "Account/acerp", method = RequestMethod.GET)
	public String acerp() {

		return "Account/acerp";
	}

	@RequestMapping(value = "Account/openTable", method = RequestMethod.GET)
	public String openTable() {

		return "Account/openTable";
	}

	@RequestMapping(value = "Account/comPany", method = RequestMethod.GET)
	public String comPany() {

		return "Account/comPany";
	}

	@RequestMapping(value = "Account/taxbill", method = RequestMethod.GET)
	public ModelAndView taxbill(String check, HttpSession session) {
		System.out.println(check);
		mav = am.getTaxbill(check, session);
		return mav;
	}

	@RequestMapping(value = "Account/acApproval", method = RequestMethod.GET)
	public ModelAndView acApproval(String check, HttpSession session) {
		System.out.println(check);
		mav = am.acApproval(check, session);
		return mav;
	}

	@RequestMapping(value = "Account/approvalLine", method = RequestMethod.GET)
	public ModelAndView approvalLine(HttpSession session) {
		mav = am.approvalLine(session);
		return mav;
	}

	@RequestMapping(value = "Account/saledetails", method = RequestMethod.GET)
	public ModelAndView saledetails(String check, HttpSession session) {
		System.out.println(check);
		mav = am.saledetails(check, session);
		return mav;
	}

	@RequestMapping(value = "Account/SaleDetaileAS", method = RequestMethod.GET)
	public ModelAndView SaleDetaileAS(String check, HttpSession session) {
		mav = am.SaleDetaile(check, session);
		return mav;
	}

	@RequestMapping(value = "Account/SaleDetaileAP", method = RequestMethod.GET)
	public ModelAndView SaleDetaileAP(String check, HttpSession session) {
		mav = am.SaleDetaile(check, session);
		return mav;
	}

	@RequestMapping(value = "Account/approdocument", method = RequestMethod.POST)
	public ModelAndView approdocument(HttpServletRequest request, ApprovalDocument ad, HttpSession session) {
		mav = am.approdocument(request, ad, session);
		return mav;
	}
////////////////////////////////////////////////////////////////////////////////
//분개전표
////////////////////////////////////////////////////////////////////////////////

////분개전표 메인창으로 이동
//@RequestMapping(value = "Account/acMain", method = RequestMethod.GET)
//public String acMain(Locale locale) {
//return "Account/acMain";
//}

// 분개전표 입력창
	@RequestMapping(value = "Account/acWritefrm", method = RequestMethod.GET)
	public String acWritefrm(Locale locale) {
		return "Account/acWritefrm";
	}

// 내가올린 결재함 - 공통
	@RequestMapping(value = "Account/apupPayment", method = RequestMethod.GET)
	public String acPend(Locale locale) {
		return "Account/apupPayment";
	}

// 내가받은 결재함 -공통
	@RequestMapping(value = "Account/apdownPayment", method = RequestMethod.GET)
	public String acDownlist(Locale locale) {
		return "Account/apdownPayment";
	}

// 임시저장 결재함
	@RequestMapping(value = "Account/acTemporary", method = RequestMethod.GET)
	public String acpreList(Locale locale) {
		return "Account/acTemporary";
	}

// 내가올린 결재안 상세보기
	@RequestMapping(value = "Account/apUpinfo", method = RequestMethod.GET)
	public String acCartinfo(Locale locale) {
		return "Account/apUpinfo";
	}

// 내가받은 결재안 상세보기
	@RequestMapping(value = "Account/apDowninfo", method = RequestMethod.GET)
	public String acApinfo(Locale locale) {
		return "Account/apDowninfo";
	}

// 임시저장 결재안 상세보기
	@RequestMapping(value = "Account/acTemroinfo", method = RequestMethod.GET)
	public String acapPreinfo(Locale locale) {
		return "Account/acTemroinfo";
	}

}
