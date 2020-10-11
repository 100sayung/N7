<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>내 급여 명세서 보기</title>
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

#menu2 {
	font-size: medium;
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
	width: 1150px;
    position: absolute;
    transform:translate(250px, 0);
} */


#description{
    float:left;
    height:350%;
    width:80%;
    position: absolute;
    transform:translate(220px, 150px);
}


ul {
	list-style: none;
}
.leftmoney{
	padding-right:20px;
	text-align: right;
}
table,td{
	border-collapse: collapse;
}
body{
	font-weight:bold;
	color:black;
}
#month{
	font-size: 15px;
}
</style>
</head>
<body onload="build();">
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
				</ul>
			</ul>
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
		<div class="first_div_css">
			<h1 class="deptregist_color_size">내 급여 명세서 보기</h1>
		</div>
	<table style="border: 2px solid #D9EDF7; width: 1150px; height: 100px; text-align: center;">
		<tr>
			<td class="font_color_paydetail">사원코드  </td>
			<td>${paycheck.hc_hrcode}</td>
			<td class="font_color_paydetail">이름  </td>
			<td>${paycheck.m_name}</td>
			<td class="font_color_paydetail">입사일  </td>
			<td>${paycheck.hc_joindate}</td>
		</tr>
		<tr>
			<td class="font_color_paydetail">부서  </td>
			<td>${paycheck.hc_dept}</td>
			<td class="font_color_paydetail">직급  </td>
			<td>${paycheck.hc_position}</td>
			<td class="font_color_paydetail">급여일</td>
			<td><input type="month" id="month" name="month"></td>
		</tr>
	</table>
	<div id="paycheckpage" align="center">

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
	
		$("#month").change(function(){
			var month=$("#month").val();
			console.log(month);

			$.ajax({
				url:"/erp/myinfo/paycheckselect",
				method:'POST',
				data:{month : month},
				dataType:'JSON',
				success:function(data){
					if(data!="1"){
					console.log(data);
					var provide=Number(data.HDP_PAY)+Number(data.HP_INCEN);
					var ince=Number(data.HP_INSURANCE)+Number(data.HP_TAX);
					var str='';
						str+="<table style='border:2px solid #D9EDF7;width:1150px;height:300px; text-align: center;'><tr>"
							+"<td class='font_color_paydetail'>지급내역</td>"
							+"<td class='font_color_paydetail'>지급액</td>"
							+"<td class='font_color_paydetail'>공제내역</td>"
							+"<td class='font_color_paydetail'>공제액</td></tr>"
							+"<tr><td class='font_color_paydetail'>기본급</td>"
							+"<td class='leftmoney'>"+data.HDP_PAY+"</td>"
							+"<td class='font_color_paydetail'>보험</td>"
							+"<td class='leftmoney'>"+data.HP_INSURANCE+"</td></tr>"
							+"<tr><td class='font_color_paydetail'>인센티브</td>"
							+"<td class='leftmoney'>"+data.HP_INCEN+"</td>"
							+"<td class='font_color_paydetail'>소득세</td>"
							+"<td class='leftmoney'>"+data.HP_TAX+"</td></tr>"
							+"<tr><td class='font_color_paydetail'>월차수당</td>"
							+"<td class='leftmoney'>"+data.HP_MONTHLYBONUS+"</td>"
							+"<td class='font_color_paydetail'>공제액계</td>"
							+"<td class='leftmoney'>"+ince+"</td></tr>"
							+"<tr><td class='font_color_paydetail'>급여 계</td>"
							+"<td class='leftmoney'>"+provide+"</td>"
							+"<td class='font_color_paydetail'>실지급액</td>"
							+"<td class='leftmoney'>"+data.HP_REALMONEY+"</td></tr>"
					$("#paycheckpage").html(str);
					}else if(data=="1"){
						$("#paycheckpage").html("<img src='http://mjscholarship.com/k1/board/images/no_article.gif' width='500px' height='350px'>");
					}
				},
				errorr:function(err){
					console.log(err);
					alert('이 달에 받은 급여가 없네요');
				}
			});
		});
<<<<<<< HEAD
=======
		
		var moneyCheck = function(money){
			var length = money.length; //7
			
			var div = Math.floor(length/3); //2 
			var mod = length%3; //1
			var num = "";
			num += money.substr(0, mod) + "";
			for(let i = 0 ; i < div ; i++){
				if(mod==0&&i==0){
					num += money.substr((mod+(i*3)), 3);
				}else{
					num += "," + money.substr((mod+(i*3)), 3);
				}
			}
			console.log(num);
			return num;
		}
>>>>>>> master
	</script>
</body>
</html>
