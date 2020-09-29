<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<style>
#header{
	margin-bottom: 30px;
}
.button {
	color: #ffffff;
}

#container {
	margin-left: 300px;
}

#boardList,.writelist {
	text-align: center; border-collapse : collapse;
	border: 1px solid black;
	border-collapse: collapse;
}

#boardList {
	margin-top: 30px;
	font-size: 30px;
}
.writelist {
	font-size: 15px;
	width: 225px;
}
#writing{
	margin-top:25px;
	float: right;
}
#container{
	padding: 50px;
	border:1px solid black;
	margin:auto;
	width: 800px;
}
</style>
</head>
<body>
	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/" accesskey="4" title="">MAIN</a></li>
				<li><a href="/erp/introducecompany" accesskey="2" title="">회사
						소개</a></li>
				<li><a href="/erp/erpapply" accesskey="3" title="">erp 신청</a></li>
				<li><a href="/erp/login" accesskey="5" title="">LOGIN</a></li>
				<li><a href="/erp/join" accesskey="6" title="">JOIN</a></li>
				<li class="current_page_item"><a href="/erp/hrCard">ERP시작</a></li>
			</ul>
		</div>
	</div>
	<div id="container">
		<h1>상담 게시판</h1>
		<table id="boardList" align="center">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
			</tr>
		</table>
		<div align="center">${paging}</div>
		<div id="writing"><a href="/erp/home/writeFrm">글쓰기</a></div>
	</div>
</body>

<script>
	$(function() {
		var bList=${bList};
		var str='';
		for(var i=0;i<bList.length;i++){
			var date=bList[i].CB_DATE;
// 			var cb=date.substring(0,10);
			str+=("<tr id='"+bList[i].CB_NUM+"' onclick='writemodify("+bList[i].CB_NUM+")'><td class='writelist'>"+bList[i].CB_NUM+"</td>"
					+"<td class='writelist'>"+bList[i].CB_TITLE+"</td><td class='writelist'>"+bList[i].CB_WRITER+"</td class='writelist'>");
		}
		$("#boardList").append(str);
		console.log(bList);
	});
// 	<td class='writelist'>"+cb+"</td></tr>"
	//게시물 수정 목록 출력
	function writemodify(num){
		console.log(num);
		$.ajax({
			url:'/erp/home/boardmodifyajax',
			method:'post',
			data:{num:num},
			dataType:'json',
			success:function(data){
				$("#container").html("<form action='/erp/home/boardmodify' method='post'>"
						+"<h1>글 수정</h1>"
							+"<table id='boardList' align='center'>"
								+"<tr><td><input value='"+data.CB_WRITER+"' readonly='readonly' name='CB_WRITER'>"
									+"<input value='"+data.CB_PASSWORD+"' readonly='readonly' name='CB_PASSWORD'>"
									+"<input value='"+data.CB_NUM+"' readonly='readonly' name='CB_NUM'>번글"
									+"<input type='checkbox' checked='checked' name='CB_TYPE' value='a'>공개글"
									+"<input type='checkbox' name='CB_TYPE' value='b'>비밀글</td></tr>"
								+"<tr><td><input value='"+data.CB_TITLE+"' placeholder='변경할 제목을 입력해 주세요.' required='required' name='CB_TITLE' ></td></tr>"
								+"<tr><td><textarea rows='20' cols='100' required='required' name='CB_CONTENTS'>"+data.CB_CONTENTS+"</textarea></td></tr>"
								+"<tr><td><button type='submit'>수정</button></td>"
								+"<tr><td><button onclick='writelistdelete("+data.CB_NUM+")' id='writedetaile' type='button'>삭제</button></td>"
						+"</tr></form>");
				console.log(data);
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	
	//게시물 삭제
	function writelistdelete(num){
		$.ajax({
			url:'writelistdelete',
			method:'post',
			data:{num:num},
			success:function(data){
				location.href="erpboard";
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	
</script>
</html>
