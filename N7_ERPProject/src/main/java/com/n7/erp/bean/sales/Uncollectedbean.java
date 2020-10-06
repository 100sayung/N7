package com.n7.erp.bean.sales;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("Uncollected")
@Accessors(chain = true)

public class Uncollectedbean { //미수금 등록
    private String bu_ccode;
    private String bu_clcode;
    private String bu_person;
    private String bu_date;
    private String bu_itnum;
    private int bu_quantity;
    private String bu_basedate; //출하요청일 //납기일?
    private String bu_currentuncollectedmoney;
    
    
}
