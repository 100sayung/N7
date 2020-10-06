package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Alias("fmenu")
@Data
public class clientMenu {
  private String f_ccode;
  private String f_functions;
}
