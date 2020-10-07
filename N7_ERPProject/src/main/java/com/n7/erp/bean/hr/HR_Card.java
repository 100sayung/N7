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
	private String hc_holynum;
	private String hc_ccode;


	//媛��졇�삱�븣 �씠由꾩쓣 留롮씠 媛��졇���꽌 異붽��뻽�쓬!
	private String m_name;
}
