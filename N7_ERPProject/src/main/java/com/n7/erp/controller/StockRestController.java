package com.n7.erp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.n7.erp.bean.Category;
import com.n7.erp.bean.ItemCode;
import com.n7.erp.service.StockMM;

@RestController
@RequestMapping(value = "/stock")
public class StockRestController {

	ModelAndView mav;

	@Autowired
	StockMM stmm;

	@RequestMapping(value = "/categoryconfirm", method = RequestMethod.POST) 
	public ResponseEntity<String> categoryCofirm(Category ct,HttpSession session) {
		return stmm.categoryCofirm(ct,session);
	}

	@RequestMapping(value = "/getcategory", method = RequestMethod.POST)
	public ResponseEntity<List<Category>> getCategory(Category ct,HttpSession session) {
		return stmm.getCategory(ct, session);
	}

	@RequestMapping(value = "/modifycategory", method = RequestMethod.POST)
	public ResponseEntity<String> modifycategory(Category ct,HttpSession session) {
		return stmm.modifyCategory(ct,session);
	}

	@RequestMapping(value = "/deletecategory", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCategory(Category ct,HttpSession session) {
		return stmm.deleteCategory(ct,session);
	}

	@RequestMapping(value = "/getitemcode", method = RequestMethod.GET)
	public ResponseEntity<List<ItemCode>> getItemCode(ItemCode it,HttpSession session) {
		return stmm.getItemCode(it,session);
	}

	@RequestMapping(value = "/getct", method = RequestMethod.POST)
	public ResponseEntity<String> getCt(Category ct,HttpSession session) {
		return stmm.getCt(ct,session);
	}

	@RequestMapping(value = "/itemcodeconfirm", method = RequestMethod.POST)
	public ResponseEntity<String> itemCodeConfirm(@RequestBody MultiValueMap<String, String> formData, ItemCode it,HttpSession session) {
		it = stmm.setItemCode(formData, it);
		return stmm.itemCodeConfirm(it,session);
	}

	@RequestMapping(value = "/modifyitemcode", method = RequestMethod.POST)
	public ResponseEntity<String> modifyItemCode(@RequestBody MultiValueMap<String, String> formData, ItemCode it,HttpSession session) {
		it = stmm.setItemCode(formData, it);
		return stmm.modifyItemCode(it,session);
	}

	@RequestMapping(value = "/deleteitemcode", method = RequestMethod.POST)
	public ResponseEntity<String> deleteItemCode(@RequestBody MultiValueMap<String, String> formData, ItemCode it,HttpSession session) {
		it = stmm.setItemCode(formData, it);
		return stmm.deleteItemCode(it,session);
	}

	@RequestMapping(value = "/getimportlist", method = RequestMethod.POST)
	public ResponseEntity<String> getImportList(String ie_status, String date1, String date2,HttpSession session) {
		return stmm.getImportList(ie_status, date1, date2,session);
	}

	@RequestMapping(value = "/confirmimportcheck", method = RequestMethod.POST)
	public ResponseEntity<String> confirmImportCheck(@RequestBody String ipList, HttpSession session) {
		try {
			ipList = URLDecoder.decode(ipList, "UTF-8");
			ipList = ipList.substring(1, ipList.length() - 1);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return stmm.cofirmImportCheck(ipList, session);
	}

	@RequestMapping(value = "/getbyitemdeallist", method = RequestMethod.POST)
	public ResponseEntity<String> getByItemDealListFromItCcode(ItemCode it,HttpSession session) {
		return stmm.getByItemDealList(it,session);
	}

	@RequestMapping(value = "/getbyitemstocklist", method = RequestMethod.POST)
	public ResponseEntity<String> getByItemStockList(ItemCode it,HttpSession session) {
		return stmm.getByItemStockList(it,session);
	}
	
	@RequestMapping(value = "/getmonthpayment", method = RequestMethod.POST)
	public ResponseEntity<String> getMonthPayment(String date1, String date2,HttpSession session) {
		return stmm.getMonthPayment(date1,date2,session);
	}
	@RequestMapping(value = "/confirmexportcheck", method = RequestMethod.POST)
	public ResponseEntity<String> confirmExportCheck(@RequestBody String ipList, HttpSession session) {
		try {
			ipList = URLDecoder.decode(ipList, "UTF-8");
			ipList = ipList.substring(1, ipList.length() - 1);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return stmm.cofirmExportCheck(ipList, session);
	}
	@RequestMapping(value = "/getclcode", method = RequestMethod.GET)
	public ResponseEntity<String> getClcode(HttpSession session) {
		return stmm.getClcode(session);
	}
}
