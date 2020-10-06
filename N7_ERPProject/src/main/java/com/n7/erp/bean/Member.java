package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Alias("member")
@Data
public class Member {
	String m_id;
	String m_pw;
	String m_address;
	String m_phonenum;
	String m_photo;
	String m_birth;
	String m_name;
	String m_ccode;
	String m_email;
	String m_grade;
	
	//��¿�
	String c_name;	
}
