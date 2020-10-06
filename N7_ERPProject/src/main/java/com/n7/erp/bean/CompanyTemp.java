package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Alias("companytemp")
@Data
public class CompanyTemp {
 private String ct_code;
 private String ct_name;
 private String ct_ceo;
 private String ct_phonenum;
 private String ct_kind;
 private String ct_kind2;
 private String ct_addr;
 private String ct_comnum;
}
