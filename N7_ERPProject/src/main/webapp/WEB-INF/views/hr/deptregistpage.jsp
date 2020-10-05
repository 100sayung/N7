<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
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
	border-right: 1px solid #E6E6E6;
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

#description {
	float: left;
	height: 100%;
	width: 1000px;
}

ul {
	list-style: none;
}
#depttable,td{
	
	margin:auto;
	text-align:center;
	border-collapse: collapse;
	border: 1px solid #D9EDF7;
}
#dept{
	padding: 5px 50px;
}
</style>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
%>
	
	<div id="header">
		<div id="logo">
			<h1>
				<a href="/erp/myInfo/myInfo">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu">
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
					<li><a href="/erp/hr/deptregistpage">부서등록</a></li>
					<li><a href="/erp/hr/movehrcardpage">인사카드</a></li>
			<div id="hrMenu"></div>
		</ul>
	</div>
	<div id="description">
	<div class="first_div_css">
		<Strong class="deptregist_color_size">부서 등록</Strong>
	</div>
	<form action="/erp/hr/deptregistinsert" name="deptregistinsert" method="post" accept-charset="utf-8">
		<table id="depttable" width="100%">
			<tr style="background-color: #F8F7F7;">
				<td>부서 </td>
				<td><span id="positionS"></span></td>
				<td>직책 </td>
				<td><input type="text" name="HDP_position" id="position"></td>
				<td><button class="infobtn">등록</button></td>
			</tr>
		</table>
	</form>
<!-- 	<button type="button" id="deptbutton">+부서등록추가</button> -->
	</div>
</body>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
<script>

$(document).ready(function(){
	$.ajax({
		url:"/erp/rest/hr/ourdept",
		dataType:"json",
		method:"get",
		success : function(data){
			console.log(data);
			let str = "";
			str += "<select name='HDP_dept' id='dept'>";
			for(let i = 0 ; i < data.length ; i++){
				str += "<option value='"+data[i].au_name+"'>"+data[i].au_name+"</option>";
			}
			str += "</select>";
			$("#positionS").html(str);
		}, error : function(err){
			console.log(err);
		}
		
	});
});

$("#showMenu1").hover(function() {
	$("#smallMenu1").attr("style", "display:inline-block");
}, function() {
	$("#smallMenu1").attr("style", "display:none");
})
$("#showMenu2").hover(function() {
	$("#smallMenu2").attr("style", "display:inline-block");
}, function() {
	$("#smallMenu2").attr("style", "display:none");
})
$("#showMenu3").hover(function() {
	$("#smallMenu3").attr("style", "display:inline-block");
}, function() {
	$("#smallMenu3").attr("style", "display:none");
})


	$("#showMenu1").hover(function() {
		$("#smallMenu1").attr("style", "display:inline-block");
	}, function() {
		$("#smallMenu1").attr("style", "display:none");
	})
	$("#showMenu2").hover(function() {
		$("#smallMenu2").attr("style", "display:inline-block");
	}, function() {
		$("#smallMenu2").attr("style", "display:none");
	})
	$("#showMenu3").hover(function() {
		$("#smallMenu3").attr("style", "display:inline-block");
	}, function() {
		$("#smallMenu3").attr("style", "display:none");
	})

	function modifyDetail(id) {
		window.open('/erp/hr/hrModifyDetail?id=' + id, '사원 인사카드 등록',
				'width=700, height=800')
	}
	window.onbeforeunload = function() {
		window.reload();
	}
</script>
</body>
</html>
