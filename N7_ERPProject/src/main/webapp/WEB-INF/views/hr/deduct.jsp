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
<div class="divcss">공제 금액 관리</div>
<table id="deductiontable">
<tr align="center">
	<td width="100px">항목</td>
	<td width="100px">현재 공제액</td>
	<td width="100px">수정 금액</td>
	<td width="100px"></td>
</tr>
</table> 본 화면 </div>
</body>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
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

	$(function(){
		var str='<tr align="center"><td width="150px">공제 명</td><td width="150px">현재 공제금액</td><td width="150px">수정 금액</td><td width="150px"></td></tr>';
		var deduct=${deduct};
		console.log(deduct);
		for(var i=0;i<deduct.length;i++){
			str+="<tr align='center'><td width='100px'>"+deduct[i].HDD_NAME+"</td>"
				 +"<td id='123"+deduct[i].HDD_NAME+"' width='100px'>"+deduct[i].HDD_AMOUNT+"</td>"
				 +"<td width='100px'><input type='text' id='deduct_"+deduct[i].HDD_NAME+"'></td>"
				 +"<td width='100px'><button type='button' onclick='modifydeduction(\""+deduct[i].HDD_NAME+"\")'>수정</button></td></tr>";
		}
		$("#deductiontable").html(str);
	});



	function modifydeduction(deduct){
		console.log($("#123"+deduct));
		var denum = $("#deduct_"+deduct).val();
		console.log(deduct);
		console.log(denum);
		$.ajax({
			url : '/erp/hr/modifydeduction',
			method : 'post',
			data : {deduct : deduct,denum : denum},
			success : function(data) {
				$("#123"+deduct).html(data);
				$("#deduct_"+deduct).val('');
				console.log(data);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
</script>
</html>
