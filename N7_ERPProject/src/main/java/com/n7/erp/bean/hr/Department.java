package com.n7.erp.bean.hr;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("department")
@Accessors(chain = true)
@Data
public class Department {
	private String HDP_dept;
	private String HDP_position;
	private int HDP_pay;
	private String HDP_num;
	private String hdp_ccode;
	private String hdp_auth;
	
	//배열로 받으려고
	private List<Department> list;
}
