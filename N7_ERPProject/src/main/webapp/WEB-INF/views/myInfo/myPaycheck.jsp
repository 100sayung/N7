<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>내 급여 명세서 보기</title>
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
	width: 1000px;
}

ul {
	list-style: none;
}
.leftmoney{
	text-align: right;
}
table,td{
	border-collapse: collapse;
}
</style>
</head>
<body onload="build();">
	<div id="header">
		<div id="logo">
			<h1>
				<a href="/erp/myInfo/myInfo">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu"></ul>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="/erp/myInfo/myInfo">내 정보 보기</li>
			<div id="myInfoMenu">
			</div>
			<li id="showMenu1">나의 결재함</a></li>
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
		<div class="first_div_css">
			<Strong class="deptregist_color_size">내 급여 명세서 보기</Strong>
		</div>
	<table style="border: 1px solid #D9EDF7; width: 1000px; height: 100px; text-align: center;">
		<tr>
			<td class="font_color_paydetail">사원코드  </td>
			<td>${paycheck.hc_hrcode}</td>
			<td class="font_color_paydetail">이름  </td>
			<td>${paycheck.m_name}</td>
			<td class="font_color_paydetail">입사일  </td>
			<td>${paycheck.hc_joindate}</td>
		</tr>
		<tr>
			<td class="font_color_paydetail">부서  </td>
			<td>${paycheck.hc_dept}</td>
			<td class="font_color_paydetail">직급  </td>
			<td>${paycheck.hc_position}</td>
			<td class="font_color_paydetail">급여일</td>
			<td><input type="month" id="month" name="month"></td>
		</tr>
	</table>	
	<div id="paycheckpage">
		
	</div>
	</div>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
	<script>
		$("#month").change(function(){
			var month=$("#month").val();
			console.log(month);
			
			$.ajax({
				url:"/erp/myinfo/paycheckselect",
				method:'POST',
				data:{month : month},
				dataType:'JSON',
				success:function(data){
					if(data!="1"){
					console.log(data);
					var provide=Number(data.HDP_PAY)+Number(data.HP_INCEN);
					var ince=Number(data.HP_INSURANCE)+Number(data.HP_TAX);
					var receive=provide-ince;
					var str='';
						str+="<table style='border:1px solid #D9EDF7;width:1000px;height:300px; text-align: center;'><tr>"
							+"<td class='font_color_paydetail'>지급내역<td>"
							+"<td class='font_color_paydetail'>지급액<td>"
							+"<td class='font_color_paydetail'>공제내역<td>"
							+"<td class='font_color_paydetail'>공제액<td></tr>"
							+"<tr><td class='font_color_paydetail'>기본급<td>"
							+"<td class='leftmoney'>"+data.HDP_PAY+"<td>"
							+"<td class='font_color_paydetail'>보험<td>"
							+"<td class='leftmoney'>"+data.HP_INSURANCE+"<td></tr>"
							+"<tr><td class='font_color_paydetail'>인센티브<td>"
							+"<td class='leftmoney'>"+data.HP_INCEN+"<td>"
							+"<td class='font_color_paydetail'>소득세<td>"
							+"<td class='leftmoney'>"+data.HP_TAX+"<td></tr>"
							+"<tr><td class='font_color_paydetail'><td>"
							+"<td><td>"
							+"<td class='font_color_paydetail'>공제액계<td>"
							+"<td class='leftmoney'>"+ince+"<td></tr>"
							+"<tr><td class='font_color_paydetail'>급여 계<td>"
							+"<td class='leftmoney'>"+provide+"<td>"
							+"<td class='font_color_paydetail'>실지급액<td>"
							+"<td class='leftmoney'>"+receive+"<td></tr>"
					$("#paycheckpage").html(str);
					}else if(data=="1"){
						$("#paycheckpage").html("<h1 align='center'>선택한 날짜에는 받은 급여가 없습니다.</h1>");
					}
				},
				errorr:function(err){
					console.log(err);
					alert('이 달에 받은 급여가 없네요');
				}
			});
		});	
	</script>
</body>
</html>