package com.n7.erp.bean.hr;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Alias("academic")
@Data
public class Academic { //학력
	String code;
	String hac_hrcode;
	String hac_num;
	String hac_school;
	String hac_major;
	String hac_year;
	String hac_ccode;
}
