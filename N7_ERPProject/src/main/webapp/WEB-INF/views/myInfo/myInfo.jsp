<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>내 정보 보기</title>
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
	border-right: 1px solid #E6E6E6;
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
<<<<<<< HEAD
	width: 80%;
} */


#description{
    float:left;
    height:350%;
    width:80%;
    position: absolute;
    transform:translate(220px, 150px);
=======
   width:1150px;
   position: absolute;
   transform:translate(250px, 0);
>>>>>>> master
}



ul {
	list-style: none;
}

.attendance {
	border: 1px solid black;
}

#dataTable {
	border: 1px solid black;
	width: 600px;
}

table,tr,td {
	border-radius:5px;
	border: 1px solid black;
	border-collapse: collapse;
}

.dataSpan {
	width: 250px;
	float: left;
	align-content: center;
	text-align: center;
}

#hrmenu {
	float: none;
	width: 800px;
}

#member {
	height: 300px;
}

.myinfo_table_css {
	width: 900px;
}

#menu2 {
	font-size: medium;
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
				<li><a href="/erp/myInfo/myInfo"
					accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu"></ul>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
			</ul>
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="/erp/myInfo/myInfo">내 정보 보기</a></li>
			<div id="myInfoMenu"><!--
		 		<li><a href="/erp/myinfo/checkattendance">출/퇴근 등록</a></li>
				<li><a href="/erp/myinfo/myPaycheck">급여명세서 보기</li>
				<li><a href="/erp/myinfo/myattendance">내 출결 보기</li>
				<li><a href="/erp/myinfo/myholiday">내 휴가 보기</li>
				<li><a href="/erp/myinfo/applyholiday">휴가신청</a></li>  -->
			</div>
			<li id="showMenu1">나의 결재함</a></li>
			<ul id="menu2" style="display: none;">
				<li>내가 올린 결재함</li>
				<ul id="smenu3" style="display: none;">
				<li id="apupPayment">진행중</li>
				<li id="apupBackpayment">반려</li>
				<li id="apupFinalpayment">결재완료</li>
>>>>>>> master
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
	<div id="description" align="center">
		<div class="first_div_css">
			<h1 class="deptregist_color_size">내 정보 보기</h1>
		</div>
		
		<table style="width:950px; border: 3px solid white;">
		
		
		<tr style="border: 3px solid white;"><td>
		<div id="member"></div>
		</td></tr>

		<tr style="border: 3px solid white;"><td>
		<div id="hrmenu"></div>
		</td></tr>
		
		<tr style="border: 3px solid white;"><td>
		<form id="form" method="post" onsubmit="return checkCurrent();">
			<div id="hrDetailInfo">

<img src="https://upload.wikimedia.org/wikipedia/commons/6/6c/Mass-Effect-N7-sign.png" style="opacity: 10%; width:850px;height:270px;">
				<table id="hrDetail" border="1" cellspacing="0">
				</table>

				<div id="addRecord"></div>
			</div>
		</td></tr>
		
		<tr style="border: 3px solid white;"><td>
<div align="right" style="width: 850px;">
<input type='button' value='추가하기' class = 'infobtn' onclick='addRecord()' id='addRecordBtn'>
<input type='button' value='수정/등록모드'  class = 'infobtn' onclick='changeMode()' id='changeBtn' style='width:150px;'>
<input type='submit' value='등록완료'  class = 'infobtn' disabled="disabled" id='registBtn'>
</div>
		</form>
		</td></tr>
		
		</table>
		
