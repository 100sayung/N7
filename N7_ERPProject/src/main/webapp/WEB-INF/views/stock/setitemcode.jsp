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
	width: 1500px;
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
.span{
float: left;
width: 176px;
text-align: center;
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
		<h3>품목번호 작성</h3>
		<form id="frm">
		<table style="border: 0px;">
			<tr>
				<td style="border: 0px;">분류명</td>
				<td style="border: 0px;"><input name="ct_name" id="ct_name" type="text"
					maxlength="50" required="required"></td>
			</tr>
			<tr>
				<td style="border: 0px;">품목번호</td>
				<td style="border: 0px;"><input name="it_ccode" id="it_ccode" type="text"
					maxlength="1" required="required"></td>
			<tr>
			<tr>
				<td style="border: 0px;">품목코드</td>
				<td style="border: 0px;"><input id="it_code" name="it_code" type="text"
					maxlength="4" required="required"></td>
			<tr>
			<tr>
				<td style="border: 0px;">상품명</td>
				<td style="border: 0px;"><input id="it_pname" name="it_pname" type="text"
					required="required"></td>
			<tr>
			<tr>
				<td style="border: 0px;">규격명</td>
				<td style="border: 0px;"><input id="it_size" name="it_size" type="text"
					required="required"></td>
			<tr>
			<tr>
				<td style="border: 0px;">단위</td>
				<td style="border: 0px;"><input id="it_unit" name="it_unit" type="text"
					maxlength="6" required="required"></td>
			<tr><tr>
				<td style="border: 0px;">적정재고량</td>
				<td style="border: 0px;"><input id="it_pstock" name="it_pstock" type="number" value="0"></td>
			<tr>
			<tr>
				<td colspan="2" style="border: 0px;"><button type="button"
						id="btn">확정</button></td>
			</tr>
		</table>
		</form>
		<span id='msg'></span><br><br>
		<h3>분류명 내역</h3>
		<button type="button" id="modify">수정</button>
	<div id="smalldescription">
	</div>
	</div>

<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	//품목분류 출력
	itemCode('/erp/stock/getitemcode');
	$('#btn').click(function(){
		var str = " ";
		var flag = true;
		//''검사
		if($('#it_ccode').val()==''||$('#it_code').val()==''||$('#it_pname').val()==''||$('#it_size').val()==''||$('it_unit').val()==''){
			$('#msg').html('값을 입력해주세요!');
			return;
		}
		//중복 검사
		for(var i = 0 ; i < $('.it_code').length;i++){
			if($('#it_ccode').val()+"-"+$('#it_code').val()==$('.it_code')[i].value){
				$('#msg').html('품목코드는 중복될 수 없습니다. 확인하고 다시 시도 해 주세요!');
				return;
			}else{
				$('#msg').html('');
			}
		}
		var data = $('#frm').serialize();
		console.log(data);
		itemCode('/erp/stock/itemcodeconfirm',data);
		$('input[id]').val("");
		$('#it_pstock').val(0);
	});
	
	function  itemCode(url,data) {
		$.ajax({
			url:url,
			data:data,
			type:"POST",
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType:"json",
			success:function(result){
				var msg = '';
				msg+='<div class = "span">품목코드</div><div class = "span">상품명</div><div class = "span">규격명</div><div class = "span">단위</div><div class = "span">적정재고량</div><br>';
				for(var i = 0 ; i < result.length;i++){
					var frm = document.createElement("form"); 
					frm.id = 'frm'+(i+1);
					var str = '';
					str += '<input class="it_code"  name="it_code" type="text" value="'
						+ result[i].it_code
						+ '" readonly>'
						+'<input class="it_pname"   name="it_pname" type="text" value="'+result[i].it_pname+'" readonly>'
						+'<input class="it_size"  name="it_size" type="text" value="'+result[i].it_size+'" readonly>'
						+'<input class="it_unit" name="it_unit" type="text" value="'+result[i].it_unit+'" readonly>'
						+'<input class="it_pstock" name="it_pstock" type="number" value="'+result[i].it_pstock+'" readonly>'
						+'<button type="button" id="btn'+i+'" onclick="modifyItemCode(\''+(i+1)+'\')">확정</button>'
						+ '<button type="button" id="del'+i+'"onclick="deleteItemCode(\''+(i+1)+'\')">삭제</button>';
						console.dir(frm);
						frm.innerHTML = str
						msg+=frm.outerHTML+'<br>';
				}
				$('#smalldescription').html(msg);
			},
			error:function(err){
				console.log(err);
			}
		});
		
	}
	//분류명, 품목번호 출력
	$('#it_ccode').keyup(function() {
		var data = {ct_code:$('#it_ccode').val()}
		category(data,'ct_code');
	});
	$('#ct_name').keyup(function(){
		var data = {ct_name:$('#ct_name').val()}
		category(data,'ct_name');
	})
	function category(data,data_id){
		$.ajax({
			url:'/erp/stock/getct',
			data:data,
			type:"POST",
			dataType:"json",
			success:function(result){
				console.log('suc',data_id)
				if(data_id=='ct_code'){
					$('#ct_name').val(result);
				}else{
					$('#it_ccode').val(result);
				}
			},
			error:function(err){
				console.log('err',data_id)
				if(data_id=='ct_code'){
					$('#ct_name').val(err.responseText);
				}else{
					$('#it_ccode').val(err.responseText);
				}
			}
		});
	}
	//품목번호 수정
	function modifyItemCode(i){
		console.log('#frm'+i)
		var data = $('#frm'+i).serialize();
		console.log(data);
		itemCode('/erp/stock/modifyitemcode',data);
	}
	//품목번호 삭제
	function deleteItemCode(i) {
		var data = $('#frm'+i).serialize();
		itemCode('/erp/stock/deleteitemcode',data);
	}
	//readonly 해제
	$('#modify').click(function () {
		$('input[class]').attr("readonly",false);
		$('input[class="it_code"]').attr("readonly",true);
	});
	
	</script>
</body>
</html>