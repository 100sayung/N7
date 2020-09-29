package com.n7.erp.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.n7.erp.bean.Member;

public interface IMemberDao {
	boolean access(Member mb);
	boolean join(Member mb);
	//boolean fileInsert(Map<String, String> fMap);
	@Select("SELECT M_CCODE FROM MEMBER WHERE M_ID=#{m_id}")
	String bringCCode(Member mb);

	ArrayList<Member> getHRCard(String m_ccode);
	@Select("SELECT * FROM MEMBER WHERE M_ID = #{id}")
	Member getMemberDetail(String id);

	@Select("SELECT * FROM MEMBER WHERE M_ID LIKE #{m_id}")
	ArrayList<Member> getSearchFromId(String m_id);

	@Update("UPDATE MEMBER SET M_GRADE = #{m_grade} WHERE M_ID = #{m_id}")
	boolean updateChangeGrade(Member mb);

	@Select("SELECT * FROM MEMBER")
	ArrayList<Member> getAllMember();

	@Update("UPDATE MEMBER SET M_GRADE = 'X' WHERE M_ID = #{m_id}")
	void forceWithDrawal(String string);

	@Select("SELECT * FROM MEMBER WHERE M_EMAIL = #{userEmail}")
	Member findId(String userEmail);
	@Select("SELECT * FROM MEMBER WHERE M_EMAIL = #{userEmail} AND M_ID = #{userId}")
	Member findPassword(@Param("userEmail") String userEmail,@Param("userId") String userId);
	@Select("UPDATE MEMBER SET M_PW = #{userPassword} WHERE M_ID = #{userId}")
	void modifyPassword(@Param("userPassword")String userPassword, @Param("userId")String userId);
	@Select("SELECT COUNT(*) FROM MEMBER WHERE M_ID = #{m_id}")
	int getDupleID(String m_id);
	@Select("SELECT COUNT(*) FROM COMPANY WHERE C_CODE = #{cCode}")
	int getDupleCCode(String m_ccode);
}
