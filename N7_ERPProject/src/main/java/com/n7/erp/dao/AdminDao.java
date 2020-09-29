package com.n7.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.google.gson.JsonElement;
import com.n7.erp.bean.Company;
import com.n7.erp.bean.Member;
import com.n7.erp.userClass.PagingVO;

public interface AdminDao {

	//페이징 멤버
	public int countMember();
	//페이징 처리 멤버 조회
	public List<Member> selectMember(PagingVO vo);
	
	public int countCompany();
	public List<Company> selectCompany(PagingVO vo);
	@Select("SELECT * FROM COMPANY_TEMP")
	public List<Company> companyTemp();
	
	public List<Member> selectCCodeMember(PagingVO vo);
	public int countCCodeMember(String m_ccode);
}

