package com.n7.erp.bean.hr;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("hr_card")
@Data
public class HR_Card {
	private String hc_id;
	private String hc_hrcode;
	private String hc_joindate;
	private String hc_dept;
	private String hc_position;
	private String hc_work;
	private String hc_status;
	private String hc_numholi;
	private String hc_ccode;


	//가져올때 이름을 많이 가져와서 추가했음!
	private String m_name;
}
