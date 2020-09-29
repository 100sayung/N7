<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>부서관리</title>
<style>
.checks {
	position: relative;
}

.checks input[type="radio"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.checks input[type="radio"]+label {
	display: inline-block;
	position: relative;
	padding-left: 30px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.checks input[type="radio"]+label:before {
	content: '';
	position: absolute;
	left: 0;
	top: -4px;
	width: 21px;
	height: 21px;
	text-align: center;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 100%;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05);
}

.checks input[type="radio"]+label:active:before, .checks input[type="radio"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.checks input[type="radio"]:checked+label:before {
	background: #E9ECEE;
	border-color: #adb8c0;
}

.checks input[type="radio"]:checked+label:after {
	content: '';
	position: absolute;
	top: 1px;
	left: 5px;
	width: 13px;
	height: 13px;
	background: #99a1a7;
	border-radius: 100%;
	box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.3);
}

.department-div {
	border: 3px double #e1e1e1;
	border-radius: 8px;
	height: 350px;
	width: 80%;
	margin-left: 100px;
	text-align: center;
}

table {
	margin-top: 100px;
	margin-left: 30px;
	width: 700px;
	border: 3px double #e1e1e1;
	border-collapse: collapse;
	border-radius: 8px;
	text-align: center;
}

th, td {
	border: 3px double #e1e1e1;
	padding: 10px;
	border-radius: 8px;
}

ul {
	list-style: none;
}



/* #departmentinfo{ */
/* width: 80%; */
/* height: 80px; */
/* } */
</style>
</head>
<body>

	<div id="page-inner">
		<div class="row">
			<div class="col-lg-12">
				<h2>부서관리</h2>
			</div>
		</div>
		<hr>
		<div style="background-color: gray;"><label><input type="radio" class="active" id="insert" value="option"
			name="option">부서권한등록</label></div>
		<!-- 			<li><a href="deDelete">부서권한 조회-삭제</a></li> -->
		<div>
			<div id="insertBox">
				<div class="row">
					<div class="col-lg-12">
						<div class="alert alert-info">
							<strong>ERP 부서 등록 페이지입니다.</strong>
							<button class="btn btn-success" id="save">저장</button>
						</div>
					</div>
				</div>
				<div class="row text-center pad-top">
					<form id="departmentinfo" >
						<div class="department-div">
							<table style='border-radius: 8px;'>
								<tbody style='border-radius: 8px;'>
									<tr style='border-radius: 8px;'>
										<th colspan='4'><div class='input-group'>
												<span class='input-group-addon'>회사코드</span> <input
													type='text' id="au_comname" name="au_comname"
													class='form-control' value="${cCode}" readonly
													style='width: 120%;'>
											</div></th>
									</tr>
									<tr style='border-radius: 8px;'>
										<th colspan='4'><div class='input-group'>
												<span class='input-group-addon'>&nbsp;부서명&nbsp;&nbsp;</span> <input
													type='text' id="au_name" name="au_name"
													class='form-control' style='width: 120%;'>
											</div></th>
									</tr>
									<tr style='border-radius: 8px;'>
										<th colspan='4'><div class='input-group'>
												<span class='input-group-addon'>&nbsp;&nbsp;&nbsp;권한&nbsp;&nbsp;&nbsp;</span><div
													type='text' class='form-control' style='width: 120%; text-align: center;'>
												 &nbsp;<label><input type="radio" id="au_authority" name="au_authority" value="1">승인</label> &nbsp; 
												<label><input type="radio" id="au_authority" name="au_authority" value="0">거부</label> &nbsp;
												</div>
											</div></th>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
		<br><br>
		<div>
			<label><input type="radio" class="active" id="delete" value="option"
				name="option">부서권한삭제</label>
			<div id="deleteBox">
				<div class="row">
					<div class="col-lg-12 ">
						<div class="alert alert-info">
							<strong>ERP 부서 권한 삭제 페이지입니다.</strong>
							<button class="btn btn-success" id="deleteBt">삭제</button>
						</div>
					</div>
				</div>
				<table>
					<tbody>
						<tr>
							<td>check</td>
							<td>부서명</td>
							<td>권한</td>
						</tr>
					</tbody>
					<tbody id="auList"></tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<br>
					<div class="alert alert-danger">
						<strong>문제가 있으신가요?</strong> 오류 및 문제점 문의는 <a target="_blank"
							href="http://localhost/erp/access">여기를 클릭하세요</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#insert").click();
	$("#deleteBox").hide();

	$("#delete").click(function() {
		$("#insertBox").hide();
		$("#deleteBox").show();

	});
	$("#insert").click(function() {
		$("#deleteBox").hide();
		$("#insertBox").show();

	});

	$("#save")
			.click(
					function() {

						var au_name = document.getElementById("au_name").value;
						var au_authority = document
								.getElementById("au_authority").value;

						if (au_name == '' || au_name == null
								&& au_authority == "" || au_authority == null) {
							alert("모두 입력해주세요.");
						} else if (au_name == '' || au_name == null) {
							alert("부서명을 입력해주세요.");
						} else if (au_authority == "" || au_authority == null) {
							alert("권한을 선택해주세요.");

						} else {

							var obj = $("#departmentinfo").serialize();

							$.ajax({
								url : '/erp/rest/managermode/depratmentSave',
								type : 'post',
								data : obj,
								success : function(data) {
									if (data == 1) {
										alert("저장 완료");
										$("#departmentinfo")[0].reset();
										window.location.reload();
									} else {
										alert("저장안됐어");
									}
								},
								error : function(error) {
									console.log(error);
								}

							});

						}

					});

	$("#deleteBt")
			.click(
					function() {
						var check = '';
						$("input[name='checknum']:checked")
								.each(
										function() {
											check = $(this).attr('value');

											$.ajax({
														url : '/erp/rest/managermode/depratmentDelete?au_name='
																+ check,
														type : 'post',
														success : function(data) {
															if (data == 1) {
																alert("삭제가 완료되었습니다.");
																window.location
																		.reload();
																console
																		.log(data);
															} else {
																alert("삭제를 실패하였습니다. 현재 사용하고 있는 부서인지 확인해주세요.");
																console
																		.log(data);
															}
														},
														error : function(error) {
															console.log(error);
														}

													});
										});
					});

	$(document)
			.ready(
					function authoritList() {
						$
								.ajax({
									url : "/erp/rest/managermode/authoritList",
									dataType : "json",
									method : "get",
									success : function(data) {
										let str = "";
										for ( let i in data.pList) {
											str += "<table>"
											str += "<tr>"
											str += "<td><input type='radio' name='checknum' class='check' value='"+data.pList[i].au_name+"'></td>";
											str += "<td>"
													+ data.pList[i].au_name
													+ "</td>";
											str += "<td>"
													+ data.pList[i].au_authority
													+ "</td>";
											str += "</tr>";
										}
										str += "</table>";
										$("#auList").html(str);
									},
									error : function(err) {
										console.log(err);
									}
								});

					});

	// 	$(document).ready(
	// 					function() {

	// 						$.ajax({
	// 									url : '/erp/rest/managermode/getCompanyInfo',
	// 									type : 'get',
	// 									datatype : 'json',
	// 									success : function(data) {
	// 										console.log(data);
	// 										var str = "";
	// 										for ( var i in data.mList) {

	// 											str += "<table class='companyInfo'><thead><tr>";
	// 											str += "<th colspan='4'><div class='input-group'><span class='input-group-addon'>회사코드</span>";
	// 											str += "<input type='text' name='c_code' class='form-control' value='"
	// 													+ data.mList[i].c_code
	// 													+ "' readonly style='width:130%;'></div></th></tr>";
	// 											str += "<tr><th colspan='2'><div class='input-group'><span class='input-group-addon'>부서이름</span>";
	// 											str += "<input type='text' name='c_name' value='"
	// 													+ data.mList[i].c_name
	// 													+ "' class='form-control' style='width:128%;'></div></th>";
	// 											str += "<th colspan='2'><div class='input-group'><span class='input-group-addon'>대표자명</span>";
	// 											str += "<input type='text' name='c_ceo' value='"
	// 													+ data.mList[i].c_ceo
	// 													+ "' class='form-control' style='width:121%;'></div></th></tr></thead>";
	// 											str += "<tbody><tr><th colspan='2'><div class='input-group'><span class='input-group-addon'>사업자번호</span>";
	// 											str += "<input type='text' name='c_comnum' value='"
	// 													+ data.mList[i].c_comnum
	// 													+ "' class='form-control' style='width:120%;'></div></th>";
	// 											str += "<th colspan='2'><div class='input-group'><span class='input-group-addon'>전화번호</span>";
	// 											str += "<input type='text' name='c_phonenum' value='"
	// 													+ data.mList[i].c_phonenum
	// 													+ "' class='form-control' style='width:120%;'></div></th></tr>";
	// 											str += "<tr><th colspan='2'><div class='input-group'><span class='input-group-addon'>업태</span>";
	// 											str += "<input type='text' name='c_kind' value='"
	// 													+ data.mList[i].c_kind
	// 													+ "' class='form-control' style='width:141%;'></div></th>";
	// 											str += "<th colspan='2'><div class='input-group'><span class='input-group-addon'>종류</span>";
	// 											str += "<input type='text' name='c_kind2' value='"
	// 													+ data.mList[i].c_kind2
	// 													+ "' class='form-control' style='width:134%;'></div></th></tr>";
	// 											str += "<tr><th colspan='4'><div class='input-group'><span class='input-group-addon'>주소</span>";
	// 											str += "<input type='text' name='c_addr' value='"
	// 													+ data.mList[i].c_addr
	// 													+ "' class='form-control' style='width:313%;'></div></th></tr></tbody></table>";

	// 										}
	// 										$(".company-div").html(str);

	// 									},
	// 									error : function(error) {
	// 										console.log(error);
	// 									}

	// 								});
	// 					});
</script>
</html>