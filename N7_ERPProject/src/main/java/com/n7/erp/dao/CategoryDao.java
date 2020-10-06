package com.n7.erp.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.n7.erp.bean.Category;

@Mapper
public interface CategoryDao {

	@Insert("INSERT INTO CT VALUES(#{ct_code},#{ct_cpcode},#{ct_name})")
	public boolean categoryCofirm(Category ct);

	@Select("SELECT * FROM CT WHERE CT_CPCODE = #{cCode}")
	public List<Category> getCategory(String cCode);

	@Update("UPDATE CT SET CT_NAME=#{ct_name} WHERE ct_code = #{ct_code} AND CT_CPCODE = #{ct_cpcode}")
	public boolean modifyCategory(Category ct);

	@Delete("DELETE FROM CT WHERE ct_code = #{ct_code} AND CT_CPCODE = #{ct_cpcode}")
	public boolean deleteCategory(Category ct);

	@Select("SELECT CT_NAME FROM CT WHERE ct_code = #{ct_code} AND CT_CPCODE = #{ct_cpcode}")
	public String getCtName(Category ct);

	@Select("SELECT CT_CODE FROM CT WHERE ct_name = #{ct_name} AND CT_CPCODE = #{ct_cpcode}")
	public String getCtCode(Category ct);

}
