<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="/erp/css/default.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <style>
        #header{
            width: 100%;
            height: 200px;
        }
        #side_menu{
            height: 100%;
            width: 250px;
            font-size: 20px;
            font-weight: bolder;
            float: left;
        }
        #side_menu #menuList{
            list-style: none;
            margin-top: 150px;
        }
        #side_menu #menuList li{
            margin: 20px;
        }
        a{
            text-decoration: none;
        }
        #description{
            float: left;
            height: 100%;
            width: 1300px;
        }
    </style>
</head>
<body>
    <div id="header">
        <div id="logo">
            <h1><a href="#">N7 ERP SYSTEM</a></h1>
        </div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu">
		</div>
    </div>
    <div id="side_menu">
        <ul id="menuList">
            <li><a href="#" id="acountting">매츌/매입전표 작성</a></li>
            <li><a href="#" id="acWriting">분개전표입력</a></li>
        </ul>
    </div>
    <center>
    <div id="description">

    </div>
    </center>
</body>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
<script>

$("#acountting").click(function(){
	$.ajax({
		url:'/erp/Account/openTable',
		type:'get',
		success:function(data){
			$("#description").html(data);
		},
		error:function(){

		}
	});

});
$("#acWriting").click(function(){
	$.ajax({
		url:'/erp/Account/acWritefrm',
		type:'get',
		success:function(data){
			$("#description").html(data);
		},
		error:function(){
			
		}
	});
	
});
</script>
</html>
