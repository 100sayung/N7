package com.n7.erp.bean.sales;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("A_comp")
@Data
@Accessors(chain=true)
public class A_company {
    private String cl_code;
    private String cl_ccode;
    private String cl_name;
    private String cl_comnum;
    private String cl_comnum2;
    private String cl_ceo;
    private String cl_employee;
    private String cl_phone;
    private String cl_phone2;
    private String cl_fax;
    private String cl_email;
    private String cl_addr;
    private String cl_kind;
    private String cl_kind2;
    private String cl_kind3;
    private String cl_bank;
    private String cl_bankholder;
    private String cl_memo;
    private String cl_banknum;
}