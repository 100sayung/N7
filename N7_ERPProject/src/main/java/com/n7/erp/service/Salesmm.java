package com.n7.erp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.sales.A_company;
import com.n7.erp.bean.sales.Businessbean;
import com.n7.erp.bean.sales.Salesbean;
import com.n7.erp.bean.sales.Shippingbean;
import com.n7.erp.bean.sales.Uncollectedbean;
import com.n7.erp.bean.sales.approvaldetail;
import com.n7.erp.bean.sales.approvalLine;
import com.n7.erp.dao.IeportDao;
import com.n7.erp.dao.SalesDao;

@Component
public class Salesmm {
   @Autowired
   SalesDao sDao;
   
   ModelAndView mav;


   public Map<String, List<Salesbean>> orderitem(HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
      System.out.println("여긴들어와?2");
      Map<String, List<Salesbean>> sMap= null;
      
      List<Salesbean> sList= new ArrayList<>();
      sList=sDao.orderitem(cCode);
      System.out.println(sList);
       if(sList!=null) {
          sMap=new HashMap<>();
          sMap.put("sList", sList);
      }
      return sMap;
   }

   public ModelAndView orderregistrationinput(Salesbean s, HttpSession session) {
      s.setBo_ccode(session.getAttribute("cCode").toString());
      mav=new ModelAndView();   
      String view=null;
      System.out.println("슈밤222222222222");
      
      s.setBo_num("O");
      
      boolean result=sDao.orderregistrationinput(s);
      if(s.getBo_ccode()!="") {
         if(result) {
            mav.addObject("msg", "데이터 입력이 완료되었습니다");
            view="sales/orderregistrationfrm";
         }else {
            mav.addObject("msg", "데이터 입력이 실패하였습니다");
            view="sales/orderregistrationfrm";
         }
      }
      mav.setViewName(view);
      return mav;         
   }

   public Map<String, List<Salesbean>> orderregistrationsearch(String search, String choice, HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
      Map<String, List<Salesbean>> sMap= null; 
      List<Salesbean> sList=new ArrayList<>();
      sList=sDao.orderregistrationsearch(search, choice, cCode);
       if(sList!=null) {
         sMap=new HashMap<>();
         sMap.put("sList", sList);
      }else {
         sMap=null;
        }
      return sMap;
   }

   public Map<String, List<Salesbean>> orderregistrationdelete(String check, HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
     Map<String, List<Salesbean>> sMap = null;
      List<Salesbean> sList = new ArrayList<>();
      Shippingbean sb =new Shippingbean();
      sb= sDao.getbonum(check, cCode);
      System.out.println(sb);       
         if(sb==null) {
            if(sDao.orderregistrationdelete(check, cCode)) {
               sList = sDao.orderitem(cCode);
               sMap = new HashMap<>();
               sMap.put("sList", sList);
               System.out.println(sList);
            }else {
               sMap = null;
            }
            
         }else {
            Salesbean sb2 = new Salesbean();
            sb2.setBo_num(sb.getBs_bonum());
            sList.add(sb2);
            sMap = new HashMap<>();
            sMap.put("sList", sList);
         }   
      return sMap;
   }

//   public Map<String, List<Shippingbean>> shippingrequestinput(Shippingbean ss, HttpSession session, HttpServletRequest request) {      
//     ss.setBs_ccode(session.getAttribute("cCode").toString());
//     ss.setBs_docunum("G");
//
//     String bs_quantity = request.getParameter("bs_quantity"); //출하등록창에 입력한 값
//     request.setAttribute("bs_quantity", bs_quantity);     
//    
//      Map<String, List<Shippingbean>> sMap = null;
//      List<Shippingbean> sList = new ArrayList<>();
//      Shippingbean sb=new Shippingbean();
//      Shippingbean sb2=new Shippingbean();
//      sb= sDao.shippingrequestinput(ss, bs_quantity);      
//      sb2 = IeportDao.getImportList(ie_qty); //재고수량
//      
//      if(ss.getBs_ccode()!="") {   
//       if(sb > sb2) {         
//              sList = sDao.shippingrequestinput(ss, bs_quantity);
//             sMap = new HashMap<>();
//             sMap.put("sList", sList);
//       }else {
//          sMap=null;
//       }
//    }
//   }
   
//      재고테이블 다녀와야함
//      품목코드로 재고수량 가져외기
//      if(내것이 더 많다) {
//       상태코드 : 4
//       return mav 그럴수없습니다.

