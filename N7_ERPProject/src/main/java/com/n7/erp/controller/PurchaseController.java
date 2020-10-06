package com.n7.erp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.service.PurchaseMM;


@Controller
public class PurchaseController {
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	@Autowired
	PurchaseMM pm;

	ModelAndView mav;

	@RequestMapping(value = "Purchase/erpmain", method = RequestMethod.GET)
	public String purchasemain() {
		return "Purchase/erpmain";
	}
	
	@RequestMapping(value = "Purchase/pregistration", method = RequestMethod.GET)
	public String pregistration() {
		return "Purchase/pregistration";
	}
	
	@RequestMapping(value = "Purchase/purchasedetail", method = RequestMethod.GET)
	public ModelAndView purchasedetail(String check) {
		mav = pm.pDetail(check);
		System.out.println("check들어감?="+check);
		return mav;
	}
	
	@RequestMapping(value = "Purchase/pprogramwrite", method = RequestMethod.GET)
	public ModelAndView pprogramwrite(String check) {
		System.out.println("check="+check);
		mav = pm.pProgram(check);
		return mav;
	}
	
	@RequestMapping(value = "Purchase/approvalLine", method = RequestMethod.GET)
	public ModelAndView approvalLine() {
		mav=pm.approvalLine();
		return mav;
	}
	
	@RequestMapping(value = "Purchase/retrunregistration", method = RequestMethod.GET)
	public String returnregistration() {
		return "Purchase/retrunregistration";
	}
	
	@RequestMapping(value = "Purchase/purchaseApprovalInfo", method = RequestMethod.GET)
	public String purchaseApprovalInfo() {
		return "Purchase/purchaseApprovalInfo";
	
	}
	
	@RequestMapping(value = "Purchase/paUpinfo", method = RequestMethod.GET)
	public String paUpinfo(Locale locale) {
		return "Purchase/paUpinfo";
	}
	
	@RequestMapping(value = "Purchase/paDowninfo", method = RequestMethod.GET)
	public String paDowninfo(Locale locale) {
		return "Purchase/paDowninfo";
	}
	 
}
