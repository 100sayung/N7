package com.n7.erp.bean.entity;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("nameholiday")
@Data 
public class NameHoliday { //달력 표시용으로 그냥 만들엇음 귀찮아서

	String hap_type;
	String hap_startday;
	String hap_endday;
	String hap_status;
	String m_name;
	String hap_docunum;
}
