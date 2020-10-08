<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    height:100%;
    width:80%;
    position: absolute;
    transform:translate(300px, 0);
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
#description, #description *{
font-size:20px;
font-weight: bolder;
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
				<ul id="mainmenu"></ul>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
		</ul>
	</div>
<div id="container">
<span></span>
<center>
	<div id="description">
		<div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">출고 확정</div>
		<c:if test="${exportStockCheck == null}">
		출고 내역이 없습니다.
		</c:if>
		<c:if test="${exportStockCheck !=null}">
		${exportStockCheck}
		<input type="button" id="btn" value="출고 확정"></button>
		</c:if>
	</div>
	</center>
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	stockSideMenu();
		$('#btn').click(function() {
							var ipList = [];
							var num = 1;
							var num3 = 0;
							for (var i = 0;;) {
								console.dir($('.check')[i]);
								console.log($('#frm' + i).length);
								if ($('#frm' + i).length != 0) {
									if ($('.check')[i].checked) {
										var serial = $('#frm' + i).serialize();
										var strArr = serial.split(/=|&/);
										var obj = "{";
										for (var j = 0; j < strArr.length; j++) {
											if (strArr.length - 1 == j) {
												obj += "\"" + strArr[j] + "\"";
											} else if (j % 2 == 0) {
												obj += "\"" + strArr[j] + "\":";
											} else {
												obj += "\"" + strArr[j] + "\""
												if (j == (11 * num) + num3) {
													obj += "}{"
													num++;
													num3++;
												} else {
													obj += ","
												}
											}

										}
										obj += "}";
										obj = replaceAll(obj, "}{", "} {");
										obj = obj.split(" ");
										for (var x = 0; x < obj.length; x++) {
											obj[x] = JSON.parse(obj[x]);

											ipList.push(obj[x]);
										}
										i++;
									} else {
										i++;
									}
								} else {
									break;
								}
							}

							let stringifiedIpList = JSON.stringify(ipList);
							console.log("arr", ipList);
							$
									.ajax({
										url : "/erp/stock/confirmexportcheck",
										data : stringifiedIpList,
										type : "post",
										traditional : true,
										contentType : "application/json;charset=UTF-8",
										dataType : "json",
										success : function(result) {
											console.log(result)
											if(result.responseText!=undefined)
											$('#description').html("<h3>출고 내역 및 수정</h3>"+result.responseText+"<input type='button' id='btn' value='출고 확정'></button>")
										},
										error : function(err) {
											console.log(err)
											$('#description').html("<h3>출고 내역 및 수정</h3>"+err.responseText+"<input type='button' id='btn' value='출고 확정'></button>")
										}
									})

						});

		function replaceAll(str, searchStr, replaceStr) {
			return str.split(searchStr).join(replaceStr);
		}

		function modifySum(pnum) {
			var amount = $('#p_amount' + pnum).val();
			var unlit = $('#p_amount' + pnum).parent().siblings(
					'#p_unlit' + pnum).children().val();
			$('#p_amount' + pnum).parent().siblings('#p_sum' + pnum).children()
					.val(Number(amount) * Number(unlit));
		}
	</script>
</body>
</html>