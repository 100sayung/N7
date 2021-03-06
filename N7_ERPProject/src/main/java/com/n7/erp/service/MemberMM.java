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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.Member;
import com.n7.erp.bean.ac.ApprovalDocument;
import com.n7.erp.bean.hr.HR_Card;
import com.n7.erp.bean.ps.PurchaseApproval;
import com.n7.erp.bean.sales.approvaldetail;
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

	public ModelAndView access(Member mb, HttpSession session, RedirectAttributes rttr) {
		System.out.println(mb.getM_id());
		if (mDao.access(mb)) {
			view = "redirect:/";
			session.setAttribute("id", mb.getM_id());
			session.setAttribute("cCode", mDao.bringCCode(mb));
			if (hDao.haveHrCode2(mb.getM_id())) {
				HR_Card hrCard = hDao.getHrCardDetail(mb.getM_id());
				System.out.println(hrCard.getHc_work());
				if(hrCard.getHc_work().equals("2")) {
					session.invalidate();
					rttr.addFlashAttribute("msg", "2");
					mav.setViewName("redirect:/");
					return mav;
				}
				session.setAttribute("hrCode", hrCard.getHc_hrcode());
				String Auth = hDao.getAuthority(hrCard.getHc_dept(), hrCard.getHc_ccode());
				session.setAttribute("auth", Auth);
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
		} else {
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
			mav.setViewName("redirect:/welcome");
		} else {
			mav.setViewName("/home/join");
			mav.addObject("msg", "0");
		}
		return mav;
	}

	public String getSearchFromId(String m_id) {
		ArrayList<Member> mlist = new ArrayList<Member>();
		if (m_id.equals("")) {
			System.out.println("�뜝�룞�삕");
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
		if (!hDao.haveHrCode(session.getAttribute("id").toString())) {
			mav.addObject("msg", "인사카드를 등록해주세요.");
		}
		mav.setViewName("myInfo/myInfo");
		return mav;
	}

	public ResponseEntity<String> findId(String userEmail) {
		Member mb = mDao.findId(userEmail);
		return ResponseEntity.ok(new Gson().toJson(mb));
	}

	public ResponseEntity<String> sendAuthenticationNum(String userEmail, int authentictionNum, String type) {
		try {
			if(type!=null){
				if(mDao.findId(userEmail)!=null){
					return ResponseEntity.ok(new Gson().toJson("이메일이 중복되었습니다."));
				}
			}
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setFrom("mykyj2000@gmail.com");
			messageHelper.setTo(userEmail);
			messageHelper.setSubject("N7 ERP 인증번호입니다.");
			messageHelper.setText("인증번호는 " + authentictionNum + " 입니다.");
			mailSender.send(mimeMessage);
			return ResponseEntity.ok(new Gson().toJson("인증번호 전송에 성공하였습니다. "));
		} catch (MessagingException e) {
			e.printStackTrace();
			return ResponseEntity.ok(new Gson().toJson("인증번호 전송에 실패하였습니다. 다시 시도 해주세요!"));
		}
	}

	public ResponseEntity<String> findPassword(String userEmail, String userId) {
		Member mb = mDao.findPassword(userEmail, userId);
		return ResponseEntity.ok(new Gson().toJson(mb));
	}

	public ModelAndView modifyPasswordFrm(String userId) {
		mav.addObject("userId", userId);
		mav.setViewName("home/modifypasswordfrm");
		return mav;
	}

	public ResponseEntity<String> modifyPassword(String userPassword, String userId) {
		mDao.modifyPassword(userPassword, userId);
		return ResponseEntity.ok(new Gson().toJson("OK"));
	}

	public String getDupleID(String m_id) {
		int idcnt = mDao.getDupleID(m_id);
		return Integer.toString(idcnt);
	}

	public String getDupleCCode(String cCode) {
		int ccodecnt = mDao.getDupleCCode(cCode);
		return Integer.toString(ccodecnt);
	}

	@Transactional
	public String deleteCompany(String cCode) {

		mDao.deleteO_return(cCode);
		mDao.deleteS_ieport(cCode);
		mDao.deleteO_purchaseprogram(cCode);
		mDao.deleteO_purchaseprogramcommom(cCode);
		mDao.deleteO_purchaselist(cCode);
		mDao.deleteO_order(cCode);
		mDao.deleteB_shipment(cCode);
		mDao.deleteAc_salestatementlist(cCode);
		mDao.deleteAc_realsalestatementlist(cCode);
		mDao.deleteAc_Realsalestatement(cCode);
		mDao.deleteB_uncollectedmoney(cCode);
		mDao.deleteB_shipregist(cCode);
		mDao.deleteS_itemcode(cCode);
		mDao.deleteHr_applyholiday(cCode);
		mDao.deleteB_activites(cCode);
		mDao.deleteHr_attendance(cCode);
		mDao.deleteHr_academic(cCode);
		mDao.deleteHr_payroll(cCode);
		mDao.deleteHr_certification(cCode);
		mDao.deleteHr_career(cCode);
		mDao.deleteHr_card(cCode);
		mDao.deleteO_purchasecommom(cCode);
		mDao.deleteB_order(cCode);
		mDao.deleteAc_salestatement(cCode);
		mDao.deleteHr_dept(cCode);
		mDao.deleteHr_deduction(cCode);
		mDao.deleteS_category(cCode);
		mDao.deleteApprovaldocu(cCode);
		mDao.deleteAc_companylist(cCode);
		mDao.deleteERPFunction(cCode);
		mDao.deleteMember(cCode);
		mDao.deleteCompany(cCode);

		return new Gson().toJson("성공");
	}

	public String checkGrade(HttpSession session) {
		String id = session.getAttribute("id").toString();
		String grade = mDao.checkGrade(id);
		return grade;
	}

	public String turnback(String num, String ect, HttpSession session) {
		String value = "";
		boolean result2 = false;
		boolean result3 = false;
		boolean result4 = false;
		String numCode = num.substring(0, 1);
		System.out.println(numCode);
		String cCode = session.getAttribute("cCode").toString();
		boolean result = mDao.turnback(num, cCode);
		if (numCode.equals("A")) {
			result2 = mDao.ectupdate1(num, ect, cCode);
		} else if (numCode.equals("G")) {
			result3 = mDao.ectupdate2(num, ect, cCode);
		} else {
			result4 = mDao.ectupdate3(num, ect, cCode);
		}

		if (result && result2 || result && result3 || result && result4) {
			value = "1";
		} else {
			value = "2";
		}
		return value;
	}

	public String approvalagree(String num, HttpSession session) {
		String value = "";
		ApprovalDocu ad = new ApprovalDocu();
		ApprovalDocument as = new ApprovalDocument();
		PurchaseApproval ap = new PurchaseApproval();
		approvaldetail av = new approvaldetail();
		String cCode = session.getAttribute("cCode").toString();
		ad = mDao.getStatus(num, cCode);
		String status = ad.getAp_status();
		String apcode = "";
		if (num.contains("AS") || num.contains("AP")) {
			as = mDao.getAScode(num, cCode);
			apcode = as.getRs_apcode2();
		} else if (num.contains("P")) {
			ap = mDao.getAPcode(num, cCode);
			apcode = ap.getP_apcode3();
		} else {
			av = mDao.getAGcode(num, cCode);
			apcode = av.getBs_apcode3();
		}
		boolean result = false;
		boolean result2 = false;
		if (status.equals("1")) {
			result = mDao.approvalagree(num, apcode, cCode);
	      } else if(status.equals("2")&&num.contains("G")){
	          mDao.salesupdate(num, cCode);
	          result2 = mDao.approvalagree2(num, cCode);
	       }else if(status.equals("2")){
	          result2 = mDao.approvalagree2(num, cCode);
	          
	       }
	       if (result || result2) {
	          value = "1";
	       } else {
	          value = "2";
	       }
	       return value;
	    }

	public String arbitrarily(String num, HttpSession session) {
		String value = "";
		String cCode = session.getAttribute("cCode").toString();
	      if(num.contains("G")){
	          mDao.salesupdate(num, cCode);
	       }
	       boolean result = mDao.arbitrarily(num, cCode);
	       if (result) {
	          value = "1";
	       } else {
	          value = "2";
	       }
	       return value;
	    }

	public ResponseEntity<String> getFunction(String cCode) {
		List<String> fList = mDao.getFunction(cCode);
		return ResponseEntity.ok(new Gson().toJson(makeFunction(fList)));
	}

	private String makeFunction(List<String> fList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<li><a href='/erp/stock/basicstock'>기초재고 등록</a></li>");
		sb.append("<li><a href='/erp/stock/importlist'>입/출고 내역</a></li>");
		sb.append("<li><a href='/erp/stock/byitemdeallist'>품목별 거래 현황</a></li>");
		sb.append("<li><a href='/erp/stock/byitemstocklist'>품목별 자재 현황</a></li>");
		sb.append("<li><a href='/erp/stock/monthpayment'>월수불실적</a></li>");
		if (fList.size() == 3) {
			sb.append("<li><a href='/erp/stock/exportstockcheck'>출고 확정</a></li>");
			sb.append("<li><a href='/erp/stock/importcheck'>입고 수정 및 확정</a></li>");
		} else if (fList.size() == 2) {
			if (fList.get(0).equals("구매관리")) {
				sb.append("<li><a href='/erp/stock/importcheck'>입고 수정 및 확정</a></li>");
				sb.append("<li><a href='/erp/stock/addexportlist'>출고 확정</a></li>");
			} else if (fList.get(fList.size() - 1).equals("영업관리")) {
				sb.append("<li><a href='/erp/stock/addimportlist'>입고 확정</a></li>");
				sb.append("<li><a href='/erp/stock/exportstocklist'>출고 확정</a></li>");
			}
		}else if(fList.size()==1){
			sb.append("<li><a href='/erp/stock/addimportlist'>입고 확정</a></li>");
			sb.append("<li><a href='/erp/stock/addexportlist'>출고 확정</a></li>");
		}

		return sb.toString();
	}

}
