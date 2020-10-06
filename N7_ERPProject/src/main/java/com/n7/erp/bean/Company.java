package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Alias("company")
@Data
public class Company {
 private String c_code;
 private String c_name;
 private String c_ceo;
 private String c_phonenum;
 private String c_kind;
 private String c_kind2;
 private String c_addr;
 private String c_comnum;
}
