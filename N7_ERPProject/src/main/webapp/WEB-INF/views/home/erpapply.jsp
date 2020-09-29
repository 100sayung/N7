<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" type="text/css"></link>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->


<style>
#joinContainer {
	margin-top: 50px;
	width: 300px;
	margin-left: 700px;
	margin-bottom: 100px;
}

select {
	width: 300px;
	height: 35px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
}

button {
	margin-top: 10px;
	margin-left: 90px;
	width: 100px;
	height: 50px;
	border: 0px;
	background-color: #FFB2D9;
	color: white;
	font-weight: bolder;
	border-radius: 8%;
}
</style>
</head>

<body>
	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/" accesskey="1" title="">MAIN</a></li>
				<li><a href="/erp/introducecompany" accesskey="2" title="">회사
						소개</a></li>
				<li><a href="/erp/erpboard" accesskey="3" title="">상담 게시판</a></li>
				<li><a href="/erp/erpapply" accesskey="4" title="">ERP 신청</a></li>
				<c:if test="${id==null}">
				<li><a href="/erp/login" accesskey="5" title="">LOGIN</a></li>
				</c:if>
				<c:if test="${id!=null}">
             	<li><form action="logout" method="post"><button>LOGOUT</button></form></li>
				<li class="current_page_item"><a href="#" accesskey="6">ERP시작</a></li>
				</c:if>
			</ul>
		</div>
	</div>
    <center>
        <div id="container">
        <br>
<br>
LOGOUT 떠있는거 해결해야함. CSS조절.

        <br><br>

            <h1>erp 신청</h1>
			<form action="newerp" method="post" onsubmit="return sum();">
                <table class="table table-condensed">
                    <tr>
                        <td>회사명</td>
                        <td><input type="text" name="c_name" required="required"></td>
                    </tr>
                    <tr>
                        <td>회사코드</td>
                        <td><input type="text" name="c_code" required="required">
                        <button onclick="dupleCCode()" type="button">중복확인</button><br>
                        <span id="dupleCCode"></span></td>
                    </tr>
                    <tr>
                        <td>대표자명</td>
                        <td><input type="text" name="c_ceo" required="required"></td>
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
    </center>

    <script>
    var checkccode;
    
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
	
	function dupleCCode(){
		var $cCode = $("#cCode").val();
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
		})
	}
	
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
	
	function sum(){
		if(checkccode){
			$("#addr").val($('#addr1').val()+$('#addr2').val()+$('#addr3').val());
			console.log($("#addr").val());
			return false;
		}else{
			alert("회사코드 중복을 확인해주세요.");
			return false;
		}
	}
	
    </script>
</body>
</html> 