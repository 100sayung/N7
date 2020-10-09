package com.n7.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Component;

import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ItemCode;
import com.n7.erp.bean.ps.approvalLine;
import com.n7.erp.bean.ps.Order;
import com.n7.erp.bean.ps.Purchase;
import com.n7.erp.bean.ps.PurchaseApproval;
import com.n7.erp.bean.ps.Return;

@Mapper
@Component
public interface PurchaseDao {

	@Update("UPDATE O_ORDER SET O_STATUS = '1' WHERE O_CCODE = #{ie_cpcode} AND O_CODE = #{ie_ocode} ")
	boolean updatePurchase(IePort iePort);

	boolean pregistration(Purchase ps);

	boolean pcommom(Purchase ps);

	List<Purchase> pFrerence(String cCode);

	List<Purchase> pfSearch(@Param("search") String search, @Param("choice") String choice, @Param("cCode") String cCode);

	boolean pfDelete(@Param("check") String check, @Param("cCode") String cCode);

	boolean pcDelete(@Param("check") String check, @Param("cCode") String cCode);

	List<Purchase> pDetail(@Param("check") String check, @Param("cCode") String cCode);

	Purchase pInfo(@Param("check") String check, @Param("cCode") String cCode);

	Purchase pBring(@Param("check") String check, @Param("cCode") String cCode);

	List<Purchase> pProgram(@Param("check") String check, @Param("cCode") String cCode);

	List<approvalLine> approvalLine();

	List<approvalLine> searchName(String name);

    List<com.n7.erp.bean.ps.approvalLine> addApproval(String code01); //name

    com.n7.erp.bean.ps.approvalLine approLinecom1(String code01);

    List<com.n7.erp.bean.ps.approvalLine> getMyInfo(String code);

    boolean Approval(PurchaseApproval pa);

	boolean pApproval1(PurchaseApproval pa);

	boolean pApproval2(PurchaseApproval pa);

	PurchaseApproval pRequest(@Param("p_documentcode") String p_documentcode, @Param("cCode") String cCode);

	List<PurchaseApproval> pListRequest(@Param("p_documentcode") String p_documentcode, @Param("cCode") String cCode);

	com.n7.erp.bean.ps.approvalLine getApprovalInfo(String code);

	PurchaseApproval pRequest2(@Param("p_documentcode") String p_documentcode, @Param("cCode") String cCode);

	List<PurchaseApproval> pListRequest2(@Param("p_documentcode") String p_documentcode, @Param("cCode") String cCode);

	boolean rRegistration(Return rt);

	List<Return> rInfo(String cCode);

	boolean rDelete(@Param("check_list") String check_list, @Param("cCode") String cCode);

	List<Return> rSearch(@Param("search") String search, @Param("choice") String choice, @Param("cCode") String cCode);

	List<IePort> stocklist(String cCode);

	List<ItemCode> getstocklist(String cCode);

	boolean insertIeport(Return rt);

	boolean updateitcode(@Param("tot2") int tot2, @Param("it_code") String itcode, @Param("cCode") String cCode);

	ItemCode getitcode(@Param("it_code") String itcode, @Param("cCode") String cCode);

	boolean orderInsert(Order od);

	List<Order> orderInfo(String cCode);

	List<Order> orderSearch(@Param("search") String search,@Param("choice") String choice,@Param("cCode") String cCode);

	List<ApprovalDocu> orderPinfo(String cCode);

	int compareCode(@Param("check") String check,@Param("cCode") String cCode);




}
