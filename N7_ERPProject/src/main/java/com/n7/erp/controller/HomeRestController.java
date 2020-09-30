package com.n7.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.n7.erp.bean.Member;
import com.n7.erp.service.MemberMM;
import com.n7.erp.userClass.PagingVO;

import java.lang.reflect.Type;
import java.util.*;

@RestController // @ResponseBody ��������
@RequestMapping(value = "/rest")
public class HomeRestController {

	@Autowired
	private MemberMM mm;

	@GetMapping(value = "/home/searchfromid")
	public String getSearchFromId(String m_id) {
		String result = mm.getSearchFromId(m_id);
		return result;
	}

	@PostMapping(value = "/home/changegrade")
	public String updateChangeGrade(String jsonStr) {
		List<Member> mlist = new Gson().fromJson(jsonStr, new TypeToken<List<Member>>() {
		}.getType());
		System.out.println(mlist);
		String result = mm.updateChangeGrade(mlist);
		return result;
	}

	@PostMapping(value = "/home/forcewithdrawal")
	public String forceWithDrawal(String jsonStr) { // ������
		System.out.println(jsonStr);
		List<String> slist = new Gson().fromJson(jsonStr, new TypeToken<List<String>>() {
		}.getType());
		System.out.println(slist);
		mm.forceWithDrawal(slist);
		return null;
	}
	
	@GetMapping(value="/home/dupleid")
	public String getDupleID(String m_id) {
		String result = mm.getDupleID(m_id);
		return result;
	}
	
	@GetMapping(value="/home/dupleccode")
	public String getDupleCCode(String m_ccode) {
		String result = mm.getDupleCCode(m_ccode);
		return result;
	}
	@PostMapping(value="/home/deletecompany")
	public String deleteCompany(String m_ccode) {
		return mm.deleteCompany(m_ccode);
	}

}
