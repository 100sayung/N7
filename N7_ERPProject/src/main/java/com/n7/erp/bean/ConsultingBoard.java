package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
	
@Accessors(chain = true)
@Alias("board")
@Data
public class ConsultingBoard {
	private String CB_NUM;	
	private String CB_TYPE;
	private String CB_WRITER;
	private String CB_PASSWORD;
	private String CB_TITLE;
	private String CB_CONTENTS;
}
