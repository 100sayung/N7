package com.n7.erp.controller;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.n7.erp.bean.Company;
import com.n7.erp.bean.ConsultingBoard;
import com.n7.erp.bean.Member;
import com.n7.erp.service.CompanyMM;
import com.n7.erp.service.ConsultingBoardMM;
import com.n7.erp.service.MemberMM;
import com.n7.erp.userClass.PagingVO;

//���� �̵�����
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	ModelAndView mav;

	@Autowired
	private MemberMM mm;
	@Autowired
	private ConsultingBoardMM cbm;
	@Autowired
	private CompanyMM cm;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "/home/home";
	}
	
	//부서관리 페이지
	@RequestMapping(value = "/managermode/erpmanage", method = RequestMethod.GET)
	public String erpmanage() {
		
		return "/managermode/erpmanage";
	}
	
	@RequestMapping(value = "/managermode/managermode", method = RequestMethod.GET)
	public String managermode() {

		return "/managermode/managermode";
	}

	@RequestMapping(value = "/managermode/Company", method = RequestMethod.GET)
	public String Company() {

		return "/managermode/Company";
	}

	@RequestMapping(value = "/introducecompany", method = RequestMethod.GET)
	public String introduceCompany() {
		return "/home/introducecompany";
	}

	@RequestMapping(value = "/home/erpboard", method = RequestMethod.GET)
	public ModelAndView erpBoard() {
		logger.info("");
		mav = cbm.moveBoardList();
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/home/login";
	}

	@RequestMapping(value = "/findidfrm", method = RequestMethod.GET)
	public String findIdFrm() {
		return "/home/findidfrm";
	}

	@RequestMapping(value = "/findpasswordfrm", method = RequestMethod.GET)
	public String findPasswordFrm() {
		return "/home/findpasswordfrm";
	}

	@RequestMapping(value = "/joinpage", method = RequestMethod.GET)
	public String join() {
		return "/home/join";
	}

	@RequestMapping(value = "/erpapply", method = RequestMethod.GET)
	public String erpApply() {
		return "/home/erpapply";
	}

	@GetMapping(value = "/adminpage")
	public String moveAdminPage() {
		return "/home/adminpage";
	}

	@GetMapping(value = "/companymanager")
	public String moveCompanyManager() {
		return "/home/companymanager";
	}

	@GetMapping(value = "/membermanager")
	public String moveMemberManager() {
		return "/home/membermanager";
	}

	@GetMapping(value = "/findid")
	public String findId() {
		return "/home/findid";
	}

	@GetMapping(value = "/findpassword")
	public String findPassword() {
		return "/home/findpassword";
	}

	@PostMapping(value = "/access")
	public ModelAndView access(Member mb, HttpSession session) {
		mav = mm.access(mb, session);
		return mav;
	}

	@PostMapping(value = "/join")
	public ModelAndView join(MultipartHttpServletRequest multi) {
		mav = mm.join(multi);
		return mav;
	}

	@PostMapping(value = "/newerp")
	public String registNewERP(Company com) {
		cm.registNewERP(com); //����� temp���� �Ұ���.
		return "/home/home";
	}

	@PostMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/home/home";
	}

	@GetMapping(value = "/main")
	public String main() {
		return "/myInfo/myInfo";
	}

	@GetMapping(value = "/myInfo/myInfo")
	public ModelAndView myinfoMain(HttpSession session) {
		mav = mm.moveMyInfo(session);
		return mav;
	}
	// �Խñ� �������� �̵�
	@RequestMapping(value = "/writeFrm", method = RequestMethod.GET)
	public String write() {
		return "writeFrm";
	}

	// �Խñ� �ۼ�
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	public ModelAndView writeBoard(ConsultingBoard board) {
		mav = cbm.writeBoard(board);
		return mav;
	}

	// �Խñ� ����
	@RequestMapping(value = "/boardmodify", method = RequestMethod.POST)
	public ModelAndView boardmodify(ConsultingBoard board) {
		mav = cbm.boardmodify(board);
		return mav;
	}

	// �Խñ� ������������ �̵�
	@RequestMapping(value = "/boardmodifyajax", method = RequestMethod.POST)
	public @ResponseBody String boardmodifyajax(Integer num) {
		String result = cbm.boardmodifyajax(num);
		return result;
	}

	// �Խñ� ����
	@RequestMapping(value = "/writelistdelete", method = RequestMethod.POST)
	public ModelAndView writelistdelete(Integer num) {
		mav = cbm.writelistdelete(num);
		return mav;
	}

	@RequestMapping(value = "/home/findid", method = RequestMethod.POST)
	public ResponseEntity<String> findID(String userEmail) {
		return mm.findId(userEmail);
	}

	@RequestMapping(value = "/home/sendauthenticationnum", method = RequestMethod.POST)
	public ResponseEntity<String> sendAuthenticationNum(String userEmail, int authenticationNum) {
		return mm.sendAuthenticationNum(userEmail, authenticationNum);
	}

	@RequestMapping(value = "/home/findpassword", method = RequestMethod.POST)
	public ResponseEntity<String> findPassword(String userEmail, String userId) {
		return mm.findPassword(userEmail, userId);
	}

	@RequestMapping(value = "/home/modifypasswordfrm", method = RequestMethod.GET)
	public ModelAndView modifyPasswordFrm(String userId) {
		mav = mm.modifyPasswordFrm(userId);
		return mav;
	}

	@RequestMapping(value = "/home/modifypassword", method = RequestMethod.POST)
	public ResponseEntity<String> modifyPassword(String userPassword, String userId) {
		return mm.modifyPassword(userPassword, userId);
	}
	
	
	
	
}
