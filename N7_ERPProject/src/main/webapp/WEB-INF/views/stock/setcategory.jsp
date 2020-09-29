<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<style>
#header {
	width: 100%;
	height: 200px;
}

#side_menu {
	height: 100%;
	width: 250px;
	font-size: 20px;
	font-weight: bolder;
	float: left;
}

#side_menu #menuList {
	list-style: none;
	margin-top: 150px;
}

#side_menu #menuList li {
	margin: 20px;
}

a {
	text-decoration: none;
}

#description {
	float: left;
	height: 100%;
	width: 800px;
}

ul {
	list-style: none;
}

td, th, table {
	border: 1px solid white;
}

td, th {
	width: 100px;
	height: 30px;
}

tr {
	text-align: center;
}
button{
width: 100px;
height: 30px;
background-color: #FFB2D9;
border:0px;
border-radius: 8px;
font-weight: bolder;
font-size: 14px;
color: white;
}
span{

text-align: center;
color: red;
}
</style>
</head>
<body>
	<div id="header">
		<div id="logo">
			<h1>
				<a href="#">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu">
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="/erp/stock/setcategory">분류명 작성</a></li>
			<li><a href="/erp/stock/setitemcode">품목 코드 작성</a></li>
			<li><a href="/erp/stock/importlist">입/출고 내역</a></li>
			<li><a href="/erp/stock/importcheck">입고 수정 및 확정</a></li>
			<li><a href="/erp/stock/byitemdeallist">품목별 거래현황</a></li>
			<li><a href="/erp/stock/byitemstocklist">품목별 자재현황</a></li>
			<li><a href="/erp/stock/monthpayment">월수불실적</a></li>
			<li><a href="/erp/stock/exportstockcheck">출고 양식</a></li>
		</ul>
	</div>

	<div id="description">
		<h3>분류명 작성</h3>
		<table style="border: 0px;">
			<tr>
				<td style="border: 0px;">분류명</td>
				<td style="border: 0px;"><input id="ct_name" type="text"
					maxlength="50" required="required"></td>
			</tr>
			<tr>
				<td style="border: 0px;">품목번호</td>
				<td style="border: 0px;"><input id="ct_code" type="text"
					maxlength="1" required="required"></td>
			<tr>
			<tr>
				<td colspan="2" style="border: 0px;"><button type="button"
						id="btn">확정</button></td>
			</tr>
		</table>

		<span id='msg'></span><br><br>
		<h3>분류명 내역</h3>
		<button type="button" id="modify">수정</button>
		<table id="tb"></table>

	</div>

<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	//카테고리 출력	
	category('/erp/stock/getcategory');
	//카테고리 추가	
	$('#btn')
				.click(
						function() {
							if ($('#ct_name').val() == ''
									|| $('#ct_code').val() == '') {
								$('#msg').html('값을 입력해주세요!');
								return;
							}
							for (var i = 0; i < $(".ct_name").length; i++) {
								if ($('#ct_name').val() == $('.ct_name')[i].childNodes[0].value
										|| $('#ct_code').val() == $('.ct_code')[i].childNodes[0].value) {
									$('#msg')
											.html(
													'분류명과 코드는 중복될 수 없습니다. 확인하고 다시 시도해주시길 바랍니다.');
									return;
								}else{
									$('#msg').html('');
								}
							}
							category('/erp/stock/categoryconfirm', {
								ct_name : $('#ct_name').val(),
								ct_code : $('#ct_code').val()
							});
						})
		function category(url, data) {
			$
					.ajax({
						url : url,
						data : data,
						dataType : 'json',
						type : 'post',
						success : function(result) {
							console.log(result);
							var str = '<tr><td>분류명</td><td>품목 코드</td><td></td><td></td></tr>';
							for (var i = 0; i < result.length; i++) {
								str += '<tr><td class="ct_name"><input type="text" value="'
										+ result[i].ct_name
										+ '" readonly></td><td class="ct_code"><input type="text" value="'
										+ result[i].ct_code
										+ '" readonly></td><td><button type="button" id="btn'+i+'" onclick="modifyCategory(\'#btn'+i+'\')">확정</button></td>'
										+ '<td><button type="button" id="del'+i+'"onclick="deleteCategory(\'#del'+i+'\')">삭제</button></td>'
										+ '</tr>';
							}
							$('#tb').html(str);
							$('#ct_name').val("");
							$('#ct_code').val("");
						},
						error : function(err) {
							console.log(err);
						}
					})
		};
		//카테고리 수정
		function modifyCategory(id) {
			var ct_name = $(id).parent().siblings('.ct_name').children()[0].value;
			var ct_code =$(id).parent().siblings('.ct_code').children()[0].value;
			if(ct_name==''||ct_code==''){
				$('#msg').html('값을 입력해주세요!');
				return;
			}
			for(var i = 0 ; i < $('.ct_name').length;i++){
				if(id.substr(4, 5)==i){
					continue;
				}
				if(ct_name==$('.ct_name')[i].childNodes[0].value){
					$('#msg')
					.html(
							'분류명은 중복될 수 없습니다. 확인하고 다시 시도해주시길 바랍니다.');
					return;
				}else{
					$('#msg').html("");
				}
			}
			var data = {"ct_name":ct_name,"ct_code":ct_code}
			category('/erp/stock/modifycategory',data);
		}
		$('#modify').click(function () {
			$('.ct_name').children().attr('readonly',false)
		});
		//카테고리 삭제
		function deleteCategory(id) {
			var ct_code =$(id).parent().siblings('.ct_code').children()[0].value;
			var data = {"ct_code":ct_code}
			category('/erp/stock/deletecategory',data);
		}
	</script>
</body>
</html>