   public ModelAndView shippingrequestinput(Shippingbean ss, HttpSession session) { //출하등록     
      ss.setBs_ccode(session.getAttribute("cCode").toString());
      mav = new ModelAndView();
      String view = null;

       ss.setBs_docunum("G");
       
      boolean result = sDao.shippingrequestinput(ss);
      if(ss.getBs_ccode()!="") {
        if (result) {
         mav.addObject("msg", "출하입력이 완료되었습니다.");
         view = "sales/shippingrequestinputfrm";
      } else {
         mav.addObject("msg", "출하입력이 실패하였습니다.");
         view = "sales/shippingrequestinputfrm";
        }
      }
      mav.setViewName(view);
      return mav;
    }
            
   
   public Map<String, List<Shippingbean>> shippingitem(HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
     Map<String, List<Shippingbean>> sMap= null;
      
      List<Shippingbean> sList= sDao.shippingitem(cCode);
      System.out.println(sList);
      if(sList!=null) {
          sMap=new HashMap<>();
          sMap.put("sList", sList);
      }
      return sMap;
   }
   
   public Map<String, List<Shippingbean>> shippingrequestsearch(String search, String choice, HttpSession session) {
      String cCode=session.getAttribute("cCode").toString();
      Map<String, List<Shippingbean>> sMap= null; 
      List<Shippingbean> sList=new ArrayList<>();
      sList=sDao.shippingrequestsearch(search, choice, cCode);
      if(sList!=null) {
         sMap=new HashMap<>();
         sMap.put("sList", sList);
      }else {
         sMap=null;
      }
      return sMap;
   }

   public Map<String, List<Shippingbean>> shippingrequestdelete(String check, HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
     Map<String, List<Shippingbean>> sMap = null;
      if(sDao.shippingrequestdelete(check, cCode)) {
         List<Shippingbean> sList = sDao.shippingitem(cCode);
         sMap = new HashMap<>();
         sMap.put("sList", sList);
         System.out.println(sList);
      }else {
         System.out.println("지워짐?");
         sMap = null;
      }
      return sMap;
   }
   
   //결재라인 손대기ㄴㄴㄴ
   public Map<String, List<com.n7.erp.bean.sales.approvalLine>> searchName(String name) {
      Map<String, List<approvalLine>> sMap=null;
      List<approvalLine> aList=null;
      if(name!=null) {
         aList = sDao.searchName(name);
         sMap=new HashMap<>();
         sMap.put("aList", aList);
      }else {
         sMap=null;
      }
      return sMap;
   }
   
   //사원코드, 아이디, cCode???
   public Map<String, List<approvalLine>> addApproval(int cnt, String[] strArray) {
      //app.setBs_apcode1(session.getAttribute("hc_hrcode").toString());
      
      Map<String, List<approvalLine>> sMap=null;
      List<approvalLine> aList=null;
      System.out.println(cnt);         
      
      String code="";       
      for(int i=0; i<cnt; i++) {
         code=strArray[i];
         aList=sDao.addApproval(code); //(code)
      }
      System.out.println(aList);
      
      
      if(aList!=null) {
         sMap=new HashMap<>();
         sMap.put("aList", aList);
      }else {
         sMap=null;
      }
      return sMap;
   }
   
