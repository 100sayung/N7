package com.n7.erp.bean.hr;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("attendance")
@Accessors(chain = true)
@Data
public class Attendance {
	String ha_ccode;
	String ha_hrcode;
	String ha_time;
	String ha_type;
	
	//출력을 위해서
	String m_name;
}
