package com.n7.erp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.service.StockMM;

@Controller
@RequestMapping("/stock")
public class StockController {
	
	ModelAndView mav;
	@Autowired
	StockMM stmm;
	
	@RequestMapping(value = "/setitemcode", method = RequestMethod.GET)
	public String setItemCode() {
		return "stock/setitemcode";
	}
	@RequestMapping(value = "/setcategory", method = RequestMethod.GET)
	public String setCategory() {
		return "stock/setcategory";
	}
	@RequestMapping(value = "/importlist", method = RequestMethod.GET)
	public String importList() {
		return "stock/importlist";
	}
	@RequestMapping(value = "/importcheck", method = RequestMethod.GET)
	public ModelAndView impportCheck(HttpSession session) {
		mav = stmm.importCheck(session);
		return mav;
	}
	@RequestMapping(value = "/byitemdeallist", method = RequestMethod.GET)
	public String byItemDealList() {
		return "stock/byitemdeallist";
	}
	@RequestMapping(value = "/byitemstocklist", method = RequestMethod.GET)
	public String byItemStockList() {
		return "stock/byitemstocklist";
	}
	@RequestMapping(value = "/monthpayment", method = RequestMethod.GET)
	public String monthPayment() {
		return "stock/monthpayment";
	}
	@RequestMapping(value = "/accountconfirm", method = RequestMethod.GET)
	public String accountConfirm() {
		return "stock/accountconfirm";
	}
	@RequestMapping(value = "/addimportlist", method = RequestMethod.GET)
	public String addImportList() {
		return "stock/addimportlist";
	}
	@RequestMapping(value = "/exportstockcheck", method = RequestMethod.GET)
	public ModelAndView exportStockCheck(HttpSession session) {
		return stmm.exportStockCheck(session);
	}
	@RequestMapping(value = "/confirmimport", method = RequestMethod.POST)
	public ModelAndView confirmImport(HttpServletRequest request) {
		return stmm.cofirmImport(request);
	}
	@RequestMapping(value = "/confirmexport", method = RequestMethod.POST)
	public ModelAndView confirmExport(HttpServletRequest request) {
		return stmm.cofirmExport(request);
	}
}
