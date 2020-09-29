<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
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

#description {
	float: left;
	height: 100%;
	width: 800px;
}

ul {
	list-style: none;
}

.menu{
	width:200px;
}
</style>
</head>
<body>
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
<div>
<div class="divcss">사원 출퇴근 상태 조회</div>
	<input type="text" id="nameSearch" placeholder="이름으로 검색"> 
	<button onclick="searchFromName()" class="infobtn" id="nameSearching" style="margin-right: 200px;">검색</button>
	<button onclick="searchFromStatus(1)" class="infobtn">출근중</button><button onclick="searchFromStatus(0)" class="infobtn">퇴근중</button>
	<div id ="container">

	</div>

	 </div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>

	$(document).ready(function() {
		$.ajax({
			url:"/erp/rest/hr/employeestatus",
			dataType:"json",
			method:"get",
			success : function(data){
				let str = "<table>";
				str += "<tr class='infomenu'><td class='menu'>부서</td><td class='menu'>직책</td><td class='menu'>이름</td><td style='width:150px;'>상태</td></tr>";
				for(let i = 0 ; i<data.length ; i++){
					str += "<tr><td>" + data[i].hc_dept + "</td><td>" + data[i].hc_position + "</td><td>" +data[i].m_name + "</td><td>";
					if(data[i].hc_status == 1){
						str += "<font style='color:blue;'>출근</font>";
					}else{
						str += "<font style='color:red;'>퇴근</font>";
					}
					str += "</td></tr>";
				}
				str +="</table>"
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	});


	function searchFromStatus(status){
		$.ajax({
			url:"/erp/rest/hr/searchfromstatus",
			data:{status:status},
			dataType:"text",
			method:"get",
			success : function(data){
				console.log(data);
				makeContainer(data);	
			}, error : function(err){
				console.log(err);
			}
		});
	}
	
	
	function searchFromName(){
		$name = $("#nameSearch").val();
		console.log($name);
		$.ajax({
			url:"/erp/rest/hr/searchstatusfromname",
			data:{name:$name},
			dataType:"text",
			method:"get",
			success : function(data){
				console.log(data);
				makeContainer(data);	
			}, error : function(err){
				console.log(err);
			}
		});
	}
	

	function makeContainer(data){
		data = JSON.parse(data);
		let str = "<table>";
		str += "<tr class='infomenu'><td class='menu'>부서</td><td class='menu'>직책</td><td class='menu'>이름</td><td style='width:150px;'>상태</td></tr>";
		for(let i = 0 ; i<data.length ; i++){
			str += "<tr><td>" + data[i].hc_dept + "</td><td>" + data[i].hc_position + "</td><td>" +data[i].m_name + "</td><td>";
			if(data[i].hc_status == 1){
				str += "<font style='color:blue;'>출근</font>";
			}else{
				str += "<font style='color:red;'>퇴근</font>";
			}
			str += "</td></tr>";
		}
		str +="</table>"
		$("#container").html(str);
	}
	//09-24 change   append   id=nameSearching
	$("#nameSearch").keyup(function(event){
		if(event.keyCode==13){
			$("#nameSearching").click();
		}
	});
	///////
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

	</script>
</body>
</html>
