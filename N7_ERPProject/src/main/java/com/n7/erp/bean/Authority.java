package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("authority")
@Accessors(chain = true)
@Data
public class Authority{
	
	public String au_comname;		//회사이름
	public String au_name;			//부서이름
	public String au_authority;		//권한
	
}
