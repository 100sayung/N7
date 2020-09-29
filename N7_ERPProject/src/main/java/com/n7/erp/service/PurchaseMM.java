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
import com.n7.erp.bean.ps.Purchase;
import com.n7.erp.bean.ps.PurchaseApproval;
import com.n7.erp.bean.ps.approvalLine;
import com.n7.erp.bean.ps.Return;
import com.n7.erp.dao.PurchaseDao;
import com.n7.erp.userClass.Paging;

@Component
public class PurchaseMM {
	
	@Autowired
	PurchaseDao pDao;

	public ModelAndView pregistration(HttpServletRequest request, Purchase ps, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ps.setP_ccode(session.getAttribute("cCode").toString());
		boolean a = false;
		boolean b = false;
		String view = null;
		if(ps.getP_ccode()!="") {
			a= pDao.pcommom(ps);
			String [] p_name = request.getParameterValues("p_name");
			String [] p_itcode = request.getParameterValues("p_itcode");
			String [] p_amount = request.getParameterValues("p_amount");
			String [] p_unlit = request.getParameterValues("p_unlit");
			String [] p_budget = request.getParameterValues("p_budget");
			for(int i=0; i<p_name.length; i++ ) {
				ps.setP_name(p_name[i]);
				ps.setP_itcode(p_itcode[i]);
				ps.setP_amount(Integer.parseInt(p_amount[i]));
				ps.setP_unlit(Integer.parseInt(p_unlit[i]));
				ps.setP_budget(Integer.parseInt(p_budget[i]));
				b= pDao.pregistration(ps); 
			}
			if(a&&b) {
				view = "/Purchase/pregistration";
				mav.addObject("msg", "데이터입력완료");
			} else {
				view = "/Purhcase/pregistration";
				mav.addObject("msg", "데이터입력 실패");
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<Purchase>> pFrerence() {
		//System.out.println("pageNum="+pageNum);
		//ModelAndView mav=new ModelAndView();
		Map<String, List<Purchase>> pMap = null;
		//pageNum=(pageNum==null)?1:pageNum;
		
		List<Purchase> pList = pDao.pFrerence();
		System.out.println("제발...");
			if (pList != null) {
					pMap = new HashMap<>();
					pMap.put("pList", pList);
					System.out.println("pList=" + pList);
			}else {
				pMap= null;
			}
		return pMap;
	}

//	private Object getPaging(Integer pageNum) {
//		int maxNum = pDao.getListCount();
//		int listCount= 10;
//		int pageCount= 2;
//		String boardName= "/erp/rest/Purchase/pference";
//		Paging paging= new Paging(maxNum, pageNum, listCount, pageCount, boardName);
//		return paging.makeHtmlPaging();
//	}

	public Map<String, List<Purchase>> pfsearch(String search, String choice) {
		Map<String, List<Purchase>> pMap = null;
		List<Purchase> pList = pDao.pfSearch(search, choice);
		if (pList != null) {
			pMap = new HashMap<>();
			pMap.put("pList", pList);
			System.out.println("pList=" + pList);
		} else {
			pMap = null;
		}
		return pMap;
	}

	public Map<String, List<Purchase>> pfdelete(String check_list) {
		Map<String, List<Purchase>> pMap = null;
		System.out.println(check_list);

		if(pDao.pcDelete(check_list) && pDao.pfDelete(check_list)) {
			List<Purchase>pList= pDao.pFrerence();
			pMap = new HashMap<>();
			pMap.put("pList", pList);
			System.out.println("지워짐");
		}else {
			System.out.println("안지워짐");
			pMap = null;
		}
		return pMap;
	}

	public ModelAndView pDetail(String check) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		List<Purchase> pList= null;
		Purchase ps= new Purchase();
		
		if(check!=null) {
			ps= pDao.pInfo(check);
			pList= pDao.pDetail(check);
			if(pList!=null) {
				mav.addObject("pList", new Gson().toJson(pList));
				System.out.println("PLIST"+pList);
				mav.addObject("ps", ps);
				view= "/Purchase/purchasedetail";
			}
		}else {
			mav.addObject("msg", "가지고 올 데이터가 없습니다.");
			view= "/Purchase/purchasedetail";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView pProgram(String check) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		List<Purchase> pList= null;
		
		if(check!=null) {
			Purchase ps= new Purchase();
				ps= pDao.pBring(check);
				pList= pDao.pProgram(check);
				if(pList!=null) {
					mav.addObject("pList", new Gson().toJson(pList));
					mav.addObject("ps", ps);
					view= "/Purchase/pprogramwrite";
			}
		}else {
			check= null;
		}
		mav.setViewName(view);
		return mav;
	}
	
    //결재라인 
   public Map<String, List<com.n7.erp.bean.ps.approvalLine>> searchName(String name) {
         Map<String, List<approvalLine>> sMap= null;
         List<approvalLine> aList=null;
         if(name!=null) {
            aList = pDao.searchName(name);
            sMap=new HashMap<>();
            sMap.put("aList", aList);
         }else {
            sMap=null;
         }
         return sMap;
      }

      public Map<String, List<approvalLine>> addApproval(int cnt, String[] strArray) {
         Map<String, List<approvalLine>> sMap=null;
         List<approvalLine> aList=null;
         System.out.println(cnt);
         String code="";
         for(int i=0; i<cnt; i++) {
            code=strArray[i];
             aList=pDao.addApproval(code);
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
                     al=pDao.approLinecom1(code01[i]); 
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

      public ModelAndView approvalLine() {
            String view=null;
            ModelAndView mav= new ModelAndView();
            List<approvalLine> aList = null;
            aList=pDao.approvalLine(); 
            if(aList.size()!=0) {
                  mav.addObject("aList",new Gson().toJson(aList));
                  view="/Purchase/approvalLine";
               }else {
                  
                   mav.addObject("msg","주소록에 정보가 없습니다");
                  view="/Purchase/pprogramwrite";
               }
            
            mav.setViewName(view);
            return mav;
         }
      
	public ModelAndView purchaseApproval(HttpServletRequest request, PurchaseApproval pa, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		pa.setP_ccode(session.getAttribute("cCode").toString());
		boolean a = false;
		boolean b = false;
		boolean c = false;
		String view = null;
		if(pa.getP_ccode()!="") {
			a= pDao.Approval(pa);
			b= pDao.pApproval1(pa);
			String [] p_name = request.getParameterValues("p_name");
			String [] p_itcode = request.getParameterValues("p_itcode");
			String [] p_amount = request.getParameterValues("p_amount");
			String [] p_unlit = request.getParameterValues("p_unlit");
			String [] p_budget = request.getParameterValues("p_budget");
			for(int i=0; i<p_name.length; i++ ) {
				pa.setP_name(p_name[i]);
				pa.setP_itcode(p_itcode[i]);
				pa.setP_amount(Integer.parseInt(p_amount[i]));
				pa.setP_unlit(Integer.parseInt(p_unlit[i]));
				pa.setP_budget(Integer.parseInt(p_budget[i]));
				c= pDao.pApproval2(pa); 
			}
			if(a&&b&&c) {
				System.out.println("다 들어가는거야?");
				view = "/Purchase/pregistration";
				mav.addObject("msg", "데이터입력완료");
			} else {
				view = "/Purchase/pprogramwrite";
				mav.addObject("msg", "데이터입력 실패");
			}
		}
		mav.setViewName(view);
		return mav;
	}
	
	public Map<String, List<approvalLine>> getMyInfo(HttpSession session) {
        Map<String, List<approvalLine>> sMap=null;
        List<approvalLine> sList=null;
        String code = session.getAttribute("hrCode").toString();
        sList=pDao.getMyInfo(code);
        System.out.println(sList);
        if(sList!=null) {
           sMap=new HashMap<>();
           sMap.put("sList", sList);
        }else {
           sMap=null;
        }
        return sMap;   
	}

	public ModelAndView rRegistration(Return rt, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		rt.setR_ccode(session.getAttribute("cCode").toString());
		if(rt.getR_ccode()!="") {
			if(pDao.rRegistration(rt)) {
				view= "/Purchase/returnregistration";
				mav.addObject("msg", "데이터입력 완료");
			}else {
				view="/Purchase/returnregistration";
				mav.addObject("msg", "데이터입력 실패");
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<Return>> rInfo() {
		Map<String, List<Return>> rMap = null;
		List<Return> rList = pDao.rInfo();
		if (rList != null) {
			rMap = new HashMap<>();
			rMap.put("rList", rList);
			System.out.println("rList=" + rList);
		} else {
			rMap = null;
		}
		return rMap;
	}

	public Map<String, List<Return>> rDelete(String check_list) {
		Map<String, List<Return>> rMap=null;
		System.out.println(check_list);
		
		if(pDao.rDelete(check_list)) {
			List<Return>rList=pDao.rInfo();
			rMap= new HashMap<>();
			rMap.put("rList", rList);
			System.out.println("지워짐");
		}else {
			System.out.println("안지워짐");
			rMap=null;
		}
		return rMap;
	}

	public Map<String, List<Return>> rSearch(String search, String choice) {
		Map<String, List<Return>> rMap= null;
		List<Return> rList= pDao.rSearch(search, choice);
		if(rList!=null) {
			rMap= new HashMap<>();
			rMap.put("rList", rList);
			System.out.println("rList="+rList);
		}else {
			rMap=null;
		}
		return rMap;
	}
	
}