   public Map<String, List<approvalLine>> approLinecom(String[] code01) {
      Map<String, List<approvalLine>> sMap=null;
      System.out.println(code01.length);
      //System.out.println(code02[0]);
      
      if(code01.length!=0) {
         List<approvalLine> tList1 = new ArrayList<>();
//                  List<approvalLine> tList2= new ArrayList<>();
         
         for(int i=0; i<code01.length; i++) {
            approvalLine al = new approvalLine();
            al=sDao.approLinecom1(code01[i]); 
            tList1.add(al);
         }
//                  for(int i=0; i<code02.length; i++) {
//                     approvalLine al = new approvalLine();
//                     al=sDao.approLinecom2(code02[i]); 
//                     tList2.add(al);
//                  }
         sMap=new HashMap<>();
         System.out.println(tList1);
         sMap.put("tList1",tList1);
         //sMap.put("tList2",tList2);
      }else {
         
         sMap=null;
      }
      
      return sMap;
      
   }
   //결재라인 끝
   public ModelAndView approvalLine() {
      String view=null;
      mav= new ModelAndView();
      List<approvalLine> aList = null;
      aList=sDao.approvalLine(); 
      if(aList.size()!=0) {
         mav.addObject("aList",new Gson().toJson(aList));
         view="sales/approvalline";
      }else {
         
         mav.addObject("msg","주소록에 정보가 없습니다");
         view="sales/shippingrequestinputfrm";
      }
      
      mav.setViewName(view);
      return mav;
   }
   
   //건들지않기
   public Map<String, List<com.n7.erp.bean.sales.approvalLine>> getMyInfo(HttpSession session) {
      Map<String, List<approvalLine>> sMap = null;
      List<approvalLine> sList = null;
      String code = session.getAttribute("hrCode").toString();
      sList = sDao.getMyInfo(code);
      System.out.println(sList);
      if (sList != null) {
         sMap = new HashMap<>();
         sMap.put("sList", sList);
      } else {
         sMap = null;
      }
      return sMap;
   }
   
   public ModelAndView approvalplan(String check, HttpSession session) { //결재창
      String cCode=session.getAttribute("cCode").toString();
      ModelAndView mav=new ModelAndView();
      Shippingbean sb=new Shippingbean();
      String view=null;        
      sb=sDao.approvalplanchoice(check, cCode);      
      if(sb!=null) {
         mav.addObject("sb",sb);
         view="sales/approvalplan";
      }else {
         mav.addObject("msg", "데이터가 없습니다");
         view="sales/shippingrequestinputfrm";
      }
      mav.setViewName(view);       
      return mav;
   }
   
   //제출하기 버튼 
   public ModelAndView approvalinput(approvaldetail app, HttpSession session) {
      app.setBs_ccode(session.getAttribute("cCode").toString());
      mav=new ModelAndView();
      String view=null;
      
      //app.setBs_docunum("D");
      
      boolean result=sDao.approvalinput(app);
      boolean result2=sDao.approvalinput2(app);
      if(app.getBs_ccode()!="") {
         if(result && result2) {
            mav.addObject("msg", "데이터 입력이 완료되었습니다");
            view="sales/approvalplan";
         }else {
            mav.addObject("msg", "데이터 입력이 실패하였습니다");
            view="sales/approvalplan";
         }
      }
      mav.setViewName(view);
      return mav;
   }
   
   public ModelAndView uncollectedmoneyinput(approvaldetail ap, HttpSession session) { //미수금
      ap.setBs_ccode(session.getAttribute("cCode").toString());
      mav=new ModelAndView();
      String view=null;
      
      boolean result=sDao.uncollectedmoneyinput(ap);
      if(ap.getBs_ccode()!="") {
         if(result) {
            mav.addObject("msg", "데이터 입력이 완료되었습니다");
            view="sales/uncollectedmoneyregistrationfrm";
         }else {
            mav.addObject("msg", "데이터 입력이 실패하였습니다");
            view="sales/uncollectedmoneyregistrationfrm";
         }
      }
      mav.setViewName(view);
      return mav;
   }   
   
