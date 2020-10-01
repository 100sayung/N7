package com.n7.erp.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.n7.erp.bean.B_shipment;
import com.n7.erp.bean.IePort;
import com.n7.erp.bean.ItemCode;

public interface ItemCodeDao {

	@Select("SELECT * FROM IT WHERE IT_CPCODE = #{cCode}")
	public List<ItemCode> getItemCode(String cCode);

	@Insert("INSERT INTO IT VALUES(#{it_code},#{it_cpcode},#{it_ccode},#{it_pname},#{it_size},#{it_unit},#{it_pstock},0)")
	public boolean itemCodeCofirm(ItemCode it);

	@Update("UPDATE IT SET IT_PNAME=#{it_pname},IT_SIZE=#{it_size},IT_UNIT=#{it_unit},IT_PSTOCK=#{it_pstock} WHERE IT_CODE=#{it_code} AND IT_CPCODE = #{it_cpcode}")
	public boolean modifyItemCode(ItemCode it);

	@Delete("DELETE FROM IT WHERE IT_CODE=#{it_code} AND IT_CPCODE = #{it_cpcode}")
	public boolean deleteItemCode(ItemCode it);

	@Select("SELECT * FROM IT WHERE IT_CCODE = #{it_ccode} AND IT_CPCODE =  #{it_cpcode}")
	public List<ItemCode> getItemCodeFromItemCCode(@Param("it_ccode")String it_ccode,@Param("it_cpcode")String it_cpcode);

	@Select("SELECT * FROM IT WHERE IT_CPCODE = #{cCode} AND IT_CODE = #{bs_itcode}")
	public ItemCode getPname(@Param("cCode")String cCode,@Param("bs_itcode") String bs_itcode);

	@Select("SELECT *FROM IT WHERE IT_CODE = #{bs_itcode} AND IT_CPCODE = #{bs_ccode}")
	public ItemCode getPnnnname(B_shipment bs);

	@Select("SELECT IT_STOCK FROM S_ITEMCODE WHERE IT_CODE = #{ie_itcode} AND IT_CPCODE = #{ie_cpcode}")
	public int getItqty(IePort ie);

	@Update("UPDATE S_ITEMCODE SET IT_STOCK =#{i} WHERE IT_CODE = #{ie_itcode} AND IT_CPCODE = #{cCode}")
	public void updateItqty(@Param("i")int i,@Param("cCode") String string,@Param("ie_itcode") String ie_itcode);

}
