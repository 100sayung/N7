<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>영업 메뉴창</title>
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
            <a href="/erp/myInfo/myInfo"">N7 ERP SYSTEM</a>
         </h1>
      </div>
      <div id="menu">
			<ul>
				<li class="current_page_item"><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu"></ul>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
      </div>
   </div>
   <div id="side_menu">
      <ul id="menuList">
         <li><a href="#" id="showMenu1">수주등록</a></li>
         <li><a href="#" id="showMenu2">출하의뢰입력</a></li>
         <li><a href="#" id="showMenu3">미수금등록</a></li>
         <li><a href="#" id="showMenu4">영업활동 조회</a></li>
      </ul>
   </div>
   <center>
   <div id="description">

   </div>
   </center>
   </body>
   <script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
   <script>

   $('#showMenu1').click(function() {

       $.ajax({
          type : 'get',
          url : '/erp/sales/orderregistrationfrm',
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
          url : '/erp/sales/shippingrequestinputfrm',
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


   $('#showMenu3').on('click', function() {

       $.ajax({
          type : 'get',
          url : '/erp/sales/uncollectedmoneyregistrationfrm',
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

   $('#showMenu4').on('click', function() {
       $.ajax({
          type : 'get',
          url : '/erp/sales/businessactivitiesfrm',
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

   </script>
</html>
