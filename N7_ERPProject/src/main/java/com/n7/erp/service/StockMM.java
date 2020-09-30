package com.n7.erp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.MultiValueMap;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.n7.erp.bean.B_shipment;
import com.n7.erp.bean.Category;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ItemCode;
import com.n7.erp.bean.ps.Purchase;
import com.n7.erp.dao.CategoryDao;
import com.n7.erp.dao.IeportDao;
import com.n7.erp.dao.ItemCodeDao;
import com.n7.erp.dao.PurchaseDao;

@Service
public class StockMM {

	ModelAndView mav;

	@Autowired
	CategoryDao ctDao;

	@Autowired
	ItemCodeDao itDao;

	@Autowired
	IeportDao ieDao;

	@Autowired
	PurchaseDao pDao;

	// 카테고리 입력 및 출력
	public ResponseEntity<String> categoryCofirm(Category ct, HttpSession session) {
		ct.setCt_cpcode(session.getAttribute("cCode").toString());
		if (ctDao.categoryCofirm(ct)) {
			return ResponseEntity.ok(new Gson().toJson(ctDao.getCategory(session.getAttribute("cCode").toString())));
		} else {
			return ResponseEntity.status(304).body("분류명 추가에 실패하였습니다. 다시 시도해주세요!");
		}
	}

	// 카테고리 출력
	public ResponseEntity<List<Category>> getCategory(Category ct, HttpSession session) {
		return ResponseEntity.ok(ctDao.getCategory(session.getAttribute("cCode").toString()));
	}

	// 카테고리 수정
	public ResponseEntity<String> modifyCategory(Category ct, HttpSession session) {
		ct.setCt_cpcode(session.getAttribute("cCode").toString());
		if (ctDao.modifyCategory(ct)) {
			return ResponseEntity.ok(new Gson().toJson(ctDao.getCategory(session.getAttribute("cCode").toString())));
		} else {
			return ResponseEntity.status(304).body("분류명 수정에 실패하였습니다. 다시 시도해주세요!");
		}
	}

	// 카테고리 삭제
	public ResponseEntity<String> deleteCategory(Category ct, HttpSession session) {
		ct.setCt_cpcode(session.getAttribute("cCode").toString());
		if (ctDao.deleteCategory(ct)) {
			return ResponseEntity.ok(new Gson().toJson(ctDao.getCategory(session.getAttribute("cCode").toString())));
		} else {
			return ResponseEntity.status(304).body("분류명 삭제에 실패하였습니다. 재고 현황에 해당 분류를 가진 재고가 존재합니다. 재고를 먼저 삭제해주세요!");
		}
	}

	// 품목코드 출력
	public ResponseEntity<List<ItemCode>> getItemCode(ItemCode it, HttpSession session) {
		if (it.getIt_ccode() == null) {
			return ResponseEntity.ok(itDao.getItemCode(session.getAttribute("cCode").toString()));
		} else {
			return ResponseEntity
					.ok(itDao.getItemCodeFromItemCCode(it.getIt_ccode(), session.getAttribute("cCode").toString()));
		}
	}

	public ResponseEntity<String> getCt(Category ct, HttpSession session) {
		System.out.println(session.getAttribute("cCode").toString());
		ct.setCt_cpcode(session.getAttribute("cCode").toString());
		if (ct.getCt_code() != null) {
			return ResponseEntity.ok(ctDao.getCtName(ct));
		} else {
			return ResponseEntity.ok(ctDao.getCtCode(ct));
		}
	}

	public ResponseEntity<String> itemCodeConfirm(ItemCode it, HttpSession session) {
		it.setIt_cpcode(session.getAttribute("cCode").toString());
		return setResponseEntity(itDao.itemCodeCofirm(it), "품목코드 추가에 실패하였습니다. 다시 시도해주세요", session);
	}

	public ResponseEntity<String> modifyItemCode(ItemCode it, HttpSession session) {
		it.setIt_cpcode(session.getAttribute("cCode").toString());
		return setResponseEntity(itDao.modifyItemCode(it), "품목코드 수정에 실패하였습니다. 다시 시도해주세요!", session);
	}

	public ResponseEntity<String> deleteItemCode(ItemCode it, HttpSession session) {
		it.setIt_cpcode(session.getAttribute("cCode").toString());
		try {
			return setResponseEntity(itDao.deleteItemCode(it),
					"품목코드 삭제에 실패하였습니다. 재고 현황에 해당 품목코드를 가진 재고가 존재합니다. 재고를 먼저 삭제해주세요!", session);
		} catch (Exception e) {
			return setResponseEntity(itDao.deleteItemCode(it),
					"품목코드 삭제에 실패하였습니다. 재고 현황에 해당 품목코드를 가진 재고가 존재합니다. 재고를 먼저 삭제해주세요!", session);
		}
	}

