package com.n7.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.n7.erp.service.AdminMM;
import com.n7.erp.userClass.PagingVO;

@RestController
@RequestMapping(value="/rest")
public class AdminRestController {
	@Autowired AdminMM am;

	@GetMapping(value = "/admin/memberlist")
	public String memberList(PagingVO vo, String nowPage, String cntPerPage) {
		//	@RequestParam(value = "cntPerPage", required = false) 
		int total = am.countMember();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo);
		String result = new Gson().toJson(am.selectMember(vo));
		return result;
	}
	
	
	
	@GetMapping(value="/admin/memberpagenumber")
	public String memberPageNumber() {
		int result = am.countMember();
		return Integer.toString(result);
	}
	

	@GetMapping(value="/admin/companypagenumber")
	public String companyPageNumber() {
		int result = am.countCompany();
		return Integer.toString(result);
	}
	
	@GetMapping(value="/admin/companylist")
	public String companyList(String nowPage, String cntPerPage) {
		int total = am.countCompany();
		if(nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		String result = new Gson().toJson(am.selectCompany(vo));
		return result;
	}
	
	@GetMapping(value="admin/companytemp")
	public String companyTemp() {
		String result = am.companyTemp();
		return result;
	}
	
	

	//회원관리 검색페이징
	@GetMapping(value="/admin/ccodepagenumber")
	public String ccodePageNumber(String m_ccode) {
		int result = am.countCCodeMember(m_ccode);
		return Integer.toString(result);
	}
	
	@GetMapping(value="/admin/ccodememberlist")
	public String ccodeMemberList(String nowPage, String cntPerPage, String m_ccode) {
		int total = am.countCCodeMember(m_ccode);
		if(nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), m_ccode);
		
		String result = new Gson().toJson(am.selectCCodeMember(vo));
		return result;
	}
}
