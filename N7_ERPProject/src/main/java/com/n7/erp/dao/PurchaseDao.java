package com.n7.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ps.approvalLine;
import com.n7.erp.bean.ps.A_company;
import com.n7.erp.bean.ps.Purchase;
import com.n7.erp.bean.ps.PurchaseApproval;
import com.n7.erp.bean.ps.Return;

@Mapper
@Component
public interface PurchaseDao {

	@Update("UPDATE P SET P_SITUATION=1 WHERE P_NUM=#{ie_pnum} AND ")//수정해야함
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

	boolean rRegistration(Return rt);

	List<Return> rInfo();

	boolean rDelete(String check_list);

	List<Return> rSearch(@Param("search") String search, @Param("choice") String choice);

	@Select("SELECT COUNT(*) FROM O_PURCHASECOMMOM")
	int getListCount();

}
