<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>사원 출결 관리</title>
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




table
{
     border:1px solid #BDBDBD;
     text-align:center;
     width:30%;
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
.attendance{

   border: 1px solid black;
}
input{
   outline-style: none;
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
                <p>인사관리</p>
                <li class="active">
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
<!--                 </div> -->
<!--                     <div class="collapse navbar-collapse">  id="navbarSupportedContent"
                    </div> -->
            <!-- </nav> -->
            <br>
            <br>
   <div id="description">

   <div class="first_div_css">
      <h1 class="deptregist_color_size">사원 출결 관리</h1>
   </div>
                        <!-- 09-24 style change -->
    <table align="center" id="calendar" style="width: 500px;height: 400px;float: left; margin-right: 20px;">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <tr>
            <td align="center"> <font color="#FF9090">일</font></td>
            <td align="center"> 월 </td>
            <td align="center"> 화 </td>
            <td align="center"> 수 </td>
            <td align="center"> 목 </td>
            <td align="center"> 금 </td>
            <td align="center"><font color=#7ED5E4>토</font></td>
        </tr>
    </table>
    <div id="at" style="height: 400px;overflow: auto;"></div>
   </div>

   <script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
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
   
   
   function checkMyAt(i){
      console.log("일수="+i);
      console.log($("#yearmonth").html());
      $.ajax({
         url : "/erp/rest/hr/employeeattendance",
         method:"get",
         dataType:"json",
         data:{day : i, yearmonth : $("#yearmonth").html()},
         success : function(data){
            console.log(data);
            //09-24 table change
            let str = "<div style='height:400px;float:right;position:static;'><table style='width:500px;overflow-y:scroll;'>";
             for(let i = 0 ; i<data.length ; i++){
               let type = "";
                   let time = data[i].ha_time.substr(16, 8);
                   var timeArry=time.split(':');
                   var timenumber=timeArry[0]+timeArry[1]+timeArry[2];
                if(data[i].ha_type=="1"){
                   type += "<font style='color:blue'>"
                  type+= " 출근</font>"
               }else{
                  type += "<font style='color:red'>"
                  type+= " 퇴근</font>"
               }
                console.log(date);
                console.log(timenumber);
               str += "<tr style='width:500px; height:50px;'><td>"+data[i].m_name+"</td><td class='"+timenumber+"'><input id="+timenumber+" type='text' value='" + time + "' style='border:0px solid; text-align:center;' readonly='true'></td><td>" + type + "</td>";
               str +="<td><button type='button' class='infobtn' onclick='javascript:attendanceUpdate(this,\""+data[i].ha_hrcode+"\",\""+data[i].ha_time+"\");'>수정</button>";
               str +="<button type='button' class='infobtn' onclick='javascript:attendanceDelete(this,\""+data[i].ha_hrcode+"\",\""+data[i].ha_time+"\");'>삭제</button></td></tr>";

            }
            str += "</table></div>";
            $("#at").html(str);
         }, error : function(err){
            console.log(err);
         }
      });
   }

   function attendanceUpdate(row, hrcode, time){

         let tr=row.parentNode.parentNode;
         var input=tr.children[1].children[0];
         var num=time.substr(16,8);
         var numArry=num.split(':');
         var number=numArry[0]+numArry[1]+numArry[2];
         console.log(number);
         console.log(input.value);
         console.log($("#"+number).val());
         console.log(input.id);
         if(num==$("#"+number).val()){
            $("#"+number).attr("readonly", false);
            $("#"+number).prop("type", "time");
            $("#"+number).css("border", "1px solid black");
         }else{
             if(confirm("정말 수정하겠습니까?")){
               $.ajax({
               url:'/erp/rest/hr/attendanceUpdate',
               type:'get',
               data:{hrcode : hrcode, time : time, textTime : $("#"+number).val()},
               dataType:'json',
               success:function(data){
                  let str = "<div style='height:400px;overflow-x:hidden;float:right;position:static;'><table style='width:500px;overflow-y:scroll;'>";
                   for(let i = 0 ; i<data.length ; i++){
                     let type = "";
                         let time = data[i].ha_time.substr(16, 8);
                         var timeArry=time.split(':');
                         var timenumber=timeArry[0]+timeArry[1]+timeArry[2];
                      if(data[i].ha_type=="1"){
                         type += "<font style='color:blue'>"
                        type+= " 출근</font>"
                     }else{
                        type += "<font style='color:red'>"
                        type+= " 퇴근</font>"
                     }
                      console.log(date);
                      console.log(timenumber);
                     str += "<tr style='width:500px; height:50px;'><td>"+data[i].m_name+"</td><td class='"+timenumber+"'><input id="+timenumber+" type='text' value='" + time + "' style='border:0px solid; text-align:center;' readonly='true'></td><td>" + type + "</td>";
                     str +="<td><button type='button' class='infobtn' onclick='javascript:attendanceUpdate(this,\""+data[i].ha_hrcode+"\",\""+data[i].ha_time+"\");'>수정</button>";
                     str +="<button type='button' class='infobtn' onclick='javascript:attendanceDelete(this,\""+data[i].ha_hrcode+"\",\""+data[i].ha_time+"\");'>삭제</button></td></tr>";
                  }
                  str += "</table></div>";
                  $("#at").html(str);
               },
               error:function(err){
                  console.log(err);
               }
            });
         }else{
            alert("취소가 완료되었습니다.");
            $("#"+number).attr("type","text");
            $("#"+number).attr("readonly", true);
            $("#"+number).val(num);
            $("#"+number).css("border", "0px");
         }
      }

   }


   //사원  출퇴근 삭제
   function attendanceDelete(row,hrcode,time){
      if(confirm("정말 삭제하겠습니까?")){
         let tr = row.parentNode.parentNode;
         tr.parentNode.removeChild(tr);
          $.ajax({
            url:"/erp/rest/hr/attendanceDelete",
            type:'get',
            data:{hrcode : hrcode, time : time},
            dataType:'json',
            success:function(data){
               console.log(data);
            },
            error:function(err){
               console.log(err);
            }
         });
      }else{
         alert("취소되었습니다.");
      }
   }

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


//이 아래로 달력
    var today = new Date(); // 오늘 날짜
    var date = new Date();

    function beforem() //이전 달을 today에 값을 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }

    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }

    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력

        if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        before.innerHTML="12월";
        next.innerHTML=(today.getMonth()+2)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }


        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 2)
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;

        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++)
        {
            cell = row.insertCell();
            cnt = cnt + 1;
        }

        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        {
            cell = row.insertCell();
            cell.innerHTML = "<a href='javascript:checkMyAt("+i+")'>"+i+"</a>" ;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
                cell.innerHTML = "<a href='javascript:checkMyAt("+i+")'><font color=#FF9090>"+i+"</font></a>";//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                cell.innerHTML = "<a href='javascript:checkMyAt("+i+")'><font color=#7ED5E4>"+i+"</font></a>";//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate())
            {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
        }
    }

   </script>
</body>
</html>