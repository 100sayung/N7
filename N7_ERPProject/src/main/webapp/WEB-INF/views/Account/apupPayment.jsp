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
<!--<link href="/erp/assets/css/font-awesome.css" rel="stylesheet"> -->
<!-- CUSTOM STYLES-->
<!--<link href="/erp/assets/css/custom.css" rel="stylesheet"> -->
<!-- GOOGLE FONTS-->
<!--<link href="http://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet" type="text/css"> -->
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<!--<script src="/erp/assets/js/jquery-1.10.2.js"></script> -->
<!-- BOOTSTRAP SCRIPTS -->
<!--<script src="/erp/assets/js/bootstrap.min.js"></script> -->
<!-- CUSTOM SCRIPTS -->
<!-- <script src="/erp/assets/js/custom.js"></script>-->

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
	text-align: center;
/* 	margin-left: 80px; */
}

#m {
	background-color: gray;
}

#center {
	text-align: center;
}



</style>
</head>
<body>
	<!-- 	<h1>acPend.jsp(임시저장)</h1> -->
	<table id="table">
		<tr id="m">
			<td>check</td>
			<td id="ap_docunum">문서번호</td>
			<td id="ap_ccode">회사코드</td>
			<td id="ap_docuname">결재문서이름</td>
			<td id="ap_fromapprover">결재올린사람</td>
			<td id="ap_toapprover ">결재받는사람</td>
			<td id="ap_date">올린시간</td>
			<td id="ap_statu">결재상태</td>
		</tr>
		<tbody id="Info"></tbody>
	</table>
	<br>
	<div id="paging" style="text-align: center;"></div>
	<br>
	<div id="center">
		<button id="approval">결재안 상세보기</button>
	</div>
</body>
<script>
	//페이지 변경 스크립트
	var currPage = 1;
	function pageNumber(j) {
		currPage = j;
		$.ajax({
			url : "/erp/rest/Account/documentPagenumber",
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
		apupPaymentList(num);
	}

	function apupPaymentList(nowPage) {
		$
				.ajax({
					url : "/erp/rest/Account/apupPaymentList",
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

	apupPaymentList(1);
	pageNumber(1);

</script>
<script>
$("#approval").click(
		function() {
			var check = '';
			$("input[name='checknum']:checked").each(
		               function() {
		                  check = $(this).attr('value');


		                  if(check.indexOf("AC") != -1){
		                     window.open(
		                        '/erp/rest/Account/apRequest?j_docunum='
		                              + check, 'apRequest',
		                        'width=1500, height=600');
		                  }else if(check.indexOf("P") != -1){ //예은
		                     window.open(
		                        '/erp/rest/Purchase/pRequest?p_documentcode='+ check, 'pRequest',
		                        'width=1500, height=600');
	                      }else if(check.indexOf("G") != -1){ //수진
	                         window.open(
	                           '/erp/rest/sales/apRequest?bs_docunum='+ check, 'apRequest',
	                           'width=1500, height=600');
		                  }else if(check.indexOf("H") != -1){ //인사
		                	  console.log(check);
		                      window.open('/erp/hr/holidaydetail?docunum=' + check, '휴가상세정보', 'width=1400, heigth=700');
		                  }else{
		                	  window.open(
		                        '/erp/rest/myinfo/mydocument', 'mydocument', 'width=1500, height=600');
		                  }

		               });
		      });
</script>
</html>
