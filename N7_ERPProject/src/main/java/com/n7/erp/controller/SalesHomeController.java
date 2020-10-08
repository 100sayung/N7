//페이지 이동 컨트롤러

package com.n7.erp.controller;


import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.sales.Businessbean;
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
   
//   @RequestMapping(value = "/sales/businessactivitiesdetail", method = RequestMethod.GET)
//      public String businessactivitiesdetail() {
//         return "/sales/businessactivitiesdetail";
//   }
   
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
   
   @RequestMapping(value = "/sales/SalesResult", method = RequestMethod.GET) //영업 DB데이터 긁어온 거
   public ModelAndView SalesResult(HttpSession session) {
      mav=sm.salesResult(session);
      return mav;
   }
   
   @RequestMapping(value = "/sales/salesapprovaldetail", method = RequestMethod.GET)
      public String salesapprovaldetail() {
      return "/sales/salesapprovaldetail"; 
   }
   
   @RequestMapping(value = "/sales/bs_bonumInfo", method = RequestMethod.GET)
   public String bs_bonumInfo() {
      return "/sales/bs_bonumInfo";
   }
   
//   @RequestMapping(value = "/sales/businessperformance", method = RequestMethod.GET)
//   public ModelAndView businessperformance(HttpSession session) {
//      mav=sm.businessperformance(session);
//      return mav;
//}
    
}