<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="/erp/css/default.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style>
		.button {
			color: #ffffff;
		}

		#description div {
			border-radius: 25px;
			background-color: rgb(85, 82, 82);
			width: 200px;
			margin: 5px;
			height: 150px;
			float: left;
			line-height: 150px;
		}

		#description div:hover {
			background-color: #eeeeee;
			border: 1px solid black;
		}

		#description {
			margin-left: 340px;
			margin-top: 200px;
		}
		#desc{
			font-size: 20px;
			font-weight: bolder;
		}
	</style>
</head>

<body>
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="/erp/">N7 ERP SYSTEM</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/introducecompany" accesskey="2" title="">회사 소개</a></li>
				<li><a href="/erp/erpboard" accesskey="3" title="">신청 게시판</a></li>
				<li><a href="/erp/erpapply" accesskey="4" title="">ERP 신청</a></li>
				<li><a href="/erp/login" accesskey="5" title="">LOGIN</a></li>
				<li><a href="/erp/join" accesskey="6" title="">JOIN</a></li>
				<li class="current_page_item"><a href="#"  onclick="window.open('main','main')">ERP시작</a></li>
			</ul>
		</div>
	</div>

	<div id="description">
		<center>
			<div class="icons" id="personManagement">
				<i class='fas fa-id-card' style='font-size:36px;color: white;'></i>
			</div>
			<div class="icons" id="salesManagement">
				<i class='far fa-handshake' style='font-size:36px;color: white;'></i>
			</div>
			<div class="icons" id="purchaseManagement">
				<i class='fas fa-shopping-cart' style='font-size:36px;color: white;'></i>
			</div>
			<div class="icons" id="stockManagement">
				<i class='fas fa-archive' style='font-size:36px;color: white;'></i>
			</div>
			<div class="icons" id="accountingManagement">
				<i class='fas fa-dollar-sign' style='font-size:36px;color: white;'></i>
			</div>
		</center>
	</div>
	<div id="desc"style="float:left;"></div>
	<script>
		$(".icons").hover(function () {
			var template = $(this).attr("id");
			$(this).siblings().attr("style", "display:none");
			$(this).children().attr("style", "color:black;font-size:36px;");
			if (template == "personManagement") {
				$("#desc").html('<h1>인사 관리</h1><br><br>다양한 인사정보의 효율적 검색 기능 제공<br>다양한 급여처리 방식으로 고객사에 최적화된 급여처리 방법 제공<br>입사 후 인적 정보의 효율적 관리<br>다양한 보직변경 항목 제공<br>자유로운 급여기준 설정을 통해 급여처리의 편리성 추구<br>사원/조직별 정보를 그래프 형식으로 병렬 제공하여 다양한 현황 분석 용이')
			}else if(template =="salesManagement"){
				$("#desc").html('<h1>영업 관리</h1><br><br>영업 실적 관리의 편안함과 정확성<br>미수금 잔액을 한 눈에 파악<br>웹 기반 시스템의 편리성<br>각 영업 사원에게 고유 ID 제공하여 권한 제어')
			}else if(template =="purchaseManagement"){
				$("#desc").html('<h1>구매 관리</h1><br><br>구매 내역 자동 재고 반영<br>실시간 재고 확인<br>발주 수량 자동 계산하여 적정재고량 유지에 도움<br>실제 재고와 장부상 재고 비교하여 정확도 UP')
			}else if(template =="stockManagement"){
				$("#desc").html('<h1>재고 관리</h1><br><br>다양한 보고서 제공<br>재고 장부 자동화<br>재고 수량 관리의 정확성<br>월수불실적 제공을 통한 편리함<br>적정 수량 유지를 통한 안정성<br>')
			}else if(template=="accountingManagement"){
				$("#desc").html('<h1>회계 관리</h1><br><br>경영자를 위한 보고서 제공<br>실시간 보고서 확인 가능(인터넷 연결 필수)<br>경영자 보고서 자동화를 통한 편안함<br>영업, 구매 내역을 그대로 처리하여 정확도 UP<br>예산 관리의 편안함')
			}

		}, function () {
			$("#desc").html('');
			$(this).siblings().attr("style", "display:inline-block");
			$(this).children().attr("style", "color:white;font-size:36px;");
			
		})
	</script>
</body>

</html>