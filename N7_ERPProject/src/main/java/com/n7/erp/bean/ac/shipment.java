package com.n7.erp.bean.ac;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("ship")
@Accessors(chain=true)
public class shipment {
   private String ie_seqnum;
   private String ie_price;
   private String ie_qty;
   private String it_pname;
   private String cl_name;
   private String cl_code;
   private String ie_cpcode;
   private String it_code;
   private String ie_status;
}
