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
				<li class="current_page_item"><a href="/erp/myInfo/myInfo"
					accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu">
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="/erp/stock/importlist">입/출고 내역</a></li>
			<li><a href="/erp/stock/importcheck">입고 수정 및 확정</a></li>
			<li><a href="/erp/stock/byitemdeallist">품목별 거래현황</a></li>
			<li><a href="/erp/stock/byitemstocklist">품목별 자재현황</a></li>
			<li><a href="/erp/stock/monthpayment">월수불실적</a></li>
			<li><a href="/erp/stock/exportstockcheck">출고 양식</a></li>
			<li><a href="/erp/stock/addimportlist">입고 확정</a></li>
			<li><a href="/erp/stock/addexportlist">출고 확정</a></li>
		</ul>
	</div>

	<div id="description">
	<form id="form" action="/erp/stock/confirmexport" method="post"> 
		<button type="button" id="account">거래처 등록</button>
		<button type="button" id="addTable">거래처 추가</button>
		<div id="contain">
			<div class='div'>
			<button type="button" onclick="addRow(this)">행 추가</button>
			<button type="button" onclick="deleteTable(this)">테이블 삭제</button>
				<table>
					<caption id="tbCation0" class="clcode"></caption>
					<tr>
						<td>제품 코드</td>
						<td>수량</td>
						<td>단가</td>
						<td>총액</td>
						<td>삭제</td>
						<td></td>
					</tr>
					<tr>
						<td id='itemcode'></td>
						<td class='ie_qty'><input type='number' name='ie_qty' required="required"></td>
						<td><input type="number" onkeyup="multiplePrice(this)" onchange='multiplePrice(this)' required="required"></td>
						<td class='ie_price'><input type='number' name='ie_price' required="required"></td>
						<td><input class='deleteBox' type="checkbox"></td>
						<td class="ie_clcode"><input type="hidden" name="ie_clcode"></td>
					</tr>
				</table>
			</div>
		</div>
		<button type="button" id="deleteBtn">삭제</button>
		<button type="button" onclick="addClcode()">등록</button>
		</form>
	</div>
	<script src=/erp/js/menu.js></script>
	<!-- 메뉴Ajax로 출력 -->
	<script>
		var clArr;
		var itArr;
		var a = 1;
		getClcode();
		getItemCode();
		function getItemCode() {
			$.ajax({
				url : "/erp/stock/getitemcode",
				type : "get",
				dataType : "json",
				success : function(result) {
					itArr = makeItSelect(result);
					console.log(result)
					$('#itemcode').html(itArr);
				},
				error : function(err) {
					console.log(err)
				}

			});
		}
		$('#account').click(
				function() {
					window.open('/erp/Account/comPany', 'comlist',
							'width=1350,height=500')
				})
		function getClcode() {
			$.ajax({
				url : "/erp/stock/getclcode",
				dataType : "json",
				type : "get",
				success : function(result) {
					clArr = makeSelect(result);
					$('#tbCation0').html(clArr);
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		$('#addTable')
				.click(
						function() {
							var str = '<div class="div"><button type="button" onclick="addRow(this)">행 추가</button>	<button type="button" onclick="deleteTable(this)">테이블 삭제</button><table><caption>'
									+ clArr
									+ '</caption><tr><td>제품 코드</td><td>수량</td><td>단가</td><td>총액</td>	<td>삭제</td>	<td></td></tr>'
									+'<tr><td>'+itArr+'</td><td class="ie_qty"><input type="number" name="ie_qty" required="required"></td>'
									+'<td><input type="number" onkeyup="multiplePrice(this)" onchange="multiplePrice(this)" required="required"></td>'
									+'<td class="ie_price"><input type="number" name="ie_price" required="required"></td>'
									+'<td><input class="deleteBox" type="checkbox"></td><td class="ie_clcode"><input type="hidden" name="ie_clcode"></td></tr></table></div>';
							$('#contain').append(str);
						});
		function makeSelect(data) {
			var str = '<select><option></option>';
			for (var i = 0; i < data.length; i++) {
				str += '<option>' + data[i] + '</option>';
			}
			str += '</select>';
			return str;
		};
		function makeItSelect(data) {
			var str = '<select name = "ie_itcode"><option></option>';
			for (var i = 0; i < data.length; i++) {
				str += '<option value="'+data[i].it_code+'">' + data[i].it_code
						+ '</option>';
			}
			str += '</select>';
			return str;
		};
		function multiplePrice(id) {
			var ie_price = id.value;
			var ie_qty = $(id).parent().siblings('.ie_qty').children().val();
			$(id).parent().siblings('.ie_price').children().val(Number(ie_price)*Number(ie_qty));
			
		}
		$('#deleteBtn').click(function(){
			console.log($('.deleteBox')[0].checked)
			for(var i = 0 ; i < $('.deleteBox').length;i++){
				if($('.deleteBox')[i].checked==true){
					var child = $('.deleteBox')[i].parentNode.parentNode;
					child.parentNode.removeChild(child);
					i--;
				}
			}
		});
		function deleteTable(id) {
			$(id).parent().remove();
		}
		function addRow(id) {
			var str = '<tr><td>'+itArr+'</td><td class="ie_qty"><input type="number" name="ie_qty" required="required"></td>'
				+'<td><input type="number" onkeyup="multiplePrice(this)" onchange="multiplePrice(this)" required="required"></td>'
				+'<td class="ie_price"><input type="number" name="ie_price" required="required"></td>'
				+'<td><input class="deleteBox" type="checkbox"></td><td class="ie_clcode"><input type="hidden" name="ie_clcode"></td></tr>';
				$(id).siblings("table").append(str);
		}
		
		function addClcode(){
			
			for(var i = 0; i < $('.div').length;i++){
				if( $($('.div')[i]).children("table").children("caption").children().val()==''){
					alert("거래처를 선택해주세요");
					return;
				}
			}
			for(var i = 0; i < $('.itemcode').length;i++){
				if( $($('.itemcode')[i]).children("table").children("caption").children().val()==''){
					alert("품목코드를 선택해주세요");
					return;
				}
			}
			for(var i = 0 ;i<$('.div').length;i++){
				var clcode = $($('.div')[i]).children("table").children("caption").children().val();
				for(var j = 0 ;j < $($('.div')[i]).children("table").children("tbody").children().children(".ie_clcode").children().length;j++){
					$($('.div')[i]).children("table").children("tbody").children().children(".ie_clcode").children()[j].value = clcode;
				}
			}
			document.getElementById("form").submit();
		}
	</script>
</body>
</html>