package com.n7.erp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ItemCode;
import com.n7.erp.bean.ps.Order;
import com.n7.erp.bean.ps.Purchase;
import com.n7.erp.bean.ps.PurchaseApproval;
import com.n7.erp.bean.ps.approvalLine;
import com.n7.erp.bean.ps.Return;
import com.n7.erp.dao.PurchaseDao;

@Transactional
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
		
		ps.setP_documentcode("P");
		
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
				mav.addObject("msg", "데이터 입력이 완료되었습니다.");
				view = "/Purchase/pregistration";
			} else {
				mav.addObject("msg", "데이터 입력이 실패하였습니다.");
				view = "/Purhcase/pregistration";
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<Purchase>> pFrerence(HttpSession session) {
		Map<String, List<Purchase>> pMap = null;
		String cCode = session.getAttribute("cCode").toString();

		List<Purchase> pList = pDao.pFrerence(cCode);
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


	public Map<String, List<Purchase>> pfsearch(String search, String choice, HttpSession session) {
		Map<String, List<Purchase>> pMap = null;
		String cCode=session.getAttribute("cCode").toString();
		List<Purchase> pList = pDao.pfSearch(search, choice, cCode);
		if (pList != null) {
			pMap = new HashMap<>();
			pMap.put("pList", pList);
			System.out.println("pList=" + pList);
		} else {
			pMap = null;
		}
		return pMap;
	}

	public Map<String, List<Purchase>> pfdelete(String check, HttpSession session) {
		String cCode=session.getAttribute("cCode").toString();
		Map<String, List<Purchase>> pMap = null;
		List<Purchase>pList= null;
		System.out.println(check);
		int cnt=0;
		cnt= pDao.compareCode(check, cCode);
		
		if(cnt==0) {
			if(pDao.pcDelete(check, cCode) && pDao.pfDelete(check, cCode)) {
				pList= pDao.pFrerence(cCode);
				pMap = new HashMap<>();
				pMap.put("pList", pList);
				System.out.println("지워졌다");
			}else {
				System.out.println("지워짐?");
				pMap= null;
			}
		}else {
			System.out.println("들어오냐?");
			pMap= new HashMap<>();
			pMap.put("pList", pList);
		}
		return pMap;
	}
	

	public ModelAndView pDetail(String check, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		String cCode=session.getAttribute("cCode").toString();
		List<Purchase> pList= null;
		Purchase ps= new Purchase();

		if(check!=null) {
			ps= pDao.pInfo(check, cCode);
			pList= pDao.pDetail(check, cCode);
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

	public ModelAndView pProgram(String check, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		String cCode=session.getAttribute("cCode").toString();
		List<Purchase> pList= null;

		if(check!=null) {
			Purchase ps= new Purchase();
				ps= pDao.pBring(check,cCode);
				pList= pDao.pProgram(check,cCode);
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
	
	public Map<String, List<Purchase>> approvalcheck(String check, HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		Map<String, List<Purchase>>pMap= null;
		int cnt=0;
		cnt= pDao.compareCode(check, cCode);
		
		if(cnt==1) {
			List<Purchase> pList= null;
			pMap= new HashMap<>();
			pMap.put("pList",pList);
		}else {
			List<Purchase> pList= new ArrayList<>();
			Purchase ps= new Purchase();
			ps.setP_status("0");
			pList.add(ps);
			pMap= new HashMap<>();
			pMap.put("pList", pList);
		}
		
		return pMap;
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

		IePort ie= new IePort();
		ItemCode it= new ItemCode();

		rt.setR_ccode(session.getAttribute("cCode").toString());
		String hr_code= session.getAttribute("hrCode").toString();
		rt.setR_hrcode(hr_code);
		rt.setR_documentcode("R");

		int cnt= 0;
		int cnt2=0;
		int tot=0;
		int tot2=0;

		it=pDao.getitcode(rt.getR_itcode(), rt.getR_ccode());
		cnt=it.getIt_stock();
		cnt2= rt.getR_amount();
		tot=cnt-cnt2;
		tot2=Math.abs(tot);

		if(rt.getR_ccode()!="") {
			if(pDao.rRegistration(rt) && pDao.insertIeport(rt)) {
				  if(pDao.updateitcode(tot2, rt.getR_itcode(), rt.getR_ccode())) {
					  view= "/Purchase/retrunregistration";
				  }
			}
			}else {
				view="/Purchase/retrunregistration";
		}
		mav.setViewName(view);
		return mav;
	}


	public Map<String, List<Return>> rInfo(HttpSession session) {
		Map<String, List<Return>> rMap = null;
		String cCode=session.getAttribute("cCode").toString();
		List<Return> rList = pDao.rInfo(cCode);
		if (rList != null) {
			rMap = new HashMap<>();
			rMap.put("rList", rList);
			System.out.println("rList=" + rList);
		} else {
			rMap = null;
		}
		return rMap;
	}

//	public Map<String, List<Return>> rDelete(String check_list, HttpSession session) {
//		Map<String, List<Return>> rMap=null;
//		System.out.println(check_list);
//		String cCode=session.getAttribute("cCode").toString();
//
//		if(pDao.rDelete(check_list,cCode)) {
//			List<Return>rList=pDao.rInfo(cCode);
//			rMap= new HashMap<>();
//			rMap.put("rList", rList);
//			System.out.println("지워짐");
//		}else {
//			System.out.println("안지워짐");
//			rMap=null;
//		}
//		return rMap;
//	}

	public Map<String, List<Return>> rSearch(String search, String choice, HttpSession session) {
		Map<String, List<Return>> rMap= null;
		String cCode=session.getAttribute("cCode").toString();
		List<Return> rList= pDao.rSearch(search, choice, cCode);
		if(rList!=null) {
			rMap= new HashMap<>();
			rMap.put("rList", rList);
			System.out.println("rList="+rList);
		}else {
			rMap=null;
		}
		return rMap;
	}

	public ModelAndView pRequest(String p_documentcode, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		String cCode=session.getAttribute("cCode").toString();

		PurchaseApproval pa= pDao.pRequest(p_documentcode, cCode);

		List<PurchaseApproval>pList= pDao.pListRequest(p_documentcode, cCode);


		if(pa!=null) {
			if(pList!=null) {
				mav.addObject("pa", pa);
				mav.addObject("pList", new Gson().toJson(pList));
				System.out.println(pa.getP_approver1());
				System.out.println("성공");
				view="/Purchase/paUpinfo";
			}
		}else {
			view="/Purchase/paUpinfo";
			System.out.println("실패");
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<com.n7.erp.bean.ps.approvalLine>> getApprovalInfo(int cnt, String[] strArray, HttpSession session) {
		Map<String, List<approvalLine>> pMap=null;
		List<approvalLine> pList= new ArrayList<>();

		System.out.println("cnt="+cnt);
		System.out.println("이름값="+strArray.length);
		String code="";

		approvalLine al= new com.n7.erp.bean.ps.approvalLine();
		for(int i=0; i<cnt; i++) {
			code=strArray[i];
			al=pDao.getApprovalInfo(code);
			pList.add(al);
		}

		if(pList!=null) {
			pMap= new HashMap<>();
			pMap.put("pList", pList);
		}else {
			pMap= null;
		}
		return pMap;
	}

	public ModelAndView pRequest2(String p_documentcode, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		String cCode=session.getAttribute("cCode").toString();

		PurchaseApproval pa= pDao.pRequest2(p_documentcode, cCode);

		List<PurchaseApproval>pList= pDao.pListRequest2(p_documentcode, cCode);

		if(pa!=null) {
			if(pList!=null) {
				mav.addObject("pa", pa);
				mav.addObject("pList", new Gson().toJson(pList));
				System.out.println(pa.getP_approver1());
				System.out.println("성공");
				view="/Purchase/paDowninfo";
			}
		}else {
			view="/Purchase/paDowninfo";
			System.out.println("실패");
		}
		mav.setViewName(view);
		return mav;
	}
	public Map<String, List<IePort>> stocklist(HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		Map<String, List<IePort>> sMap= null;
		List<IePort> sList= pDao.stocklist(cCode);
		if(sList!=null) {
			sMap= new HashMap<>();
			sMap.put("sList", sList);
			System.out.println("sList="+sList);
		}else {
			sMap=null;
		}
		return sMap;
	}

	public Map<String, List<ItemCode>> getstocklist(HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		Map<String, List<ItemCode>> sMap= null;
		List<ItemCode> sList= pDao.getstocklist(cCode);
		if(sList!=null) {
			sMap= new HashMap<>();
			sMap.put("sList", sList);
			System.out.println("sList="+sList);
		}else {
			sMap=null;
		}
		return sMap;
	}

	public ModelAndView orderinsert(Order od, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		String view= null;
		od.setO_ccode(session.getAttribute("cCode").toString());
		
		if(od.getO_ccode()!="") {
			if(pDao.orderInsert(od)) {
				view="Purchase/orderregistration";
			}else {
				view="Purchase/orderregistration";
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<Order>> orderInfo(HttpSession session) {
		Map<String, List<Order>> pMap = null;
		String cCode = session.getAttribute("cCode").toString();

		List<Order> pList = pDao.orderInfo(cCode);
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

	public Map<String, List<Order>> orderSearch(String search, String choice, HttpSession session) {
		Map<String, List<Order>> pMap = null;
		String cCode= (String)session.getAttribute("cCode");
		List<Order> pList = pDao.orderSearch(search, choice, cCode);
		if (pList != null) {
			pMap = new HashMap<>();
			pMap.put("pList", pList);
			System.out.println("pList=" + pList);
		} else {
			pMap = null;
		}
		return pMap;
	}

	public Map<String, List<ApprovalDocu>> orderpinfo(HttpSession session) {
		Map<String, List<ApprovalDocu>> pMap=null;
		String cCode=(String)session.getAttribute("cCode");
		List<ApprovalDocu>pList=pDao.orderPinfo(cCode);
		if(pList!=null) {
			pMap= new HashMap<>();
			pMap.put("pList", pList);
			System.out.println("pList:"+pList);
		}else {
			pMap=null;
		}
		return pMap;
	}


}
