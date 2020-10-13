<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>사원 휴 -퇴직 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />


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
/* body{
	font-size:medium;
	color:black;
	font-weight: bold;
}
input,select{
	font-size: medium;
} */
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
	<div id="description">
	<div class="first_div_css">
		<h1 class="deptregist_color_size">사원 휴 - 퇴직 관리</h1>
	</div>
	<div style="float: right;">
		<input type="text" id="nameSearch" placeholder="이름으로 입력" style="padding: 5px 10px;"> <button onclick="searchFromName()" class="infobtn" id="nameSearching">검색</button>
	</div>
	<div>
		<a href="javascript:CheckRetired(0)"><button class='infobtn'>재직중</button></a>
		<a href="javascript:CheckRetired(1)"><button class='infobtn'>휴직중</button></a>
		<a href="javascript:CheckRetired(2)"><button class='infobtn'>퇴사</button></a> <br>
		<div>
			<table style="width: 100%;border-collapse: collapse;text-align: center;border: #D9EDF7"border="1">
				<tr style="background-color: #B2BEB5">
					<td width="150px">이름</td>
					<td width="300px">부서</td>
					<td width="300px">직책</td>
					<td width="250px" colspan="2"></td>
				</tr>
			</table>
		</div>
		<div id="container" style="overflow:auto; width:1150px; height:600px;" align="center">
			<input type="hidden" value="" id="status">
		</div>
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
	   
	   
	//검색 조건들 생성



	//검색 조건 끝
	CheckRetired(0);


	function CheckRetired(status){
		$.ajax({
			url:"/erp/rest/hr/checkretired",
			dataType:"json",
			method:"get",
			data : {status : status},
			success : function(data){
				let str = "";
				str += "<table style='border:1px solid #D9EDF7; width:1150px;text-align:center;'>";
				console.log(data);
				for(let i = 0 ; i<data.length ; i++){
					str += "<tr>"
					str += "<td width='150px'><input type='hidden' name='hc_hrcode' value= '"+data[i].hc_hrcode+"'>"+data[i].m_name +"</td>";
					str += "<td width='300px'><input type='text' class='border_delete_btn' name ='hc_dept' value = '" + data[i].hc_dept + "' readonly></td>";
					str += "<td width-'300px'><input type='text' class='border_delete_btn' name='hc_position' value = '" + data[i].hc_position + "' readonly></td>";
					str+="<td><select name='hc_work'>";
					if(status == 1){
						str+="<option value = '1' selected = 'selected'> 휴직 </option>";
						str+="<option value = '2'> 퇴사 </option>";
						str+="<option value = '0'> 재직 </option>";
					}else if(status == 2){
						str+="<option value = '1'> 휴직 </option>";
						str+="<option value = '2' selected = 'selected'> 퇴사 </option>";
						str+="<option value = '0'> 재직 </option>";
					}else if(status == 0){
						str+="<option value = '1'> 휴직 </option>";
						str+="<option value = '2'> 퇴사 </option>";
						str+="<option value = '0' selected = 'selected'> 재직 </option>";
					}
					str += "</select></td><td><input type='button' class='infobtn' value='등록' onclick='javascript:thisRowDel(this);'></td></tr>";
				}
				str+="</table>"
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
		$("#status").val(status);
	}


		function thisRowDel(row){
			if(confirm("정말 하시겠습니까?") == true){
			console.log(row);
			let tr = row.parentNode.parentNode;
			console.log(tr.firstChild.firstChild.value);
			console.log(tr.lastChild.previousSibling.firstChild.value);
			$.ajax({
				url:"/erp/rest/hr/updateretired",
				data : {hrCode : tr.firstChild.firstChild.value, work : tr.lastChild.previousSibling.firstChild.value},
				dataType:"json",
				method:"post",
				success : function(data){
					console.log(data);
				},error : function(err){
					console.log(err)
				}
			});
			tr.parentNode.removeChild(tr);
			}else{
				alert("취소되었습니다.");
			}
		}
	//업데이트시




	function searchFromName(){
		$name = $("#nameSearch").val();
		console.log($name);
		$.ajax({
			url:"/erp/rest/hr/searchingretirename",
			data:{name:$name},
			dataType:"json",
			method:"post",
			success : function(data){
				let str = "";
				if(data.length!=0){
					str += "<table style='border:1px solid #D9EDF7; width:1150px;text-align:center;'>";
					console.log(data);
					for(let i = 0 ; i<data.length ; i++){
						str += "<tr>"
						str += "<td width='150px'><input type='hidden' name='hc_hrcode' value= '"+data[i].hc_hrcode+"'>"+data[i].m_name +"</td>";
						str += "<td width='300px'><input type='text' class='border_delete_btn' name ='hc_dept' value = '" + data[i].hc_dept + "' readonly></td>";
						str += "<td width='400px'><input type='text' class='border_delete_btn' name='hc_position' value = '" + data[i].hc_position + "' readonly></td>";
						str+="<td><select name='hc_work'>";
						if(data[i].hc_work == 1){
							str+="<option value = '1' selected = 'selected'> 휴직 </option>";
							str+="<option value = '2'> 퇴사 </option>";
							str+="<option value = '0'> 재직 </option>";
						}else if(data[i].hc_work == 2){
							str+="<option value = '1'> 휴직 </option>";
							str+="<option value = '2' selected = 'selected'> 퇴사 </option>";
							str+="<option value = '0'> 재직 </option>";
						}else if(data[i].hc_work == 0){
							str+="<option value = '1'> 휴직 </option>";
							str+="<option value = '2'> 퇴사 </option>";
							str+="<option value = '0' selected = 'selected'> 재직 </option>";
						}
						str += "</select></td><td><input type='button' class='infobtn' value='등록' onclick='javascript:thisRowDel(this);'></td></tr>";
					}
					str+="</table>";
				}else if(data.length==0){
					str+="<img width='300px' height='200px' src='https://blogpfthumb-phinf.pstatic.net/MjAyMDEwMDhfMzAw/MDAxNjAyMTIyNTMxOTM1.cPqAMKgvroqiVofLJzASQOwt3BOrq1zpalCLu6vch0Ig.PdHZwEQaxFiD4lK9kgW7NoywjrEk9yuyLZWozxx7_xkg.GIF.tkdgus5512/no_article.gif?type=w161'>";
				}
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}


	// 09-24 change    append   id=nameSearching
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

	</script>
</body>
</html>
