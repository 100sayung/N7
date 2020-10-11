<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>사원 급여 입력및 수정</title>
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
	width: 1150px;
}

ul {
	list-style: none;
}
table {
	border: 1px solid #D9EDF7;
	border-collapse: collapse;
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
				<li><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu"></ul>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
					<li><a href='/erp/hr/receiptholiday'>휴가 접수</a></li>
					<li><a href='/erp/hr/attendance'>사원 출결 관리</a></li>
					<li><a href='/erp/hr/employeestatus'>근무 조회</a></li>
					<li><a href='/erp/hr/retiremm'>휴/퇴직 관리</a></li>
					<li><a href='/erp/hr/deptpay'>부서/직책 관리</a></li>
					<li><a href='/erp/hr/deduct'>공제사항 관리</a></li>
					<li><a href='/erp/hr/searchpaymm'>급여 관리</a></li>
		</ul>
	</div>
	<div id="description">
	<div class="first_div_css">
		<h1 class="deptregist_color_size">사원 급여 상세정보</h1>
	</div>
	<form action="searchpaymm" method="post" name="payroll" onsubmit="return checkpayinputmodify()">
	<input type="hidden" value="${card.hc_ccode}" name="HC_CCODE">
	<table id="payinputmodify" style="text-align: center; width: 1150px; height: 100px;" >
		<tr>
			<td class="font_color_paydetail">직원코드  </td>
			<td><input style="border: none;" type="text" name="HC_HRCODE" readonly="readonly" value="${card.hc_hrcode}"></td>
			<td class="font_color_paydetail">이름  </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${name}"></td>
			<td class="font_color_paydetail">입사일  </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_joindate}"></td>
		</tr>
		<tr>
			<td class="font_color_paydetail">부서  </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_dept}"></td>
			<td class="font_color_paydetail">직급  </td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${card.hc_position}"></td>
			<td class="font_color_paydetail">급여일  </td>
			<td><input id="HP_PAYDATE" type="month" name="HP_PAYDATE"></td>
		</tr>
	</table>
	<table style="margin-top: 30px; width: 1150px; text-align: center; height: 300px;" >
		<tr>
			<td class="font_color_paydetail">지급내역</td>
			<td class="font_color_paydetail">지급 액</td>
			<td class="font_color_paydetail">공제내역</td>
			<td class="font_color_paydetail">공제액</td>
		</tr>
		<tr>
			<td class="font_color_paydetail">기본급</td>
			<td><input style="border: none;" type="text" readonly="readonly" value="${pay.HDP_PAY}"></td>
			<td class="font_color_paydetail">${deduct[0].HDD_NAME}</td>
			<td><input id="insurance" autocomplete="off" type="text" name="HP_INSURANCE" required="required"
						 value="${deduct[0].HDD_AMOUNT}" min="0"></td>
		</tr>
		<tr>
			<td class="font_color_paydetail">인센티브</td>
			<td><input id="incen" autocomplete="off" type="text" required="required" value="0"
					 name="HP_INCEN" min="0"></td>
			<td class="font_color_paydetail">${deduct[1].HDD_NAME}</td>
			<td><input id="tax" autocomplete="off" type="text" name="HP_TAX" required="required"
			 value="${deduct[1].HDD_AMOUNT}" min="0"></td>
		</tr>
		<tr>
			<td class="font_color_paydetail">연차수당</td>
			<td id="monthlybonustd">
			<input type="checkbox" id="checkbonus"> 연차수당 지급
			<input type="hidden" id="monthlybonus" name="HP_MONTHLYBONUS" style="border: none;" type="text" readonly="readonly" value="0">
			</td>
			<td class="font_color_paydetail">공제액계</td>
			<td><input id="deductsum" style="border: none;" type="text" readonly="readonly" value="${pay.HDD_AMOUNT}"></td>
		</tr>
		<tr>
			<td class="font_color_paydetail">지급액 계</td>
			<td><input id="provide" style="border: none;" type="text" readonly="readonly" value="0"></td>
			<td class="font_color_paydetail">실수령액</td>
			<td><input id="receive" style="border: none;" type="text" readonly="readonly" value="0" name="HP_REALMONEY"></td>
		</tr>
	</table>
		<div align="center" style="margin-top: 30px;">
			<input type="submit" value="확인" id="ok" class="infobtn">
			<a href="/erp/hr/searchpaymm" class="infobtn" style="padding: 6px 20px;">돌아가기</a>
		</div>
	</form>
	</div>
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
		$("#checkbonus").click(function(){
			console.log("왜 안 돼?");
			if($("#checkbonus").is(":checked")){
				if(confirm("연차수당을 지급하시겠습니까?")){
					var input = (${pay.HDP_PAY}/200 *8)
					console.log(input);
					input = input*${holynum};
					console.log(input);
					let str = "";
					str = '<input id="monthlybonus" name="HP_MONTHLYBONUS" style="border: none;" type="text" readonly="readonly" value="'+input+'">';
					console.log("확인");
					$("#monthlybonustd").html(str);
					let provide = $("#provide").val();
					provide = (provide*1) + (input*1);
					$("#provide").val(provide);
					var power=Number($("#incen").val())+${pay.HDP_PAY}-Number($("#tax").val())-Number($("#insurance").val())+($("#monthlybonus").val()*1);
					$("#receive").val(power);
				}else{
					alert("취소되었습니다.");
				}
			}
		});
		//금액 실시간 변경 
		
		$("#incen").change(function(){
			console.log($("#incen").val());
			var total=Number($(this).val())+${pay.HDP_PAY}+($("#monthlybonus").val()*1);
			$("#provide").val(total);

			var power=Number($("#incen").val())+${pay.HDP_PAY}-Number($("#tax").val())-Number($("#insurance").val())+($("#monthlybonus").val()*1);
			$("#receive").val(power);
		});
		$("#insurance").change(function(){
			var sum=Number($(this).val())+Number($("#tax").val());
			console.log(sum);
			$("#deductsum").val(sum);

			var power=$("#provide").val()-Number($("#tax").val())-Number($("#insurance").val());
			$("#receive").val(power);
		});
		$("#tax").change(function(){
			var sul=Number($(this).val())+Number($("#insurance").val());
			console.log(sul);
			$("#deductsum").val(sul);

			var power=$("#provide").val()-Number($("#tax").val())-Number($("#insurance").val());
			$("#receive").val(power);
		});
		//맨처음 화면 나올때 총 수령액
		$(document).ready(function(){
			$("#provide").val("${pay.HDP_PAY}"*1);
			var sul=Number($(this).val())+Number($("#insurance").val())+Number($("#tax").val());
			console.log(sul);
			$("#deductsum").val(sul);

	//		var power=Number($("#incen").val())+${pay.HDP_PAY}-Number($("#tax").val())-Number($("#insurance").val());
			var power = $("#provide").val()-$("#deductsum").val();
			$("#receive").val(power);
			console.log(power);
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
