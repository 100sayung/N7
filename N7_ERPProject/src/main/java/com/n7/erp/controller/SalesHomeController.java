//페이지 이동 컨트롤러

package com.n7.erp.controller;


import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import com.n7.erp.bean.sales.Shippingbean;
import com.n7.erp.service.Salesmm;


@Controller
public class SalesHomeController {
   
   @Autowired
   Salesmm sm;
   
   ModelAndView mav;
   
   @RequestMapping(value = "/sales/", method = RequestMethod.GET)
   public String home() {
      return "/sales/home";
   }
   @RequestMapping(value = "/sales/main", method = RequestMethod.GET)
      public String main() {
         return "/sales/main";
   }
   
   @RequestMapping(value = "/sales/orderregistrationfrm", method = RequestMethod.GET)
      public String orderregistrationfrm() {
         return "/sales/orderregistrationfrm";
   }
   
   @RequestMapping(value = "/sales/shippingrequestinputfrm", method = RequestMethod.GET)
      public String shippingrequestinputfrm() {
         return "/sales/shippingrequestinputfrm";
   }
   
   @RequestMapping(value = "/sales/uncollectedmoneyregistrationfrm", method = RequestMethod.GET)
      public String uncollectedmoneyregistrationfrm() {
         return "/sales/uncollectedmoneyregistrationfrm";
   }
   
   @RequestMapping(value = "/sales/businessactivitiesfrm", method = RequestMethod.GET)
      public String businessactivitiesfrm() {
         return "/sales/businessactivitiesfrm";
   }
   
   @RequestMapping(value = "/sales/businessactivitiesdetail", method = RequestMethod.GET)
      public String businessactivitiesdetail() {
         return "/sales/businessactivitiesdetail";
   }
   
   @RequestMapping(value = "/sales/approvalplan", method = RequestMethod.GET)
      public ModelAndView approvalplan(String check, HttpSession session) {
        mav=sm.approvalplan(check, session);
         return mav;
   }
   
   @RequestMapping(value = "/sales/clientfrm", method = RequestMethod.GET)
      public String clientfrm() {
         return "/sales/clientfrm";
   }
   
   @RequestMapping(value = "/sales/approvalLine", method = RequestMethod.GET)
      public ModelAndView approvalLine() {
         mav=sm.approvalLine();
         return mav;
   }
   
   @RequestMapping(value = "/sales/salesapprovaldetail", method = RequestMethod.GET)
      public String salesapprovaldetail() {
      return "/sales/salesapprovaldetail"; 
   }
   
   
//   @RequestMapping(value = "/introducecompany", method = RequestMethod.GET)
//   public String introduceCompany() {
//      return "introducecompany";
//   }
//   @RequestMapping(value = "/erpboard", method = RequestMethod.GET)
//   public String erpBoard() {
//      return "erpboard";
//   }
//   @RequestMapping(value = "/login", method = RequestMethod.GET)
//   public String login() {
//      return "login";
//   }
//   @RequestMapping(value = "/join", method = RequestMethod.GET)
//   public String join() {
//      return "join";
//   }
//   @RequestMapping(value = "/erpapply", method = RequestMethod.GET)
//   public String erpApply() {
//      return "erpapply";
//   }
//   
}