   public Map<String, List<approvaldetail>> uncollectedmoneyitem(HttpSession session) {
      String cCode=session.getAttribute("cCode").toString();
      Map<String, List<approvaldetail>> sMap= null;
      System.out.println("3333333333333333333");
      List<approvaldetail> sList=new ArrayList<>();
      List<approvaldetail> sList2=new ArrayList<>();
      sList=sDao.uncollectedmoneyitem(cCode);
      sList2=sDao.uncollectedmoneyitem2(cCode);
      
      if(sList!=null) {
         sMap=new HashMap<>();
         sMap.put("sList", sList);
         sMap.put("sList2", sList2);
      }else {
         sMap=null;
      }
      return sMap;
   }
   
   
   public Map<String, List<approvaldetail>> uncollectedmoneysearch(String search, String choice, HttpSession session) {
      String cCode=session.getAttribute("cCode").toString();
      Map<String, List<approvaldetail>> sMap= null; 
      List<approvaldetail> sList=new ArrayList<>();
      sList=sDao.uncollectedmoneysearch(search, choice, cCode);
      if(sList!=null) {
         sMap=new HashMap<>();
         sMap.put("sList", sList);
      }else {
         sMap=null;
      }
      return sMap;
   }
   
   public Map<String, List<approvaldetail>> creditsearch(HttpSession session) {
      String cCode=session.getAttribute("cCode").toString();
      Map<String, List<approvaldetail>> sMap= null; 
      List<approvaldetail> sList=new ArrayList<>();
      sList=sDao.creditsearch(cCode);
      if(sList!=null) {
         sMap=new HashMap<>();
         sMap.put("sList", sList);
      }else {
         sMap=null;
      }
      return sMap;
   }
   
   public Map<String, List<approvaldetail>> fullpaymentsearch(HttpSession session) {
      String cCode=session.getAttribute("cCode").toString();
      Map<String, List<approvaldetail>> sMap= null; 
      List<approvaldetail> sList=new ArrayList<>();
      sList=sDao.fullpaymentsearch(cCode);
      if(sList!=null) {
         sMap=new HashMap<>();
         sMap.put("sList", sList);
      }else {
         sMap=null;
      }
      return sMap;      
   }
   
   
   public Map<String, List<approvaldetail>> fullpaymentprocess(String check, HttpSession session) {
      String cCode=session.getAttribute("cCode").toString();
      Map<String, List<approvaldetail>> sMap= null; 
      List<approvaldetail> sList=new ArrayList<>();
      System.out.println("여기옴?");
      System.out.println(check); 
      if(sDao.fullpaymentprocess(check, cCode)){
         System.out.println("들어옴!");
         sList=sDao.uncollectedmoneyitem2(cCode);
         sMap=new HashMap<>();
         sMap.put("sList",sList);
      }else {
         sMap=null;
         System.out.println("망함?");
      }
      return sMap;
   }
   
   public ModelAndView businessactivitiesinput(Businessbean b, HttpSession session) { //영업활동
      b.setBa_ccode(session.getAttribute("cCode").toString());
      mav=new ModelAndView();
      String view=null;
      
      b.setBa_ocode("A");
      
      boolean result=sDao.businessactivitiesinput(b);
      if(b.getBa_ccode()!="") {
        if(result) {
         mav.addObject("msg", "영업활동 입력이 완료되었습니다");
          view="sales/businessactivitiesfrm";
      }else {
         mav.addObject("msg", "영업활동 입력이 실패하였습니다");
          view="sales/businessactivitiesfrm";
        }
      }
      mav.setViewName(view);
      return mav;
   }

