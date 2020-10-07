package com.n7.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.n7.erp.bean.ConsultingBoard;
import com.n7.erp.bean.Member;
import com.n7.erp.service.ConsultingBoardMM;
import com.n7.erp.service.MemberMM;
import com.n7.erp.userClass.PagingVO;

import java.lang.reflect.Type;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController // @ResponseBody ��������
@RequestMapping(value = "/rest")
public class HomeRestController {

	@Autowired
	private MemberMM mm;

	@Autowired
	private ConsultingBoardMM cbm;


	@GetMapping(value = "/home/searchfromid")
	public String getSearchFromId(String m_id) {
		String result = mm.getSearchFromId(m_id);
		return result;
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
	public String deleteCompany(String cCode) {
		return mm.deleteCompany(cCode);
	}

	@PostMapping(value="/home/checkgrade")
	public String checkGrade(HttpSession session) {
		String result= mm.checkGrade(session);
		return result;
	}
	@PostMapping(value="/home/turnback")
	public String turnback(String num,String ect,HttpSession session) {
		String value= mm.turnback(num,ect,session);
		return value;
	}
	@PostMapping(value="/home/approvalagree")
	public String approvalagree(String num,HttpSession session) {
		String value= mm.approvalagree(num,session);
		return value;
	}
	@PostMapping(value="/home/arbitrarily")
	public String arbitrarily(String num,HttpSession session) {
		String value= mm.arbitrarily(num,session);
		return value;
	}
	@PostMapping(value = "/home/boardSearch")
	   public Map<String, List<ConsultingBoard>> boardSearch(String choice, String keyword) {
	      Map<String, List<ConsultingBoard>>bMap=cbm.boardSearch(choice, keyword);
	      return bMap;
	   }
	@GetMapping(value = "/home/getfunction")
	public ResponseEntity<String> getFunction(HttpSession session) {
		return mm.getFunction(session.getAttribute("cCode").toString());
	}

	@PostMapping(value = "/home/forcewithdrawal")
	public String forceWithDrawal(String jsonStr) {
		System.out.println(jsonStr);
		List<String> slist = new Gson().fromJson(jsonStr, new TypeToken<List<String>>() {
		}.getType());
		System.out.println(slist);
		mm.forceWithDrawal(slist);
		return null;
	}
	@PostMapping(value = "/home/boardSearch")
	   public Map<String, List<ConsultingBoard>> boardSearch(String choice, String keyword) {
	      Map<String, List<ConsultingBoard>>bMap=cbm.boardSearch(choice, keyword);
	      return bMap;
	   }
	@PostMapping(value = "/home/insertReply")
	public Map<String,ConsultingBoard> insertReply(String num, String reply) {
		Map<String,ConsultingBoard>bMap=cbm.insertReply(num, reply);
		return bMap;
	}

	@PostMapping(value = "/home/writeBoard")
	public String writeBoard(ConsultingBoard board, HttpSession session) {
	     String value=cbm.writeBoard(board, session);
	    return value;
	}

	@PostMapping(value = "/home/delectBoard")
	public String delectBoard(String num, String password) {
		String value=cbm.delectBoard(num, password);
		return value;
	}
}