<input type='hidden' id='current'>

	
	</div>
	<script src=/erp/js/menu.js></script>
	<!-- 메뉴Ajax로 출력 -->
	<script>
	var cnt = 0;
	function checkCurrent(){
		var $check = $("#current").val();
		if($check==""){
			console.log("공백");
			alert("잘못된 접근입니다. 정보를 입력해주세요.");
			return false;
		}
		if(cnt == 0){
			console.log(cnt);
			alert("잘못된 접근입니다. 정보를 입력해주세요.");
			return false;
		}
		return true;
	}
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

		var num;
		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : "/erp/rest/myinfo/myinfo",
										dataType : "json",
										method : "get",
										success : function(data) {
											console.log(data);
											let info = "";
											info += '<div><div class="dataSpan"><img style="width:250px; height: 300px;" src="/erp/upload/'+data.photo+'"></div>';
											info += '<div class="dataSpan"><table id="dataTable" height="300px"><tr  class="infomenu"><td>이름</td></tr>'
											info += '<tr><td id="m_name">'
													+ data.name + '</td></tr>';
											info += '<tr class="infomenu"><td>생년월일</td></tr>';
											info += '<tr><td id="m_birth">'
													+ data.birth + '</td></tr>';
											info += '<tr class="infomenu"><td>전화번호</td></tr>';
											info += '<tr><td id="m_phonenum">'
													+ data.phonenum
													+ '</td></tr>';
											info += '<tr class="infomenu"><td conlspan="2">주소</td></tr>'
											info += '<tr><td id="m_address" colspan="2">'
													+ data.address
													+ '</td></tr></table></div></div>';
											$("#member").html(info);
										},
										error : function(err) {
											console.log(err);
										}
									});

							$
									.ajax({
										url : "/erp/rest/myinfo/hrexistfromid",
										dataType : "json",
										method : "get",
										contentType : 'application/json',
										success : function(data) {
											let str = "";
											str += '<tr style="border:1px solid white;"><td><a href="javascript:InCompanyInfo()"><button class = "infobtn" >사내정보</button></a></td>';
											if (data) {
												str += '<td><a href="javascript:AcademicInfo()"> <button class = "infobtn">학력</button></a></td>';
												str += '<td><a href="javascript:CareerInfo() "> <button class = "infobtn">이력</button> </a></td>';
												str += '<td><a href="javascript:CertificationInfo()"> <button class = "infobtn">자격증</button> </a></td>';
											}
											str += '</tr>';
											$("#hrmenu").html(str);
										},
										error : function(err) {
											console.log(err);
										}
									});
							console.log("load");
						});

		function replaceAll(str, searchStr, replaceStr) {
			return str.split(searchStr).join(replaceStr);
		}

		function checkDateValue(val1, val2) {
			let date1 = Number(replaceAll(val1.value, "-", ""));
			let date2 = Number(replaceAll(val2.value, "-", ""));
			if (date1 > date2) {
				alert("종료일은 시작일보다 이전일 수 없습니다.");
				val2.value = "";
			}
		}

		function addRecord() {
			let str = "";
			let cntAc = 0;
			let cntCt = 0;
			var $current = $("#current").val();
			console.log(num);
			if ($current == 'Academic') {
				str += "<tr id='test'><td><input type='text' name='hac_school' class='detailInfo' style='width:273px;'></td>";
				str += "<td><input type='text' name='hac_major' class='detailInfo' style='width:273px;'></td>";
				str += "<td><input type='date' name='hac_year' class='detailInfo' style='width:230px;'>";
				str += "<input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
			} else if ($current == 'Certification') {
				str += "<tr><td><input type='text' name='hct_name' class='detailInfo' style='width:273px;'></td>";
				str += "<td><input type='text' name='hct_agency' class='detailInfo' style='width:273px;'></td>";
				str += "<td><input type='date' name='hct_date' class='detailInfo' style='width:230px;'>"
				str += "<input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
			} else if ($current == 'Career') {
				str += "<tr><td><input type='text' name='hcr_name' class='detailInfo' style='width:143px;'></td>";
				str += "<td><input type='date' name='hcr_startperiod' id='chk"
						+ (num * 2) + "' class='detailInfo checkDate' style='width:140px;'>";
				str += "<input type='date' name='hcr_endperiod' id='chk"
						+ ((num * 2) + 1)
						+ "' class='detailInfo checkDate' onchange='checkDateValue(chk"
						+ (num * 2) + ", chk" + ((num * 2) + 1) + ")' style='width:140px;'></td>"
				str += "<td><input type='text' name='hcr_position' class='detailInfo' style='width: 143px;'></td>";
				str += "<td><textarea rows='3' cols='20' name='hcr_content' class='detailInfo' style='height:18px; width:190px; padding-top:2px;'></textarea>"
				str += "<input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
				num++;
			}
			cnt = cnt+1;
			$("#infoTable > tbody:last").append(str);
		}

		function thisRowDel(row) {
			let tr = row.parentNode.parentNode;
			console.log(tr);
			tr.parentNode.removeChild(tr);
			var $current = $("#current").val();
			var num;
			cnt--;
			console.log(cnt);
			if (tr.className == "origin") {
				if (confirm("정말 삭제하시겠습니까?")) {
					if ($current == "Academic") {
						num = tr.childNodes[2].children.hac_num.value;
					} else if ($current == "Career") {
						num = tr.childNodes[3].children.hcr_num.value;
					} else if ($current == "Certification") {
						num = tr.childNodes[2].children.hct_num.value;

					}
					$.ajax({
						url : "/erp/rest/hr/removeinfo",
						data : {
							num : num,
							type : $current
						},
						dataType : "text",
						method : "post",
						success : function(data) {
							console.log(data);
						},
						error : function(err) {
							console.log(err);
						}
					});
				} else {
					alert("취소되었습니다.")
				}

			}
		}

		function changeMode(){
			console.log($("#changeBtn").attr('class'));
			if($("#changeBtn").attr('class')=="infobtn mf"){
				$(".detailInfo").attr("readonly", true).addClass("modifyMode").removeClass("registMode");
				$("#registBtn").attr("disabled", false);
				$("#registBtn").css('background-color','#3D6B9B');
				for(let i = 0 ; i<$(".origin").length ; i++){
					if($("#origin_"+i)[0].lastChild.className=="removebtn"){
					$("#origin_"+i)[0].lastChild.remove();
					}
				}
			}else{
				if($("#current").val()=='HRCard'){
					changeDept(document.getElementById("dept"));
					console.log("dd");
				}
				$(".detailInfo").removeAttr("readonly").removeClass("modifyMode").addClass("registMode");
				$("#registBtn").attr("disabled", true);
				$("#registBtn").css('background-color','#d2d2d2');
				for(let i = 0 ; i <$(".origin").length ; i++){
					$("#origin_"+i).append("<td class='removebtn'><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td>");
				}
			}
			$("#changeBtn").toggleClass("mf");

		}


		var formURL = "/erp/myinfo";

		function AcademicInfo() {
			onBtn();
			cnt = 0;
			$("#form").attr("action", formURL + "/newacademic");
			$("#current").val("Academic");
			$("#registBtn").attr("disabled", true);
			$("#registBtn").css('background-color','#d2d2d2');
			$.ajax({
						url : "/erp/rest/myinfo/academic",
						dataType : "json",
						method : "get",
						async:false,
						contentType : 'application/json',
						success : function(data) {
							if (data.length == undefined) {
								var arr = [ data ]
								data = arr;
							}
							let str = "";
							str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
							str += "<td style='width:279px;'>학교/학위</td><td style='width:279px;'>전공</td><td style='width:279px;'>날짜</td></tr>";
							for (let i = 0; i < data.length; i++) {
								console.log(data[i].hac_year);
								str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hac_school' class='detailInfo' style='width:273px;' value='"+data[i].hac_school+"' readonly></td>"
								str += "<td><input type='text' name='hac_major' style='width:273px;' class='detailInfo' value='"+data[i].hac_major+"' readonly></td>";
								str += "<td><input type='date' name='hac_year' style='width:273px;' class='detailInfo' value='"+data[i].hac_year+"' readonly>";
								str += "<input type='hidden' name='hac_num' value='"+data[i].hac_num+"'></td></tr>";
							}
							cnt = data.length;
							str += "</table>";
							$("#hrDetailInfo").html(str);
						},
						error : function(err) {
							/* let str ="";
							str += "<table border='1px solid black'><tr>";
							str += "<td>학교/학위</td><td>전공</td><td>날짜</td></tr>";
							str += "<tr><td><input type='text' name='hac_school' class='detailInfo'></td>"
							str += "<td><input type='text' name='hac_major' class='detailInfo'></td>";
							str += "<td><input type='date' name='hac_year' class='detailInfo'></td></tr>";
							str += "</table>";
							$("#hrDetailInfo").html(str); */
						}
					});
		}

		function CertificationInfo() {
			onBtn();
			cnt = 0;
			$("#form").attr("action", formURL + "/newcertification");
			$("#current").val("Certification");
			$("#registBtn").attr("disabled", true);
			$("#registBtn").css('background-color','#d2d2d2');
			$
					.ajax({
						url : "/erp/rest/myinfo/certification",
						dataType : "json",
						method : "get",
						async:false,
						success : function(data) {
							if (data.length == undefined) {
								var arr = [ data ]
								console.log(arr);
								data = arr;
							}
							let str = "";
							str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
							str += "<td style='width:279px;'>자격증</td><td style='width:279px;'>발급처</td><td style='width:279px;'>발급일</td></tr>";
							for (let i = 0; i < data.length; i++) {
								str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hct_name' style='width:273px;' class='detailInfo' value='"+data[i].hct_name+"' readonly ></td>"
								str += "<td><input type='text' name='hct_agency' class='detailInfo' style='width:273px;' value='"+data[i].hct_agency+"' readonly ></td>";
								str += "<td><input type='date' name='hct_date' class='detailInfo' style='width:273px;' value='"+data[i].hct_date+"' readonly>";
								str += "<input type='hidden' name='hct_num' value='"+data[i].hct_num+"'></td></tr>";
							}
							cnt = data.length;
							str += "</table>";
							$("#hrDetailInfo").html(str);
						},
						error : function(err) {
							/* let str ="";
							str += "<table border='1px solid black'><tr>";
							str += "<td>자격증</td><td>발급처</td><td>발급일</td></tr>";
							str += "<tr><td><input type='text' name='hct_name' class='detailInfo'></td>"
							str += "<td><input type='text' name='hct_agency' class='detailInfo'></td>";
							str += "<td><input type='date' name='hct_date' class='detailInfo' required pattern='\d{4}-\d{2}-\d{2}'></td></tr>";
							str += "</table>";
							$("#hrDetailInfo").html(str); */
						}
					});
		}
		function CareerInfo() {
			onBtn();
			cnt = 0;
			$("#form").attr("action", formURL + "/newcareer");
			$("#current").val("Career");
			$("#registBtn").attr("disabled", true);
			$("#registBtn").css('background-color','#d2d2d2');
			$
					.ajax({
						url : "/erp/rest/myinfo/career",
						dataType : "json",
						method : "get",
						async:false,
						success : function(data) {
							console.log("안됨?");
							let str = "";
							str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
							str += "<td style='width:150px;'>회사/프로젝트명</td><td style='width:290px;'>기간</td><td style='width:150px;'>직책</td><td colspan='2' style='width:240px;'>내용</td></tr>";
							for (let i = 0; i < data.length; i++) {
								str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hcr_name' style='width:147px;' class='detailInfo' value='"+data[i].hcr_name+"' readonly ></td>"
								str += "<td><input type='date' name='hcr_startperiod' id='chk"
										+ (i * 2)
										+ "'class='detailInfo checkDate' value='"
										+ data[i].hcr_startperiod
										+ "' readonly  style='width:147px;'>";
								str += "<input type='date' name='hcr_endperiod' id='chk"
										+ ((i * 2) + 1)
										+ "' class='detailInfo checkDate' value='"
										+ data[i].hcr_endperiod
										+ "' readonly onchange='checkDateValue(chk"
										+ (i * 2)
										+ ", chk"
										+ ((i * 2) + 1)	
										+ ")' style='width:147px;'></td>"
								str += "<td><input type='text' name='hcr_position' class='detailInfo' value='"+data[i].hcr_position+"' readonly style='width:147px;'></td>";
								str += "<td><textarea rows='3' cols='20' name='hcr_content' class='detailInfo' value='"+data[i].hcr_content+"' style='height:18px; width:247px; padding-top:2px;'></textarea>";
								str += "<input type='hidden' name='hcr_num' value='"+data[i].hcr_num+"'></td></tr>'";
							}
							str += "</table>";
							$("#hrDetailInfo").html(str);
							cnt = data.length;
							num = data.length;
						},
						error : function(err) {
							console.log(err);
						}
					});
		}
		function InCompanyInfo() {
			$("#form").attr("action", formURL + "/newhrcard");
			$("#current").val("HRCard");
			offBtn();
			cnt = 1;
			$.ajax({
						url : "/erp/rest/myinfo/hrcard",
						dataType : "json",
						method : "get",
						success : function(data) {
							console.log(data);
							var married = "";
							var status = "";
							var work = "";
							if (data.hc_status == 1) {
								status = "근무";
							} else if (data.hc_status == 0) {
								status = "퇴근"
							} else {
								status = "휴가";
							}
							if (data.hc_work == 1) {
								work = "휴직";
							} else if (data.hc_work == 2) {
								work = "퇴사";
							} else {
								work = "재직";
							}
							let str = "";
							str += "<table border='1px solid black' class='myInfo_table_css'><tr class='infomenu'>";
							str += "<td style='width:279px;'>사원코드</td><td style='width:279px;'>부서</td><td style='width:279px;'>직책</td></tr>";
							str += "<tr><td><input type='text' name='hc_code' value='"+data.hc_hrcode+"' readonly style='width:273px;'></td>";
							str += "<td><input type='text' name='hc_dept' value='"+data.hc_dept+"' readonly style='width:273px;'></td>";
							str += "<td><input type='text' name='hc_position' value='"+data.hc_position+"' readonly style='width:273px;'></td>";
							str += "</tr><td colspan='3' class='infomenu'>입사일</td></tr>";
							str += "<td colspan='3'><input type='date' name='hc_joindate' value='"+data.hc_joindate+"' class='detailInfo' readonly></td>"
							str += "<tr class='infomenu'><td>현재 상태</td><td>재/휴직 상태</td><td>남은 연차</td></tr>";
							str += "<td><input type='text' value='"+status+"' readonly style='width:273px;'></td>"
							str += "<td><input type='text' value='"+work+"'readonly style='width:273px;'></td>"
							str += "<td><input type='text' value='"+data.hc_holynum+"' readonly style='width:273px;'></td></tr></table>";
							$("#hrDetailInfo").html(str);
						},
						error : function(err) {
							console.log(err);
							let str = "";
							str += "<table border='1px solid black' class='myinfo_table_css'><tr class='infomenu'>";
							str += "<td style='width:279px;'>사원코드</td><td style='width:279px;'>부서</td><td style='width:279px;'>직책</td></tr>";
							str += "<tr><td><input type='text' name='hc_code' placeholder='---' readonly style='width:273px;'></td>"
							str += "<td><input type='text' name='hc_dept' value='"+data.hc_dept+"' readonly style='width:273px;'></td>";
							str += "<td><input type='text' name='hc_position' value='"+data.hc_position+"' readonly style='width:273px;'></td>";
							str += "</tr><td colspan='3'>입사일</td></tr>";
							str += "<td colspan='3'><input type='date' name='hc_joindate' readonly></td></tr>"
							str += "<tr><td>현재 상태</td><td>재/휴직 상태</td><td>남은 연차</td></tr>";
							str += "<td><input type='text' placeholder='---' readonly style='width:273px;'></td>"
							str += "<td><input type='text' placeholder='---' readonly style='width:273px;'></td>"
							str += "<td><input type='text' placeholder='---' readonly style='width:273px;'></td></tr></table>";
							$("#hrDetailInfo").html(str);
						}
					});
		}
		function offBtn(){
			$("#registBtn").attr("disabled", true);
			$("#registBtn").css('background-color','#d2d2d2');	
			$("#changeBtn").attr("disabled", true);
			$("#changeBtn").css('background-color','#d2d2d2');
			$("#addRecordBtn").attr("disabled", true);
			$("#addRecordBtn").css('background-color','#d2d2d2');
		}
		function onBtn(){
			$("#registBtn").attr("disabled", false);
			$("#registBtn").css('background-color','#3D6B9B');
			$("#changeBtn").attr("disabled", false);
			$("#changeBtn").css('background-color','#3D6B9B');
			$("#addRecordBtn").attr("disabled", false);
			$("#addRecordBtn").css('background-color','#3D6B9B');
		}
	</script>
	<script>
		$("#showMenu1").hover(function() {
			$("#menu2").attr("style", "display:inline-block");
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
				url : '/erp/Account/acTemporary',
				success : function(data) {
					console.log(data);
					$("#description").html(data);
				},
				error : function(err) {
					console.log(err);
				}
			});

		});

	</script>
</body>
</html>
