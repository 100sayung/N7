package com.n7.erp.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import com.n7.erp.dao.AccountDao;
import com.n7.erp.userClass.PagingVO;
import com.google.gson.Gson;
import com.n7.erp.bean.ac.A_company;
import com.n7.erp.bean.ac.Account;
import com.n7.erp.bean.ac.ApprovalDocument;
import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.ac.SaleInfo;
import com.n7.erp.bean.ac.myCompany;
import com.n7.erp.bean.ac.shipment;
import com.n7.erp.bean.ac.approvalLine;

@Component
public class AccountMM {

	@Autowired
	AccountDao aDao;

	ModelAndView mav;

	public Map<String, List<A_company>> insertcomlist(A_company ac, HttpSession session) {
		Map<String, List<A_company>> aMap = null;
		ac.setCl_ccode(session.getAttribute("cCode").toString());
		if (ac.getCl_code() != "") {
			if (aDao.insertcomlist(ac)) {
				List<A_company> aList = aDao.getComList(ac.getCl_ccode());
				aMap = new HashMap<>();
				aMap.put("aList", aList);
			} else {
				aMap = null;
			}
		} else {
			List<A_company> aList = aDao.getComList(ac.getCl_ccode());
			aMap = new HashMap<>();
			aMap.put("aList", aList);
		}
		return aMap;
	}

	public Map<String, List<A_company>> serchcomlist(String use, HttpSession session) {
		Map<String, List<A_company>> aMap = null;
		String cCode = session.getAttribute("cCode").toString();
		List<A_company> aList = aDao.getCompanyList(use,cCode);
		aMap = new HashMap<>();
		aMap.put("aList", aList);
		return aMap;
	}

	public Map<String, List<A_company>> searchcode(String use, String code, HttpSession session) {
		Map<String, List<A_company>> aMap = null;
		String cCode = session.getAttribute("cCode").toString();
		System.out.println(use);
		System.out.println(code);
		List<A_company> aList = aDao.getsearchCode(use, code, cCode);
		if (aList != null) {
			aMap = new HashMap<>();
			aMap.put("aList", aList);
		}
		return aMap;
	}

	public Map<String, List<A_company>> trensCom(String USE, String CODE, HttpSession session) {
		Map<String, List<A_company>> aMap = null;
		List<A_company> aList=null;
		boolean result = false;
		String cCode = session.getAttribute("cCode").toString();
		
			result = aDao.trensCom(USE, CODE, cCode);
			
		System.out.println(result);
		if (result) {
			if(Integer.parseInt(USE)==0) {
				System.out.println("여기로와?1");
				USE="1";
				aList = aDao.getCompanyList(USE, cCode);
			}else if(Integer.parseInt(USE)==1) {
				System.out.println("여기로와?2");
				USE="0";
				aList = aDao.getCompanyList(USE, cCode);
			}
			aMap = new HashMap<>();
			aMap.put("aList", aList);
		} else {
			System.out.println("여기로와?3");
			aMap = null;

		}
//		}else {
//			aMap=null;
//		}
		return aMap;
	}

