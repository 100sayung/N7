package com.n7.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import com.n7.erp.bean.ApprovalDocu;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ItemCode;
import com.n7.erp.bean.ps.approvalLine;
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

	List<Purchase> pFrerence();

	List<Purchase> pfSearch(@Param("search") String search, @Param("choice") String choice);

	boolean pfDelete(String check_list);

	boolean pcDelete(String check_list);

	List<Purchase> pDetail(String check);

	Purchase pInfo(String check);

	Purchase pBring(String check);

	List<Purchase> pProgram(String check);

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
	
	List<Return> rInfo();

	boolean rDelete(String check_list);

	List<Return> rSearch(@Param("search") String search, @Param("choice") String choice);

	List<IePort> stocklist(String cCode);

	List<ItemCode> getstocklist(String cCode);

//	boolean itupdate(ItemCode it);

	
}
