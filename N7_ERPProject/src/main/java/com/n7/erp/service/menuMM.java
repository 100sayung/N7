package com.n7.erp.service;

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

import com.n7.erp.bean.Authority;
import com.n7.erp.bean.Company;
import com.n7.erp.bean.Menu;
import com.n7.erp.bean.clientMenu;
import com.n7.erp.bean.ac.approvalLine;
import com.n7.erp.dao.HRIDeptDao;
import com.n7.erp.dao.menuDao;

@Component
public class menuMM {
	@Autowired
	menuDao mDao;
	@Autowired
	private HRIDeptDao hDao;

	ModelAndView mav;

	public Map<String, List<Menu>> getmenu() {
		Map<String, List<Menu>> mMap = null;
		List<Menu> mList = new ArrayList<>();

		mList = mDao.getmenu();
		if (mList != null) {
			mMap = new HashMap<>();
			mMap.put("mList", mList);
		} else {
			mMap = null;
		}
		return mMap;
	}

	public Map<String, Object> addmenu(String[] strArray, HttpSession session) {
		Map<String, Object> mMap = null;
		System.out.println("이름값=" + strArray.length);
		boolean result = false;
		String menu = "";
		String cCode = session.getAttribute("cCode").toString();
		mDao.deletemenu(cCode);
		for (int i = 0; i < strArray.length; i++) {
			menu = strArray[i];
			result = mDao.addmenu(menu, cCode);
		}
		if (result) {
			mMap = new HashMap<>();
			mMap.put("msg", 1);
		} else {
			mMap = new HashMap<>();
			mMap.put("msg", 0);
		}
		return mMap;

	}

	public Map<String, List<clientMenu>> getaddmenu(HttpSession session) {
		Map<String, List<clientMenu>> mMap = null;
		List<clientMenu> mList = new ArrayList<>();
		String cCode = session.getAttribute("cCode").toString();
		mList = mDao.getaddmenu(cCode);
		System.out.println(mList);
		if (mList != null) {
			mMap = new HashMap<>();
			mMap.put("mList", mList);
		} else {
			mMap = null;
		}
		return mMap;
	}

	public Map<String, List<Company>> getCompanyInfo(HttpSession session) {
		Map<String, List<Company>> mMap = null;
		List<Company> mList = new ArrayList<>();
		String cCode = session.getAttribute("cCode").toString();
		mList = mDao.getCompanyInfo(cCode);
		System.out.println(mList);
		if (mList != null) {
			mMap = new HashMap<>();
			mMap.put("mList", mList);
		} else {
			mMap = null;
		}
		return mMap;
	}

	public ModelAndView companyUpdate(Company cp) {
		mav = new ModelAndView();

		String view = null;
		boolean result = mDao.companyUpdate(cp);
		if (result) {
			mav.addObject("msg", "저장 완료");
			view = "/managermode/Company";
		} else {
			mav.addObject("msg", "저장 실패");
			view = "/managermode/Company";
		}
		mav.setViewName(view);
		return mav;
	}

	public int authInsert(Authority au) {
		System.out.println("회사명: " + au.getAu_comname());
		System.out.println("부서명: " + au.getAu_name());
		System.out.println("권한: " + au.getAu_authority());

		int a = mDao.authInsert(au);

		if (a != 0) {
			return 1;
		}
		return 0;
	}

	public Map<String, List<Authority>> authoritList(HttpSession session) {
		Map<String, List<Authority>> pMap = null;
		String cCode = (String) session.getAttribute("cCode");
		System.out.println("회사코드: " + cCode);

		List<Authority> pList = mDao.authoritList(cCode);

		if (pList != null) {
			pMap = new HashMap<>();
			pMap.put("pList", pList);
			System.out.println("내가받은 pList가져왓어");
		} else {
			System.out.println("못가져왓져");
		}

		return pMap;
	}

	public int depratmentDelete(String au_name, HttpSession session) {
		String cCode = (String) session.getAttribute("cCode");

		System.out.println("부서명" + au_name);

		int deptcnt = hDao.checkDept(au_name, cCode);
		if (deptcnt == 0) {
			int a = mDao.depratmentDelete(au_name, cCode);
			if (a != 0) {
				System.out.println("부서 삭제햇져");
				return 1;
			}
		} 
		return 0;
	}

}
