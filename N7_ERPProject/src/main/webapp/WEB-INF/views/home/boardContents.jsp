<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
		<link href="img/favicon.png" rel="icon" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="lib/icomoon/icomoon.css" rel="stylesheet" />
  <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1a9e4h5a1u&callback=initMap"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous" />
	<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<style type="text/css">
h2{
font-size: 36px;
margin-top: -70px;
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
/* margin-left: 400px; */
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
float: left;
margin-left: 400px;
}
</style>
</head>
<body>
	<div id="header" class="container" style="text-align: center;">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 COMPANY</a>
			</h1>
		</div>
		<div id="menu">
		</div>
	</div>
	<div id="description" class="out" style="height: 700px;">
	<div style='width:100%; height:50px; text-align:center; background-color: #3D6B9B;'><h1><a href="/erp/erpboard" style='color:white; text-decoration: none;'>ERP상담게시판</a></h1></div>
	<div class="center">
        <div id="container">
        <br>
<br>
	<form action="boardContnes">
		<h2>상세보기</h2>
		<table id="table">
			<tr>
				<th scope="row"">글 번호</th>
				<td>${board.CB_NUM}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${board.CB_WRITER}</td>
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
		<button type="button" id="delete">삭제</button>
	</div>
</div>

</body>
</html>