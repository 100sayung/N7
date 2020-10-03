<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
html, body {
	text-align: center;
}

table, tr, th, td {
	border: 1px solid silver;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: auto;
	height: auto;
}

.txt {
	width: 200px;
	height: 20px;
	border-style: none;
	text-align: center;
}

.select {
	width: 150px;
	height: 25px;
}

.draft {
	width: 500px;
	height: 20px;
	border-style: none;
	text-align: center;
	"
}

.draft2 {
	width: 600px;
	text-align: center;
}

.draft3 {
	width: 230px;
	border-style: none;
	text-align: center;
}

#ect {
	height: 300px;
	width: 950px;
}

</style>
</head>
<body>
	<form id="for">
		<div
			style="width: auto; background-color: #3D6B9B; color: white; padding: 1%;">전표 
			상세보기</div>
		<div
			style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
			<table>
				<tr>
					<th>제목</th>
					<th><input type="hidden" name="j_title" value="${si.j_title}">${ac.j_title}</th>
				</tr>
				<tr>
					<th>결재자</th>
					<th id="line">
					<input type="hidden" value="${ac.j_none}" id="j_none" name="code"> 
					<input type="hidden" value="${ac.j_ntwo}" id="j_ntwo" name="code"> 
					<input type="hidden" value="${ac.j_nthr}" id="j_nthr" name="code">
					</th>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<div style="border: 1px solid #EAEAEA; background-color: white;">
							<div>
								<table>
									<tr>
										<th colspan="2">담당자</th>
										<th colspan="2"><input type="text" name="s_employee"
											class="txt" value="${si.s_employee}" readonly></th>
										<th colspan="2">문서번호</th>
										<th colspan="2"><input type="text" name="s_num"
											class="txt" value="${si.s_num}" readonly></th>

									</tr>
									<tr>
										<th colspan="2">사업자번호</th>
										<th colspan="2"><input type="text" name="s_comnum"
											class="txt" value="${si.s_comnum}" readonly><input
											type="hidden" name="s_ccode" class="txt"
											value="${si.s_ccode}" readonly></th>
										<th colspan="2">거래처코드</th>
										<th colspan="2"><input type="text" name="s_clcode"
											class="txt" value="${si.s_clcode}" readonly></th>
									</tr>
									<tr>
										<th colspan="2">종류</th>
										<td colspan="2"><input type="text" name="j_group"
											class="draft3" value="${si.s_kind}" readonly></td>
										<th colspan="2">거래처명</th>
										<td colspan="2"><input type="text" name="s_company"
											class="draft3" value="${si.s_company}" readonly></td>

									</tr>
<!-- 									<tr> -->
<!-- 										<th colspan="2">차변금액</th> -->
<!-- 										<td colspan="5"><input type="text" name="j_debit" -->
<%-- 											class="draft" value="${ac.j_debit}" readonly></td> --%>
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<th colspan="2">대변금액</th> -->
<!-- 										<td colspan="5"><input type="text" name="j_credit" -->
<%-- 											class="draft" value="${ac.j_credit}" readonly></td> --%>
<!-- 									</tr> -->

<!-- 									<tr> -->
<!-- 										<th>적요</th> -->
<!-- 										<td colspan="7"><input type="text" name="j_sumup" -->
<%-- 											class="draft" value="${ac.j_sumup}" readonly></td> --%>
<!-- 									</tr> -->
									<tr>
										<th>반려사유</th>
										<th colspan="8"><input type="text" name="j_reasion"
											value="${ac.j_reasion}" id="ect"></th>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<script>
		//레디 펑션 줘서 결재자 info 불러오기
		$(document).ready(
						function() {
							arr = new Array();
							var cnt = $("input[name='code']").length;

							$("input[name='code']").each(function() {
								arr.push($(this).attr('value'));
							});

							$.ajax({
										url : '/erp/rest/Account/getApprinfo',
										type : 'post',
										traditional : true,
										data : 'ARR=' + arr + '&CNT=' + cnt,
										success : function(data) {
											console.log(data);
											var str = "";
											for ( var i in data.aList) {
												str += "<input type='text' name='rs_apcode"+i+"' value='"+data.aList[i].hc_hrcode+"' hidden='true'>";
												str += data.aList[i].hc_position
														+ "/";
												str += "<input style='width:50px;' type='text' name='rs_apname"+i+"' value='"+ data.aList[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
											}
											console.log(str)
											$("#line").html(str);

										},
										error : function(error) {
											console.log(error);
										}
									});
						});
		
		
</script> 
</body>
</html>