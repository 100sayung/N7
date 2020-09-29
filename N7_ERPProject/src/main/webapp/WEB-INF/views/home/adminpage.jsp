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
	<style>
.button {
	color: #ffffff;
}

#description div {
	border-radius: 25px;
	background-color: rgb(85, 82, 82);
	width: 200px;
	margin: 5px;
	height: 150px;
	float: left;
	line-height: 150px;
}

#description div:hover {
	background-color: #eeeeee;
	border: 1px solid black;
}

#description {
	margin-left: 340px;
	margin-top: 200px;
}

#desc {
margin-left: 200px;
	font-size: 20px;
	font-weight: bolder;
}

</style>
</head>

<body>
	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/adminpage">ERP 등록</a></li>
				<li><a href="/erp/companymanager" accesskey="3" title="">회사 관리</a></li>
				<li><a href="/erp/membermanager" accesskey="4" title="">회원 관리</a></li>
			</ul>
		</div>
	</div>
	
	<div id="container"></div>
	
	<script>
	$(document).ready(function(){
		$.ajax({
			url:"/erp/rest/admin/companytemp",
			dataType:"json",
			method:"get",
			success : function(data){
				console.log(data);
				let str = "";
			 	str = "<table>"
				str += "<tr class='infomenu' style='height:75px'><td style='width:100px;'>회사이름</td>";
				str += "<td style='width:150px;'>회사코드</td><td style='width:200px;'>주소</td><td style='width:100px;'>대표자</td>";
				str += "<td style='width:100px;'>업태</td><td style='width:100px;'>분류</td>";
				str += "<td style='width:150px;'>전화번호</td><td style='width:160px;'>사업자번호</td><td style='width:75px;'>수정</td><tr>"
				for(let i = 0 ; i<data.length ; i++){
					str += "<tr class = '' id='"+data[i].ct_code+"'>";					
					str += "<td>" + data[i].ct_name +"</td>";
					str += "<td>" + data[i].ct_code +"</td>";
					str += "<td>" + data[i].ct_addr + "</td>";
					str += "<td>" + data[i].ct_ceo + "</td>";
					str += "<td>" + data[i].ct_kind + "</td>";
					str += "<td>" + data[i].ct_kind2 + "</td>";
					str += "<td>" + data[i].ct_phonenum + "</td>";
					str += "<td>" + data[i].ct_comnum + "</td>";
					str += "<td><button class='infobtn' onclick='deleteCompany(\""+data[i].ct_code+"\")'>등록</button><br/>";					
					str += "<button class='infobtn' onclick='updateFunction(\""+data[i].ct_code+"\")'>거부</button></td>";	
				}
				str += "</tr>";
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	});
	</script>
</body>
</html>