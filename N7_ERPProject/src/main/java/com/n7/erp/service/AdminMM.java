package com.n7.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.n7.erp.bean.Company;
import com.n7.erp.bean.CompanyTemp;
import com.n7.erp.bean.Member;
import com.n7.erp.dao.AdminDao;
import com.n7.erp.dao.HRIDeptDao;
import com.n7.erp.userClass.PagingVO;

@Service
public class AdminMM {

	@Autowired AdminDao aDao;
	@Autowired HRIDeptDao hDao;

	//占쏙옙占쏙옙징 처占쏙옙 占쏙옙占�
	public int countMember() {
		return aDao.countMember();
	}
	
	public List<Member> selectMember(PagingVO vo){
		return aDao.selectMember(vo);
	}

	public int countCompany() {
		return aDao.countCompany();
	}

	public List<Company> selectCompany(PagingVO vo){
		return aDao.selectCompany(vo);
	}

	public String companyTemp() {
		List<CompanyTemp> cList = aDao.companyTemp();
		String result = new Gson().toJson(cList);
		System.out.println(result);
		return result;
	}

	public List<Member> selectCCodeMember(PagingVO vo) {
		return aDao.selectCCodeMember(vo);
	}
	public int countCCodeMember(String m_ccode) {
		return aDao.countCCodeMember(m_ccode);
	}

	public String insertCompanyTemp(String ct_code) {
		CompanyTemp ct = aDao.getCompany(ct_code);
		if(aDao.insertCompanyTemp(ct)) {
			aDao.deleteCompanyTemp(ct);
			hDao.insertTax(ct_code);
			hDao.insertInsurance(ct_code);
			return "1";
		}else {
			return "0";
		}
	}
	public String deleteCompanyTemp(String ct_code) {
		CompanyTemp ct = aDao.getCompany(ct_code);
		if(aDao.deleteCompanyTemp(ct)) {
			return "1";
		}else {
			return "0";
		}
	}


}
