package com.n7.erp.dao;

import org.apache.ibatis.annotations.Insert;

import com.n7.erp.bean.Company;

public interface companyDao {

	@Insert("INSERT INTO COMPANY_TEMP VALUES(#{c_code}, #{c_name}, #{c_ceo}, #{c_phonenum}, #{c_kind}, #{c_kind2}, #{c_addr}, #{c_comnum})")
	boolean registNewERP(Company com);

}
