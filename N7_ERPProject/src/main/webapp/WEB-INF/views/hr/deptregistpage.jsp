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
	width: 800px;
}

ul {
	list-style: none;
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
				<a href="#">N7 ERP SYSTEM</a>
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
			<li id="showMenu1">인사 관리
				<ul id="smallMenu1" style="display: none;">
					<li><a href="/erp/hr/deptregistpage">부서등록</a></li>
					<li><a href="/erp/hr/movehrcardpage">인사카드</a></li>
				</ul>
			</li>

			<li id="showMenu2">근태 관리
				<ul id="smallMenu2" style="display: none;">
					<li><a href="/erp/hr/receiptholiday">휴가 접수</a></li>
					<li><a href="/erp/hr/attendance">사원 출결 관리</a></li>
					<li><a href="/erp/hr/employeestatus">근무 조회</a></li>
					<li><a href="/erp/hr/retiremm">휴/퇴직 관리</a></li>
				</ul>
			</li>
			<li id="showMenu3">급여 관리
				<ul id="smallMenu3" style="display: none;">
					<li><a href="/erp/hr/deptpay">부서/직급별 급여</a></li>
					<li><a href="/erp/hr/deduct">공제사항 관리</a></li>
					<li><a href="/erp/hr/searchpaymm">급여 관리</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="description">

	<h1 align="center">부서 등록 페이지</h1>
	<form action="/erp/hr/deptregistinsert" name="deptregistinsert" method="post" accept-charset="utf-8">
		<button>등록</button>
		<table id="depttable">
			<tr>
				<td>부서 :</td>
				<td><input type="text" name="HDP_position" id="position"></td>
				<td>직책 :</td>
				<td><input type="text" name="HDP_dept" id="dept"></td>
			</tr>
		</table>
		${failure}
	</form>
<!-- 	<button type="button" id="deptbutton">+부서등록추가</button> -->
	</div>
</body>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
<script>
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

// 	$("#deptbutton")
// 			.click(
// 					function() {
// 						$("#depttable")
// 								.append(
// 										"<tr>"
// 												+ "<td>부서 : </td>"
// 												+ "<td><input type'text' name='HDP_position' id='position'></td>"
// 												+ "<td>직책 : </td>"
// 												+ "<td><input type'text' name='HDP_dept' id='dept'></td>"
// 												+ "</tr>");
// 					});

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
