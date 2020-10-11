<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>사원 급여 상세 보기</title>
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
<<<<<<< HEAD
} */

#description{
    float:left;
    height:300%;
    width:80%;
    position: absolute;
    transform:translate(0, 70px);
=======
	position: absolute;
   transform:translate(250px, 0);
>>>>>>> master
}


ul {
	list-style: none;
}
#payinputmodify{
	border: 1px solid black;
	border-collapse: collapse;
}
table{
	border-collapse: collapse;
}
.dat{
	border:2px solid #D9EDF7;
	background-color: #ECEBEA;
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

            <ul class="list-unstyled components">
                <p>인사관리</p>
               <li><a href='/erp/hr/receiptholiday'>휴가 접수</a></li>
               <li><a href='/erp/hr/attendance'>사원 출결 관리</a></li>
               <li><a href='/erp/hr/employeestatus'>근무 조회</a></li>
               <li><a href='/erp/hr/retiremm'>휴/퇴직 관리</a></li>
               <li><a href='/erp/hr/deptpay'>부서/직책 관리</a></li>
               <li><a href='/erp/hr/deduct'>공제사항 관리</a></li>
               <li><a href='/erp/hr/searchpaymm'>급여 관리</a></li>
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
	<div id="description">
	<div class="first_div_css">
		<h1 class="deptregist_color_size">사원 급여 상세정보</h1>
	</div>
	<form action="searchpaymm" method="post" name="payroll">
	<input type="hidden" value="${card.hc_ccode}" name="HP_CCODE">
	<table id="payinputmodify" style="text-align: center; width: 1150px;height: 100px;border: 2px solid #D9EDF7;background-color: #F8F7F7;" >
		<tr>
			<td class="dat">사원코드  </td>
			<td><input id="hrcode" name="hrcode" style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_hrcode}"></td>
			<td class="dat">이름  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${name}"></td>
			<td class="dat">입사일  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_joindate}"></td>
		</tr>
		<tr>
			<td class="dat">부서  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_dept}"></td>
			<td class="dat">직급  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_position}"></td>
			<td class="dat">급여일  </td>
			<td><input type="month" id="month" name="month"></td>
		</tr>
	</table>
	</form>
	<div id="detailpage" align="center">
	</div>
	<div align="center" style="margin-top: 20px;">
		<input type="button" class="infobtn" onclick="moving()" value="확인">
	</div>
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	
	   $(document).ready(function () {
	       $("#sidebar").mCustomScrollbar({
	           theme: "minimal"
	       });

	       $('#sidebarCollapse').on('click', function () {
	           $('#sidebar, #content').toggleClass('active');
	           $('.collapse.in').toggleClass('in');
	           $('a[aria-expanded=true]').attr('aria-expanded', 'false');
	       });
	   }); 
	

		function moving(){
			location.href="/erp/hr/searchpaymm";
		}

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
			return num;
		}
		//달력이 변경되면 정보 출력
		$("#month").change(function(){
			var month=$(this).val();
			var hrcode=$("#hrcode").val();
			$.ajax({
				url:"/erp/hr/findmonth",
				method:'POST',
				data:{month : month ,hrcode : hrcode},
				dataType:"json",
				success:function(data){
					var provide=Number(data.HDP_PAY)+Number(data.HP_INCEN);
					var ince=Number(data.HP_INSURANCE)+Number(data.HP_TAX);
					var str='';
					console.log(data);
					if(data!="1"){
						str+="<table style='width:1150px; height:300px;text-align:center;border:2px solid #D9EDF7;'><tr>"
							+"<td  class='dat'>지급내역</td>"
							+"<td  class='dat'>지급액</td>"
							+"<td  class='dat'>공제내역</td>"
							+"<td  class='dat'>공제액</td></tr>"
							+"<tr><td  class='dat'>기본급</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HDP_PAY.toString())+"</td>"
							+"<td  class='dat'>보험</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_INSURANCE.toString())+"</td></tr>"
							+"<tr><td  class='dat'>인센티브</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_INCEN.toString())+"</td>"
							+"<td  class='dat'>소득세</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_TAX.toString())+"</td></tr>"
							+"<tr><td  class='dat'>월차수당</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_MONTHLYBONUS.toString())+"</td>"
							+"<td  class='dat'>공제액계</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(ince.toString())+"</td></tr>"
							+"<td  class='dat'>급여 계</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(provide.toString())+"</td>"
							+"<td  class='dat'>실지급액</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_REALMONEY.toString())+"</td></tr></table>"
					}else if(data=="1"){
						str+="<img src='http://mjscholarship.com/k1/board/images/no_article.gif' width='500px' height='350px'>";
					}
					$("#detailpage").html(str);
				},
				error:function(err){
					console.log(err);
				}
			});
		});


		$("#showMenu1").hover(function() {
			$("#smallMenu1").attr("style", "display:inline-block");
		}, function() {
			$("#smallMenu1").attr("style", "display:none");
		})
		$("#showMenu2").hover(function() {
			$("#smallMenu2").attr("style", "display:inline-block");
		}, function() {
			$("#smallMenu2").attr("style", "display:none");
		})
		$("#showMenu3").hover(function() {
			$("#smallMenu3").attr("style", "display:inline-block");
		}, function() {
			$("#smallMenu3").attr("style", "display:none");
		})

	</script>
</body>
</html>
