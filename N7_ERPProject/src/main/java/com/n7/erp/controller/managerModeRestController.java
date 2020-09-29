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

import com.n7.erp.bean.Authority;
import com.n7.erp.bean.Company;
import com.n7.erp.bean.Menu;
import com.n7.erp.bean.clientMenu;
import com.n7.erp.service.menuMM;

@RestController
@RequestMapping(value = "/rest")
public class managerModeRestController {
	@Autowired
	menuMM mm;

	ModelAndView mav;

	@GetMapping(value = "/managermode/getmenu", produces = "application/json;charset=utf-8")
	public Map<String, List<Menu>> getmenu() {
		Map<String, List<Menu>> mMap = mm.getmenu();
		return mMap;
	}

	@GetMapping(value = "/managermode/getaddmenu", produces = "application/json;charset=utf-8")
	public Map<String, List<clientMenu>> getaddmenu(HttpSession session) {
		Map<String, List<clientMenu>> mMap = mm.getaddmenu(session);
		return mMap;
	}

	@GetMapping(value = "/managermode/getCompanyInfo",produces="application/json;charset=utf-8" )
	public  Map<String, List<Company>> getCompanyInfo(HttpSession session) {
		Map<String, List<Company>> mMap=mm.getCompanyInfo(session);
		return mMap;
	}
	
	@PostMapping(value = "/managermode/addmenu", produces = "application/json;charset=utf-8")
	public Map<String, Object> addmenu(String MENU, HttpSession session) {
		String[] strArray = MENU.split(",");
		Map<String, Object> mMap = mm.addmenu(strArray, session);
		return mMap;
	}

	@PostMapping(value = "/managermode/companyUpdate", produces = "application/json;charset=utf-8")
	public ModelAndView companyUpdate(Company cp) {
		mav = mm.companyUpdate(cp);
		return mav;
	}

	@PostMapping(value = "/managermode/depratmentSave", produces = "application/json;charset=utf-8")
	public int depratmentSave(Authority au) {
		int a = mm.authInsert(au);
		return a;
	}

	@GetMapping(value = "/managermode/authoritList", produces = "application/json;charset=utf-8")
	public Map<String, List<Authority>> authoritList(HttpSession session) {
	Map<String, List<Authority>> pMap = mm.authoritList(session);
		return pMap;
	}

	@PostMapping(value = "/managermode/depratmentDelete", produces="application/json;charset=utf-8")
	public int depratmentDelete(String au_name, Authority au, HttpSession session) {
		System.out.println("부서명: "+au_name);
		int a = mm.depratmentDelete(au_name, session);
		
		return a;
	}
	
	
}
