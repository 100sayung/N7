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
table#List {
border-collapse: separate;
border-spacing: 1px;
text-align: left;
line-height: 1.5;
order-top: 1px solid #ccc;
margin : auto;
text-align: center;
margin-top: 20px;
}
table#List th {
width: 140px;
padding: 7px;
padding-top: 10px;
font-weight: bold;
vertical-align: top;
border-bottom: 1px solid #ccc;
text-align: center;
}
table#List td {
width: 250px;
padding: 8px;
vertical-align: top;
border-bottom: 1px solid #ccc;
text-align: center;
}
#paging{
display: block;
text-align: center;
margin-top: 15px;
margin-left: 520px;
padding-bottom: 12px;
}
#bbb{
/* position: absolute;  */
float: right;
margin-right: 450px;
margin-top: 10px;
}
#ccc{
position:relative;
float: right;
margin-right: 450px;
margin-top: 10px;
padding-bottom: 20px;
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
	<form action="erpboard">
	<div id="a">
		<h2>상담 게시판</h2>
		<table id="List">
			<tr style="background-color: #F0CDDE; width: 350px;">
				<th scope="row">번호</th>
				<th scope="row">제목</th>
				<th scope="row">작성자</th>
			</tr>
		</table>
	</div>
	<div id="bbb"><button><a href="/erp/home/writeFrm" style="text-decoration: none;">글쓰기</a></button></div>
	</form>
	<div align="cneter" id="paging">${paging}</div>
	<div id="ccc">
		<select id="choice" style="height: 24px;">
			<option value=CB_NUM">번호</option>
			<option value="CB_WRITER">작성자</option>
			<option value="CB_TITLE">제목</option>
		</select>
		<input type="text" id="search" name="search" style="height: 18px;">
		<button id="searchbtn">검색</button>
	</div>
	
<script type="text/javascript">
	$(function(){
		var bList=${bList};
		var str="";
		for(var i=0; i<bList.length; i++){
			str+="<tr><td>"+bList[i].CB_NUM+"</td>";
			str+="<td><a style='text-decoration: none;' href='/erp/home/boardContents?CB_NUM="+bList[i].CB_NUM+"'>"+bList[i].CB_TITLE+"</a></td>";
			str+="<td>"+bList[i].CB_WRITER+"</td></tr>";
		}
		$("#List").append(str);
		console.log(bList);
	});
</script>
</body>
</html>
