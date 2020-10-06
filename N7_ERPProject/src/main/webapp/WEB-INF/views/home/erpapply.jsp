<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : UpRight
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130526

-->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
		<link href="img/favicon.png" rel="icon" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="lib/icomoon/icomoon.css" rel="stylesheet" />
  <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1a9e4h5a1u&callback=initMap"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous" />
	<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
	<style>
.button {
	color: #ffffff;
}

#desc {
margin-left: 200px;
	font-size: 20px;
	font-weight: bolder;
}

#description{
	position:relative;
}

body{
	font-size: medium;
}

</style>
</head>

<body>
	<div id="header" class="container" style="text-align: center;">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 COMPANY</a>
			</h1>
		</div>
		<div id="menu">
		</div>
	</div>
	<div id="description" class="out" style="height: 700px;">
	<div style='width:100%; height:50px; text-align:center; background-color: #3D6B9B;'><h1 style='color:white'>ERP신청</h1></div>
	<div class="center">
        <div id="container">
        <br>
<br>

			<form action="newerp" method="post" onsubmit="return sum();">
                <table class="table table-condensed">
                    <tr>
                        <td>회사명</td>
                        <td><input type="text" name="c_name" required="required"/></td>
                    </tr>
                    <tr>
                        <td>회사코드</td>
                        <td><input type="text" name="c_code" required="required" id="cCode"/>
                        <button onclick="dupleCCode()" type="button">중복확인</button><br>
                        <span id="dupleCCode"></span></td>
                    </tr>
                    <tr>
                        <td>대표자명</td>
                        <td><input type="text" name="c_ceo" required/></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="c_phonenum" required="required"></td>
                    </tr>
                    <tr>
                    	<td>업태</td>
                    	<td><input type='text' name='c_kind' required="required"></td>
                    </tr>
                    <tr>
                    	<td>종류</td>
                    	<td><input type='text' name='c_kind2' required="required"></td>
                    </tr>
                   <!--  <tr>
                        <td>구분</td>
                        <td><input type="radio" name="division" value="법인"> 법인 <input type="radio" name="division"
                                value="개인">개인</td>
                    </tr> -->
                    <tr>
                    	<td>주소</td>
                    	<td>
						<div class="form-group">
							<button id="postcodify_search_button" style="width: 100px;height: 30px;" type="button">주소검색</button>
							<input type="text" id="addr1" name="addr1" class="postcodify_address form-control" value="" />
							<input id="addr2" type="text" name="addr2" class="postcodify_details form-control" value="" />
							<input type="text" name="addr3" id="addr3" class="postcodify_extra_info form-control" value="" />
						</div>
						</td>
                    </tr>
                    <tr>
                    	<td>사업자번호</td>
                    	<td><input type='text' name='c_comnum' required="required"></td>
                    </tr>
                    <!-- <tr>
                        <td>필요 기능</td>
                        <td><input type="checkbox" name="require"> 인사 관리
                            <input type="checkbox" name="require"> 영업 관리
                            <input type="checkbox" name="require"> 구매 관리
                            <input type="checkbox" name="require"> 자재 관리
                            <input type="checkbox" name="require"> 회계 관리
                        </td>
                    </tr> -->
                    <tr>
                        <td colspan="2"><button style="margin-left: 305px;">신청</button></td>
                    </tr>
					<input type="hidden" name="c_addr" id="addr"></input>

                </table>
            </form>
        </div>

    <script>
    var checkccode;
    
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
	
	function dupleCCode(){
		var $cCode = $("#cCode").val();
		
		if($cCode == "" || $cCode == null){
			$("#dupleCCode").html("<font style='color:red;'>회사코드를 입력해주세요.</font>");
		}else{
		
			console.log($cCode);
			$.ajax({
				url:"/erp/rest/home/dupleccode",
				data : {m_ccode: $cCode},
				dataType:"text",
				method:"get",
				async:false,
				success : function(data){
					console.log(data)
					if(data==1){
						checkccode=false;
						$("#dupleCCode").html("<font style='color:red;'>해당 회사코드가 이미 존재합니다.</font>");
					}else{
						checkccode=true;
						$("#dupleCCode").html("<font style='color:green;'>확인</font>");
					}
				}, error : function(err){
				console.log(err);
				}
			});
		}
	}
	
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
	
	function sum(){
		if(checkccode){
			$("#addr").val($('#addr1').val()+$('#addr2').val()+$('#addr3').val());
			console.log($("#addr").val());
			return true;
		}else{
			alert("회사코드 중복을 확인해주세요.");
			return false;
		}
	}
	
    </script>
</body>
</html> 