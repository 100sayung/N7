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
.List {
border-collapse: collapse;
border-top: 3px solid #168;
}  
.List th {
color: #168;
background: #f0f6f9;
text-align: center;
}
.List th, .List td {
padding: 10px;
border: 1px solid #ddd;
}
.List th:first-child, .List td:first-child {
border-left: 0;
}
.List th:last-child, .List td:last-child {
border-right: 0;
}
.List tr td:first-child{
text-align: center;
}
#paging{
display: block;
text-align: center;
margin-top: 15px;
margin-left: 50px; 
padding-bottom: 12px; 
}
 #bbb{
float: right;
margin-top: 10px;
}
#ccc{
position:relative;
float: right;
margin-top: 10px;
padding-bottom: 20px;
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
	<div style='width:100%; height:50px; text-align:center; background-color: #3D6B9B;'><h1 style='color:white'>ERP상담게시판</h1></div>
	<div class="center">
        <div id="container">
        <br>
<br>
	<form action="erpboard">
	<div id="a">
<!-- 		<h2>상담 게시판</h2> -->
		<table class="List">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</table>
	</div>
   <div id="bbb"><button><a href="/erp/home/writeFrm" style="text-decoration: none;">글쓰기</a></button></div> 
	</form>
	<div align="cneter" id="paging">${paging}</div>
 	<div id="ccc">
		<select id="choice" style="height: 24px;">
			<option value="CB_TITLE">제목</option>
			<option value="CB_WRITER">작성자</option>
			<option value="CB_NUM">번호</option>
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
		$(".List").append(str);
		console.log(bList);
	});
	
	$("#searchbtn").click(function(){
		var choice= $("#choice").val();
		var search= $("#search").val();
		console.log(choice);
		console.log(search);
		$.ajax({
			url: '/erp/rest/home/boardSearch',
			type: 'post',
			data: "choice="+choice+"&search="+search,
			dataType: 'json',
			success: function(data){
				 var bList=${bList};
				 var str="";
				 str+="<tr style='background-color: #3D6B9B; width: 350px; color:white;'><th scope='row'>번호</th><th scope='row'>제목</th><th scope='row'>작성자</th></tr>";
				 if(data.bList!=""){
					 console.log(bList);
					 for(var i in data.bList){
						 str+="<tr><td>"+bList[i].CB_NUM+"</td>";
						 str+="<td><a style='text-decoration: none;' href='/erp/home/boardContents?CB_NUM="+bList[i].CB_NUM+"'>"+bList[i].CB_TITLE+"</a></td>";
						 str+="<td>"+bList[i].CB_WRITER+"</td></tr>";
						}
						$(".List").html(str);
						//console.log(bList);
				 }else{
					alert("데이터가 없습니다.");
				 }
			 },
			error: function(err){
				console.log(err);
			}
		});
	});
</script>
</body>
</html>