	public ModelAndView saleinsert(HttpServletRequest request, SaleInfo si, HttpSession session) {
		String view = null;
		boolean a = false;
		boolean b = false;
		mav = new ModelAndView();
		A_company ac = new A_company();
		ac = aDao.getcomcode(si.getS_comnum());
		if (ac == null) {
			mav.addObject("msg", "등록된 거래처가 없습니다.");
		} else {

			si.setS_clcode(ac.getCl_code());
			si.setS_ccode(session.getAttribute("cCode").toString());
			String[] strpkind = request.getParameterValues("s_pkind");
			String[] strcnt = request.getParameterValues("s_cnt");
			String[] strprice = request.getParameterValues("s_price");
			String[] strprice2 = request.getParameterValues("s_price2");
			String[] strtax = request.getParameterValues("s_tax");
			String[] strtotal = request.getParameterValues("s_total");
			String[] strmemo = request.getParameterValues("s_memo");
			a = aDao.saleinsert(si);
			for (int i = 0; i < strpkind.length; i++) {
				si.setS_pkind(strpkind[i]);
				si.setS_cnt(strcnt[i]);
				si.setS_price(strprice[i]);
				si.setS_price2(strprice2[i]);
				si.setS_tax(strtax[i]);
				si.setS_total(strtotal[i]);
				si.setS_memo(strmemo[i]);
				b = aDao.saleinsert2(si);
			}

			if (a && b) {
				mav.addObject("msg", "전표등록성공");
				view = "Account/openTable";
			} else {
				mav.addObject("msg", "전표등록실패");
				view = "Account/openTable";
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<SaleInfo>> getsaleList(HttpSession session) {
		Map<String, List<SaleInfo>> aMap = null;
		String cCode = session.getAttribute("cCode").toString();
		List<SaleInfo> sList1 = aDao.getsaleList(cCode);
		// List<SaleInfo> sList2 = aDao.getsaleList2();
		if (sList1 != null) {
			aMap = new HashMap<>();
			aMap.put("sList1", sList1);
		} else {
			aMap = null;
		}
		// aMap.put("sList2", sList2);
		return aMap;
	}

	public Map<String, List<SaleInfo>> getList(String code) {
		System.out.println(code);
		Map<String, List<SaleInfo>> sMap = null;
		List<SaleInfo> sList = aDao.getList(code);
		if (sList != null) {
			sMap = new HashMap<>();
			sMap.put("sList", sList);
		}
		return sMap;
	}

	public ModelAndView getTaxbill(String check, HttpSession session) {
		String view = null;
		System.out.println(check);
		String cCode = session.getAttribute("cCode").toString();
		mav = new ModelAndView();
		if (check != null) {
			if (check.contains("AS")) {
				List<SaleInfo> tList1 = aDao.saleDetaile(check, cCode);
				List<SaleInfo> tList2 = aDao.saleDetaile2(check, cCode);
				String comnum = tList1.get(0).getS_comnum();
				myCompany mc = new myCompany();
				A_company ac = new A_company();
				ac = aDao.getcomInfo(comnum, cCode);
				mc = aDao.getmyCompany(cCode);
				mav.addObject("mc", mc);
				mav.addObject("ac", ac);
				mav.addObject("tList1", tList1);
				mav.addObject("tList2", new Gson().toJson(tList2));
				view = "Account/taxbillAS";

			} else {
				myCompany mc = new myCompany();
				A_company ac = new A_company();
				List<SaleInfo> tList1 = aDao.saleDetaile(check, cCode);
				List<SaleInfo> tList2 = aDao.saleDetaile2(check, cCode);
				String comnum = tList1.get(0).getS_comnum();
				ac = aDao.getcomInfo(comnum, cCode);
				mc = aDao.getmyCompany(cCode);
				mav.addObject("mc", mc);
				mav.addObject("ac", ac);
				mav.addObject("tList1", tList1);
				mav.addObject("tList2", new Gson().toJson(tList2));
				mav.addObject("msg", "세금계산서 등록");
				view = "Account/taxbillAP";
			}
		} else {
			mav.addObject("msg", "선택한 항목이없습니다");
			view = "Account/openTable";
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<SaleInfo>> deleteSale(int cnt, String[] strArray, HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		Map<String, List<SaleInfo>> aMap = null;
		boolean result = false;
		boolean result2 = false;
		String code = "";
		for (int i = 0; i < cnt; i++) {
			code = strArray[i];
			result2 = aDao.deleteSale2(code, cCode);
			result = aDao.deleteSale(code, cCode);
		}
		if (result && result2) {
			List<SaleInfo> sList = aDao.getsaleList(cCode);
			aMap = new HashMap<>();
			aMap.put("sList", sList);
		} else {
			aMap = null;
		}
		return aMap;
	}

	public ModelAndView saledetails(String check, HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		String view = null;
		System.out.println(check);
		mav = new ModelAndView();

		if (check != null) {
			List<SaleInfo> tList = new ArrayList<>();
			tList = aDao.getTaxbill(check);
			List<SaleInfo> tList2 = aDao.saleDetaile2(check, cCode);
			myCompany mc = new myCompany();
			mc = aDao.getmyCompany(cCode);
			mav.addObject("mc", mc);
			mav.addObject("tList", tList);
			mav.addObject("tList2", new Gson().toJson(tList2));
			view = "Account/saledetails";
		} else {

			mav.addObject("msg", "매출만 거래명세서를 볼수 있습니다");
			view = "Account/openTable";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView acApproval(String check, HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		mav = new ModelAndView();
		String view = "";
		if (check != null) {
			List<SaleInfo> sList1 = aDao.saleDetaile(check, cCode);
			List<SaleInfo> sList2 = aDao.saleDetaile2(check, cCode);
			if (sList1 != null) {
				mav.addObject("sList1", sList1);
				mav.addObject("sList2", new Gson().toJson(sList2));
				view = "Account/acApproval";
			}
		} else {
			mav.addObject("msg", "불러올 데이터가 없습니다");
			view = "opentable";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView approvalLine(HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		String view = null;
		mav = new ModelAndView();
		List<approvalLine> aList = null;
		aList = aDao.approvalLine(cCode);
		if (aList.size() != 0) {
			mav.addObject("aList", new Gson().toJson(aList));
			view = "Account/approvalLine";
		} else {

			mav.addObject("msg", "주소록에 정보가 없습니다");
			view = "Account/acApproval";
		}

		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<approvalLine>> searchName(String name) {
		Map<String, List<approvalLine>> aMap = null;
		List<approvalLine> aList = null;
		if (name != null) {
			aList = aDao.searchName(name);
			aMap = new HashMap<>();
			aMap.put("aList", aList);
		} else {
			aMap = null;
		}
		return aMap;
	}

	public Map<String, List<approvalLine>> addApproval(int cnt, String[] strArray) {
		Map<String, List<approvalLine>> aMap = null;
		List<approvalLine> aList = new ArrayList<>();
		System.out.println("숫자=" + cnt);
		System.out.println("이름값=" + strArray.length);
		String code = "";
		approvalLine al = new approvalLine();
		for (int i = 0; i < cnt; i++) {
			code = strArray[i];
			al = aDao.addApproval(code);
			aList.add(al);
		}
		if (aList != null) {
			aMap = new HashMap<>();
			aMap.put("aList", aList);
		} else {
			aMap = null;
		}
		return aMap;
	}

	public Map<String, List<approvalLine>> approLinecom(String[] code01) {
		Map<String, List<approvalLine>> aMap = null;
		System.out.println(code01.length);
		// System.out.println(code02[0]);

		if (code01.length != 0) {
			List<approvalLine> tList1 = new ArrayList<>();
			// List<approvalLine> tList2= new ArrayList<>();

			for (int i = 0; i < code01.length; i++) {
				approvalLine al = new approvalLine();
				al = aDao.approLinecom1(code01[i]);
				tList1.add(al);
			}
//				for(int i=0; i<code02.length; i++) {
//					approvalLine al = new approvalLine();
//					al=aDao.approLinecom2(code02[i]);
//					tList2.add(al);
//				}
			aMap = new HashMap<>();
			System.out.println(tList1);
			aMap.put("tList1", tList1);
			// aMap.put("tList2",tList2);
		} else {

			aMap = null;
			;
		}

		return aMap;

	}

	public ModelAndView approdocument(HttpServletRequest request, ApprovalDocument ad, HttpSession session) {
		String view = null;
		mav = new ModelAndView();
		boolean a = false;
		boolean b = false;
		boolean c = false;
		A_company ac = new A_company();
		ac = aDao.getcomcode(ad.getRs_comnum());
		ad.setRs_clcode(ac.getCl_code());
		ad.setRs_ccode(session.getAttribute("cCode").toString());
		String[] strpkind = request.getParameterValues("rs_pkind");
		String[] strcnt = request.getParameterValues("rs_cnt");
		String[] strprice = request.getParameterValues("rs_price");
		String[] strprice2 = request.getParameterValues("rs_price2");
		String[] strtax = request.getParameterValues("rs_tax");
		String[] strtotal = request.getParameterValues("rs_total");
		String[] strmemo = request.getParameterValues("rs_memo");
		a = aDao.approvaldocu(ad);
		b = aDao.approdocument(ad);
		for (int i = 0; i < strpkind.length; i++) {
			ad.setRs_pkind(strpkind[i]);
			ad.setRs_cnt(strcnt[i]);
			ad.setRs_price(strprice[i]);
			ad.setRs_price2(strprice2[i]);
			ad.setRs_tax(strtax[i]);
			ad.setRs_total(strtotal[i]);
			ad.setRs_memo(strmemo[i]);
			c = aDao.approdocument2(ad);
		}
		if (a && b && c) {
			// aDao.saleListDelete(ad);
			mav.addObject("num", "1");
			view = "Account/openTable";
		} else {
			mav.addObject("num", "0");
			view = "Account/openTable";
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<SaleInfo>> getpkind(String pkind) {
		Map<String, List<SaleInfo>> sMap = null;
		List<SaleInfo> sList = new ArrayList<>();
		List<SaleInfo> sList2 = new ArrayList<>();
		SaleInfo si = new SaleInfo();
		sList = aDao.getpkind(pkind);
		System.out.println("날짜검색");
		for (int i = 0; i < sList.size(); i++) {
			si = aDao.getDate(sList.get(i).getS_num());
			sList2.add(si);
		}
		System.out.println("날짜검색끝");
		System.out.println(sList);
		if (sList != null) {
			sMap = new HashMap<>();
			sMap.put("sList", sList);
			sMap.put("sList2", sList2);
		}
		return sMap;
	}

	public ModelAndView SaleDetaile(String check, HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		String view = null;
		mav = new ModelAndView();
		List<SaleInfo> sList1 = aDao.saleDetaile(check, cCode);
		List<SaleInfo> sList2 = aDao.saleDetaile2(check, cCode);
		if (sList1 != null) {
			if (sList1.get(0).getS_num().contains("AS")) {
				mav.addObject("sList1", sList1);
				mav.addObject("sList2", new Gson().toJson(sList2));
				view = "Account/SaleDetaileAS";
			} else {
				mav.addObject("sList1", sList1);
				mav.addObject("sList2", new Gson().toJson(sList2));
				view = "Account/SaleDetaileAP";
			}
		} else {
			mav.addObject("msg", "불러올 데이터가 없습니다");
			view = "Account/opentable";
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<SaleInfo>> selectSearch(String select, String choice) {
		Map<String, List<SaleInfo>> sMap = null;
		List<SaleInfo> sList = null;
		sList = aDao.selectSreach(select, choice);
		System.out.println(sList);
		if (sList != null) {
			sMap = new HashMap<>();
			sMap.put("sList", sList);
		} else {
			sMap = null;
		}
		return sMap;
	}

	public Map<String, List<ApprovalDocu>> comparecode(String code, HttpSession session) {
		String cCode = session.getAttribute("cCode").toString();
		Map<String, List<ApprovalDocu>> sMap = null;
		List<ApprovalDocu> sList = null;

		sList = aDao.comparecode(code, cCode);
		System.out.println(sList);
		if (sList != null) {
			sMap = new HashMap<>();
			sMap.put("sList", sList);
		} else {
			sMap = null;
		}
		return sMap;
	}

	public Map<String, List<approvalLine>> getMyInfo(HttpSession session) {
		Map<String, List<approvalLine>> sMap = null;
		List<approvalLine> sList = null;
		String code = session.getAttribute("hrCode").toString();
		sList = aDao.getMyInfo(code);
		System.out.println(sList);
		if (sList != null) {
			sMap = new HashMap<>();
			sMap.put("sList", sList);
		} else {
			sMap = null;
		}
		return sMap;
	}

	public Map<String, List<shipment>> getshipment(HttpSession session) {
		Map<String, List<shipment>> aMap = null;
		List<shipment> sList = null;
		String cCode = session.getAttribute("cCode").toString();
		sList = aDao.getshipment(cCode);
		if (sList != null) {
			aMap = new HashMap<>();
			aMap.put("sList", sList);
		} else {
			aMap = null;
		}
		return aMap;
	}
/////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////

	public int actempoInsert(Account ac, HttpSession session) {
		String cCode = (String) session.getAttribute("cCode");
		String hrCode = (String) session.getAttribute("hrCode");

		ac.setJ_ccode(cCode); // 회사코드
		ac.setJ_docunum("AC");
		ac.setJ_reasion("사유");
		ac.setJ_none(hrCode);
		ac.setJ_ntwo("결재자2");
		ac.setJ_nthr("결재자3");

		if (aDao.actempoInsert(ac)) {
			System.out.println("ac전표 등록이 완료되었습니다.");
			return 1;
		} else {
			System.out.println("ac전표 등록을 실패하였습니다.");
			return 0;
		}

	}

//public Map<String, List<Account>> acTemporaryList((HttpSession session, PagingVO vo, int start, int end) {
//String hrCode = (String) session.getAttribute("hrCode");
//String cCode = (String) session.getAttribute("cCode");aDao.acTemporaryList(hrCode, cCode);
//
//if (aList != null) {
//aMap = new HashMap<>();
//aMap.put("aList", aList);
//System.out.println("임시저장 리스트 가져왓어");
//} else {
//System.out.println("못가져왓져");
//}
//return aMap;
//}

	public List<Account> acTemporaryList(HttpSession session, PagingVO vo, int start, int end) {
		String hrCode = (String) session.getAttribute("hrCode");
		String cCode = (String) session.getAttribute("cCode");

		return aDao.acTemporaryList(hrCode, cCode, vo, start, end);

	}

//public Map<String, List<ApprovalDocu>> apupPaymentList(HttpSession session) {
//Map<String, List<ApprovalDocu>> pMap = null;
//String hrCode = (String) session.getAttribute("hrCode");
//String cCode = (String) session.getAttribute("cCode");
//
//List<ApprovalDocu> pList = aDao.apupPaymentList(hrCode, cCode);
//
//if (pList != null) {
//pMap = new HashMap<>();
//pMap.put("pList", pList);
//System.out.println("내가올린 pList가져왓어");
//} else {
//System.out.println("못가져왓져");
//}
//return pMap;
//}

//내가 올린 결재안 목록 페이징
	public List<ApprovalDocu> apupPaymentList(HttpSession session, PagingVO vo, int start, int end) {
		String hrCode = (String) session.getAttribute("hrCode");
		String cCode = (String) session.getAttribute("cCode");

		return aDao.apupPaymentList(hrCode, cCode, vo, start, end);
	}

//public Map<String, List<ApprovalDocu>> apdownPaymentList(HttpSession session) {
//Map<String, List<ApprovalDocu>> pMap = null;
//String hrCode = (String) session.getAttribute("hrCode");
//String cCode = (String) session.getAttribute("cCode");
//System.out.println("사원코드: " + hrCode);
//
//List<ApprovalDocu> pList = aDao.apdownPaymentList(hrCode, cCode);
//
//if (pList != null) {
//pMap = new HashMap<>();
//pMap.put("pList", pList);
//System.out.println("내가받은 jList가져왓어");
//} else {
//System.out.println("못가져왓져");
//}
//
//return pMap;
//}

//내가 받은 결재안 목록 페이징
	public List<ApprovalDocu> apdownPaymentList(HttpSession session, PagingVO vo, int start, int end) {
		String hrCode = (String) session.getAttribute("hrCode");
		String cCode = (String) session.getAttribute("cCode");
		System.out.println("사원코드: " + hrCode);

		return aDao.apdownPaymentList(hrCode, cCode, vo, start, end);
	}

// 임시저장 결재안 상세보기
	public ModelAndView acRequest(String j_docunum, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String cCode = (String) session.getAttribute("cCode");

		Account ac = aDao.acRequest(j_docunum, cCode);

		if (ac != null) {
			mav.addObject("ac", ac);
			view = "Account/acTemroinfo";
			System.out.println(ac.getJ_none());
			System.out.println("성공했다 이시키야");
		} else {
			view = "Account/acTemroinfo";
			System.out.println("야 못했다 미안하다...");
		}
		mav.setViewName(view);
		return mav;
	}

// 내가받은결재안 상세보기
	public ModelAndView apRequest2(String j_docunum, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String cCode = (String) session.getAttribute("cCode");

		Account ac = aDao.apRequest2(j_docunum, cCode);

		if (ac != null) {
			mav.addObject("ac", ac);
			view = "Account/apDowninfo";
			System.out.println(ac.getJ_none());
			System.out.println("성공했다 이시키야");
		} else {
			view = "Account/apDowninfo";
			System.out.println("야 못했다 미안하다...");
		}
		mav.setViewName(view);
		return mav;
	}

// 내가올린결재안 상세
	public ModelAndView apRequest(String j_docunum, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String cCode = (String) session.getAttribute("cCode");

		Account ac = aDao.apRequest(j_docunum, cCode);

		if (ac != null) {
			mav.addObject("ac", ac);
			view = "Account/apUpinfo";
			System.out.println(ac.getJ_none());
			System.out.println("성공했다 이시키야");
		} else {
			view = "Account/apUpinfo";
			System.out.println("야 못했다 미안하다...");
		}
		mav.setViewName(view);
		return mav;
	}

// 내가 결재할때
	public ModelAndView acSign(Account ac, ApprovalDocu ap, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		mav = new ModelAndView();
		String view = null;

		ac.setJ_none(req.getParameter("rs_apcode0"));
		ac.setJ_ntwo(req.getParameter("rs_apcode1"));
		ac.setJ_nthr(req.getParameter("rs_apcode2"));
		ac.setJ_ccode((String) session.getAttribute("cCode"));
//if (ac.getJ_grade().equals("0")) {
		ac.setJ_grade("1");
//} 

//확인용
//System.out.println("결재자1: " + ac.getJ_none());
		System.out.println("결재자2: " + ac.getJ_ntwo());
		System.out.println("결재자3: " + ac.getJ_nthr());
		System.out.println("결재등급: " + ac.getJ_grade());

		if (ac.getJ_reasion() == null || ac.getJ_reasion() == "" || ac.getJ_reasion().equals("사유")) {
			ac.setJ_reasion("사유없음");
		}

//ap세팅
		ap.setAp_docunum(ac.getJ_docunum()); // 결재안
		ap.setAp_ccode(ac.getJ_ccode()); // 회사코드
		ap.setAp_docuname(ac.getJ_title()); // 결재문서이름
		ap.setAp_fromapprover(ac.getJ_none());// 결재올린사람
		ap.setAp_toapprover(ac.getJ_ntwo()); // 결재받을사람
		ap.setAp_status((ac.getJ_grade())); // 결재상태

		boolean sa = aDao.acSign(ac); // 결재사람1,2,3 넣는거 업데이트
		boolean sp = aDao.apCart2(ap); // 결재문서 테이블에 인서트

		if (sa && sp) {
			try {
				rep.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				out = rep.getWriter();
				out.println("<script>alert('결재요청완료');</script>");
				out.println("<script>window.close();</script>");
				out.println("<script>window.opener.location.reload();</script>");
				out.flush();
				out.close();
				mav.setViewName("Account/acTemporary");
				System.out.println("결재요청했음");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			mav.setViewName("Account/acTemporary");
			System.out.println("야 결재요청못했다 미안하다..");
		}
//mav.setViewName(view);
		return mav;
	}

// 결재2,3
	public ModelAndView acSign2(Account ac, ApprovalDocu ap, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String hrCode = (String) session.getAttribute("hrCode");
		String cCode = (String) session.getAttribute("cCode");
		
		ac.setJ_ccode(cCode);
		ac.setJ_none(req.getParameter("rs_apcode0"));
		ac.setJ_ntwo(req.getParameter("rs_apcode1"));
		ac.setJ_nthr(req.getParameter("rs_apcode2"));

		if (ac.getJ_grade().equals("1") && hrCode.equals(ac.getJ_ntwo())) {
			ac.setJ_grade("2");
			ap.setAp_toapprover(ac.getJ_nthr());
		} else if (ac.getJ_grade().equals("2") && hrCode.equals(ac.getJ_nthr())) {
			ac.setJ_grade("3");
			ap.setAp_toapprover(ac.getJ_nthr());
		}
		ap.setAp_toapprover(ac.getJ_nthr());

		if (ac.getJ_grade().equals("1")) {
			ap.setAp_status("1");
		} else if (ac.getJ_grade().equals("2")) {
			ap.setAp_status("2");
		} else if (ac.getJ_grade().equals("3")) {
			ap.setAp_status("3");
		} else {
			ap.setAp_status("3");
		}

		ap.setAp_ccode(cCode);
		ap.setAp_docunum(ac.getJ_docunum());

		boolean sa = aDao.acSign2(ac);
		boolean sp = aDao.apSign2(ap);

		if (sa && sp) {
			view = "Account/apdownPayment";
			System.out.println("결재요청했음");
		} else {
			view = "Account/apdownPayment";
			System.out.println("야 결재요청못했다 미안하다..");
		}
		mav.setViewName(view);
		return mav;
	}

// 결재안 삭제
	public int acDelete(String j_docunum, Account ac, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		String cCode = (String) session.getAttribute("cCode");

		int a = aDao.acCheck(j_docunum, cCode);
		boolean b = aDao.acDelete(j_docunum, cCode);

// 결재상태1?2면 딜리트안되게해야돼
		if (a != 0 && b) { // 결재상태 '0'인게 있고 삭제가 되면 결재안삭제완료
			System.out.println("결재안삭제가 완료되었습니다.");
			return 1;
		} else if (a == 0) { // 결재상태 '0'인게 없을경우
			System.out.println("결재중인 결재안입니다.");
			return 2;
		} else {
			System.out.println("");
			return 0;
		}
	}

// 결재안 반려
	public ModelAndView acBack(Account ac, ApprovalDocu ap, HttpServletRequest req, HttpServletResponse rep,
			HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String cCode = (String) session.getAttribute("cCode");

		System.out.println("acBack까지 들어왔어: " + ac.getJ_docunum());
		System.out.println("acBack까지 들어왔어: " + ac.getJ_reasion());

		if (ac.getJ_reasion() == null || ac.getJ_reasion() == "" || ac.getJ_reasion().equals("사유")) {
			ac.setJ_reasion("사유없음");
		}
		
		ac.setJ_ccode(cCode);
		
		ap.setAp_ccode(cCode);
		ap.setAp_docunum(ac.getJ_docunum());

		boolean ba = aDao.acBack(ac);
		boolean bp = aDao.apBack2(ap);

		if (ba && bp) {
			view = "Account/apdownPayment";
			System.out.println("반려요청했음");
		} else {
			view = "Account/apdownPayment";
			System.out.println("야 반려요청못했다 미안하다..");
		}
		mav.setViewName(view);
		return mav;
	}

	public Map<String, List<approvalLine>> getApprinfo(int cnt, String[] strArray, HttpSession session) {
		Map<String, List<approvalLine>> aMap = null;
		List<approvalLine> aList = new ArrayList<>();

		System.out.println("숫자=" + cnt);
		System.out.println("이름값=" + strArray.length);
		String code = "";

		approvalLine al = new approvalLine();
		for (int i = 0; i < cnt; i++) {
			code = strArray[i];
			al = aDao.getApprinfo(code);
			aList.add(al);
		}
		if (aList != null) {
			aMap = new HashMap<>();
			aMap.put("aList", aList);
		} else {
			aMap = null;
		}
		return aMap;
	}

//결재안문서 카운트
	public int countDocument() {
		return aDao.countDocument();
	}
}
