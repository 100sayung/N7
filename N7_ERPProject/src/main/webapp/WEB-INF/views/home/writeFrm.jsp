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
<style type="text/css">
h1{
font-size: 36px;
margin-top: 15px;
margin-bottom: 10px;
font-family: inherit;
font-weight: 500;
color: inherit;
text-transform: uppercase;
display: block;    
}
#writeTitle{
width: 300px;
} 
.writeclass{
width: 20px;
height: 15px;
}
.writeText{
padding: 10px;
}
#write{
resize: none;
}
#pw{
display : block;
float: left;
margin-left: -195px;
padding: 8px;
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
	<div style='width:100%; height:50px; text-align:center; background-color: #3D6B9B;'><h1><a href="/erp/erpboard" style='color:white; text-decoration: none;'>ERP상담게시판</a></h1></div>
	<div class="center">
        <div id="container">
        <br>
<br>
   <form action="writeBoard" id="writeFrm" method="post">
      <h1>글쓰기</h1>
	<table>
         <tr>
           <c:if test="${id==null}">
            	<td><input type="text" name="CB_WRITER" class="writeText" placeholder="작성자를 입력해주세요." required="required"></td>
           	</c:if>
           	<td><input type="hidden" name="CB_WRITER" value="${id}"></td>
         </tr>
         <tr>
            <td>
            <input id="writeTitle" placeholder="제목을 입력해 주세요." required="required" class="writeText" name="CB_TITLE"></td>
			</td>
         </tr>
         <tr>
            <th><textarea rows="20" cols="100" id="write" class="writeText" name="CB_CONTENTS" required="required" placeholder="내용을 입력해주세요."></textarea></th>
         </tr>
         <tr>
            <td id="aaa">
               <button type="submit">글 작성</button>
               <button type="reset">다시쓰기</button>
               <button><a href="/erp/erpboard" style="text-decoration: none;">뒤로</a></button>
            </td>
            <c:if test="${id==null}">
				<td><input type="password" name="CB_PASSWORD" id="pw" placeholder="비밀번호 입력" ></td>
			</c:if>
			<td><input type="hidden" name="CB_PASSWORD" value="${id}"></td>
         </tr>
         <tr>
         </tr>
      </table> 
   </form>
  </div> 
</body>
</html>