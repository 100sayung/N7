package com.n7.erp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.Company;
import com.n7.erp.dao.companyDao;

@Service
public class CompanyMM {

   @Autowired
   private companyDao cDao;

   ModelAndView mav;

   public boolean registNewERP(Company com){
      if (cDao.registNewERP(com)) {
         return true;
      }
      return false;
   }
}