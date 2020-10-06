package com.n7.erp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.n7.erp.bean.ConsultingBoard;

public interface IConsultingBoardDao {

	ArrayList<ConsultingBoard> getBoardList(Integer pageNum);
	
	@Select("SELECT COUNT(*) FROM CONSULTING_BOARD")
	int getBoarCount();

	boolean boardWrite(ConsultingBoard board);

	ConsultingBoard getContents(int CB_NUM);

	List<ConsultingBoard> bsearch(String choice, String keyword);

	//boolean writeBoard(ConsultingBoard board);
//	
//	ConsultingBoard boardmodifyajax(Integer num);
//
//	boolean boardmodify(ConsultingBoard board);
//
//	boolean writelistdelete(Integer num);
//
}
