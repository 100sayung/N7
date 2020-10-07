package com.n7.erp.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
   
@Accessors(chain = true)
@Alias("board")
@Data
public class ConsultingBoard {
   
   private int cb_count;   
   private String cb_num;   
   private String cb_type;
   private String cb_writer;
   private String cb_password;
   private String cb_title;
   private String cb_contents;
}