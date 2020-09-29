package com.n7.erp.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.n7.erp.bean.Member;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.dao.IHrDao;
import com.n7.erp.dao.IMemberDao;

@Service
public class MyInfoMM {

	@Autowired
	IMemberDao mDao;
	@Autowired
	IHrDao hDao;

	public String getMyInfo(HttpSession session) {
		String id = session.getAttribute("id").toString();

		Member mb = mDao.getMemberDetail(id);
		HashMap<String, String> infoMap = new HashMap<String, String>();
		infoMap.put("name", mb.getM_name());
		infoMap.put("birth", mb.getM_birth());
		infoMap.put("email", mb.getM_email());
		infoMap.put("phonenum", mb.getM_phonenum());
		infoMap.put("photo", mb.getM_photo());
		infoMap.put("address", mb.getM_address());

		if (hDao.haveHRCodeFromId(id)) {
			HR_Card hrCard = hDao.getHrCardDetail(id);
			infoMap.put("cCode", hrCard.getHc_ccode());
			infoMap.put("dept", hrCard.getHc_dept());
			infoMap.put("position", hrCard.getHc_position());
			infoMap.put("joindate", hrCard.getHc_joindate());
			infoMap.put("status", hrCard.getHc_status());
			infoMap.put("work", hrCard.getHc_work());
		}
		String result = new Gson().toJson(infoMap);
		return result;
	}

}
