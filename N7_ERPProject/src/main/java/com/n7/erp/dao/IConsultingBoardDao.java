package com.n7.erp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.n7.erp.bean.ConsultingBoard;

public interface IConsultingBoardDao {

	ArrayList<ConsultingBoard> getBoardList(Integer pageNum);
	
	@Select("SELECT COUNT(*) FROM CONSULTING_BOARD")
	int getBoarCount();

	boolean boardWrite(ConsultingBoard board);

	ConsultingBoard getContents(int CB_NUM);

	List<ConsultingBoard> boardSearch(String choice, String search);

	@Select("SELECT COUNT(*) FROM CONSULTING_BOARD WHERE CB_NUM=#{CB_NUM}")
	int getBoardExist(int CB_NUM);

	@Delete("DELETE FROM CONSULTING_BOARD WHERE CB_NUM=#{CB_NUM}")
	boolean boardDelete(int cB_NUM);

	//boolean writeBoard(ConsultingBoard board);
//	
//	ConsultingBoard boardmodifyajax(Integer num);
//
//	boolean boardmodify(ConsultingBoard board);
//
//	boolean writelistdelete(Integer num);
//
}
