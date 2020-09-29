package com.n7.erp.bean.sales;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("business")
@Accessors(chain = true)

public class Businessbean {
    private String ba_ocode;
    private String ba_ccode;
    private String ba_clcode;
    private String ba_hrcode;
    private String ba_unit;
    private String ba_startperiod;
    private String ba_endperiod;
    private String ba_date;
    private String ba_content;
    private int ba_estimatedsalesamount;
    private int ba_actualsalesamount;
    private String ba_enddate;
    private String ba_memo;
}
