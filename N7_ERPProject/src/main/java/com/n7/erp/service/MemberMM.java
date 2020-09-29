package com.n7.erp.service;

import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.n7.erp.bean.Member;
import com.n7.erp.dao.IHrDao;
import com.n7.erp.dao.IMemberDao;
import com.n7.erp.userClass.FileManager;

@Repository
@Service
public class MemberMM {

	ModelAndView mav = new ModelAndView();
	@Autowired
	private IMemberDao mDao;
	@Autowired
	private IHrDao hDao;
	String view = "";
	@Autowired
	JavaMailSender mailSender;

	public ModelAndView access(Member mb, HttpSession session) {
		System.out.println(mb.getM_id());
		if (mDao.access(mb)) {
			view = "/home/home";
			session.setAttribute("id", mb.getM_id());
			session.setAttribute("cCode", mDao.bringCCode(mb));
			if (hDao.haveHrCode(mb.getM_id())) {
				session.setAttribute("hrCode", hDao.getHrCodeFromID(mb.getM_id()));
				System.out.println(hDao.getHrCodeFromID(mb.getM_id()));
			}
		} else {
			view = "/home/login";
			mav.addObject("warn", "Warning");
		}
		System.out.println(view);
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView join(MultipartHttpServletRequest multi) {
		Member mb = new Member();
		System.out.println("m_ccode = " + multi.getParameter("m_ccode"));
		if (multi.getParameter("m_ccode").toString().equals("")) {
			mb.setM_ccode("N7");
		}else {
			String cCode = multi.getParameter("m_ccode");
			mb.setM_ccode(cCode);
		}
		String id = multi.getParameter("m_id");
		String pw = multi.getParameter("m_pw");
		String address = multi.getParameter("m_address");
		String phonenum = multi.getParameter("m_phonenum");
		String birth = multi.getParameter("m_birth");
		String name = multi.getParameter("m_name");
		String email = multi.getParameter("m_email");
		mb.setM_address(address).setM_birth(birth).setM_email(email).setM_id(id).setM_name(name).setM_phonenum(phonenum)
				.setM_pw(pw);
		System.out.println(address);
		FileManager fm = new FileManager();
		String file = fm.fileUp(multi);
		System.out.println(file);
		mb.setM_photo(file);

		if (mDao.join(mb)) {
			mav.addObject("msg", 1);
		} else {
			mav.addObject("msg", 0);
		}
		mav.setViewName("/home/home");
		return mav;
	}

public String getSearchFromId(String m_id) {
	ArrayList<Member> mlist = new ArrayList<Member>();
	if (m_id.equals("")) {
		System.out.println("��");
		mlist = mDao.getAllMember();
	} else {
		m_id = "%" + m_id + "%";
		System.out.println("m_id : " + m_id);
		mlist = mDao.getSearchFromId(m_id);
	}
	String result = new Gson().toJson(mlist);
	System.out.println(result);
	return result;
}

public String updateChangeGrade(List<Member> mlist) {
	for (int i = 0; i < mlist.size(); i++) {
		mDao.updateChangeGrade(mlist.get(i));
	}

	return null;
}

public void forceWithDrawal(List<String> slist) {
	for (int i = 0; i < slist.size(); i++) {
		mDao.forceWithDrawal(slist.get(i));
	}

}

public ModelAndView moveMyInfo(HttpSession session) {
	if(!hDao.haveHrCode(session.getAttribute("id").toString())) {
		mav.addObject("msg", "�켱 �λ�ī�� ����� ��û���ּ���.");
	}
	mav.setViewName("myInfo/myInfo");
	return mav;
}

	public ResponseEntity<String> findId(String userEmail) {
		Member mb = mDao.findId(userEmail);
		return ResponseEntity.ok(new Gson().toJson(mb));
	}

	public ResponseEntity<String> sendAuthenticationNum(String userEmail, int authentictionNum) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setFrom("mykyj2000@gmail.com");
			messageHelper.setTo(userEmail);
			messageHelper.setSubject("N7 ERP ������ȣ�Դϴ�.");
			messageHelper.setText("������ȣ�� " + authentictionNum + " �Դϴ�");
			mailSender.send(mimeMessage);
			return ResponseEntity.ok(new Gson().toJson("������ȣ���� ����"));
		} catch (MessagingException e) {
			e.printStackTrace();
			return ResponseEntity.ok(new Gson().toJson("������ȣ���� ����"));
		}
	}

	public ResponseEntity<String> findPassword(String userEmail, String userId) {
		Member mb = mDao.findPassword(userEmail,userId);
		return ResponseEntity.ok(new Gson().toJson(mb));
	}

	public ModelAndView modifyPasswordFrm(String userId) {
		mav.addObject("userId",userId);
		mav.setViewName("home/modifypasswordfrm");
		return mav;
	}

	public ResponseEntity<String> modifyPassword(String userPassword, String userId) {
		mDao.modifyPassword(userPassword,userId);
		return ResponseEntity.ok(new Gson().toJson("��й�ȣ ���濡 �����Ͽ����ϴ�."));
	}

	public String getDupleID(String m_id) {
		int idcnt = mDao.getDupleID(m_id);
		return Integer.toString(idcnt);
	}

	public String getDupleCCode(String cCode) {
		int ccodecnt = mDao.getDupleCCode(cCode);
		return Integer.toString(ccodecnt);
	}

}
