package com.n7.erp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.google.gson.JsonElement;
import com.n7.erp.bean.Company;
import com.n7.erp.bean.CompanyTemp;
import com.n7.erp.bean.Member;
import com.n7.erp.userClass.PagingVO;

public interface AdminDao {

	//占쎈읂占쎌뵠筌욑옙 筌롢끇苡�
	public int countMember();
	//占쎈읂占쎌뵠筌욑옙 筌ｌ꼶�봺 筌롢끇苡� 鈺곌퀬�돳
	public List<Member> selectMember(PagingVO vo);
	
	public int countCompany();
	public List<Company> selectCompany(PagingVO vo);
	
	@Select("SELECT * FROM COMPANY_TEMP")
	public List<CompanyTemp> companyTemp();
	
	public List<Member> selectCCodeMember(PagingVO vo);
	public int countCCodeMember(String m_ccode);

	@Select("SELECT * FROM COMPANY_TEMP WHERE CT_CODE = #{ct_code}")
	public CompanyTemp getCompany(String ct_code);
	@Insert("INSERT INTO COMPANY VALUES (#{ct_code}, #{ct_name}, #{ct_ceo}, #{ct_phonenum}, #{ct_kind}, #{ct_kind2}, #{ct_addr}, #{ct_comnum})")
	public boolean insertCompanyTemp(CompanyTemp ct);
	@Delete("DELETE FROM COMPANY_TEMP WHERE CT_CODE = #{ct_code}")
	public boolean deleteCompanyTemp(CompanyTemp ct);
}

