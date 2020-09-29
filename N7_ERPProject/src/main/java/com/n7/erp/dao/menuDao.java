package com.n7.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.n7.erp.bean.Authority;
import com.n7.erp.bean.Company;
import com.n7.erp.bean.Menu;
import com.n7.erp.bean.clientMenu;

@Mapper
@Component
public interface menuDao {

	List<Menu> getmenu();

	boolean addmenu(@Param("menu")String menu, @Param("cCode")String cCode);

	List<clientMenu> getaddmenu(String cCode);

	void deletemenu(String cCode);

	List<Company> getCompanyInfo(String cCode);

	boolean companyUpdate(Company cp);

	int authInsert(Authority au);

	List<Authority> authoritList(String cCode);

	int depratmentDelete(Authority au);

	int depratmentDelete(@Param("au_name")String au_name, @Param("cCode") String cCode);

}
