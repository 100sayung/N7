<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>휴가 신청</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
	media="all" />
	
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
        <link rel="icon" type="image/png" href="http://example.com/myicon.png"> 

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
	border-right:1px solid #E6E6E6;
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

/* #description {
	float: left;
	height: 100%;
	width: 800px;
<<<<<<< HEAD
} */

#description{
    float:left;
    height:350%;
    width:80%;
    position: absolute;
    transform:translate(220px, 150px);
=======
   position: absolute;
   transform:translate(250px, 0);
>>>>>>> master
}


ul {
	list-style: none;
}
.attendance{
	border: 1px solid black;
}
#menu2 {
	font-size: medium;
	}
	
	
.center{
	margin-left: 10%;
}
</style>
</head>
<body>
<<<<<<< HEAD
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3><a href="/erp/myInfo/myInfo"">N7 ERP SYSTEM</a></h3>
            </div>

            <ul class="list-unstyled components">
                <p></p>
				<li class="active">
  			    <li><a href="/erp/myInfo/myInfo">내 정보 보기</li>
				<div id="myInfoMenu"></div>
				<li id="showMenu1">나의 결재함</li>
				<ul id="menu2" style="display: none;">
					<li>내가 올린 결재함</li>
					<ul id="smenu3" style="display: none;">
						<li id="apupPayment">진행중</li>
						<li id="apupBackpayment">반려</li>
						<li id="apupFinalpayment">결재완료</li>
					</ul>
					<li id="apdownPayment">내가 받은 결재함</li>
					<li id="acTemporary">임시저장 결재함</li>
=======
	<div id="header">
		<div id="logo">
			<h1>
				<a href="/erp/myInfo/myInfo">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu"></ul>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="/erp/myInfo/myInfo">내 정보 보기</a></li>
			<div id="myInfoMenu">
			</div>
			<li id="showMenu1">나의 결재함</li>
			<ul id="menu2" style="display: none;">
				<li>내가 올린 결재함</li>
				<ul id="smenu3" style="display: none;">
				<li id="apupPayment">진행중</li>
				<li id="apupBackpayment">반려</li>
				<li id="apupFinalpayment">결재완료</li>
>>>>>>> master
				</ul>
			</ul>
<<<<<<< HEAD
        </nav>

        <!-- Page Content  -->
        <div id="content" style="float:left;">

           <!--  <nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button> -->
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
	<div id="description">
	<button id="approval" class="goodbtn">결재자등록</button>
=======
		</ul>
	</div>
	<div id="description" class="out">
	
		<div class="first_div_css">
			<h1 class="deptregist_color_size">휴가 신청</h1>
		</div>
		
	<div class="center">
	<button id="approval" class="goodbtn" type="button">결재자등록</button>
>>>>>>> master
	<form action="/erp/hr/applyholiday" method="post" onsubmit="return checkHoliday();">
	<table style='text-align: center;'>
	<tr><td class='infomenu'>결재자</td><td><div id='line'></div></td></tr>
	<tr class='infomenu'>
		<td>문서제목</td><td>휴가종류</td>
	</tr><tr>
		<td><input type="text" name="hap_docuname" placeholder="문서 제목을 입력해주세요 글자제한 20자" required="required" style="width:300px;"></td>
		<td>
			<select style="width:200px;" name="hap_type" id="type">
				<option value="year">연차</option>
				<option value="period">생리</option>
				<option value="pregnancy">임신/육아</option>
				<option value="etc">기타</option>
			</select>
		</td>
	</tr><tr class='infomenu'>
		<td>휴가시작일</td><td>휴가종료일</td>
	</tr><tr>
		<td><input type="date" name="hap_startday" required="required" id="start" style="width:300px;"></td>
		<td><input type="date" name="hap_endday" required="required" onchange='checkDateValue(start, end);' id="end" style="width:300px;"></td>
	</tr><tr>
		<td colspan='2' class='infomenu'>사유</td>
	</tr><tr>
		<td colspan='2'><textarea rows="10" cols="10" name="hap_reason" style="width:620px; heigth:1000px; resize:none;"></textarea></td>
	</tr>
	</table>
	<input type="submit" class='infobtn' value="제출">
	</form>
	</div>
</div>

	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
	<script>

	   $("#showMenu1").hover(function() {
			$("#menu2").attr("style", "display:inline-block");
		});
		
		$("#menu2").hover(function() {
			$("#smenu3").attr("style", "display:inline-block");
		});

		$("#apupFinalpayment").click(function() {
			$.ajax({
				url : '/erp/Account/apupFinalpayment',
				type : 'get',
				success : function(data) {
					$("#description").html(data);
				},
				error : function() {
				}
			});

		});
		
		$("#apupBackpayment").click(function() {
			$.ajax({
				url : '/erp/Account/apupBackpayment',
				type : 'get',
				success : function(data) {
					$("#description").html(data);
				},
				error : function() {
				}
			});

		});
		
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
	
	function setChildValue(data) {
		console.log(data);
		if (data.tList1 != "") {
		var str = "";
			for ( var i in data.tList1) {
		        str +="<input type='text' name='hap_toapprover' value='"+data.tList1[i].hc_hrcode+"' hidden='true'>";
				str +=data.tList1[i].hc_position+"/" + data.tList1[i].m_name;
			}
			console.log(str)
			$("#line").append(str);
		};
	};
	var holidaycnt = "";
	$(document).ready(function(){
		$.ajax({
			url:"/erp/rest/hr/hrcardinfo",
			dataType:"json",
			type:"get",
			async:false,
			success : function(data){
				console.log(data);
				holidaycnt = data;
			}, error : function(err){
				console.log(err);
			}
		});
	});
	function checkHoliday(){
		var startDay = new Date($("#start").val());
		var endDay = new Date($("#end").val());
		var term = endDay - startDay;
		term = (term/86400000)+1;
		if($("#type").val()=="year"){
			if(holidaycnt.hc_holynum>=term){
				return true;
			}else{
				alert("남은휴가보다 더 많은 일수를 신청하셨습니다.");
				return false;
			}
		}
		return true;
	}

	$("#approval").click(function() {
		console.log("123");
		window.open('/erp/hr/approvalLine', 'approvalLine', 'width=1400,height=700');
	});


	function replaceAll(str, searchStr, replaceStr) {
	    return str.split(searchStr).join(replaceStr);
	 }


	function checkDateValue(val1, val2){
		let date1 = Number(replaceAll(val1.value, "-", ""));
		let date2 = Number(replaceAll(val2.value, "-", ""));
		if(date1>date2){
			alert("종료일은 시작일보다 이전일 수 없습니다.");
			val2.value = "";
		}
	}

	</script>
</body>
</html>