   public Map<String, List<Businessbean>> businessitem(HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
     Map<String, List<Businessbean>> sMap= null;
      System.out.println("3333333333333333333");
      List<Businessbean> bList= sDao.businessitem(cCode);
      if(bList!=null) {
         sMap=new HashMap<>();
         sMap.put("bList", bList);
      }
      return sMap;
   }
   
//   public Map<String, List<A_company>> insertcomlist(A_company ac, HttpSession session) {
//         Map<String, List<A_company>> aMap=null;
//         ac.setCl_ccode(session.getAttribute("cCode").toString());
//         if(ac.getCl_code()!="") {
//            if(sDao.insertcomlist(ac)) {
//               List<A_company> aList = sDao.getComList(ac.getCl_code());
//               aMap=new HashMap<>();
//               aMap.put("aList", aList);
//            }else {
//               aMap=null;
//            }
//         }else {
//            List<A_company> aList = sDao.getComList(ac.getCl_code());
//            aMap=new HashMap<>();
//            aMap.put("aList", aList);
//         }
//      
//         return aMap;
//      }
//   
//   public Map<String, List<A_company>> searchcomlist() {
//         Map<String, List<A_company>> aMap=null;
//               List<A_company> aList = sDao.getCompanyList();
//               aMap=new HashMap<>();
//               aMap.put("aList", aList);
//            
//         return aMap;
//      }
//   
//   public Map<String, List<A_company>> searchcode(A_company ac, String code) {
//         Map<String, List<A_company>> aMap=null;
//            List<A_company> aList = sDao.getsearchCode(ac);
//            if(aList!=null) {
//               aMap=new HashMap<>();
//               aMap.put("aList", aList);
//            }
//         
//      return aMap;
//   }
//   
//   public Map<String, List<A_company>> deleteCom(int cnt, String[] strArray) {
//         Map<String, List<A_company>> aMap=null;
//         boolean result=false;
//         String code="";
//         for(int i=0; i<cnt; i++) {
//            code=strArray[i];
//            result=sDao.deleteCom(code);
//         }
//         if(result) {
//            List<A_company> aList = sDao.getCompanyList();
//            aMap=new HashMap<>();
//               aMap.put("aList", aList);
//         }else {
//            aMap=null;
//         }
//         return aMap;
//      }




   public Map<String, List<Businessbean>> businessactivitiessearch(String search, String choice, HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
     Map<String, List<Businessbean>> sMap= null; 
      List<Businessbean> bList=new ArrayList<>();
      bList=sDao.businessactivitiessearch(search, choice, cCode);
      if(bList!=null) {
         sMap=new HashMap<>();
         sMap.put("bList", bList);
      }else {
         sMap=null;
      }
      return sMap;
   }

   public Map<String, List<Businessbean>> businessactivitiesdelete(String check, HttpSession session) {
     String cCode=session.getAttribute("cCode").toString();
     Map<String, List<Businessbean>> sMap = null;
      if (sDao.businessactivitiesdelete(check, cCode)) {
         List<Businessbean> sList = sDao.businessitem(cCode);
         sMap = new HashMap<>();
         sMap.put("sList", sList);
         System.out.println(sList);
      } else {
         System.out.println("지워짐?");
         sMap = null;
      }
      return sMap;
   }

   //결재 상세보기
   public ModelAndView approvaldetailinput(approvaldetail app, HttpSession session){ 
         app.setBs_ccode(session.getAttribute("cCode").toString());
         mav=new ModelAndView();
         String view=null;
               
         boolean result=sDao.approvaldetailinput(app);
         if(app.getBs_ccode()!="") {
           if(result) {
            mav.addObject("msg", "데이터 입력이 완료되었습니다");
             view="sales/salesapprovaldetail";
         }else {
            mav.addObject("msg", "데이터 입력이 실패하였습니다");
             view="sales/salesapprovaldetail";
           }
         }
         mav.setViewName(view);
         return mav;
   }
    
//   public Map<String, List<Shippingbean>> shippingquantity(String check, HttpSession session) {
//      String cCode=session.getAttribute("cCode").toString();
//      Map<String, List<Shippingbean>> sMap= null; 
//       List<Shippingbean> sList=new ArrayList<>();
//       sList=sDao.shippingquantity(check, cCode);
//       
//       if(check>) {
//        if(sList!=null) {
//            sMap=new HashMap<>();
//            sMap.put("sList", sList);
//       }else {
//            sMap=null;
//         }
//       }
//         return sMap;
//   }

   
   
//  view 테이블 만들어야함
//   public Map<String, List<approvaldetail>> approvaldelete(String check) { // 결재완료 삭제
//      Map<String, List<approvaldetail>> sMap = null;
//      if (sDao.approvaldelete(check)) {
//         List<approvaldetail> sList = sDao.shippingitem();
//         sMap = new HashMap<>();
//         sMap.put("sList", sList);
//         System.out.println(sList);
//      } else {
//         sMap = null;
//      }
//      return sMap;
//   }
}