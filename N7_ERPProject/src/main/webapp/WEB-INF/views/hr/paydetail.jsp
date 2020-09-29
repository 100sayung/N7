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
#payinputmodify{
	border: 1px solid black;
	border-collapse: collapse;
}
table{
	border: 1px solid black;
	border-collapse: collapse;
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
	<div id="description">
	<div class="divcss">사원 급여 상세정보</div>
	<form action="searchpaymm" method="post" name="payroll">
	<input type="hidden" value="${card.hc_ccode}" name="HP_CCODE">
	<table id="payinputmodify" style="align-self: center; width: 800px;height: 100px;" >
		<tr>
			<td>사원코드 : </td>
			<td><input id="hrcode" name="hrcode" style="border: none;" type="text" readonly="readonly" value="${card.hc_hrcode}"></td>
			<td>이름 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${name}"></td>
			<td>입사일 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_joindate}"></td>
		</tr>
		<tr>
			<td>부서 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_position}"></td>
			<td>직급 : </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_dept}"></td>
			<td>급여일 : </td>
			<td><input type="month" id="month" name="month"></td>
		</tr>				
	</table>
	</form>
	<div id="detailpage">
	</div>
	<input type="button" onclick="moving()" value="확인">
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
		function moving(){
			location.href="/erp/hr/searchpaymm";
		}
	
		//달력이 변경되면 정보 출력
		$("#month").change(function(){
			var month=$(this).val();
			var hrcode=$("#hrcode").val();
			$.ajax({
				url:"/erp/hr/findmonth",
				method:'POST',
				data:{month : month ,hrcode : hrcode},
				dataType:"json",
				success:function(data){
					var provide=Number(data.HDP_PAY)+Number(data.HP_INCEN);
					var ince=Number(data.HP_INSURANCE)+Number(data.HP_TAX);
					var receive=provide-ince;
					var str='';
					console.log(data);
					if(data!="1"){
						str+="<table style='width:800px; height:300px; border:1px solid black;'><tr>"
							+"<td>지급내역</td>"
							+"<td>지급액</td>"
							+"<td>공제내역</td>"
							+"<td>공제액</td></tr>"
							+"<tr><td>기본급</td>"
							+"<td>"+data.HDP_PAY+"</td>"
							+"<td>보험</td>"
							+"<td>"+data.HP_INSURANCE+"</td></tr>"
							+"<tr><td>인센티브</td>"
							+"<td>"+data.HP_INCEN+"</td>"
							+"<td>소득세</td>"
							+"<td>"+data.HP_TAX+"</td></tr>"
							+"<tr><td></td>"
							+"<td></td>"
							+"<td>공제액계</td>"
							+"<td>"+ince+"</td></tr>"
							+"<td>급여 계</td>"
							+"<td>"+provide+"</td>"
							+"<td>실지급액</td>"
							+"<td>"+receive+"</td></tr></table>"
					}else if(data=="1"){
						str+="<h1>해당 월에는 받은 급액이 없습니다.</h1>";
					}
					$("#detailpage").html(str);
				},
				error:function(err){
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
		
	</script>
</body>
</html>