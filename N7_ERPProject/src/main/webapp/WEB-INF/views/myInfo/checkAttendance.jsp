<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

#description {
	float: left;
	height: 100%;
	width: 800px;
}

ul {
	list-style: none;
}
.attendance{
	border: 1px solid black;
	margin : 15px;
	width:300px;
	height: 70px;
}

.emphasis{
	background:#FFB2D9;
	font-size: 30px;
	font-weight: bold;
	color:white;
}
.noemphasis{
	background:gray;
	font-size:20px;
}

#check{
	width:800px;
	height:150px;
	text-align: center;
	align-content: center;
}
</style>
</head>
<body onload="build();">
	<div id="header">
		<div id="logo">
			<h1>
				<a href="#">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu">
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="/erp/myinfo/checkattendance">출/퇴근 등록</a></li>
			<li><a href="/erp/myInfo/myInfo">내 정보 보기</li>
			<li><a href="/erp/myinfo/myPaycheck">급여명세서 보기</li>
			<li><a href="/erp/myinfo/myattendance">내 출결 보기</li>
			<li><a href="/erp/myinfo/myholiday">내 휴가 보기</li>
			<li><a href="/erp/myinfo/applyholiday">휴가신청</a></li>
			<li><a href="/erp/myinfo/mydocument">나의 결재함</a></li>
		</ul>
	</div>
	<div id="description">
	
	<h1 align="center">현재시각</h1>
	<h1 align="center" id="clock"></h1><br><br>
	
	<div style="align:center;" id="currentStatus"></div>
	<br>
	<br>
	<div id='check'>
	<span id="in" class="attendance">출근 등록</span>
	<span id="out" class="attendance">퇴근 등록</span>
	</div>
	</div>
	
	
    <table align="center" id="calendar">
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
	


	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
<script>
	var status = "";
	var load = function(){
		$.ajax({
			url:"/erp/rest/hr/currentattendance",
			dataType:"json",
			method:"get",
			success : function(status){
				console.log(status);
				if(status == 1){
					status = "<h1 align='center'>근무중</h1>";
					$("#out").addClass('emphasis');
					$("#in").addClass('noemphasis');
				}else{
					status = "<h1 align='center'>퇴근중</h1>";
					$("#in").addClass('emphasis');
					$("#out").addClass('noemphasis');
				}
				$("#currentStatus").html(status);
			}, error : function(err){
				console.log(err);
			}
		});
		
		
	};
	load();
	$(".attendance").click(function(){
		console.log(this.id);
		let curtime = new Date();
	
		$.ajax({
			url:"/erp/rest/hr/attendance",
			data:{status : this.id, time : curtime.toString()},
			dataType:"json",
			method:"post",
			success: function(data){
				console.log(data);
				if(data == 1){
					alert("출근 등록 되었습니다.");
				}else{
					alert("퇴근 등록 되었습니다.");
				}
				location.reload();
			}, error : function(err){
				console.log(err);
			}
		}); 
	});

	var clockTarget = document.getElementById("clock");


	function clock() {
	    var date = new Date();
	    // date Object를 받아오고 
	    var month = date.getMonth();
	    // 달을 받아옵니다 
	    var clockDate = date.getDate();
	    // 몇일인지 받아옵니다 
	    var day = date.getDay();
	    // 요일을 받아옵니다. 
	    var week = ['일', '월', '화', '수', '목', '금', '토'];
	    // 요일은 숫자형태로 리턴되기때문에 미리 배열을 만듭니다. 
	    var hours = date.getHours();
	    // 시간을 받아오고 
	    var minutes = date.getMinutes();
	    // 분도 받아옵니다.
	    var seconds = date.getSeconds();
	    let time = (month+1)+"월 "+clockDate + "일 " + week[day] + "요일 " + hours + "시 " + minutes + "분 " + seconds + "초";
	    $("#clock").text(time);
	}


	//시계 진행되게 계속 실행시켜주는거
	function init() {
	clock();
	setInterval(clock, 1000);
	}

	init();
	

	
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
	            cell.innerHTML = i;
	            cnt = cnt + 1;
	            if (cnt % 7 == 1) {//일요일 계산
	                cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
	            }
	            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
	                cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
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