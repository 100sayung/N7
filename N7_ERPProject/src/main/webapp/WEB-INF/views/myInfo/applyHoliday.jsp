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
.attendance{
	border: 1px solid black;
}
#menu2 {
	font-size: medium;
	}
</style>
</head>
<body>
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
			<li><a href="/erp/myInfo/myInfo">내 정보 보기</li>
			<li><a href="/erp/myinfo/checkattendance">출/퇴근 등록</a></li>
			<li><a href="/erp/myinfo/myPaycheck">급여명세서 보기</li>
			<li><a href="/erp/myinfo/myattendance">내 출결 보기</li>
			<li><a href="/erp/myinfo/myholiday">내 휴가 보기</li>
			<li><a href="/erp/myinfo/applyholiday">휴가신청</a></li>
			<li id="showMenu1">나의 결재함</li>
			<ul id="menu2" style="display: none;">
				<li>내가 올린 결재함</li>
				<ul id="smenu3" style="display: none;">
				<li id="apupPayment">진행중</li>
				<li id="apupBackpayment">반려</li>
				<li id="apupFinalpayment">결재완료</li>
				</ul>
				<li id="apdownPayment">내가 받은 결재함</li>
				<li id="acTemporary">임시저장 결재함</li>
			</ul>
		</ul>
	</div>
	<div id="description"> 
	<button id="approval" class="goodbtn">결재자등록</button>
	<form action="/erp/hr/applyholiday" method="post">
	<table style='text-align: center;'>
	<tr><td class='infomenu'>결재자</td><td><div id='line'></div></td></tr>
	<tr class='infomenu'>
		<td>문서제목</td><td>휴가종류</td>
	</tr><tr>
		<td><input type="text" name="hap_docuname" placeholder="문서 제목을 입력해주세요 글자제한 20자" required="required" style="width:300px;"></td>
		<td><input type="text" name="hap_type" placeholder="휴가 종류를 입력해주세요 글자제한 20자" required="required"  style="width:300px;"></td>
	</tr><tr class='infomenu'>
		<td>휴가시작일</td><td>휴가종료일</td>
	</tr><tr>
		<td><input type="date" name="hap_startday" required="required" id="start" style="width:300px;"></td>
		<td><input type="date" name="hap_endday" required="required" onchange='checkDateValue(start, end);' id="end" style="width:300px;"></td>
	</tr><tr>
		<td colspan='2' class='infomenu'>사유</td>
	</tr><tr>
		<td colspan='2'><textarea rows="10" cols="10" name="hap_reason" style="width:620px; heigth:1000px; resize:none;"></textarea></td>
	</tr>
	</table>
	<input type="submit" class='infobtn' value="제출">
	</form>
	</div>
	
	
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
	<script>
	   $("#showMenu1").hover(function() {
			$("#menu2").attr("style", "display:inline-block");
		});
		
		$("#menu2").hover(function() {
			$("#smenu3").attr("style", "display:inline-block");
		});

		$("#apupFinalpayment").click(function() {
			$.ajax({
				url : '/erp/Account/apupFinalpayment',
				type : 'get',
				success : function(data) {
					$("#description").html(data);
				},
				error : function() {
				}
			});

		});
		
		$("#apupBackpayment").click(function() {
			$.ajax({
				url : '/erp/Account/apupBackpayment',
				type : 'get',
				success : function(data) {
					$("#description").html(data);
				},
				error : function() {
				}
			});

		});
		
		$("#apupPayment").click(function() {
			$.ajax({
				url : '/erp/Account/apupPayment',
				type : 'get',
				success : function(data) {
					$("#description").html(data);
				},
				error : function() {
				}
			});

		});

		$("#apdownPayment").click(function() {
			$.ajax({
				url : '/erp/Account/apdownPayment',
				type : 'get',
				success : function(data) {
					$("#description").html(data);
				},
				error : function() {
				}
			});

		});

		$("#acTemporary").click(function() {
			$.ajax({
				url:'/erp/Account/acTemporary',
				success:function(data) {
					console.log(data);
					$("#description").html(data);
				},
				error : function(err) {
					console.log(err);
				}
			});

		});
	
	function setChildValue(data) {
		console.log(data);
		if (data.tList1 != "") {
		var str = "";
			for ( var i in data.tList1) {
		        str +="<input type='text' name='hap_toapprover' value='"+data.tList1[i].hc_hrcode+"' hidden='true'>";
				str +=data.tList1[i].hc_position+"/" + data.tList1[i].m_name;
			}
			console.log(str)
			$("#line").append(str);
		};
	};

		
	$(document).ready(function() {
		$.ajax({
			url : "/erp/rest/hr/myleaderlist",
			dataType : "json",
			method : "get",
			success : function(data){
				console.log(data);
				var str = "<td><select name='hap_toapprover'>";
				for(let i = 0 ; i<data.length ; i++){
					str += "<option value='"+data[i].hr_hrcode+"' selected='selected'>"+data[i].m_name+"("+data[i].hc_position+")</option>";
					}
				str += "</select>"
				$("#myleader").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	});
	$("#approval").click(function() {
		console.log("123");
		window.open('/erp/hr/approvalLine', 'approvalLine', 'width=1400,height=700');
	});
	

	function replaceAll(str, searchStr, replaceStr) {
	    return str.split(searchStr).join(replaceStr);
	 }
	

	function checkDateValue(val1, val2){
		let date1 = Number(replaceAll(val1.value, "-", ""));
		let date2 = Number(replaceAll(val2.value, "-", ""));
		if(date1>date2){
			alert("종료일은 시작일보다 이전일 수 없습니다.");
			val2.value = "";
		}
	}

	</script>
</body>
</html>
