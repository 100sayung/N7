<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
		<link href="img/favicon.png" rel="icon" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />

<style type="text/css">
.List {
border-collapse: collapse;
border-top: 3px solid #168;
}
.List th {
color: #168;
background: #f0f6f9;
text-align: center;
}
.List th, .List td {
padding: 10px;
border: 1px solid #ddd;
text-align: center;
}
.List th:first-child, .List td:first-child {
border-left: 0;
}
.List th:last-child, .List td:last-child {
border-right: 0;
}
.List tr td:first-child{
text-align: center;
}
#paging{
display: block;
text-align: center;
margin-top: 15px;
margin-left: 10px;
padding-bottom: 12px;
}
 #bbb{
float: right;
margin-top: 10px;
}
#ccc{
position:relative;
float: right;
margin-top: 10px;
padding-bottom: 20px;
}
</style>
</head>
<body>
	<div id="header" class="container" style="text-align: center;">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 COMPANY</a>
			</h1>
		</div>
		<div id="menu">
		</div>
	</div>
	<div id="description" class="out" style="height: 700px;">
	<div style='width:100%; height:50px; text-align:center; background-color: #3D6B9B;'><h1><a href="/erp/erpboard" style='color:white; text-decoration: none;'>ERP상담게시판</a></h1></div>
	<div class="center">
        <div id="container">
	<form action="erpboard">
	<div id="a">
<!-- 		<h2>상담 게시판</h2> -->
		<table class="List">
			<tr>
				<th style="width: 100px;">번호</th>
				<th style="width: 800px;">제목</th>
				<th style="width: 200px;">작성자</th>
			</tr>
		</table>
	</div>
   <div id="bbb"><a href="/erp/home/writeFrm" style="text-decoration: none;"><button>글쓰기</button></a></div>
	</form>
	<div align="cneter" id="paging">${paging}</div>

 	<div id="ccc">
		<select id="choice" style="height: 24px;">
			<option value="CB_TITLE">제목</option>
			<option value="CB_WRITER">작성자</option>
		</select>
		<input type="text" id="keyword" name="search" style="height:18px;" />
		<button type="button" id="searchbtn">검색</button>
	</div>
</body>
<script>
		var bList=${bList};
	$(document).ready(function(){
		var str="";
		for(var i=0; i<bList.length; i++){
			str+="<tr><td>"+bList[i].cb_num+"</td>";
			str+="<td><a style='text-decoration: none;' href='/erp/home/boardContents?CB_NUM="+bList[i].cb_num+"'>"+bList[i].cb_title+"</a></td>";
			str+="<td>"+bList[i].cb_writer+"</td></tr>";
		}
		$(".List").append(str);
		console.log(bList);
	});

	$("#searchbtn").click(function(){
        var pageNum=0;
		var choice= $("#choice").val();
		var keyword= $("#keyword").val();
		console.log(choice);
		console.log(keyword);

		if(keyword==""){
			alert("검색어를 입력해 주세요");
		}else{
		$.ajax({
			url: "/erp/rest/home/boardSearch",
			type: "post",
			data: "choice="+choice+"&keyword="+keyword,
			dataType: "json",
			success: function(data){
				$(".List").html("");
				console.log(data);
				 var str="";
				 str+="<tr style='background-color: #3D6B9B; width: 350px; color:white;'><th scope='row'style='width: 100px;'>번호</th><th scope='row' style='width: 800px;'>제목</th><th scope='row' style='width: 200px;'>작성자</th></tr>";
				 if(data.bList!=""){
					 for(var i=0; i<data.bList.length-1; i++){
						 str+="<tr><td>"+data.bList[i].cb_num+"</td>";
						 str+="<td><a style='text-decoration: none;' href='/erp/home/boardContents?CB_NUM="+data.bList[i].cb_num+"'>"+data.bList[i].cb_title+"</a></td>";
						 str+="<td>"+data.bList[i].cb_writer+"</td></tr>";
						}
					 pageNum+=data.bList[data.bList.length-1].cb_count;
					 console.log(pageNum);

						$(".List").html(str);
						var totalData = pageNum;
						var pageCount=0;
					    var dataPerPage = 10;
					    if(pageNum<10){
					       pageCount = 1;

					    }else{

					       pageCount = 5;
					    }


					        paging(totalData, dataPerPage, pageCount, 1);


					    function paging(totalData, dataPerPage, pageCount, currentPage){

					        console.log("currentPage : " + currentPage);

					        var totalPage = Math.ceil(totalData/dataPerPage);
					        var pageGroup = Math.ceil(currentPage/pageCount);

					        console.log("pageGroup : " + pageGroup);

					        var last = pageGroup * pageCount;
					        if(last > totalPage)
					            last = totalPage;
					        var first = last - (pageCount-1);
					        var next = last+1;
					        var prev = first-1;

					        console.log("last : " + last);
					        console.log("first : " + first);
					        console.log("next : " + next);
					        console.log("prev : " + prev);

					        var $pingingView = $("#paging");

					        var html = "";

					        if(prev > 0)
					            html += "<a href=# id='prev'><</a> ";

					        for(var i=first; i <= last; i++){
					            html += "<a href='#' id=" + i + ">[" + i + "]</a> ";
					        }

					        if(last < totalPage)
					            html += "<a href=# id='next'>></a>";

					        $("#paging").html(html);
					        $("#paging a").css("color", "black");
					        $("#paging a#" + currentPage).css({"text-decoration":"none",
					                                           "color":"red",
					                                           "font-weight":"bold"});

					        $("#paging a").click(function(){

					            var $item = $(this);
					            var $id = $item.attr("id");
					            var selectedPage = $item.text();

					            if($id == "next")    selectedPage = next;
					            if($id == "prev")    selectedPage = prev;

					            paging(totalData, dataPerPage, pageCount, selectedPage);
					        });

					    }
				 }else{
					alert("데이터가 없습니다.");
				 }
			 },
			error: function(err){
				console.log(err);
			}
		});
		}
	});

</script>
</html>
