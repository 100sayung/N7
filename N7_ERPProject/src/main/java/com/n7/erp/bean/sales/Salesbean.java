package com.n7.erp.bean.sales;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("sales")
@Accessors(chain = true)

public class Salesbean {
     private String bo_num;
     private String bo_clcode;
     private String bo_ccode;
     private String bo_unit;
     private String bo_manager;
     private String bo_dept;
     private String bo_pronum;
     private String bo_orderdate;
     private String bo_duedate;
     private int bo_proquantity;
     private int bo_prosalesamount;
     private int bo_orderbudget;     
}