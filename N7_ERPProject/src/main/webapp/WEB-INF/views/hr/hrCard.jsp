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
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
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
					<li><a href="/erp/hr/attendance">사원 출결 관리</a></li>
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
	<div id="description" align="center"> ${msg }<br><br>
	<div class="divcss">사원 인사카드 조회 및 미등록 카드 등록</div>
	<div id="noHaveHrCard"></div>
	<input type="text" id="nameSearch" placeholder="이름으로 검색">
	<button onclick="searchFromName()" class='infobtn' id="nameSearching">검색</button>
	
	<div id="container"></div>
	<div id="paging">
	
	
	
	
	</div>
	</div>
	
	
	<script src=/erp/js/menu.js></script>
	<script> 
	//페이지 변경 스크립트
 	hrCardList(1);
 	pageNumber(1);

	var currPage = 1;
	function pageNumber(j){
		currPage = j;
		$.ajax({
			url:"/erp/rest/hr/hrcardpagenumber",
			dataType:"json",
			method:"get",
			success : function(page){
				console.log(page);
				var pagecnt = (page/10) + 1;
				let str = "";
				for(let i = 1 ; i < pagecnt ; i++){
					if(i == currPage){
						str += " &nbsp; ["+ i +"] &nbsp; ";
					}else{
						str += " &nbsp; <a href=javascript:paging("+i+")>["+ i +"]</a> &nbsp; ";
					}
				}
				console.log(str);
				$("#paging").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}

	function hrCardList(nowPage){
		console.log("?????????");
		$.ajax({
			url:"/erp/rest/hr/hrcardlist",
			dataType:"json",
			data:{nowPage : nowPage, cntPerPage : "10"},
			method:"get",
			success : function(data){
				console.log(data);
				let str = "";
			 	str = "<table id='table1' border='1' cellspacing='0'>";
			 	str += "<tr class='infomenu'><td>사진</td><td>이름</td><td>생년월일</td><td>이메일</td><td>수정</td></tr>";
				for(let i = 0 ; i<data.length ; i++){
					str += "<td><img style='width:120px; height:90px;' src = '/erp/upload/"+data[i].m_photo+"'></td>";
					str += "<td>"+data[i].m_name+"</td>";
					str += "<td>"+data[i].m_birth+"</td>";
					str += "<td>"+data[i].m_email+"</td>";
					str += "<td><input type='button' value='수정' class='infobtn' onclick='modifyDetail(\""+data[i].m_id+"\")'></td></tr>";
				}
				str += "</table>";
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}	
		});
	}
	function paging(num){
		pageNumber(num);
		hrCardList(num);
	}

	function noHrCardPageNumber(j){
		currPage = j;
		$.ajax({
			url:"/erp/rest/hr/nohrcardpagenumber",
			dataType:"json",
			method:"get",
			success : function(page){
				console.log(page);
				var pagecnt = (page/10) + 1;
				let str = "";
				for(let i = 1 ; i < pagecnt ; i++){
					if(i == currPage){
						str += " &nbsp; ["+ i +"] &nbsp; ";
					}else{
						str += " &nbsp; <a href=javascript:noHrCardPaging("+i+")>["+ i +"]</a> &nbsp; ";
					}
				}
				console.log(str);
				$("#paging").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}

	function noHrCardHrCardList(nowPage){
		$.ajax({
			url:"/erp/rest/hr/nohrcardlist",
			dataType:"json",
			data:{nowPage : nowPage, cntPerPage : "10"},
			method:"get",
			success : function(data){
				console.log(data);
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}	
		});
	}
	
	function noHrCardPaging(num){
		noHrCardPageNumber(num);
		noHrCardHrCardList(num);
	}
	
	
	function searchFromName(){
		$name = $("#nameSearch").val();
		console.log($name);
		$.ajax({
			url:"/erp/rest/hr/searchfromname",
			data:{name:$name},
			dataType:"text",
			method:"get",
			success : function(data){
				console.log(data);
				let str = "";
			 	str = "<table id='table1' border='1' cellspacing='0'>";
			 	str += "<tr class='infomenu'><td>사진</td><td>이름</td><td>생년월일</td><td>이메일</td><td>수정</td></tr>";
				for(let i = 0 ; i<data.length ; i++){
					str += "<td><img style='width:120px; height:90px;' src = '/erp/upload/"+data[i].m_photo+"'></td>";
					str += "<td>"+data[i].m_name+"</td>";
					str += "<td>"+data[i].m_birth+"</td>";
					str += "<td>"+data[i].m_email+"</td>";
					str += "<td><input type='button' value='수정' class='infobtn' onclick='modifyDetail(\""+data[i].m_id+"\")'></td></tr>";
				}
				str += "</table>";
				$("#container").html(data);
			}, error : function(err){
				console.log(err);
			}
		});
	}
	
  	  $(function(){
  	      var responseMessage = "<c:out value="${msg}" />";
  	      if (responseMessage != ""){
            alert(responseMessage)
            let str = "";
            str += "<a href='javascript:NoHaveHrCard()'>미 등록 인원 보기</a>";
            $("#noHaveHrCard").html(str);
   	     }
 	  });

  	  function NoHaveHrCard(){
  		  noHrCardPaging();
  	  }
  	//09-25 change append <button> id=nameSearching
  	$("#nameSearch").keyup(function(event){
		if(event.keyCode==13){
			$("#nameSearching").click();
		}
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


		function modifyDetail(id){
			window.open('/erp/hr/hrModifyDetail?id='+id, '사원 인사카드 등록', 'width=700, height=800')
		}
		window.onbeforeunload = function(){
			window.reload();
		}
		

	</script>
</body>
</html>
