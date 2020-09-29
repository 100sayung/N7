package com.n7.erp.bean.sales;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("shipping")
@Accessors(chain = true)

public class Shippingbean { //출하등록
    private String bs_docunum;
    private String bs_ccode;
    private String bs_bonum;
    private String bs_itcode;
    private String bs_proname; //제품명 추가함!
    private String bs_clcode;
    private String bs_basedate; //date1이였는데 바꿈 //출하의뢰일
    private int bs_unit;
    private int bs_quantity;
    private int bs_price;
}