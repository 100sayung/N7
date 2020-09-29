<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	이미 회사가 있다 -> 회사코드에 자기 회사 쓰면됨 우리는 현재 빈칸으로 두거나 N7입력.<br></br>
	회사가 없는데 새로 만들 예정이다 -> 빈칸으로 두고 가입한 뒤에 erp신청 후 회사테이블에 값입력 -> 회사코드가 생기므로 그 회사코드 후에 입력
	<br></br>
	(ERP 신청 -> ADMIN이 승인(우리가 승인) -> 회사ERP 생성(생성할때 회사코드는 우리가?))<br>
	ID중복체크 해야함 <br>
	<form action="join" method="post" enctype="multipart/form-data" onsubmit="return sum();">
		<div id="joinContainer">
			<div class="table-responsive">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="ID를 입력해주세요"
						id="id" name="m_id" required />
					<input type="button" value="중복체크" onclick="dupleID()">
					<br/><span id="dupleID"></span>
				</div>
				<div class="form-group">
					<input type="password" class="form-control"
						placeholder="password를 입력해주세요" required id="pw" name="m_pw" />
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름을 입력해주세요"
						required name="m_name" id="name" />
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="회사 코드를 입력해주세요 / 없으면 공백 "
						id="cCode" name="m_ccode" />
					<input type="button" value="코드확인" onclick="dupleCCode()">
					<br/><span id="dupleCCode"></span>
				</div>
				<div class="form-group">
					<input type="text" class="form-control"
						placeholder="주민번호 앞 6자리를 입력해주세요" maxlength="6" required
						name="m_birth" />
				</div>
				<div class="form-group">
					<button id="postcodify_search_button" style="width: 100px;height: 30px;">주소검색</button>
					<input type="text" id="addr1" name="addr1" class="postcodify_address form-control"
						value="" /><input id="addr2" type="text" name="addr2"
						class="postcodify_details form-control" value="" /><input type="text"
						name="addr3" id="addr3" class="postcodify_extra_info form-control" value="" />
				</div>
				<div class="form-group">
					<input type="text" class="form-control"
						placeholder="핸드폰 번호를 입력해주세요" required name="m_phonenum"/>
				</div>
				<div class="form-group">
					<input type="email" class="form-control"
						placeholder = "이메일을 입력해주세요" required name="m_email"/>
				</div>
				<div class="form-group">
					<input type="file" class="form-control-file border"
						required name="m_photo"/>
				</div>
				<input type="hidden" name="m_address" id="addr"></input>
				<button>회원가입</button>
			</div>
		</div> 
	</form>
	<script> 
	var checkid;
	var checkccode
	
	function dupleID(){
		var $id = $("#id").val()
		console.log($id)
		$.ajax({
			url:"/erp/rest/home/dupleid",
			data : {m_id: $id},
			dataType:"text",
			method:"get",
			async:false,
			success : function(data){
				console.log(data)
				if(data==1){
					checkid=false;
					$("#dupleID").html("<font style='color:red;'>아이디가 중복됩니다.</font>");
				}else{
					checkid=true;
					$("#dupleID").html("");
				}
			}, error : function(err){
				console.log(err);
			}
		});
	}
	
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
					checkccode=true;
					$("#dupleCCode").html("");
				}else{
					checkccode=false;
					$("#dupleCCode").html("<font style='color:red;'>해당 회사코드가 존재하지 않습니다.</font>");
				}
			}, error : function(err){
				console.log(err);
			}
		})
	}
	
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
	
	function sum(){
		console.log(checkid, checkccode);
		if(checkid&&checkccode){
			$("#addr").val($('#addr1').val()+$('#addr2').val()+$('#addr3').val());
			return true;
		}else{
			alert("회사코드 혹은 아이디 중복을 확인해주세요.");
			return false;
		}
	}
	
	</script> 
</body>
</html>