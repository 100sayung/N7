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
	width: 1200px;
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

button {
	width: 100px;
	height: 30px;
	background-color: #FFB2D9;
	border: 0px;
	border-radius: 8px;
	font-weight: bolder;
	font-size: 14px;
	color: white;
}

span {
	text-align: center;
	color: red;
}

input[type='text'], input[type='number'] {
	width: 70px;
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
	<div id="getCt_code">
	</div>
		<div id="getItemCodeFromItemCcode">
		</div>
		<div id="contain">
		</div>
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	$.ajax({
		url:"/erp/stock/getcategory",
		type:"post",
		dataType:"json",
		success:function(result){
			if (result==null) {
				$('#description').html('분류명이 존재하지 않습니다.먼저 작성해주세요.')
				return;
			}
			if(result.length==0){
				$('#description').html('분류명이 존재하지 않습니다.먼저 작성해주세요.')
				return;
			}
			console.log(result)
			var str='<h3>품목별 거래현황</h3><table><tr><td>분류 : </td><td><select id="selectit_ccode" onchange="getItemCodeFromItemCCode()"><option></option>';
			for(var i = 0;i<result.length;i++){
				str+='<option data-value="'+result[i].ct_code+'">'+result[i].ct_name+'</option>'
			}str+='</select></td></tr></table>'
			$('#getCt_code').html(str);
			
		},
		error:function(err){
			console.log(err)
		}
		
	});
	function getItemCodeFromItemCCode() {
		for(var i = 0;i<$('#selectit_ccode').children().length;i++){
			if($('#selectit_ccode').children()[i].selected ==true){
				$.ajax({
					url:"/erp/stock/getitemcode",
					data:{it_ccode:$('#selectit_ccode').children()[i].dataset.value},
					type:"post",
					dataType:"json",
					success:function(result){
					console.log(result);
					var str="<table><tr><td>품목 : </td><td><select id='selectit_code' onchange='JsonParseObject({it_code:\"\"})'><option></option>";
					for(var i = 0;i<result.length;i++){
						str+='<option data-value="'+result[i].it_code+'">'+result[i].it_pname+":"+result[i].it_size+"("+result[i].it_unit+")"+'</option>'
					}str+='</select></td></tr></table>'
					$('#getItemCodeFromItemCcode').html(str);
					JsonParseObject({it_ccode:""})
					},
					error:function(err){
					console.log(err)		
					}
				});
			}
		}
	}
	function getByItemDealList(it_code) {
		$.ajax({
			url:"/erp/stock/getbyitemdeallist",
			data:it_code,
			dataType:"json",
			type:"post",
			success:function(result){
				if(result.length==0){
					$('#contain').html('거래 내역이 없습니다.');
					$('#selectit_code').attr('readonly',true);
					return;
				}else{
					$('#selectit_code').attr('readonly',false);
				}
				var str = '<h3>품목별 거래현황</h3><table><tr><td>제품 코드</td><td>거래처</td><td>거래 일시</td><td>거래 분류</td><td>발주 번호</td><td>단가</td><td>수량</td><td>거래 사원</td><td>총액</td></tr>';
				for (var i = 0; i < result.length; i++) {
					str += '<tr><td>' + result[i].ie_itcode + '</td>';
					str += '<td>' + result[i].ie_account + '</td>';
					str += '<td>' + result[i].ie_date.substr(0, 10)+ '</td>';
					if (result[i].ie_status == 0) {
						str += '<td>입고</td>'
					} else {
						str += '<td>출고</td>'
					}
					if (result[i].ie_pnum != undefined) {
						str += '<td>' + result[i].ie_pnum + '</td>'
					} else {
						str += '<td></td>'
					}
					str += '<td>' +parseInt(result[i].ie_price/result[i].ie_qty) + '</td>'
					str += '<td>' + result[i].ie_qty + '</td>'
					str += '<td>' + result[i].ie_hrcode + '</td>'
					str += '<td>'+ result[i].ie_price+ '</td></tr>'
				}
				str+='</table>'
				$('#contain').html(str)
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	function JsonParseObject(it_code) {
		if(it_code.it_code==undefined){
			for(var i = 0;i<$('#selectit_ccode').children().length;i++){
				if($('#selectit_ccode').children()[i].selected==true){
					it_code.it_ccode = $('#selectit_ccode').children()[i].dataset.value;
					getByItemDealList(it_code);
				}
			}
		}else{
			for(var i = 0;i<$('#selectit_code').children().length;i++){
				if($('#selectit_code').children()[i].selected==true){
					it_code.it_code = $('#selectit_code').children()[i].dataset.value;
					getByItemDealList(it_code);
				}
			}
		}
	}
	</script>
</body>
</html>