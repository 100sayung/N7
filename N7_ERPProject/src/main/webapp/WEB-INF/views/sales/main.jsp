<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
   media="all" />
<style>
#header {
   width: 100%;
   height: 200px;
}

#side_menu {
   height: 100%;
   width: 250px;
   font-size: 20px;
   font-weight: bolder;
   float: left;
   border-right:1px solid #E6E6E6;
}

#side_menu #menuList {
   list-style: none;
   margin-top: 150px;
}

#side_menu #menuList li {
   margin: 20px;
}

a {
   text-decoration: none;
}

#body{
    position: relative; 
}

#description{
    float:left;
    height:100%;
    width:80%;
    position: absolute;
    transform:translate(300px, 0);   
}

ul {
   list-style: none;
}
</style>
</head>
<body>
   <div id="header">
      <div id="logo">
         <h1>
            <a href="#">N7 ERP SYSTEM</a>
         </h1>
      </div>
      <div id="menu">
         <ul>
            <li><a href="#" accesskey="4" title="">내 정보</a></li>
            <li><a href="#" accesskey="2" title="">인사 관리</a></li>
            <li class="current_page_item"><a href="#" accesskey="3" title="">영업 관리</a></li>
            <li><a href="#" accesskey="5" title="">구매 관리</a></li>
            <li><a href="#" accesskey="6" title="">자재 관리</a></li>
            <li><a href="#">회계 관리</a></li>
         </ul>
      </div>
   </div>
   <div id="side_menu">
      <ul id="menuList">
         <li id="showMenu1">수주등록</li>
         <li id="showMenu2">출하의뢰입력  </li>
         <li id="showMenu3">미수금등록</li>
         <li id="showMenu4">영업활동 조회</li>
         <li id="showMenu5">내 결재함</li>
      </ul>
   </div>
   <div id="description">
    
   </div>
   <script>
   
   $('#showMenu1').click(function() {

       $.ajax({
          type : 'get',
          url : 'orderregistrationfrm',
          dataType : 'html',
          success : function(data) {
             $('#description').html(data);
          },
          error: function(error){
             console.log(error);
          }
       });
    });
   
   $('#showMenu2').click(function() {
       
       $.ajax({
          type : 'get',
          url : 'shippingrequestinputfrm',
          dataType : 'html',
          success : function(data) {
             console.log(data);
             $('#description').html(data);
          },
          error: function(error){
             console.log(error);
          }
       });
    }); 
    
    
/*   $('#showMenu2').click(function() {
    var str="";
    
    $.ajax({
       type : 'get',
       url:'rest/orderitem'
       dataType : "json",
       success : function(data) {
          console.log(data);
          
          for(var i in data.sList){
             str+="<tr><td><input type='text' name='checknum' value="+data.sList[i].pro_order_num+"></td>";
             str+="<td><input type='text' name='pro_name' value="+data.sList[i].pro_name+"</td>";
             
          }
          $('#tBody').html(str);
       },
       error: function(error){
          console.log(error);
       }
    });
 });  */
   
   $('#showMenu3').on('click', function(e) {
       e.preventDefault();

       $.ajax({
          type : 'get',
          url : 'uncollectedmoneyregistrationfrm',
          dataType : 'html',
          success : function(data) {
             console.log(data);
             $('#description').html(data);
          },
          error: function(error){
             console.log(error);
          }
       });
    });
   
   $('#showMenu4').on('click', function(e) {
       e.preventDefault();

       $.ajax({
          type : 'get',
          url : 'businessactivitiesfrm',
          dataType : 'html',
          success : function(data) {
             console.log(data);
             $('#description').html(data);
          },
          error: function(error){
             console.log(error);
          }
       });
    });
   
   $('#showMenu5').on('click', function(e) {
       e.preventDefault();

/*        var check='';
       $("input[name=each_check]:checked").each(function(){
          check= $(this).attr("value");
          
          console.log(check);
          if(check!=""){ */
      
       $.ajax({
          type : 'get',
          url :  'salesapprovaldetail',
          dataType : 'html',
          success : function(data) {
             console.log(data);
             $('#description').html(data);
          },
          error: function(error){
             console.log(error);
          }
        });
    });
  
    var select;
      $.ajax({
            url:"/erp/stock/getitemcode",
            dataType:"json",
            type:"post",
            success:function(data){
               select = makeSelectBox(data);
            },
            error:function(err){
               console.log(err);
            }
         });
      
     function makeSelectBox(arr){
          var arrStr = "<select name = 'bs_itcode'>"
          if(arr.length==0){
             arrStr+="<option>품목코드를 먼저 작성해주세요 </option>";
          }else{
             for(var i = 0;i<arr.length;i++){
                arrStr+="<option value='"+arr[i].it_code+"'>"+arr[i].it_code+"</option>"; 
             }
          }
          arrStr+="</select>";
          return arrStr;
       } 
     
      var select2;
      $.ajax({
            url:"/erp/rest/sales/getbonum",
            dataType:"json",
            type:"post",
            success:function(data){
               select2 = makeSelectBox(data);
            },
            error:function(err){
               console.log(err);
            }
         });
      
     function makeSelectBox(arr){
          var arrStr = "<select name = 'bs_bonum'>"
          if(arr.length==0){
             arrStr+="<option>수주번호를 작성해주세요 </option>";
          }else{
             for(var i = 0;i<arr.length;i++){
                arrStr+="<option value='"+arr[i].bo_num+"'>"+arr[i].bo_num+"</option>"; 
             }
          }
          arrStr+="</select>";
          return arrStr;
       } 
   </script>
</body>
</html>