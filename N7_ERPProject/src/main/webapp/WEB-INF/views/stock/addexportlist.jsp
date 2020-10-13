<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/sidebar.css" rel="stylesheet" type="text/css" media="all" />
	
	
	         <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         <!-- Our Custom CSS -->
        <!-- <link rel="stylesheet" href="style2.css"> -->
        <!-- Scrollbar Custom CSS  -->
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <!-- Bootstrap Js CDN -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">  
        <!-- jQuery Custom Scroller CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<style>
/*
    DEMO STYLE
*/
@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";


  body {
   /*  font-family: 'Poppins', sans-serif; */
     background: #fafafa; 
}

/* p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}  */

 a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
} 

.navbar {
    padding: 15px 10px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
} 

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}  

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
#sidebar {
    width: 200px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    z-index: 999;
    background: #7386D5;
    color: #fff;
    transition: all 0.3s;
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    /* font-size: 1.1em; */
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}


a[data-toggle="collapse"] {
   position: relative;
}

a[aria-expanded="false"]::before, a[aria-expanded="true"]::before {
    content: '\e259';
    display: block;
    position: absolute;
    right: 20px;
    font-family: 'Glyphicons Halflings';
    /* font-size: 0.6em; */
}
a[aria-expanded="true"]::before {
    content: '\e260';
}


ul ul a {
    /* font-size: 0.9em !important; */
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    /* font-size: 0.9em !important; */
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}
a.download {
    background: #fff;
    color: #7386D5;
}
a.article, a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}


/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
 #content {
    width: calc(100% - 180px);
    padding: 40px;
    min-height: 100vh;
    transition: all 0.3s;
    position: absolute;
    top: 0;
    right: 0;
}
 #content.active {
    width: 100%;
} 







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

/* #side_menu #menuList {
	list-style: none;
	margin-top: 150px;
}

#side_menu #menuList li {
	margin: 20px;
}  */

a {
	text-decoration: none;
}

/* #description {
	float: left;
    height:100%;
    width:80%;
    position: absolute;
    transform:translate(300px, 0);
} */

#description{
    float:left;
    height:300%;
    width:80%;
    position: absolute;
    transform:translate(0, 70px);
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
	width: 200px;
}
#description *{
font-size: 20px;
font-weight: bolder;
}
input[type="button"]{
font-size: 20px;
font-weight: bolder;
}
body{
position: relative;
}
td{
width: 300px;
}
select{
width: 300px;
}
</style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3><a href="/erp/myInfo/myInfo"">N7 ERP SYSTEM</a></h3>
            </div>

        <p><br>&nbsp;&nbsp;&nbsp;자재관리</p>
        <ul class="list-unstyled components" id="menuList">
                <!-- <li class="active"> -->
				<div id="side_menu">
					<ul id="menuList"></ul>
				</div>
			</ul>
        </nav>

        <!-- Page Content  -->
        <div id="content" style="float:left;">

           <!--  <nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!--                 <div class="container-fluid"> -->
                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                        <ul class="nav navbar-nav ml-auto" id="menu">
                            <li class="nav-item active">
                               <a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a>
                            </li>
                            <li class="nav-item">
                                <a href="/erp/hr/movehrcardpage">사내정보</a>
                            </li>
                            <li id="mainmenu"></li>
                        </ul>
</div>
<center>
	<div id="description">
	<form id="form" action="/erp/stock/confirmexport" method="post"> 
<input type="button" onclick="window.open('/erp/home/comInfo','PopupWin','width=500,height=600')" value="거래처 검색">
		<input type="button" id="account" value="거래처 등록">
		<input type="button" id="addTable" value="테이블 추가">
		<input type="button" onclick="window.open('/erp/stock/setcategory','PopupWin','width=500,height=600')" value="분류코드 추가" >
		<input type="button" onclick="window.open('/erp/stock/setitemcode','PopupWin','width=500,height=600')" value="품목코드 추가" >
		<input type="button" onclick="window.open('/erp/stock/searchitemcode','PopupWin','width=500,height=600')" value="품목코드 검색" >
		<div id="contain">
			<div class='div'>
			  <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">출고</div>
			<div style="background-color:#F8F7F7;">
			<input type="button" onclick="addRow(this)" value="행 추가">
			<input type="button" onclick="deleteTable(this)" value="테이블 삭제">
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
						<td class="itemcode" id='itemcode'></td>
						<td class='ie_qty'><input min="0" type='number' name='ie_qty' required="required"></td>
						<td><input type="number" min="0" onkeyup="multiplePrice(this)" onchange='multiplePrice(this)' required="required"></td>
						<td class='ie_price'><input min="0" type='number' name='ie_price' required="required"></td>
						<td><input class='deleteBox' type="checkbox"></td>
						<td class="ie_clcode"><input type="hidden" name="ie_clcode"></td>
					</tr>
				</table>
				</div>
			</div>
		</div>
		<input type="button" id="deleteBtn" value="삭제">
		<input type="button" onclick="addClcode()" value="등록">
		</form>
	</div>
	</center>
	<script src=/erp/js/menu.js></script>
	<!-- 메뉴Ajax로 출력 -->
	<script>
