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
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
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

#description {
	float: left;
	height: 100%;
	width: 800px;
}

ul {
	list-style: none;
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
				<ul id="mainmenu">
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li id="showMenu1">인사 관리
				<ul id="smallMenu1" style="display: none;">
					<li><a href="/erp/hr/deptregistpage">부서등록</a></li>
					<li><a href="/erp/hr/movehrcardpage">인사카드</a></li>
				</ul>
			</li>

			<li id="showMenu2">근태 관리
				<ul id="smallMenu2" style="display: none;">
					<li><a href="/erp/hr/receiptholiday">휴가 접수</a></li>
					<li><a href="/erp/hr/attendance">사원 출결 조회</a></li>
					<li><a href="/erp/hr/employeestatus">근무 조회</a></li>
					<li><a href="/erp/hr/retiremm">휴/퇴직 관리</a></li>
				</ul>
			</li>
			<li id="showMenu3">급여 관리
				<ul id="smallMenu3" style="display: none;">
					<li><a href="/erp/hr/deptpay">부서/직급별 급여</a></li>
					<li><a href="/erp/hr/deduct">공제사항 관리</a></li>
					<li><a href="/erp/hr/searchpaymm">급여 관리</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="description">
	<div class="divcss">부서 or 직책 적용</div>
	<table>
		<tr id="seldplist">
			<td><select id="disdept" name="disdept" onchange="changeDept()"><option selected="selected"
						 value="">부서 선택</option>
			</select></td>
			<td><select id="disposition" name="disposition"><option selected="selected"
						 value="">직급 선택</option>
			</select></td>
			<td><button type="button" onclick="distinct()">검색</button></td>
			<!-- 검색 버튼 클릭시  -->
		</tr>
	</table>
	<table id="id">
		<tr align="center">
			<td>부서</td>
			<td>직급</td>
			<td>금액</td>
			<td>수정 금액</td>
			<td></td>
		</tr>
	</table>
 </div>
</body>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
<script>
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


	//현재 부서와 직급 갯수 대로 반복 출력
	$(function() {
		var dept = ${dept};
		console.log(${dept});
		console.log(dept.length);
		for(var i=0;i<dept.length;i++){
			console.log(dept[i].HDP_num+dept[i].HDP_pay);
			$("#id").append("<tr align='center'><td width='100px'>"+dept[i].HDP_dept+"</td>"
			+"<td width='100px'>"+dept[i].HDP_position+"</td>"
			+"<td id='"+dept[i].HDP_num+"' width='100px'>"+dept[i].HDP_pay+"</td>"
			+"<td><input id='modifypay_"+dept[i].HDP_num+"'></td>"
			+"<td><button type='button' id='"+dept[i].HDP_num+dept[i].HDP_pay+"'  onclick='dify("+dept[i].HDP_num+")'>수정</button></td>"
			+"<td><button type='button' onclick='erase("+dept[i].HDP_num+")'>삭제</button></td></tr>");
		}
	});
	
// 	$(function(){
// 		var division = ${dept};
// 		for(var i=0;i<division.length;i++){
// 			var num=division[i].HDP_num;
// 			var p=division[i].HDP_pay;
// 			$("#modifypay_"+division[i].HDP_num).keyup(function(event){
// 			console.log(num+","+p);
// 				if(event.keyCode==13){
// 					$("#"+num+p).click();
// 				}
// 			});
// 		}
// 	});



	//부서 직급 페이지 에서 급여 수정
	function dify(dept) {
		var paymodify = $("#modifypay_"+dept).val();
		console.log("paynum("+dept+")="+paymodify);
		console.log(dept);
		$.ajax({
			url : "modifydeptpay",
			method : "post",
			dataType:"JSON",
			data : {dept : dept, pay : paymodify},
			success : function(data) {
				$("#"+dept).html(data);
				$("#modifypay_"+dept).val('');
			},
			error : function(err) {
				console.log(err);
			}
		});
	}


	//부서 직급 페이지 해당 부서,직급 삭제
	function erase(deptnum) {
		console.log(deptnum);
		$.ajax({
			url : "deptdelete",
			method : "post",
			data : {deptnum : deptnum},
			dataType: 'JSON',
			success : function(data) {
				var str='<tr align="center"><td width="100px">부서</td><td width="100px">직급</td><td width="100px">금액</td><td width="100px">수정 금액</td></tr>';
				for(var i=0;i<data.length;i++){
					str+="<tr align='center'><td width='100px'>"+data[i].HDP_position+"</td>"
					+"<td width='100px'>"+data[i].HDP_dept+"</td>"
					+"<td id='"+data[i].HDP_num+"' width='100px'>"+data[i].HDP_pay+"</td>"
					+"<td><input id='modifypay_"+data[i].HDP_num+"'></td>"
					+"<td><button type='button id='"+dept[i].HDP_num+dept[i].HDP_pay+"'' onclick='dify("+data[i].HDP_num+")'>수정</button></td>"
					+"<td><button type='button' onclick='erase("+data[i].HDP_num+")'>삭제</button></td></tr>";
				}
				console.log(str);
				$("#id").html(str);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}


	//부서 직책 검색전 <select>문 목록
	$(function(){
		var str='';
		var distinctposition=${distinctposition};
		var distinctdept=${distinctdept};
// 		for(var i=0;i<distinctposition.length;i++){
// 			$("#disposition").append("<option>"+distinctposition[i].HDP_position+"</option>");
// 		}
		for(var i=0;i<distinctdept.length;i++){
			$("#disdept").append("<option>"+distinctdept[i].HDP_dept+"</option>");
		}
	});
	function changeDept(){
		var id=$("#disdept");
		console.log(id.val());
		$.ajax({
			url:"deptsearchposition",
			method : "get",
			dataType : "json",
			data : {"dept" : id.val()},
			success : function(data){
				let str = "";
				str += "<select name='dispostion' class='detailInfo' id='disposition'>";
				for(let i = 0 ; i<data.length ; i++){
					str += "<option value='"+data[i].HDP_position+"'>"+data[i].HDP_position+"</option>";
				}
				str += "</select>"
				$("#disposition").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}
	//부서 직책 검색기능
	function distinct(){

		var disdept=$("#disdept").val();
		var disposition=$("#disposition").val();
		console.log(disdept);
		console.log(disposition);
		$.ajax({
			url:'distinct',
			method:'post',
			data:{disdept:disdept,disposition:disposition},
			dataType:'json',
			success:function(data){
				var str='<tr align="center"><td width="100px">부서</td><td width="100px">직급</td><td width="100px">금액</td><td width="100px">수정 금액</td></tr>';
				for(var i=0;i<data.length;i++){
					str+="<tr align='center'><td width='100px'>"+data[i].HDP_dept+"</td>"
					+"<td width='100px'>"+data[i].HDP_position+"</td>"
					+"<td id='"+data[i].HDP_num+"' width='100px'>"+data[i].HDP_pay+"</td>"
					+"<td><input id	='modifypay_"+data[i].HDP_num+"'></td>"
					+"<td><button type='button' id='"+dept[i].HDP_num+dept[i].HDP_pay+"' onclick='dify("+data[i].HDP_num+")' class='mopay'>수정</button></td>"
					+"<td><button type='button' onclick='erase("+data[i].HDP_num+")' class='mopay'>삭제</button></td></tr>";
					console.log(data[i].HDP_num);
				}
				$("#id").html(str);
			},
			error:function(err){
				console.log(err);
			}

		});
	}

	
</script>
</html>
