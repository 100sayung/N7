<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- BOOTSTRAP STYLES-->
<link href="/erp/assets/css/bootstrap.css" rel="stylesheet">
<!-- FONTAWESOME STYLES-->
<link href="/erp/assets/css/font-awesome.css" rel="stylesheet">
<!-- CUSTOM STYLES-->
<link href="/erp/assets/css/custom.css" rel="stylesheet">
<!-- GOOGLE FONTS-->
<link href="http://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet" type="text/css">
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="/erp/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="/erp/assets/js/bootstrap.min.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/erp/assets/js/custom.js"></script>
<title>Insert title here</title>
<style>
table, tr, td {
	border: 1px solid black;
	text-align: center;
}

td {
	padding: 5px;
	font-size: large;
/* 	width: 58px; */
	height: 10px;
}

#table {
	width: 1200px;
	height: auto;
}

#m {
	background-color: gray;
}

#center{

text-align: center;
}
</style>
</head>
<body>
	<!-- 	<h1>acPend.jsp(임시저장)</h1> -->
	<table id="table">
		<tr id="m">
			<td>check</td>
			<td>문서번호</td>
			<td>회사코드</td>
			<td>결재문서이름</td>
			<td>결재올린사람</td>
			<td>결재받는사람</td>
			<td>올린시간</td>
			<td>결재상태</td>
		</tr>
		<tbody id="Info"></tbody>
	</table>
	<br>
	<div id="paging" style="text-align: center;"></div>
	<br>
	<div id="center">
	<button id="approval">결재안 상세보기</button>
	</div>
	<!-- 	<button id="acBack2">반려요청</button> -->
	<!-- 	<button id="acDelete">삭제</button> -->
</body>
<script>
	//페이지 변경 스크립트
	var currPage = 1;
	function pageNumber(j) {
		currPage = j;
		$.ajax({
			url : "/erp/rest/Account/documentPagenumber1",
			dataType : "json",
			method : "get",
			success : function(page) {
				console.log(page);
				var pagecnt = (page / 10) + 1;
				let str = "";
				for (let i = 1; i < pagecnt; i++) {
					if (i == currPage) {
						str += " &nbsp; [" + i + "] &nbsp; ";
					} else {
						str += " &nbsp; <a href=javascript:paging(" + i + ")>["
								+ i + "]</a> &nbsp; ";
					}
				}
				console.log(str);
				$("#paging").html(str);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	function paging(num) {
		pageNumber(num);
		apdownPaymentList(num);
	}

	function apdownPaymentList(nowPage) {
		$.ajax({
					url : "/erp/rest/Account/apdownPaymentList",
					dataType : "json",
					data : {
						nowPage : nowPage,
						cntPerPage : "10"
					},
					method : "get",
					success : function(data) {
						let str = "";
						for (let i = 0; i < data.length; i++) {
							str += "<table>"
							str += "<tr>"
							str += "<td><input type='radio' name='checknum' class='check' value='"+data[i].ap_docunum+"'></td>";
							str += "<td>" + data[i].ap_docunum + "</td>";
							str += "<td>" + data[i].ap_ccode + "</td>";
							str += "<td>" + data[i].ap_docuname + "</td>";
							str += "<td>" + data[i].ap_fromapprover + "</td>";
							str += "<td>" + data[i].ap_toapprover + "</td>";
							str += "<td>" + data[i].ap_date + "</td>";
							str += "<td>" + data[i].ap_status + "</td>";
							str += "</tr>"
						}
						str += "</table>";
						$("#Info").html(str);
					},
					error : function(err) {
						console.log(err);
					}
				});
	}

	apdownPaymentList(1);
	pageNumber(1);
</script>
<script>
	//	$.ajax({
	//	type : 'get',
	//	url : '/erp/rest/Account/apdownPaymentList',
	//	dataType : 'json',
	//	contentType : 'application/json; charset=UTF-8',
	//	success : function(data) {
	//		console.log(data);
	//		var str = "";
	//		for ( var i in data.pList) {
	//			str += "<tr class='success'>"
	//			str += "<td><input type='radio' name='checknum' class='check' value='"+data.pList[i].ap_docunum+"'></td>"
	//			str += '<td>' + data.pList[i].ap_docunum + '</td>'
	//			str += '<td>' + data.pList[i].ap_ccode + '</td>'
	//			str += '<td>' + data.pList[i].ap_docuname + '</td>'
	//			str += '<td>' + data.pList[i].ap_fromapprover + '</td>'
	//			str += '<td>' + data.pList[i].ap_toapprover + '</td>'
	//			str += '<td>' + data.pList[i].ap_date + '</td>'
	//			str += '<td>' + data.pList[i].ap_status + '</td>'
	//			str += '</tr>'
	//		}
	//		$("#Info").html(str);
	//	},
	//	error : function(err) {
	//		console.log(err);
	//	}
	//});
	$("#approval").click(
			function() {
				var check = '';
				$("input[name='checknum']:checked").each(
						function() {
							check = $(this).attr('value');

							window.open(
									'/erp/rest/Account/apRequest2?j_docunum='
											+ check,
									'/erp/rest/Account/apRequest2',
									'width=1500, height=600');
						});
			});
</script>
</html>





