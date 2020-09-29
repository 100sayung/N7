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
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
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
	
	<br />
	
	회사관리페이지 
	<h1>회사데이터 삭제 / 회사ERP권한 설정(이건 연결하는게 좋을듯)</h1>
	
	
	
	<div id="container"></div>
	<div id="paging"></div>
	
	
	<script> 
	//페이지 변경 스크립트
	
	var currPage = 1;
	function pageNumber(j){
		currPage = j;
		$.ajax({
			url:"/erp/rest/admin/companypagenumber",
			dataType:"json",
			method:"get",
			success : function(page){
				console.log(page);
				var pagecnt = (page/10) + 1;
				let str = "";
				for(let i = 1 ; i < pagecnt ; i++){
					if(i == currPage){
						str += " &nbsp; ["+ i +"] &nbsp; ";
					}else{
						str += " &nbsp; <a href=javascript:paging("+i+")>["+ i +"]</a> &nbsp; ";
					}
				}
				console.log(str);
				$("#paging").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}
	function paging(num){
		pageNumber(num);
		companylist(num);
	}
	
	function companylist(nowPage){
		$.ajax({
			url:"/erp/rest/admin/companylist",
			dataType:"json",
			data:{nowPage : nowPage, cntPerPage : "10"},
			method:"get",
			success : function(data){
				console.log(data);
				let str = "";
			 	str = "<table>"
				str += "<tr class='infomenu' style='height:75px'><td style='width:50px;'></td><td style='width:100px;'>회사이름</td>";
				str += "<td style='width:150px;'>회사코드</td><td style='width:200px;'>주소</td><td style='width:100px;'>대표자</td>";
				str += "<td style='width:100px;'>업태</td><td style='width:100px;'>분류</td>";
				str += "<td style='width:150px;'>전화번호</td><td style='width:160px;'>사업자번호</td><td style='width:75px;'>수정</td><tr>"
				for(let i = 0 ; i<data.length ; i++){
					str += "<tr class = '' id='"+data[i].c_code+"'>";					
					str += "<td>" + data[i].c_name +"</td>";
					str += "<td>" + data[i].c_code +"</td>";
					str += "<td>" + data[i].c_addr + "</td>";
					str += "<td>" + data[i].c_ceo + "</td>";
					str += "<td>" + data[i].c_kind + "</td>";
					str += "<td>" + data[i].c_kind2 + "</td>";
					str += "<td>" + data[i].c_phonenum + "</td>";
					str += "<td>" + data[i].c_comnum + "</td>";
					str += "<td><button class='infobtn' onclick='deleteCompany(\""+data[i].c_code+"\")'>제거</button><br/>";					
					str += "</tr>"
				}
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}	
		});
	}
	
	companylist(1);
	pageNumber(1);
	
	</script>
	<script>
		function deleteCompany(cCode){
			console.log(cCode);
			alert("전부삭제 해야함");
		}
		function updateFunction(cCode){
			alert("managermode 연동 시켜야해" + cCode);
		}
	
	</script>
</body>
</html>