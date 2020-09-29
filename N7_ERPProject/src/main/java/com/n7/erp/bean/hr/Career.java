package com.n7.erp.bean.hr;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("career")
@Data
@Accessors(chain = true)
public class Career { //이력
	String hcr_num;
	String hcr_name;
	String hcr_startperiod;
	String hcr_endperiod; //끝난 날
	String hcr_content;
	String hcr_position;
	String hcr_hrcode;
	String hcr_ccode;
	private List<Career> caList;
}
