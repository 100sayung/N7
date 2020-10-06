package com.n7.erp.bean.entity;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("namehrcode")
@Data
public class NameHrCode { //이름과 hrcode를 가져올 일이있어서 Entity에 만들었음
	private String m_name;
	private String hc_hrcode;
	private String hc_position;
}
