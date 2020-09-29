<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Document</title>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- BOOTSTRAP STYLES-->
    <link href="/erp/assets/css/bootstrap.css" rel="stylesheet">
     <!-- FONTAWESOME STYLES-->
    <link href="/erp/assets/css/font-awesome.css" rel="stylesheet">
        <!-- CUSTOM STYLES-->
    <link href="/erp/assets/css/custom.css" rel="stylesheet">
     <!-- GOOGLE FONTS-->
   <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="/erp/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="/erp/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="/erp/assets/js/custom.js"></script>
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
	width: 1300px;
}
</style>
</head>
<body>
	<div id="header">
		<div id="logo">
			<h1>
				<a href="/erp/main">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul id="mainmenu"></ul>
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="#" id="apupPayment">내가 올린 결재함</a></li>
			<li><a href="#" id="apdownPayment">내가 받은 결재함</a></li>
			<!-- 			<li><a href="/erp/Account/acpreList" id="prelist">임시저장 결재함</a></li> -->
			<li><a href="#" id="acTemporary">임시저장 결재함</a></li>
			<!-- 			<li><a href="javascript:Aj('/erp/Account/acpreList', '#description')"> 결재함</a></li> -->
		</ul>
	</div>
	<center>
		<div id="description"></div>
	</center>
</body>
<script>
	$("#apupPayment").click(function() {
		$.ajax({
			url : '/erp/Account/apupPayment',
			type : 'get',
			success : function(data) {
				$("#description").html(data);
			},
			error : function() {
			}
		});

	});

	$("#apdownPayment").click(function() {
		$.ajax({
			url : '/erp/Account/apdownPayment',
			type : 'get',
			success : function(data) {
				$("#description").html(data);
			},
			error : function() {
			}
		});

	});

// 	function Aj(url, position) {
// 		$.ajax({
// 			url : url,
// 			type : 'get',
// 			dataType : "html",
// 			success : function(page) {
// 				$(position).html(page);
// 			},
// 			error : function(error) {
// 				console.log(error);
// 			}
// 		});
// 	}

	// 	$("#prelist").click(function(){
	// 		$.ajax({
	// 			url : '/erp/Account/acpreList',
	// 			type : 'get',
	// 			success : function (data){
	// 				$("#description").html(data);
	// 			},
	// 			error : function(){

	// 			}

	// 		});

	// 	});

		$("#acTemporary").click(function() {
			$.ajax({
				url:'/erp/Account/acTemporary',
				success:function(data) {
					console.log(data);
					$("#description").html(data);
				},
				error : function(err) {
					console.log(err);
				}
			});

		});
		
	
</script>
<script>
$(document).ready(function(){
	$.ajax({
		url:'/erp/rest/managermode/getaddmenu',
		type:'get',
		datatype:'json',
		success:function(data){
			console.log(data);
			var str="";

			for(var i in data.mList){
				str+="<li><a id="+data.mList[i].f_functions+" onclick=menu('"+data.mList[i].f_functions+"')>"+data.mList[i].f_functions+"</a></li>";
			}

			$("#mainmenu").html(str);
		},
		error:function(error){
			console.log(error);
		}

	});

});

function menu(menu){
	console.log(menu);

	if(menu=="인사관리"){
		$("#"+menu).attr("href","/erp/hr/hr");
		}else if(menu=="영업관리"){
		$("#"+menu).attr("href","/erp/sales/orderitem");
		}else if(menu=="구매관리"){
		$("#"+menu).attr("href","/erp/Purchase/erpmain");
		}else if(menu=="재고관리"){
		$("#"+menu).attr("href","/erp/stock/setcategory");
		}else if(menu=="회계관리"){
		$("#"+menu).attr("href","/erp/Account/acerp");
		}
}
</script>
</html>