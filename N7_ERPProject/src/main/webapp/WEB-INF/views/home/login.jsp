<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 300px;
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

.warnMsg {
	color: red;
}
#idserach{
margin-left: 30px;

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
		<%-- <div id="menu">
			<ul>
				<li><a href="/erp/" accesskey="1" title="">MAIN</a></li>
				<li><a href="/erp/introducecompany" accesskey="2" title="">회사
						소개</a></li>
				<li><a href="/erp/erpboard" accesskey="3" title="">상담 게시판</a></li>
				<li><a href="/erp/erpapply" accesskey="4" title="">ERP 신청</a></li>
				<c:if test="${id==null}">
				<li><a href="/erp/join" accesskey="5" title="">JOIN</a></li>
				</c:if>
				<c:if test="${id!=null}">
             	<li><form action="logout" method="post"><button>LOGOUT</button></form></li>
				<li class="current_page_item"><a href="#" accesskey="6">ERP시작</a></li>
				</c:if>
			</ul>
		</div> --%>
	</div>
	<br>
	<div id="loginContainer" >
	<form action="access" method="post">
			<div class="table-responsive">
				<div class="form-group">
					<input type="text" class="form-control" name="m_id"
						placeholder="id를 입력해주세요" required id="usr">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="m_pw"
						placeholder="password를 입력해주세요" required id="pwd">
				</div>
			</div>
			<span class="warnMsg">${warn }</span><br>
			<button>로그인</button><br>
			<a href = "/erp/findidfrm" id="idserach">아이디 찾기</a>____<a href = "/erp/findpasswordfrm">비밀번호 찾기</a>			
	</form>
		</div>
<p style="text-align : center;">회원이 아니신가요? <a href="/erp/joinpage">회원가입</a></p><br>
	<script>
		if (location.search!= '') {
			$('.warnMsg').text('아이디 혹은 비밀번호가 잘못되었습니다.');
			history.replaceState({}, null, location.pathname);
		}
	</script>

</body>



</html>
