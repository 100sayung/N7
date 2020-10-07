<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- BOOTSTRAP STYLES-->
<link href="/erp/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/erp/assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/erp/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href="http://fonts.googleapis.com/css?family=Open+Sans"
<title>게시판 글쓰기</title>
	rel="stylesheet" type="text/css" />
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="/erp/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="/erp/assets/js/bootstrap.min.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/erp/assets/js/custom.js"></script>

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

#container {
	margin-top: 5%;
	margin-left: 27%;
	width: 800px;
}

#footer {
	float: right;
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
		

		<div
			style='width: 100%; height: 50px; text-align: center; background-color: #3D6B9B;'>
			<h1 style='color: white'>ERP상담게시판</h1>
		</div>
		<div id="container" style="text-align: center;">
			<form id="boardData">

				<h1>글쓰기</h1>
				<table>
					<tr>
						<td colspan="2"><input type="radio" class="writeclass"
							id="check1" checked="checked" name="cb_type" value="a" />공개글 <input
							type="radio" class="writeclass" id="check2" name="cb_type"
							value="b" />비밀글</td>
					</tr>
					<tr>
						<td>
							<div class='input-group'>
								<span class='input-group-addon' style="width: 81px;">작성자</span>
								<input type="text" name="cb_writer" class="writeText"
									placeholder="작성자" required="required" />
							</div>
							<div class='input-group'>
								<span class='input-group-addon'>비밀번호</span> <input type="text"
									name="cb_password" class="writeText" placeholder="비밀번호"
									required="required" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class='input-group'>
								<span class='input-group-addon' style="width: 82px;">제목</span> <input
									type='text' name='cb_title' class='form-control'
									style="width: 712px;" placeholder="내용을 입력해주세요." />
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class='input-group'>
								<span class='input-group-addon' style="width: 81px;">내용</span>
								<textarea rows="12" cols="95" id="write" name="cb_contents"
									required="required" placeholder="내용을 입력해주세요."></textarea>
							</div>
						</th>
					</tr>
					<tr>
					</tr>
				</table>

			</form>
			<div id="footer">

				<button type="button" id="submit">등록</button>
				<button type="reset">다시쓰기</button>
				<a href="/erp/erpboard" style="text-decoration: none;"><button
						type="button">뒤로</button></a>
			</div>
		</div>
	</div>

</body>
<script>
$("#submit").click(function(){
	var obj = $("#boardData").serialize();
	
	 $.ajax({
		url:'/erp/rest/home/writeBoard',
		type:'post',
		data:obj,
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data==1){
				alert("등록완료");
				location.href="/erp/home/erpboard"
			}else{
				alert("등록실패");
			}
			
		},
		error:function(error){
			console.log(error);
		}		
	 });

});
</script>
</html>