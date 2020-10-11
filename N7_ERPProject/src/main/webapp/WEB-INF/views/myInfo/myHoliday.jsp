<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>내 휴가 보기</title>
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
   height: 500px;
   width:1150px;
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
.attendance{
   border: 1px solid black;
}

table, th, td{
	text-align:center;
	border-bottom : 1px solid balck;
	border-top : 1px solid black;
	border-collapse: collapse;
}
#calendar td{
   width:30px;
}
#menu2 {
	font-size: medium;
	}

body{
	color:black;
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
		<h1 class="deptregist_color_size">내 휴가 보기</h1>
	</div>
   <div style="float: right;">
   <table style="border: 1px solid black; ">
   		<tr style="background-color: #FFFFFF">
   			<td>대기중</td>
   			<td>회색</td>
   		</tr>
   		<tr style="background-color: #D2E9FF">
   			<td>승인</td>
   			<td>초록색</td>
   		</tr>
   </table>
   </div>
      <table align="center" style="margin-top: 50px;background-color: #D9EDF7;">
         <tr style="border: 1px solid black;">
            <td style="width : 100px;"><font color="#8A7F8D"><label
                  onclick="beforem()" id="before"></label></font></td>
            <td style="width : 150px; font-size: 15px;" align="center" id="yearmonth" style="font-size: 15px;"></td>
            <td style="width : 100px;"><font color="#8A7F8D"><label
                  onclick="nextm()" id="next"></label></font></td>
         </tr>
      </table>
      <table align="center" id="calendar">
      </table>

      <br>
      <div id="container"></div>
   </div>
   <script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
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
   
      var str = "";
      $(document).ready(function() {
      })

      //이 아래로 달력
      var today = new Date(); // 오늘 날짜
      var date = new Date();

      function beforem() //이전 달을 today에 값을 저장
      {
         today = new Date(today.getFullYear(), today.getMonth() - 1, today
               .getDate());
         build(); //만들기
      }

      function nextm() //다음 달을 today에 저장
      {
         today = new Date(today.getFullYear(), today.getMonth() + 1, today
               .getDate());
         build();
      }

      function build() {
         var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
         var lastDate = new Date(today.getFullYear(), today.getMonth() + 1,
               0); //현재 달의 마지막 날
         var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
         var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
         yearmonth.innerHTML = today.getFullYear() + "년 "
               + (today.getMonth() + 1) + "월"; //년도와 월 출력

         if (today.getMonth() + 1 == 12) //  눌렀을 때 월이 넘어가는 곳
         {
            before.innerHTML = (today.getMonth()) + "월";
            next.innerHTML = "1월";
         } else if (today.getMonth() + 1 == 1) //  1월 일 때
         {
            before.innerHTML = "12월";
            next.innerHTML = (today.getMonth() + 2) + "월";
         } else //   12월 일 때
         {
            before.innerHTML = (today.getMonth()) + "월";
            next.innerHTML = (today.getMonth() + 2) + "월";
         }

           // 남은 테이블 줄 삭제
           while (tbcal.rows.length > 0)
           {
               tbcal.deleteRow(tbcal.rows.length - 1);
           }

         var row = null;
         row = tbcal.insertRow();
         var cnt = 0;
         // 달력 출력
         for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
         {
            cell = row.insertCell();
            cell.style.width="30px;";
            cell.innerHTML = "<span id="+i+"><a href='javascript:checkMyAt("
                  + i + ")'>" + i + "</a></span>";
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
               cell.innerHTML = "<span id="+i+"><a href='javascript:checkMyAt("
                     + i
                     + ")'><font color=#FF9090>"
                     + i
                     + "</font></a></span>";//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
               cell.innerHTML = "<span id="+i+"><a href='javascript:checkMyAt("
                     + i
                     + ")'><font color=#7ED5E4>"
                     + i
                     + "</font></a></span>";//토요일에 색
            }
            if (today.getFullYear() == date.getFullYear()
                  && today.getMonth() == date.getMonth()
                  && i == date.getDate()) {
               cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
         }
         $.ajax({
            url : "/erp/rest/hr/myholidayview",
            dataType : "json",
            data : {
               yearmonth : $("#yearmonth").html()
            },
            method : "get",
            success : function(data) {
               console.log(data);
               console.log($("#yearmonth").html());
               var month = $("#yearmonth").html().split("월");
               month = month[0].split(" ");
               var year = month[0].substr(0, 4);
               month = month[1];
               if (month < 10) {
                  month = "0" + month;
               }
               row = calendar.insertRow();
               for (let k = 0; k < data.length; k++) {
                  let startarr = data[k].hap_startday.split("-");
                  let startday = "";
                  for (let sa = 0; sa < startarr.length; sa++) {
                     startday += startarr[sa];
                  }
                  let endarr = data[k].hap_endday.split("-");
                  let endday = "";
                  for (let sa = 0; sa < endarr.length; sa++) {
                     endday += endarr[sa];
                  }
                  console.log(startday, endday);
                  for (let j = 0; j < cnt + 1; j++) {
                     cell = row.insertCell();
                     let day = j + 1;
                     if (day < 10) {
                        day = "0" + day;
                     }
                     //09-24 change
                   	 cell.style.padding="10px 0px";
                     if(data[k].hap_status=="3"){
                    	 cell.style.backgroundColor="#D2E9FF";
                    	 cell.style.color="black";
                    	 cell.style.fontWeight="bolder";
                     }else if(data[k].hap_status=="1"){
                    	 cell.style.color="black";
                    	 cell.style.backgroundColor="#FFFFFF";
                     }
                     ///////
                     let date = "" + year + month + day;
                     if (startday == date) {
                        cell.innerHTML = "<--";
                     } else if (endday == date) {
                        cell.innerHTML = "-->";
                     } else if (startday < date && date < endday) {
                        if(j!=cnt){	
                           cell.innerHTML = "---";
                        }else{
                           cell.innerHTML = data[k].m_name;
                           cell.style.width="90px";
                           cell.className="last"
                              cell = row.insertCell();
                           cell.innerHTML = "<input type='button' class='infobtn' value='상세정보' id='"+data[k].hap_docunum+"' onclick='showDetail(\""+data[k].hap_docunum+"\")'>"
                           cell.clssName="last"

                        }
                     } else if (j == cnt) {
                        cell.innerHTML = data[k].m_name;
                        cell.style.width="90px";
                        cell.clssName="last"
                        cell = row.insertCell();
                        cell.innerHTML = "<input type='button' class='infobtn' value='상세정보' id='"+data[k].hap_docunum+"' onclick='showDetail(\""+data[k].hap_docunum+"\")'>"
                        cell.clssName="last"
                     } else {
                        cell.innerHTML = "";
                     }
                  }
                  designThis(cell);
                  row = calendar.insertRow();
               }
               str
            },
            error : function(err) {
               console.log(err);
            }
         });
      }

      function designThis(cell){
         console.log(cell);
         cell.style.width = "100px";
      }

      function showDetail(docunum){
         console.log(docunum);
         window.open('/erp/hr/holidaydetail?docunum=' + docunum, '휴가상세정보', 'width=1400, heigth=700');

      }

      $("#showMenu1").hover(function() {
         $("#smallMenu1").attr("style", "display:inline-block");
      }, function() {
         console.log(str);
         $("#smallMenu1").attr("style", "display:none");
      });
      $("#showMenu2").hover(function() {
         $("#smallMenu2").attr("style", "display:inline-block");
      }, function() {
         $("#smallMenu2").attr("style", "display:none");
      });
      $("#showMenu3").hover(function() {
         $("#smallMenu3").attr("style", "display:inline-block");
      }, function() {
         $("#smallMenu3").attr("style", "display:none");
      });
   </script>
</body>
</html>
