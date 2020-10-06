<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
#loginContainer {
	width: 500px;
	margin-left: 700px;
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
	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/">MAIN</a></li>
				<li><a href="/erp/introducecompany">회사 소개</a></li>
				<li><a href="/erp/erpboard">상담 게시판</a></li>
				<li><a href="/erp/erpapply">ERP 신청</a></li>
				<li><a href="/erp/join">JOIN</a></li>
				<li><form action="logout" method="post">
						<input type="submit" value="LOGOUT">
					</form></li>
				<li class="current_page_item"><a href="#">ERP시작</a></li>
			</ul>
		</div>
	</div>
	<div id="loginContainer">
		<div class="table-responsive">
			<table>
				<tr>
					<td><input type="text" class="form-control" id="userPassword"
						placeholder="새로운 비밀번호를 입력해주세요" required></td>
				</tr>
				<tr>
					<td><input type="text" id="checkPassword" class="form-control"
						placeholder="비밀번호를 다시 입력해주세요" id="authenticationNum"></td>
				</tr>
				<tr>
					<td><button type="button" id="modifyPasswordBtn"
							style="background-color: black; width: 80px; margin: 0px;">확인</button></td>
				</tr>
			</table>
		</div>
		<br> <span class="warnMsg"></span>
	</div>
	<script>
		if (location.search != '') {
			history.replaceState({}, null, location.pathname);
		}
		$("#modifyPasswordBtn").click(function() {
			if ($("#userPassword").val() == "") {
				$(".warnMsg").html("비밀번호를 입력해주세요!");
				return;
			}
			if ($("#checkPassword").val() == "") {
				$(".warnMsg").html("비밀번호를 입력해주세요!");
				return;
			}
			if ($("#userPassword").val() != $("#checkPassword").val()) {
				$(".warnMsg").html("비밀번호가 맞지 않습니다!");
				return;
			}
			$.ajax({
				url : "/erp/home/modifypassword",
				type : "post",
				dataType : "json",
				data : {
					userPassword : $("#userPassword").val(),
					userId : "${userId}"
				},
				success : function(result) {
					alert(result);
					location.href = "/erp/";
				},
				error : function(err) {
					console.log(err)
				}
			})
		});
	</script>
</body>
</html>