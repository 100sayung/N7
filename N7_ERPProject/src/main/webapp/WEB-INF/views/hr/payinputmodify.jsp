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
table {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	width: 100px;
	height: 30px;
}

tr {
	text-align: center;
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
					<li><a href="">휴가 접수</a></li>
					<li><a href="">사원 출결 관리</a></li>
					<li><a href="">근무 조회</a></li>
					<li><a href="">휴/퇴직 관리</a></li>
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
	<h1>직원 급여명세서 입력 및 수정</h1>
	<form action="searchpaymm" method="post" name="payroll" onsubmit="return checkpayinputmodify()">
	<input type="hidden" value="${card.hc_ccode}" name="HC_CCODE">
	<table id="payinputmodify" style="align-self: center; width: 800px; height: 100px;" >
		<tr>
			<td>직원코드 : </td>
			<td><input style="border: none;" type="text" name="HC_HRCODE" readonly="readonly" value="${card.hc_hrcode}"></td>
			<td>이름 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${name}"></td>
			<td>입사일 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_joindate}"></td>
		</tr>
		<tr>
			<td>부서 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_dept}"></td>
			<td>직급 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_position}"></td>
			<td>급여일 : </td>
			<td><input id="HP_PAYDATE" type="month" name="HP_PAYDATE"></td>
		</tr>				
	</table>
	<table style="margin-top: 30px; width: 800px; align-items: center; height: 300px;" >
		<tr class="tr_chart_color">
			<td>지급내역</td>
			<td>지급 액</td>
			<td>공제내역</td>
			<td>공제액</td>
		</tr>
		<tr>
			<td>기본급</td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${pay.HDP_PAY}" class="rightinput"></td>
			<td>${deduct[0].HDD_NAME}</td>
			<td><input id="insurance" autocomplete="off" type="text" name="HP_INSURANCE" required="required"
						 value="${deduct[0].HDD_AMOUNT}" onkeypress="return checkinsurance(event)" min="0" class="rightinput"></td>
		</tr>
		<tr>
			<td>인센티브</td>
			<td><input id="incen" autocomplete="off" type="text" required="required" value="0"
					 name="HP_INCEN" onkeypress="return checkincen(event)" min="0" class="rightinput"></td>
			<td>${deduct[1].HDD_NAME}</td>
			<td><input id="tax" autocomplete="off" type="text" name="HP_TAX" required="required"
			 value="${deduct[1].HDD_AMOUNT}" onkeypress="return checktax(event)" min="0" class="rightinput"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>공제액계</td>
			<td><input id="deductsum" style="border: none;" type="text" readonly="readonly" value="${pay.HDD_AMOUNT}" class="rightinput"></td>
		</tr>
		<tr>
			<td>지급액 계</td>
			<td><input id="provide" style="border: none;" type="text" readonly="readonly" value="0" class="rightinput"></td>
			<td>실수령액</td>
			<td><input id="receive" style="border: none;" type="text" readonly="readonly" value="0" name="HP_REALMONEY" class="rightinput"></td>
		</tr>
	</table>
	<div class="centertype">
	<input type="submit" value="확인" id="ok" class="cssbutton">
	<a href="/erp/hr/searchpaymm" class="cssbutton" style="padding: 6px 20px;">돌아가기</a>
	</div>
	</form>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
		//input창 클릭스 해당 창 문자 전체 선택
		$("#incen").click(function(){
			$(this).select();
		});
		$("#insurance").click(function(){
			$(this).select();
		});
		$("#tax").click(function(){
			$(this).select();
		});
		
		//금액 실시간 변경
		$("#incen").change(function(){
			console.log($("#incen").val());
			var total=Number($(this).val())+${pay.HDP_PAY};
			$("#provide").val(total);
			
			var power=Number($("#incen").val())+${pay.HDP_PAY}-Number($("#tax").val())-Number($("#insurance").val());
			$("#receive").val(power);
		});
		$("#insurance").change(function(){
			var sum=Number($(this).val())+Number($("#tax").val());
			console.log(sum);
			$("#deductsum").val(sum);
			
			var power=Number($("#incen").val())+${pay.HDP_PAY}-Number($("#tax").val())-Number($("#insurance").val());
			$("#receive").val(power);
		});
		$("#tax").change(function(){
			var sul=Number($(this).val())+Number($("#insurance").val());
			console.log(sul);
			$("#deductsum").val(sul);
			
			var power=Number($("#incen").val())+${pay.HDP_PAY}-Number($("#tax").val())-Number($("#insurance").val());
			$("#receive").val(power);
		});
		//맨처음 화면 나올때 총 수령액
		$(document).ready(function(){
			var sul=Number($(this).val())+Number($("#insurance").val());
			console.log(sul);
			$("#deductsum").val(sul);
			
			var power=Number($("#incen").val())+${pay.HDP_PAY}-Number($("#tax").val())-Number($("#insurance").val());
			$("#receive").val(power);
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
		
		
		function checkpayinputmodify(){
			if($("#HP_PAYDATE").val()==""){
				alert("급여일을 안고르셨습니다 선택해주세요.");
				return false;
			}
		}
		//숫자만 입력 가능하게
		$("#insurance").keyup(function(){
			var inputVal=$(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		});
		$("#incen").keyup(function(){
			var inputVal=$(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		});
		$("#tax").keyup(function(){
			var inputVal=$(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		});
	</script>
</body>
</html>