/*     var sidebar = "/erp/css/sidebar.css";
	$('<link rel="stylesheet" type="text/css" href="'+sidebar+'" >').appendTo("head"); */

		var cssId = 'sidebar'; // you could encode the css path itself to generate id..
		if (!document.getElementById(cssId)) {
			var head = document.getElementsByTagName('head')[0];
			var link = document.createElement('link');
			link.id = cssId;
			link.rel = 'stylesheet';
			link.type = 'text/css';
			link.href = '/erp/css/sidebar.css';
			link.media = 'all';
			head.appendChild(link);
		}

		
		$(document).ready(function() {
			$("#sidebar").mCustomScrollbar({
				theme : "minimal"
			});

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar, #content').toggleClass('active');
				$('.collapse.in').toggleClass('in');
				$('a[aria-expanded=true]').attr('aria-expanded', 'false');
			});
		});

		stockSideMenu();
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
							var str = '<div class="div"><div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">출고</div><div style="background-color:#F8F7F7;"><input type="button" onclick="addRow(this)" value="행 추가"><input type="button" onclick="deleteTable(this)" value="테이블 삭제"><table><caption>'
									+ clArr
									+ '</caption><tr><td>제품 코드</td><td>수량</td><td>단가</td><td>총액</td>	<td>삭제</td>	<td></td></tr>'
									+ '<tr><td class="itemcode">'
									+ itArr
									+ '</td><td class="ie_qty"><input type="number" name="ie_qty" required="required"></td>'
									+ '<td><input type="number" onkeyup="multiplePrice(this)" min="0" onchange="multiplePrice(this)" required="required"></td>'
									+ '<td class="ie_price"><input type="number" min="0" name="ie_price" required="required"></td>'
									+ '<td><input class="deleteBox" type="checkbox"></td><td class="ie_clcode"><input type="hidden" name="ie_clcode"></td></tr></table></div></div>';
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
			var str = '<select  onchange="getStock(this)" name = "ie_itcode"><option></option>';
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
			$(id).parent().siblings('.ie_price').children().val(
					Number(ie_price) * Number(ie_qty));

		}
		$('#deleteBtn').click(function() {
			console.log($('.deleteBox')[0].checked)
			for (var i = 0; i < $('.deleteBox').length; i++) {
				if ($('.deleteBox')[i].checked == true) {
					var child = $('.deleteBox')[i].parentNode.parentNode;
					child.parentNode.removeChild(child);
					i--;
				}
			}
		});
		function deleteTable(id) {
			$(id).parent().parent().remove();
		}
		function addRow(id) {
			var str = '<tr><td class="itemcode">'
					+ itArr
					+ '</td><td class="ie_qty"><input type="number" name="ie_qty" required="required"></td>'
					+ '<td><input type="number" onkeyup="multiplePrice(this)" min="0" onchange="multiplePrice(this)" required="required"></td>'
					+ '<td class="ie_price"><input type="number" min="0" name="ie_price" required="required"></td>'
					+ '<td><input class="deleteBox" type="checkbox"></td><td class="ie_clcode"><input type="hidden" name="ie_clcode"></td></tr>';
			$(id).siblings("table").append(str);
		}

		function addClcode() {
			console.log($($('.itemcode')[0]))
			for (var i = 0; i < $('.div').length; i++) {
				if ($($('.div')[i]).children("div").children("table").children(
						"caption").children().val() == '') {
					alert("거래처를 선택해주세요");
					return;
				}
			}
			for (var i = 0; i < $('.itemcode').length; i++) {
				if ($($('.itemcode')[i]).children("select").val() == '') {
					alert("품목코드를 선택해주세요");
					return;
				}
			}
			for (var i = 0; i < $('.div').length; i++) {
				var clcode = $($('.div')[i]).children("div").children("table")
						.children("caption").children().val();
				for (var j = 0; j < $($('.div')[i]).children("div").children(
						"table").children("tbody").children().children(
						".ie_clcode").children().length; j++) {
					$($('.div')[i]).children("div").children("table").children(
							"tbody").children().children(".ie_clcode")
							.children()[j].value = clcode;
				}
			}
			document.getElementById("form").submit();
		}
		function getStock(id) {
			$
					.ajax({
						url : "/erp/stock/getstock",
						type : "get",
						data : {
							it_code : $(id).val()
						},
						dataType : "json",
						success : function(result) {
							console.log(result)
							$(id).parent().siblings(".ie_qty").children()[0].max = Number(result);
						},
						error : function(err) {
							console.log(err)
						}
					})
		}
	</script>
</body>
</html>