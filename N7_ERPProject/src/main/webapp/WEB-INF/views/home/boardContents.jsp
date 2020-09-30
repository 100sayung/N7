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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<style type="text/css">
h2{
font-size: 36px;
margin-top: 23px;
margin-bottom: 10px;
margin-left: auto;
font-family: inherit;
font-weight: 500;
color: inherit;
text-transform: uppercase;
display: block;    
text-align: center;
}
table#table {
border-collapse: separate;
border-spacing: 0;
text-align: left;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 1px solid #ccc;
margin : 20px 10px;
text-align: center;
margin-left: 400px;
margin-top: 20px;
}
table#table th {
width: 100px;
padding: 10px;
font-weight: bold;
vertical-align: top;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
border-top: 1px solid #fff;
border-left: 1px solid #fff;
background: #eee;
}
table#table td {
width: 250px;
padding: 10px;
vertical-align: top;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
}
#aaa{
float: right;
margin-right: 500px;
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
	<form action="boardContnes">
		<h2>상세보기</h2>
		<table id="table">
			<tr>
				<th scope="row"">글 번호</th>
				<td>${board.CB_NUM}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${board.CB_TITLE}</td>
			</tr>
			<tr>
				<th scope="row">글 제목</th>
				<td>${board.CB_TITLE}</td>
			</tr>
			<tr>
				<th scope="row">글 내용</th>
				<td><textarea rows="15" cols="90" style="resize: none;">${board.CB_CONTENTS}</textarea></td>
			</tr>
		</table>
	</form>
		<div>
			<button id="aaa"><a href="/erp/erpboard" style="text-decoration: none;">뒤로</a></button>
		</div>
</body>
</html>