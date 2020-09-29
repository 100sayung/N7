package com.n7.erp.bean.hr;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("certification")
@Data
@Accessors(chain = true)
public class Certification { //자격증
	String hct_hrcode;
	String hct_name;
	String hct_agency;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	String hct_date;
	String hct_num;
	String hct_ccode;
	private List<Certification> ctList;
}
