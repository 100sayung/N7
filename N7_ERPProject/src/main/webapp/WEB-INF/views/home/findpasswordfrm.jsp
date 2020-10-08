<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 200;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px;
  color: #cccccc;
}








#loginContainer {
	width: 500px;
	margin-left: 600px;
	margin-top: 170px;
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

input[type="text"] {
	float: left;
	width: 300px;
}

.warnMsg {
	color: red;
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
<!-- 	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 ERP SYSTEM</a>
			</h1>
		</div> -->
<%-- 		<div id="menu">
			<ul>
				<li><a href="/erp/">MAIN</a></li>
				<li><a href="/erp/introducecompany">회사 소개</a></li>
				<li><a href="/erp/erpboard">상담 게시판</a></li>
				<li><a href="/erp/erpapply">ERP 신청</a></li>
				<li><a href="/erp/joinpage">JOIN</a></li>
				<c:if test="${id!=null}">
					<li><form action="logout" method="post">
							<input type="submit" value="LOGOUT">
						</form></li>
				</c:if>
				<li class="current_page_item"><a href="#">ERP시작</a></li>
			</ul>
		</div> --%>
	</div>
	<div id="loginContainer">
		<div class="table-responsive">
			<table>
				<tr>
					<td><input type="text" class="form-control" id="userId"
						placeholder="아이디를 입력해주세요" required></td>
					<td rowspan="2">
						<button id="authenticationBtn" type="button"
							style="background-color: black; height: 50px; width: 80px; float: left; margin: 0px;">인증번호
							전송</button>
					</td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" id="userEmail"
						placeholder="email을 입력해주세요" required></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control"
						placeholder="인증번호를 입력해주세요" id="authenticationNum"></td>
					<td><button type="button" id="checkAuthenticationNumBtn"
							style="background-color: black; width: 80px; margin: 0px;">확인</button></td>
				</tr>
			</table>
		</div>
		<br> <span class="warnMsg"></span>
	</div>
	<script>
		var authenticationNum;
		var userId;
		$("#authenticationBtn").click(
				function() {
					if ($("#userEmail").val() == "") {
						$(".warnMsg").html("email을 입력해주세요!");
						return;
					}
					$.ajax({
						url : "/erp/home/findpassword",
						type : "post",
						dataType : "json",
						data : {
							userEmail : $("#userEmail").val(),
							userId : $("#userId").val()
						},
						success : function(result) {
							if (result == null) {
								$(".warnMsg").html(
										"해당 이메일로 가입된 회원이 없습니다. 다시 확인해 주세요!");
								return;
							} else {
								userId = result.m_id;
								sendAuthenticationNum(result.m_email);
							}
						},
						error : function(err) {

						}
					})
				});
		function sendAuthenticationNum(userEmail) {
			authenticationNum = Math.floor(Math.random() * 8889 + 1111);
			$.ajax({
				url : "/erp/home/sendauthenticationnum",
				type : "post",
				dataType : "json",
				data : {
					userEmail : userEmail,
					authenticationNum : Number(authenticationNum)
				},
				success : function(result) {
					$(".warnMsg").html(result);
					return;
				},
				error : function(err) {
				}
			})
		}
		$("#checkAuthenticationNumBtn").click(function() {
			if ($("#userEmail").val() == "") {
				$(".warnMsg").html("email을 입력해주세요!");
				return;
			}
			if ($("#authenticationNum").val() == "") {
				$(".warnMsg").html("인증번호를 입력해주세요!");
				return;
			}
			if (authenticationNum == $("#authenticationNum").val()) {
				location.href = "/erp/home/modifypasswordfrm?userId=" + userId;
			}
			if (authenticationNum != $("#authenticationNum").val()) {
				$(".warnMsg").html("인증번호가 틀립니다.");
			}
		});
	</script>
</body>
</html>