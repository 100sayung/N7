package com.n7.erp.controller;

import java.util.List;
import java.util.Map;

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

	// 遺��꽌 愿�由� �럹�씠吏�
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

	@RequestMapping(value = "/jusopopup", method = RequestMethod.GET)
	public String jusoPopUp() {
		return "/home/jusopopup";
	}

	@RequestMapping(value = "/home/erpboard", method = RequestMethod.GET)
	public ModelAndView erpBoard(Integer pageNum) {
		mav = cbm.moveBoardList(pageNum);
		return mav;
	}

	/*
	 * @RequestMapping(value = "/home/boardSearch", method = RequestMethod.POST)
	 * public Map<String, List<ConsultingBoard>> boardSearch(String choice, String
	 * keyword, Integer pageNum) { Map<String,
	 * List<ConsultingBoard>>bMap=cbm.boardSearch(choice, keyword, pageNum); return
	 * bMap; }
	 */

	@RequestMapping(value = "/home/comInfo", method = RequestMethod.GET)
	public String comInfo() {
		return "/home/comInfo";
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

	@GetMapping(value = "/welcome")
	public String welcome() {
		System.out.println("ㅇㅇ");
		return "/home/welcomepage";
	}

	@RequestMapping(value = "/erpapply", method = RequestMethod.GET)
	public String erpApply() {
		return "/home/erpapply";
	}

	@GetMapping(value = "/adminpage")
	public String moveAdminPage(HttpSession session) {
		if (mm.checkGrade(session).equals("2")) {
			return "/home/adminpage";
		}
		return "redirect:/";
	}

	@GetMapping(value = "/companymanager")
	public String moveCompanyManager(HttpSession session) {
		if (mm.checkGrade(session).equals("2")) {
			return "/home/companymanager";
		}
		return "redirect:/";
	}

	@GetMapping(value = "/membermanager")
	public String moveMemberManager(HttpSession session) {
		if (mm.checkGrade(session).equals("2")) {
			return "/home/membermanager";
		}
		return "redirect:/";
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
		cm.registNewERP(com);
		return "/home/home";
	}

	@PostMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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

	// 野껊슣�뻻疫뀐옙 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗
	@RequestMapping(value = "/home/writeFrm", method = RequestMethod.GET)
	public String write() {
		return "/home/writeFrm";
	}

	@RequestMapping(value = "/home/boardContents", method = RequestMethod.GET)
	public ModelAndView boardContents(int CB_NUM) {
		System.out.println("CB_NUM=" + CB_NUM);
		mav = cbm.boardContents(CB_NUM);
		return mav;
	}

	@RequestMapping(value = "/home/findid", method = RequestMethod.POST)
	public ResponseEntity<String> findID(String userEmail) {
		return mm.findId(userEmail);
	}

	@RequestMapping(value = "/home/sendauthenticationnum", method = RequestMethod.POST)
	public ResponseEntity<String> sendAuthenticationNum(String userEmail, int authenticationNum,String type) {
		return mm.sendAuthenticationNum(userEmail, authenticationNum,type);
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

	@RequestMapping(value = "/home/jusopopup", method = RequestMethod.GET)
	public String jusoPopUp(String userPassword, String userId) {
		return "home/jusopopup";
	}

}
