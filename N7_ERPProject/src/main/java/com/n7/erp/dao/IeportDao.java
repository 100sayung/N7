package com.n7.erp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.n7.erp.bean.B_shipment;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ps.Purchase;

public interface IeportDao {

	@Select("SELECT *  FROM P JOIN IT ON P.P_ITCODE = IT.IT_CODE WHERE P.O_STATUS = '0' AND IT.IT_CPCODE = #{cCode} ORDER BY P.P_CLCODE")
	List<Purchase> importCheckList(String cCode);

	@Insert("INSERT INTO IE VALUES(S_IEPORT_SEQ.NEXTVAL,#{ie_cpcode},DEFAULT,#{ie_hrcode},#{ie_etc},'1',#{ie_clcode},#{ie_ocode},#{ie_itcode},#{ie_qty},#{ie_price},0)")
	boolean insertImport(IePort iePort);

	@Select("SELECT * FROM IE WHERE IE_CPCODE = #{cCode}")
	ArrayList<IePort> getImportList(String cCode);

	@Select("SELECT * FROM IE WHERE IE_STATUS = #{ie_status} AND #{cCode}")
	ArrayList<IePort> getImportIeList(@Param("ie_status") String ie_status, @Param("cCode") String cCode);

	@Select("SELECT * FROM IE WHERE TO_DATE(TO_CHAR(IE_DATE,'YYYYMMDD'),'YYYY-MM-DD') BETWEEN TO_DATE(#{date1},'YYYY-MM-DD') AND TO_DATE(#{date2},'YYYY-MM-DD') AND IE_CPCODE = #{cCode}")
	ArrayList<IePort> getImportDateList(Map<String, String> dMap);

	@Select("SELECT * FROM IE WHERE TO_DATE(TO_CHAR(IE_DATE,'YYYYMMDD'),'YYYY-MM-DD') BETWEEN TO_DATE(#{date1},'YYYY-MM-DD') AND TO_DATE(#{date2},'YYYY-MM-DD') AND IE_STATUS = #{ie_status} AND IE_CPCODE = #{cCode}")
	ArrayList<IePort> getImportDateCheckList(Map<String, Object> iMap);

	@Select("SELECT * FROM IE WHERE IE_ITCODE = #{it_code} AND IE_CPCODE = #{cCode}")
	ArrayList<IePort> getByItemDealList(@Param("it_code")String it_code,@Param("cCode") String cCode);

	@Select("SELECT IE_ITCODE , SUM(IE_QTY) IE_QTY FROM IE JOIN IT ON IT_CODE = IE_ITCODE WHERE IT_CCODE = #{it_ccode} AND IE_CPCODE = #{cCode} GROUP BY IE_ITCODE")
	ArrayList<IePort> getByItemDealListFromItCcode(@Param("it_ccode") String it_ccode, @Param("cCode") String cCode);
	
	@Select("SELECT IE_ITCODE , SUM(IE_QTY) IE_QTY FROM IE  WHERE IE_ITCODE = #{it_code} AND IE_CPCODE = #{cCode} GROUP BY IE_ITCODE")
	IePort getByItemStockList(@Param("it_code")String it_code, @Param("cCode") String cCode);
	
	@Select("SELECT IE_ITCODE, IE_STATUS,SUM(IE_QTY) IE_QTY FROM IE WHERE ie_date BETWEEN TO_DATE(#{date1},'YYYY-MM-DD') AND  TO_DATE(#{date2},'YYYY-MM-DD') AND IE_CPCODE = #{cCode} GROUP BY IE_ITCODE,IE_STATUS ORDER BY IE_ITCODE, IE_STATUS")
	ArrayList<IePort> getMonthPayment(HashMap<String,String> hMap);

	@Select("SELECT IE_ITCODE, SUM(IE_QTY) IE_QTY FROM IE WHERE IE_DATE<TO_DATE(#{date1},'YYYY-MM-DD') AND IE_CPCODE = #{cCode} GROUP BY IE_ITCODE")
	ArrayList<IePort> getByItemStockListAll(@Param("date1")String date1,@Param("cCode") String cCode);

	@Select("SELECT * FROM B_SHIPMENT WHERE BS_CCODE = #{cCode} AND BS_STATUS = '3'")
	List<B_shipment> exportCheckList(String cCode);

	@Select("SELECT COUNT(IE_QTY) FROM S_IEPORT WHERE IE_CPCODE = #{cCode}")
	List<IePort> getStockList(String cCode);

	@Update("UPDATE B_SHIPMENT SET BS_STATUS = '4' WHERE BS_DOCUNUM = #{ie_ocode} AND BS_CCODE = #{ie_cpcode}")
	boolean updateBshipment(IePort ie);

	@Insert("INSERT INTO S_IEPORT VALUES(S_IEPORT_SEQ.NEXTVAL,#{ie_cpcode},DEFAULT,#{ie_hrcode},#{ie_etc},'2',#{ie_clcode},#{ie_ocode},#{ie_itcode},-#{ie_qty},#{ie_price},0)")
	boolean insertExport(IePort ie);

	@Select("SELECT CL_CODE FROM AC_COMPANYLIST WHERE CL_CCODE = #{cCode}")
	List<String> getClcode(String cCode);

}
