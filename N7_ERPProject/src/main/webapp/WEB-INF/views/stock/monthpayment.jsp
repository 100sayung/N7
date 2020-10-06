<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 1500px;
}

ul {
	list-style: none;
}

td, th, table {
	border: 1px solid white;
}

td, th {
	width: 100px;
	height: 30px;
}

tr {
	text-align: center;
}

button {
	width: 100px;
	height: 30px;
	background-color: #FFB2D9;
	border: 0px;
	border-radius: 8px;
	font-weight: bolder;
	font-size: 14px;
	color: white;
}

span {
	text-align: center;
	color: red;
}

.span {
	float: left;
	width: 176px;
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
			<li><a href="/erp/stock/setcategory">분류명 작성</a></li>
			<li><a href="/erp/stock/setitemcode">품목 코드 작성</a></li>
			<li><a href="/erp/stock/importlist">입/출고 내역</a></li>
			<li><a href="/erp/stock/importcheck">입고 수정 및 확정</a></li>
			<li><a href="/erp/stock/byitemdeallist">품목별 거래현황</a></li>
			<li><a href="/erp/stock/byitemstocklist">품목별 자재현황</a></li>
			<li><a href="/erp/stock/monthpayment">월수불실적</a></li>
			<li><a href="/erp/stock/exportstockcheck">출고 양식</a></li>
			<li><a href="/erp/stock/addimportlist">입고 확정</a></li>
			<li><a href="/erp/stock/addexportlist">출고 확정</a></li>
		</ul>
	</div>

	<div id='contain'>
		<input id='date1' type="month" onchange='checkDate()'><br><br>
		<div id="msg"></div>
		<div id="description"></div>
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	var date1 = new Date();
		var date2 = new Date(date1.getFullYear(),date1.getMonth(),1);
		var date3 = new Date(date1.getFullYear(),date1.getMonth()+1,1);
		getMonthPayment(date2.getFullYear()+"-"+(Number(date2.getMonth())+1)+"-"+date2.getDate(),date3.getFullYear()+"-"+(Number(date3.getMonth())+1)+"-"+date3.getDate());	
	function checkDate() {
		console.log($('#date1').val())
		if($('#date1').val()==''){
			$('#msg').html('값을 입력해주세요!');
			return;
		}
		var chkDate = $('#date1').val().split('-');
		date2 = new Date(Number(chkDate[0]),(Number(chkDate[1])-1),1);
		date3 = new Date(Number(chkDate[0]),Number(chkDate[1]),1);
		getMonthPayment(date2.getFullYear()+"-"+(Number(date2.getMonth())+1)+"-"+date2.getDate(),date3.getFullYear()+"-"+(Number(date3.getMonth())+1)+"-"+date3.getDate());
	}
	function getMonthPayment(date1,date2){
		$.ajax({
			url:"/erp/stock/getmonthpayment",
			type:"post",
			data:{date1:date1,date2:date2},
			dataType:"json",
			success:function(result){
				if(result==null||result==undefined||result==''){
					$('#msg').html('결과가 존재하지 않습니다.');
					return;
				}
				console.log(result);
				$('#description').html(result.responseText)
			},
			error:function(err){
				console.log(err)
				$('#description').html(err.responseText)
			}
		})
	}
	</script>
</body>
</html>