	public ItemCode setItemCode(MultiValueMap<String, String> formData, ItemCode it) {
		String it_ccode = (formData.getFirst("it_ccode") == null) ? "" : formData.getFirst("it_ccode");
		it.setIt_ccode(it_ccode);
		String it_code = (formData.getFirst("it_ccode") == null) ? formData.getFirst("it_code")
				: it_ccode + "-" + formData.getFirst("it_code");
		it.setIt_code(it_code);
		return it.setIt_pname(formData.getFirst("it_pname"))
				.setIt_pstock(Integer.parseInt(formData.getFirst("it_pstock"))).setIt_size(formData.getFirst("it_size"))
				.setIt_unit(formData.getFirst("it_unit"));
	}

	public ResponseEntity<String> setResponseEntity(boolean flag, String msg, HttpSession session) {
		if (flag) {
			return ResponseEntity.ok(new Gson().toJson(itDao.getItemCode(session.getAttribute("cCode").toString())));
		} else {
			return ResponseEntity.status(304).body(msg);
		}
	}

	public ModelAndView importCheck(HttpSession session) {

		mav = new ModelAndView();
		List<Purchase> ipList = ieDao.importCheckList(session.getAttribute("cCode").toString());
		mav.addObject("importCheckList", makeImportCheckHtml(ipList));
		System.out.println("importCheckList=" + makeImportCheckHtml(ipList));
		mav.setViewName("stock/importcheck");
		return mav;
	}

