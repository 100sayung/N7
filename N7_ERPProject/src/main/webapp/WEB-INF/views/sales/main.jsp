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
				<li><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
				</ul>
				<ul id="mainmenu"></ul>
      </div>
   </div>
   <div id="side_menu">
      <ul id="menuList">
         <li><a id="showMenu1">수주등록</a></li>
         <li><a id="showMenu2">출하의뢰입력</a></li>
         <li><a id="showMenu3">미수금등록</a></li>
         <li><a id="showMenu4">영업활동 조회</a></li>
      </ul>
   </div>
   <div id="description">
    <div id="center">
    <div style="width:auto; background-color:white; color:white; padding:1%; text-align:center;">
           <button type="button" id="orderitemfrm">수주품목 현황</button>
           <span style="padding-left: 5px"><a href="#"
         onclick="window.open('/erp/Account/comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
        </div>
        <div style="width:1150px; background-color:#3D6B9B;  color:white; padding:1%; text-align:center;">수주관리 양식</div>
              <div style="text-align:center;">
              <select id="choice" style="width:180px;">
                      <option value="bo_num">수주번호</option>
                      <option value="bo_clcode">거래처회사코드</option>
                      <option value="bo_ccode">회사코드</option>
               </select>
        <input type="text" name="search" id="search">
        <button id="searchh">검색</button>
        </div>
        <form id="orderregistrationinput">
        <div border="1" style="width:1175px; height:80px; padding-top:25px; background-color:#F8F7F7;">
        <table style="margin-left:250px;">
         <thead>
            <tr>
               <th>수주번호</th>
               <th><input type="number" name="bo_num" placeholder="자동생성" readonly></th>
               <th>거래처회사코드</th>
               <th><input id="clcode" type="text" name="bo_clcode">&nbsp;<button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button></th>
               <th>회사코드</th>
               <th><input type="text" name="bo_ccode" value="${cCode}"></th>
            </tr>
            <tr>
               <th>사업단위</th>
               <th><select name="bo_unit" style="width:150px;">
                   <option value="본사">본사</option>
                   <option value="지사">지사</option></select></th>
               <th>담당자</th>
               <th><input type="text" name="bo_manager"></th>
               <th>부서</th>
               <th id="dept"></th>
            </tr>
         </thead>
      </table>
      </div>
            <div style="background-color:#ECEBEA; width:1175px;">
            <table id="item" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1"
              style="width:900px;  margin-left:10px; border-color:gray;">
                <colgroup align="center">
                </colgroup>
                <colgroup align="left">
                </colgroup>
                <colgroup span="2" align="center">
                </colgroup>
                <colgroup span="3" align="center">
                </colgroup>
                <thead valign="top">
                <tr>
                  <th><input type="radio" id="allCheck"></th>
                  <th>수주번호</th>
                  <th>프로젝트명</th>
                  <th>프로젝트기간 시작</th>
                  <th>프로젝트기간 끝</th>
                  <th>수량</th>
                  <th>판매금액</th>
                  <th>수주예산</th>
               </tr>
                </thead>
                <tbody id="tBody">
                    <tr>
                        <td><input type="radio" name="each_check" class="each"></td>
                        <td><input type="text" name="bo_num" placeholder="자동생성" readonly></td>
                        <td><input type="text" name="bo_pronum" id="add"  required></td>
                        <td><input type="date" name="bo_orderdate" min="2000-01-01" max="2030-12-31" style="width:180px;"></td>
                        <td><input type="date" name="bo_duedate" min="2000-01-01" max="2030-12-31" style="width:180px;"></td>
                        <td><input type="number" name="bo_proquantity"  required></td>
                        <td><input type="number" name="bo_prosalesamount"  required></td>
                        <td><input type="number" name="bo_orderbudget" required></td>
                    </tr>
                </tbody>
            </table>
            </div>
            <br>
            <div style="text-align:center;">
                 <button type="button" id="deleteCheck" value="삭제">삭제</button>
                 <button type="button" id="subb" value="저장">저장</button>
            </div>
          </form>
   </div>
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



   </script>
</html>
