<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License
Name       : UpRight 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130526
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
   media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<style>
#header{
   margin-bottom: 30px;
}
.button {
   color: #ffffff;
}

#container {
   margin-left: 300px;
}

#boardList,.writelist {
   text-align: center; border-collapse : collapse;
   border: 1px solid black;
   border-collapse: collapse;
}
#boardList {
   margin-top: 30px;
   font-size: 30px;
}
.writelist {
   font-size: 15px;
   width: 225px;
}
#writing{
   margin-top:25px;
   float: right;
}
#container{
   padding: 50px;
   border:1px solid black;
   margin:auto;
   width: 800px;
}
#writeFrm{
   margin-left:500px; 
}
#writeTitle{
   width: 500px;
}
.writeclass{
   width: 20px;
   height: 15px;
}
.writeText{
   padding: 10px;
}
h1{
font-size: 36px;
margin-top: 15px;
margin-bottom: 10px;
font-family: inherit;
font-weight: 500;
color: inherit;
text-transform: uppercase;
display: block;    
}
#write{
resize: none;
}
#password{
display : block;
float: left;
margin-left: -195px;
padding: 8px;
}
</style>
</head>
<body>
	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/">MAIN</a></li>
				<li><a href="/erp/introducecompany">회사 소개</a></li>
				<li><a href="/erp/erpboard" accesskey="5" title="">상담 게시판</a></li>
				<li><a href="/erp/erpapply">ERP 신청</a></li>
				<li><a href="/erp/login">LOGIN</a></li>
				<li><a href="/erp/join">JOIN</a></li>
				<li class="current_page_item"><a href="#">ERP시작</a></li>
			</ul>
		</div>
	</div>
   <form action="writeBoard" id="writeFrm" method="post">
      <h1>글쓰기</h1>
	<table>
		 <tr>
		 	<input type="checkbox" class="writeclass" id="writecheck" checked="checked" name="CB_TYPE" value="a">공개글
            <input type="checkbox" class="writeclass" name="CB_TYPE" value="b">비밀글</td>
         </tr>
         <tr>
            <td>
            <input id="writeTitle" placeholder="제목을 입력해 주세요." required="required" class="writeText" name="CB_TITLE"></td>
			</td>
         </tr>
         <tr>
            <th><textarea rows="25" cols="100" id="write" class="writeText" name="CB_CONTENTS" required="required" placeholder="내용을 입력해주세요."></textarea></th>
         </tr>
         <tr>
            <td id="aaa">
               <button type="submit">글 작성</button>
               <button type="reset">다시쓰기</button>
               <button><a href="/erp/erpboard" style="text-decoration: none;">뒤로</a></button>
            </td>
         	 <td><input type="password" name="CB_PASSWORD" id="password" placeholder="비밀번호 입력" ></td>
         </tr>
         <tr>
         </tr>
      </table> 
   </form>
</body>
</html>