	private String makeImportCheckHtml(List<Purchase> ipList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < ipList.size(); i++) {
			if ((ipList.size() - 1) != i && i >= 1) {
				if (!(ipList.get(i).getP_clcode().equals(ipList.get(i - 1).getP_clcode()))) {
					sb.append(
							"<form id = 'frm" + i + "'><table><caption>" + ipList.get(i).getP_clcode() + "</caption>");
					sb.append("<tr><td colspan='8'><input class='check' type='checkbox'></td></tr>");
					sb.append(
							"<tr><td>품명</td><td>제품코드</td><td>규격</td><td>단위</td><td>수량</td><td>단가</td><td>금액</td><td>기타</td></tr>");
				}
				sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
						+ ipList.get(i).getP_clcode() + "'></td>");
				sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
						+ "' readonly></td>");
				sb.append("<td><input type='text' value='" + ipList.get(i).getIt_size() + "' readonly></td>");
				sb.append("<td><input type='text' value='" + ipList.get(i).getIt_unit() + "' readonly></td>");
				sb.append("<td><input id='p_amount" + ipList.get(i).getP_documentcode() + "' onclick='modifySum(\""
						+ ipList.get(i).getP_documentcode() + "\")' name='ie_qty' type='number' value='"
						+ ipList.get(i).getP_amount() + "'>");
				sb.append("<input type='hidden' value='" + ipList.get(i).getP_amount() + "'></td>");
				sb.append("<td id='p_unlit" + ipList.get(i).getP_documentcode() + "'><input type='number' value='"
						+ ipList.get(i).getP_unlit() + "' readonly></td>");
				sb.append("<td id='p_sum" + ipList.get(i).getP_documentcode()
						+ "'><input name='ie_price' type='number' value='"
						+ (ipList.get(i).getP_unlit() * ipList.get(i).getP_amount()) + "' readonly></td>");
				sb.append("<td><input type='text' name = 'ie_etc'>");
				sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getO_code() + "'></td>");
				if (!(ipList.get(i).getP_clcode().equals(ipList.get(i + 1).getP_clcode()))) {
					sb.append("</tr></table></form>");
				} else {
					sb.append("</tr>");
				}
			} else if (i == 0) {
				sb.append("<form id = 'frm" + i + "'><table><caption>" + ipList.get(i).getP_clcode() + "</caption>");
				sb.append("<tr><td colspan='8'><input class='check' type='checkbox'></td></tr>");
				sb.append(
						"<tr><td>품명</td><td>제품코드</td><td>규격</td><td>단위</td><td>수량</td><td>단가</td><td>금액</td><td>기타</td></tr>");
				if (ipList.size() != 1) {
					sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
							+ ipList.get(i).getP_clcode() + "'></td>");
					sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
							+ "' readonly></td>");
					sb.append("<td><input type='text' value='" + ipList.get(i).getIt_size() + "' readonly></td>");
					sb.append("<td><input type='text' value='" + ipList.get(i).getIt_unit() + "' readonly></td>");
					sb.append("<td><input id='p_amount" + ipList.get(i).getP_documentcode() + "' onclick='modifySum(\""
							+ ipList.get(i).getP_documentcode() + "\")' name='ie_qty' type='number' value='"
							+ ipList.get(i).getP_amount() + "'>");
					sb.append("<input type='hidden' value='" + ipList.get(i).getP_amount() + "'></td>");
					sb.append("<td id='p_unlit" + ipList.get(i).getP_productnum() + "'><input type='number' value='"
							+ ipList.get(i).getP_unlit() + "' readonly></td>");
					sb.append("<td id='p_sum" + ipList.get(i).getP_documentcode()
							+ "'><input name='ie_price' type='number' value='"
							+ (ipList.get(i).getP_unlit() * ipList.get(i).getP_amount()) + "' readonly></td>");
					sb.append("<td><input type='text' name = 'ie_etc'>");
					sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getO_code() + "'></td>");
					if (!(ipList.get(i).getP_clcode().equals(ipList.get(i + 1).getP_clcode()))) {
						sb.append("</tr></table></form>");
					} else {
						sb.append("</tr>");
					}
				} else {
					sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
							+ ipList.get(i).getP_clcode() + "'></td>");
					sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
							+ "' readonly></td>");
					sb.append("<td><input type='text' value='" + ipList.get(i).getIt_size() + "' readonly></td>");
					sb.append("<td><input type='text' value='" + ipList.get(i).getIt_unit() + "' readonly></td>");
					sb.append("<td><input id='p_amount" + ipList.get(i).getP_documentcode() + "' onclick='modifySum(\""
							+ ipList.get(i).getP_documentcode() + "\")' name='ie_qty' type='number' value='"
							+ ipList.get(i).getP_amount() + "'>");
					sb.append("<input type='hidden' value='" + ipList.get(i).getP_amount() + "'></td>");
					sb.append("<td id='p_unlit" + ipList.get(i).getP_documentcode() + "'><input type='number' value='"
							+ ipList.get(i).getP_unlit() + "' readonly></td>");
					sb.append("<td id='p_sum" + ipList.get(i).getP_documentcode()
							+ "'><input name='ie_price' type='number' value='"
							+ (ipList.get(i).getP_unlit() * ipList.get(i).getP_amount()) + "' readonly></td>");
					sb.append("<td><input type='text' name = 'ie_etc'>");
					sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getO_code() + "'></td>");
					sb.append("</tr></table></form>");
				}
			} else {
				if (!(ipList.get(i).getP_clcode().equals(ipList.get(i - 1).getP_clcode()))) {
					sb.append(
							"<form id = 'frm" + i + "'><table><caption>" + ipList.get(i).getP_clcode() + "</caption>");
					sb.append("<tr><td colspan='8'><input class='check' type='checkbox'></td></tr>");
					sb.append(
							"<tr><td>품명</td><td>제품코드</td><td>규격</td><td>단위</td><td>수량</td><td>단가</td><td>금액</td><td>기타</td></tr>");
				}
				sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
						+ ipList.get(i).getP_clcode() + "'></td>");
				sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
						+ "' readonly></td>");
				sb.append("<td><input type='text' value='" + ipList.get(i).getIt_size() + "' readonly></td>");
				sb.append("<td><input type='text' value='" + ipList.get(i).getIt_unit() + "' readonly></td>");
				sb.append("<td><input id='p_amount" + ipList.get(i).getP_documentcode() + "' onclick='modifySum(\""
						+ ipList.get(i).getP_documentcode() + "\")' name='ie_qty' type='number' value='"
						+ ipList.get(i).getP_amount() + "'>");
				sb.append("<input type='hidden' value='" + ipList.get(i).getP_amount() + "'></td>");
				sb.append("<td id='p_unlit" + ipList.get(i).getP_documentcode() + "'><input type='number' value='"
						+ ipList.get(i).getP_unlit() + "' readonly></td>");
				sb.append("<td id='p_sum" + ipList.get(i).getP_documentcode()
						+ "'><input name='ie_price' type='number' value='"
						+ (ipList.get(i).getP_unlit() * ipList.get(i).getP_amount()) + "' readonly></td>");
				sb.append("<td><input type='text' name = 'ie_etc'>");
				sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getO_code() + "'></td>");
				sb.append("</tr></table></form>");
			}
		}
		return sb.toString();
	}

	@Transactional
	public ResponseEntity<String> cofirmImportCheck(String ipList, HttpSession session) {

		ipList = ipList.replace("},", "} ");
		String[] arr = ipList.split(" ");
		List<IePort> imList = new ArrayList<IePort>();
		boolean a = false, b = false;
		for (int i = 0; i < arr.length; i++) {
			imList.add(new Gson().fromJson(arr[i], IePort.class));
		}
		for (int i = 0; i < imList.size(); i++) {
			IePort ip = new IePort();
			ip = imList.get(i);
			ip.setIe_cpcode(session.getAttribute("cCode").toString());
			ip.setIe_hrcode(session.getAttribute("hrCode").toString());
			a = pDao.updatePurchase(imList.get(i));
			b = ieDao.insertImport(imList.get(i));
		}
		if (a && b) {
			List<Purchase> pList = ieDao.importCheckList(session.getAttribute("cCode").toString());
			return ResponseEntity.ok(makeImportCheckHtml(pList));
		}
		return ResponseEntity.ok(new Gson().toJson("입고 확정에 실패하였습니다."));
	}

	public ResponseEntity<String> getImportList(String ie_status, String date1, String date2, HttpSession session) {
		ArrayList<IePort> ip = null;
		if (ie_status != null) {
			if (ie_status.equals("") && date1 == null && date2 == null) {
				ip = ieDao.getImportList(session.getAttribute("cCode").toString());
			} else if ((ie_status.equals("")) && date1 != null && date2 != null) {
				Map<String, String> dMap = new HashMap<String, String>();
				dMap.put("date1", date1);
				dMap.put("date2", date2);
				dMap.put("cCode", session.getAttribute("cCode").toString());
				ip = ieDao.getImportDateList(dMap);
			} else if (!(ie_status.equals("")) && date1 == null && date2 == null) {
				ip = ieDao.getImportIeList(ie_status, session.getAttribute("cCode").toString());
			} else {
				Map<String, Object> iMap = new HashMap<String, Object>();
				iMap.put("ie_status", ie_status);
				iMap.put("date1", date1);
				iMap.put("date2", date2);
				iMap.put("cCode", session.getAttribute("cCode").toString());
				ip = ieDao.getImportDateCheckList(iMap);
			}
		} else {
			ip = ieDao.getImportList(session.getAttribute("cCode").toString());
		}
		return ResponseEntity.ok(new Gson().toJson(ip));
	}

	public ResponseEntity<String> getByItemDealList(ItemCode it, HttpSession session) {
		if (it.getIt_ccode() != null) {
			return ResponseEntity.ok(new Gson().toJson(
					ieDao.getByItemDealListFromItCcode(it.getIt_ccode(), session.getAttribute("cCode").toString())));
		} else {
			return ResponseEntity.ok(new Gson()
					.toJson(ieDao.getByItemDealList(it.getIt_code(), session.getAttribute("cCode").toString())));
		}
	}

	public ResponseEntity<String> getByItemStockList(ItemCode it, HttpSession session) {
		if (it == null) {
			return ResponseEntity.ok(new Gson().toJson(ieDao.getStockList(session.getAttribute("cCode").toString())));
		}
		return ResponseEntity.ok(
				new Gson().toJson(ieDao.getByItemStockList(it.getIt_code(), session.getAttribute("cCode").toString())));
	}

	public ResponseEntity<String> getMonthPayment(String date1, String date2, HttpSession session) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("date1", date1);
		hMap.put("date2", date2);
		hMap.put("cCode", session.getAttribute("cCode").toString());
		List<IePort> ieList = ieDao.getMonthPayment(hMap);
		List<IePort> ieList2 = ieDao.getByItemStockListAll(date1, session.getAttribute("cCode").toString());
		return ResponseEntity.ok(makeHtml(ieList, ieList2));
	}

	private String makeHtml(List<IePort> ieList, List<IePort> ieList2) {
		StringBuilder sb = new StringBuilder();
		System.out.println("ieListSize=" + ieList.size());
		System.out.println("ieList2Size=" + ieList2.size());
		int a = 0;
		sb.append("<table><tr><td>품목코드</td><td>기초재고</td><td>입고</td><td>출고</td><td>반품</td><td>현재고</td></tr>");
		if (ieList.size() == 0 && ieList2.size() == 0) {
			sb = new StringBuilder();
			sb.append("</table><span>결과가 존재하지 않습니다.</span>");
			return sb.toString();
		} else if (ieList.size() == 0 && ieList2.size() != 0) {
			for (int i = 0; i < ieList2.size(); i++) {
				sb.append("<tr><td>" + ieList2.get(i).getIe_itcode() + "</td>");
				sb.append("<td>" + ieList2.get(i).getIe_qty() + "</td>");
				sb.append("<td>0</td><td>0</td><td>0</td>");
				sb.append("<td>" + ieList2.get(i).getIe_qty() + "</td><tr>");
			}
		} else {
			for (int i = 0; i < ieList.size();) {
				if (ieList.size() - 3 >= i) {
					if (ieList.get(i).getIe_itcode().equals(ieList.get(i + 1).getIe_itcode())) {
						if (ieList.get(i + 1).getIe_status().equals("2")) {
							if (ieList.get(i + 1).getIe_itcode().equals(ieList.get(i + 2).getIe_itcode())) {
								if (ieList.get(i + 2).getIe_status().equals("3")) {
									sb.append("<td>" + ieList.get(i).getIe_itcode() + "</td>");
									if (ieList2.size() < a + 1 || ieList2.size() == 0) {
										sb.append("<td>0</td>");
									} else {
										sb.append("<td>" + ieList2.get(a).getIe_qty() + "</td>");

									}
									sb.append("<td>" + ieList.get(i).getIe_qty() + "</td>");
									sb.append("<td>" + Math.abs(ieList.get(i + 1).getIe_qty()) + "</td>");
									sb.append("<td>" + Math.abs(ieList.get(i + 2).getIe_qty()) + "</td>");
									if (ieList2.size() < a + 1 || ieList2.size() == 0) {
										sb.append(
												"<td>" + (0 + ieList.get(i).getIe_qty() + ieList.get(i + 1).getIe_qty()
														+ ieList.get(i + 2).getIe_qty()) + "</td></tr>");
									} else {
										sb.append("<td>"
												+ (ieList2.get(a).getIe_qty() + ieList.get(i).getIe_qty()
														+ ieList.get(i + 1).getIe_qty() + ieList.get(i + 2).getIe_qty())
												+ "</td></tr>");
										a++;
									}
									i += 3;
								}
							} else {
								sb.append("<tr><td>" + ieList.get(i).getIe_itcode() + "</td>");
								if (ieList2.size() < a + 1 || ieList2.size() == 0) {
									sb.append("<td>0</td>");
								} else {
									sb.append("<td>" + ieList2.get(a).getIe_qty() + "</td>");

								}
								sb.append("<td>" + ieList.get(i).getIe_qty() + "</td>");
								sb.append("<td>" + Math.abs(ieList.get(i + 1).getIe_qty()) + "</td>");
								sb.append("<td>0</td>");
								if (ieList2.size() < a + 1 || ieList2.size() == 0) {
									sb.append("<td>" + (ieList.get(i).getIe_qty() + ieList.get(i + 1).getIe_qty())
											+ "</td></tr>");
								} else {
									sb.append("<td>" + ieList2.get(a).getIe_qty() + ieList.get(i).getIe_qty()
											+ ieList.get(i + 1).getIe_qty() + "</td></tr>");
									a++;
								}
								i += 2;

							}
						} else {
							sb.append("<tr><td>" + ieList.get(i).getIe_itcode() + "</td>");
							if (ieList2.size() < a + 1 || ieList2.size() == 0) {
								sb.append("<td>0</td>");
							} else {
								sb.append("<td>" + ieList2.get(a).getIe_qty() + "</td>");
							}
							sb.append("<td>" + ieList.get(i).getIe_qty() + "</td>");
							sb.append("<td>0</td>");
							sb.append("<td>" + Math.abs(ieList.get(i + 1).getIe_qty()) + "</td>");
							if (ieList2.size() < a + 1 || ieList2.size() == 0) {
								sb.append("<td>" + (ieList.get(i).getIe_qty() + ieList.get(i + 1).getIe_qty())
										+ "</td></tr>");
							} else {
								sb.append("<td>" + (ieList2.get(a).getIe_qty() + ieList.get(i).getIe_qty()
										+ ieList.get(i + 1).getIe_qty()) + "</td></tr>");
								a++;
							}
							i += 2;
						}
					} else {
						sb.append("<tr><td>" + ieList.get(i).getIe_itcode() + "</td>");
						if (ieList2.size() < a + 1 || ieList2.size() == 0) {
							sb.append("<td>0</td>");
						} else {
							sb.append("<td>" + ieList2.get(a).getIe_qty() + "</td>");
						}
						sb.append("<td>" + ieList.get(i).getIe_qty() + "</td>");
						sb.append("<td>0</td>");
						sb.append("<td>0</td>");
						if (ieList2.size() < a + 1 || ieList2.size() == 0) {
							sb.append("<td>" + ieList.get(i).getIe_qty() + "</td></tr>");
						} else {
							sb.append("<td>" + (ieList2.get(a).getIe_qty() + ieList.get(i).getIe_qty()) + "</td></tr>");
							a++;
						}
						i += 1;
					}
				} else if (ieList.size() - 2 >= i) {
					if (ieList.get(i).getIe_itcode().equals(ieList.get(i + 1).getIe_itcode())) {
						if (ieList.get(i + 1).getIe_status().equals("2")) {
							sb.append("<tr><td>" + ieList.get(i).getIe_itcode() + "</td>");
							if (ieList2.size() < a + 1 || ieList2.size() == 0) {
								sb.append("<td>0</td>");
							} else {
								sb.append("<td>" + ieList2.get(a).getIe_qty() + "</td>");
							}
							sb.append("<td>" + ieList.get(i).getIe_qty() + "</td>");
							sb.append("<td>" + Math.abs(ieList.get(i + 1).getIe_qty()) + "</td>");
							sb.append("<td>0</td>");
							if (ieList2.size() < a + 1 || ieList2.size() == 0) {
								sb.append("<td>" + (ieList.get(i).getIe_qty() + ieList.get(i + 1).getIe_qty())
										+ "</td></tr>");
							} else {
								sb.append("<td>" + (ieList2.get(a).getIe_qty() + ieList.get(i).getIe_qty()
										+ ieList.get(i + 1).getIe_qty()) + "</td></tr>");
								a++;
							}
							i += 2;
						} else {
							sb.append("<tr><td>" + ieList.get(i).getIe_itcode() + "</td>");
							if (ieList2.size() < a + 1 || ieList2.size() == 0) {
								sb.append("<td>0</td>");
							} else {
								sb.append("<td>" + ieList2.get(a).getIe_qty() + "</td>");
							}
							sb.append("<td>" + ieList.get(i).getIe_qty() + "</td>");
							sb.append("<td>0</td>");
							sb.append("<td>" + Math.abs(ieList.get(i + 1).getIe_qty()) + "</td>");
							if (ieList2.size() < a + 1 || ieList2.size() == 0) {
								sb.append("<td>" + (ieList.get(i).getIe_qty() + ieList.get(i + 1).getIe_qty())
										+ "</td></tr>");
							} else {
								sb.append("<td>" + (ieList2.get(a).getIe_qty() + ieList.get(i + 1).getIe_qty()
										+ ieList.get(i).getIe_qty()) + "</td></tr>");
								a++;
							}
							i += 2;
						}
					}
				} else if (i == ieList.size() - 1) {
					sb.append("<tr><td>" + ieList.get(i).getIe_itcode() + "</td>");
					if (ieList2.size() < a + 1 || ieList2.size() == 0) {
						sb.append("<td>0</td>");
					} else {
						sb.append("<td>" + ieList2.get(a).getIe_qty() + "</td>");
					}
					sb.append("<td>" + ieList.get(i).getIe_qty() + "</td>");
					sb.append("<td>0</td>");
					sb.append("<td>0</td></tr>");
					if (ieList2.size() < a + 1 || ieList2.size() == 0) {
						sb.append("<td>" + ieList.get(i).getIe_qty() + "</td></tr>");
					} else {
						sb.append("<td>" + (ieList2.get(a).getIe_qty() + ieList.get(i).getIe_qty()) + "</td></tr>");
						a++;
					}
					i += 1;
				}
			}
		}
		sb.append("</table>");
		return sb.toString();
	}

	public ModelAndView exportStockCheck(HttpSession session) {
		mav = new ModelAndView();
		List<B_shipment> ipList = ieDao.exportCheckList(session.getAttribute("cCode").toString());
		for (int i = 0; i < ipList.size(); i++) {
			ItemCode it = itDao.getPname(session.getAttribute("cCode").toString(), ipList.get(i).getBs_itcode());
			ipList.get(i).setIt_ccode(it.getIt_ccode()).setIt_code(it.getIt_code()).setIt_pname(it.getIt_pname())
					.setIt_pstock(it.getIt_pstock()).setIt_size(it.getIt_size()).setIt_unit(it.getIt_unit())
					.setBs_ccode(session.getAttribute("cCode").toString());
		}
		mav.addObject("exportStockCheck", makeExportCheckHtml(ipList));
		mav.setViewName("stock/exportstockcheck");
		return mav;
	}

	private String makeExportCheckHtml(List<B_shipment> ipList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < ipList.size(); i++) {
			if ((ipList.size() - 1) != i && i >= 1) {
				if (!(ipList.get(i).getBs_clcode().equals(ipList.get(i - 1).getBs_clcode()))) {
					sb.append(
							"<form id = 'frm" + i + "'><table><caption>" + ipList.get(i).getBs_clcode() + "</caption>");
					sb.append("<tr><td colspan='8'><input class='check' type='checkbox'></td></tr>");
					sb.append(
							"<tr><td>품명</td><td>제품코드</td><td>규격</td><td>단위</td><td>수량</td><td>단가</td><td>금액</td><td>기타</td></tr>");
				}
				sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
						+ ipList.get(i).getBs_clcode() + "'></td>");
				sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
						+ "' readonly></td>");
				sb.append("<td>ipList.get(i).getIt_size()</td>");
				sb.append("<td>" + ipList.get(i).getIt_unit() + "</td>");
				sb.append(
						"<td><input name='ie_qty' type='number' value='" + ipList.get(i).getBs_quantity() + "'></td>");
				sb.append("<td ><input type='number' value='" + ipList.get(i).getBs_unit() + "' readonly></td>");
				sb.append("<td><input name='ie_price' type='number' value='"
						+ (ipList.get(i).getBs_quantity() * ipList.get(i).getBs_unit()) + "' readonly></td>");
				sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getBs_docunum() + "'></td>");
				if (!(ipList.get(i).getBs_clcode().equals(ipList.get(i + 1).getBs_clcode()))) {
					sb.append("</tr></table></form>");
				} else {
					sb.append("</tr>");
				}
			} else if (i == 0) {
				sb.append("<form id = 'frm" + i + "'><table><caption>" + ipList.get(i).getBs_clcode() + "</caption>");
				sb.append("<tr><td colspan='8'><input class='check' type='checkbox'></td></tr>");
				sb.append(
						"<tr><td>품명</td><td>제품코드</td><td>규격</td><td>단위</td><td>수량</td><td>단가</td><td>금액</td><td>기타</td></tr>");
				if (ipList.size() != 1) {
					sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
							+ ipList.get(i).getBs_clcode() + "'></td>");
					sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
							+ "' readonly></td>");
					sb.append("<td>" + ipList.get(i).getIt_size() + "</td>");
					sb.append("<td>" + ipList.get(i).getIt_unit() + "</td>");
					sb.append("<td><input type='number' name='ie_qty' value='" + ipList.get(i).getBs_quantity()
							+ "'></td>");
					sb.append("<td>" + ipList.get(i).getBs_unit() + "' readonly></td>");
					sb.append("<td" + "'><input name='ie_price' type='number' value='"
							+ (ipList.get(i).getBs_quantity() * ipList.get(i).getBs_unit()) + "' readonly></td>");
					sb.append("<td><input type='text' name = 'ie_etc'>");
					sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getBs_docunum()
							+ "'></td>");
					if (!(ipList.get(i).getBs_clcode().equals(ipList.get(i + 1).getBs_clcode()))) {
						sb.append("</tr></table></form>");
					} else {
						sb.append("</tr>");
					}
				} else {
					sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
							+ ipList.get(i).getBs_clcode() + "'></td>");
					sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
							+ "' readonly></td>");
					sb.append("<td><input type='text' value='" + ipList.get(i).getIt_size() + "' readonly></td>");
					sb.append("<td><input type='text' value='" + ipList.get(i).getIt_unit() + "' readonly></td>");
					sb.append("<td><input name='ie_qty' type='number' value='" + ipList.get(i).getBs_quantity()
							+ "'></td>");
					sb.append("<td><input type='number' value='" + ipList.get(i).getBs_unit() + "' readonly></td>");
					sb.append("<td><input name='ie_price' type='number' value='"
							+ (ipList.get(i).getBs_quantity() * ipList.get(i).getBs_unit()) + "' readonly></td>");
					sb.append("<td><input type='text' name = 'ie_etc'>");
					sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getBs_docunum()
							+ "'></td>");
					sb.append("</tr></table></form>");
				}
			} else {
				if (!(ipList.get(i).getBs_clcode().equals(ipList.get(i - 1).getBs_clcode()))) {
					sb.append(
							"<form id = 'frm" + i + "'><table><caption>" + ipList.get(i).getBs_clcode() + "</caption>");
					sb.append("<tr><td colspan='8'><input class='check' type='checkbox'></td></tr>");
					sb.append(
							"<tr><td>품명</td><td>제품코드</td><td>규격</td><td>단위</td><td>수량</td><td>단가</td><td>금액</td><td>기타</td></tr>");
				}
				sb.append("<tr><td>" + ipList.get(i).getIt_pname() + "<input type='hidden' name='ie_clcode' value='"
						+ ipList.get(i).getBs_clcode() + "'></td>");
				sb.append("<td><input type='text' name='ie_itcode' value='" + ipList.get(i).getIt_code()
						+ "' readonly></td>");
				sb.append("<td><input type='text' value='" + ipList.get(i).getIt_size() + "' readonly></td>");
				sb.append("<td><input type='text' value='" + ipList.get(i).getIt_unit() + "' readonly></td>");
				sb.append("<td><input type='number' value='" + ipList.get(i).getBs_quantity() + "'></td>");
				sb.append("<td><input name='ie_qty' type='number' value='" + ipList.get(i).getBs_unit()
						+ "' readonly></td>");
				sb.append("<td><input name='ie_price' type='number' value='"
						+ +(ipList.get(i).getBs_quantity() * ipList.get(i).getBs_unit()) + "' readonly>");
				sb.append("<input type='hidden' name = 'ie_ocode' value='" + ipList.get(i).getBs_docunum() + "'></td>");
				sb.append("</tr></table></form>");
			}
		}
		return sb.toString();
	}

	@Transactional
	public ResponseEntity<String> cofirmExportCheck(String ipList, HttpSession session) {
		ipList = ipList.replace("},", "} ");
		String[] arr = ipList.split(" ");
		List<IePort> imList = new ArrayList<IePort>();
		boolean a = false, b = false;
		for (int i = 0; i < arr.length; i++) {
			imList.add(new Gson().fromJson(arr[i], IePort.class));
		}
		for (int i = 0; i < imList.size(); i++) {
			IePort ip = new IePort();
			ip = imList.get(i);
			ip.setIe_cpcode(session.getAttribute("cCode").toString());
			ip.setIe_hrcode(session.getAttribute("hrCode").toString());
			a = ieDao.updateBshipment(ip);
			b = ieDao.insertExport(ip);
		}
		if (a && b) {
			List<B_shipment> bsList = ieDao.exportCheckList(session.getAttribute("cCode").toString());
			for (int i = 0; i < bsList.size(); i++) {
				B_shipment bs = bsList.get(i);
				bs.setBs_ccode(session.getAttribute("cCode").toString());
				ItemCode it = itDao.getPnnnname(bs);
				bsList.get(i).setIt_ccode(it.getIt_ccode()).setIt_code(it.getIt_code()).setIt_pname(it.getIt_pname())
						.setIt_pstock(it.getIt_pstock()).setIt_size(it.getIt_size()).setIt_unit(it.getIt_unit());
			}
			return ResponseEntity.ok(new Gson().toJson(makeExportCheckHtml(bsList)));
		}
		return ResponseEntity.ok(new Gson().toJson("출고 확정에 실패하였습니다."));
	}

	public ResponseEntity<String> getClcode(HttpSession session) {
		return ResponseEntity.ok(new Gson().toJson(ieDao.getClcode(session.getAttribute("cCode").toString())));
	}

	@Transactional
	public ModelAndView cofirmImport(HttpServletRequest request) {
		mav = new ModelAndView();
		for(int i = 0 ; i < request.getParameterValues("ie_itcode").length;i++) {
			IePort ie = new IePort();
			ie.setIe_clcode(request.getParameterValues("ie_clcode")[i]).setIe_cpcode(request.getSession().getAttribute("cCode").toString()).setIe_hrcode(request.getSession().getAttribute("hrCode").toString()).setIe_price(Integer.parseInt(request.getParameterValues("ie_price")[i])).setIe_qty(Integer.parseInt(request.getParameterValues("ie_qty")[i])).setIe_itcode(request.getParameterValues("ie_itcode")[i]);
			ieDao.insertImport(ie);
			int num = itDao.getItqty(ie);
			itDao.updateItqty((num+ie.getIe_qty()),request.getSession().getAttribute("cCode").toString(),ie.getIe_itcode());
		}
		mav.setViewName("stock/addimportlist");
		return mav;
	}

	public ModelAndView cofirmExport(HttpServletRequest request) {
		mav = new ModelAndView();
		for(int i = 0 ; i < request.getParameterValues("ie_itcode").length;i++) {
			IePort ie = new IePort();
			ie.setIe_clcode(request.getParameterValues("ie_clcode")[i]).setIe_cpcode(request.getSession().getAttribute("cCode").toString()).setIe_hrcode(request.getSession().getAttribute("hrCode").toString()).setIe_price(Integer.parseInt(request.getParameterValues("ie_price")[i])).setIe_qty(Integer.parseInt(request.getParameterValues("ie_qty")[i])).setIe_itcode(request.getParameterValues("ie_itcode")[i]);
			ieDao.insertExport(ie);
			int num = itDao.getItqty(ie);
			itDao.updateItqty((num-ie.getIe_qty()),request.getSession().getAttribute("cCode").toString(),ie.getIe_itcode());
		}
		mav.setViewName("stock/addexportlist");
		return mav;
	}
}