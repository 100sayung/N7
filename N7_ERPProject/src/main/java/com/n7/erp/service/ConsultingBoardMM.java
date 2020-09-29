package com.n7.erp.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.n7.erp.bean.ConsultingBoard;
import com.n7.erp.dao.HRIDeptDao;
import com.n7.erp.dao.IConsultingBoardDao;
import com.n7.erp.userClass.Paging;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ConsultingBoardMM {

	@Autowired
	private IConsultingBoardDao CBdao;

	ModelAndView mav = new ModelAndView();
	//게시판 이동시 목록 출력
	public ModelAndView moveBoardList() {
		String view=null;
		mav=new ModelAndView();
		ArrayList<ConsultingBoard> bList=new ArrayList<ConsultingBoard>();
		bList=CBdao.moveBoardList();
		System.out.println("게시판 목록 불러오기="+bList);
		Integer pageNum=bList.size();
		System.out.println("전체 글 갯수"+pageNum);
		pageNum=(pageNum==null)?1:pageNum;

		if(pageNum<=0) {
			System.out.println("잘못된 페이지 번호");
		}
		if(bList!=null) {
			System.out.println("나는 모르겠다");
			Gson gson=new Gson();
			String json=gson.toJson(bList);
			mav.addObject("bList", json);
			mav.addObject("paging", getPaging(pageNum));
			view="/home/erpboard";
		}
		mav.setViewName(view);
		return mav;
	}
	//페이징
	private Object getPaging(Integer pageNum) {
		Integer maxNum=CBdao.getBoardList();
		System.out.println("maxnum="+maxNum);
		int listCount=5;
		int pageCount=2;
		String boardName="/erp/home/erpboard";
		Paging paging=new Paging(pageNum,maxNum, listCount, pageCount, boardName);
		System.out.println("======"+paging.makeHtmlPaging());
		return paging.makeHtmlPaging();
	}
	//게시판 글 작성
	public ModelAndView writeBoard(ConsultingBoard board) {
		String view=null;
		if(CBdao.writeBoard(board)) {
			view="/home/erpboard";
		}else {
			view="/home/erpboard";
		}
		mav.setViewName(view);
		return mav;
	}
	//게시글 수정 목록 출력
	public String boardmodifyajax(Integer num) {
		System.out.println("수정페이지 서비스 번호 값="+num);
		ConsultingBoard cbList=CBdao.boardmodifyajax(num);
		System.out.println("회원 정보="+cbList);
		if(cbList!=null) {
			Gson gson=new Gson();
			String json=gson.toJson(cbList);
			System.out.println("json타입으로 변경"+json);
			return json;
		}

		return null;
	}
	//게시글 수정
	public ModelAndView boardmodify(ConsultingBoard board) {
		String view=null;
		if(CBdao.boardmodify(board)) {
			view="redirect:/home/erpboard";
		}
		mav.setViewName(view);
		return mav;
	}
	//게시글 삭제
	public ModelAndView writelistdelete(Integer num) {
		String view=null;
		if(num!=null) {
			if(CBdao.writelistdelete(num)) {
				view="/home/erpboard";
			}else {
				view="/home/erpboard";
			}
		}
		mav.setViewName(view);
		return mav;
	}
}
