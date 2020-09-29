<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<!-- <script src="/js/jquery.serializeObject.js"></script> -->
<style>
#cal {
	font-size: 20px;
	font-family: 굴림;
	border: 2px border-color:#3333FF;
	float: left;
}

body, div {
	text-align: center;
}

#comInfo {
	text-align: center;
}

#plusorminus {
	float: right;
}

.data {
	width: 168px;
}

#main2 {
	position: absolute;
	left: 30%;
}

.data2 {
	width: 150px;
	text-align: center;
}
#testTable{
width:1300px;
overflow: auto;
}
#ListTable{
width:1300px;
height: 300px;
overflow: auto;
}
#grafe{
width:100%;
}
#grafeInfo{
float: left;
width:100%;
}
#detaile{
float: left;
}
</style>
</head>
<body>
	<div
		style="width: auto; background-color: white-space; color: white; padding: 1%;">
		<span style="padding-left: 5px"><a href="#" onclick="saleinsert()"><button>매출/매입등록</button></a></span>
		<span style="padding-left: 5px"><a href="#"
			onclick="window.open('comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
		<span style="padding-left: 5px"><button id="getshipment">출하조회</button></span>
		<span style="padding-left: 5px"><button id="getList">매출/매입데이터조회</button></span>
		<span style="padding-left: 5px"><button id="taxbill">세금계산서인쇄</button></span>
		<span style="padding-left: 5px"><button id="saledetails">거래명세표인쇄</button></span>
		<span style="padding-left: 5px"><button id="approval">결재요청하기</button></span>
 		<span style="padding-left: 5px"><button type="button" id="delete">삭제</button></span>

	</div>
		<div
			style="width: auto; background-color: #FFB2D9; color: white; padding: 1%;">매출/매입
			전표관리</div>
		<span style="padding-left: 5px"><input id="select" type="text" /></span>
		<select id="choice" name="s_saleSelect">
			<option value="num">전표번호</option>
			<option value="company">거래처명</option>
			<option value="employee">입력자</option>
		</select>
		<button id="search2" type="button">검색</button>
		매출<input onclick="getList('AS')" type='radio' name="sale" value='AS'>
		매입<input onclick="getList('AP')" type='radio' name="sale" value='AP'>

		<!-- <form action="rest/saleinsert" method="post"> -->
		<form id="saleInfo">
		<div id="comInfo"
			style="height: 80px; padding-top: 15px; background-color: #F8F7F7;">
			<table id="main2">
				<thead>
					<tr>
						<td>전표번호</td>
						<td><input class="data" type="text" value="자동생성" readonly /></td>
						<td>종류</td>
						<td><select class="data" name="s_num">
								<option value="">--</option>
								<option value="AS">매출</option>
								<option value="AP">매입</option>
						</select></td>
						<td>유형</td>
						<td><select class="data" name="s_kind">
								<option value="과세">과세</option>
								<option value="비과세">비과세</option>
						</select></td>
					</tr>
					<tr>
						<td>거래처명</td>
						<td><input class="data" type="text" name="s_company" /></td>
						<td>사업자번호</td>
						<td><input class="data" type="text" name="s_comnum" /></td>
						<td>입력자</td>
						<td><input class="data" type="text" name="s_employee" /></td>
						<td></td>
					</tr>
				</thead>
			</table>
		</div>
		<!-- </form> -->
			<button id="detaile" type="button">상세정보</button>
			 <span id='plusorminus'>
			<input type="number" id="qty" min="1" style="width: 64px;">
			<button type="button" id="addList"> 행추가</button>
			<button type="button" id="deleteCheck">삭제</button>
			</span>

			<!-- <form id="saleInfodetaile"> -->

		<div id="ListTable" style="background-color: #ECEBEA;">
			<table id="testTable"
				summary="Code page support in different versions of MS Windows."
				border="1">
				<thead>
					<tr>
						<td>체크</td>
						<td>품목</td>
						<td>수량</td>
						<td>단가(원)</td>
						<td>공급가액(원)</td>
						<td>부가세액(원)</td>
						<td>합계(원)</td>
						<td>적요</td>
					</tr>
				</thead>
				<tbody id="tBody">
					<tr>
						<td><input type="checkbox" class="check"></td>
						<td><input class="data" type="text" name="s_pkind" /></td>
						<td><input id="cnt" class="data" type="text" name="s_cnt" /></td>
						<td><input id="price" class="data" type="text" name="s_price" /></td>
						<td><input id="price2" class="data" type="text"
							name="s_price2" /></td>
						<td><input id="tax" class="data" type="text" name="s_tax" /></td>
						<td><input id="total" class="data" type="text" name="s_total" /></td>
						<td><input class="data" name="s_memo" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
 		<button type="button" onclick="saleInsertInfo()">등록</button>



	<br>
	<br>

</body>
<script type="text/javascript">
$("#getshipment").click(function(){
	$.ajax({
		url:'/erp/rest/Account/getshipment',
		type:'get',
		datatype:'json',
		success:function(data){
			console.log(data);
		},
		error:function(error){
			console.log(error);
		}
	});
	
});

$("#search2").click(function(){
	var select = $("#select").val();
	var choice = $("#choice").val();
	$.ajax({
		url:"/erp/rest/Account/selectSearch",
		type:"post",
		data:'select='+select+'&choice='+choice,
		datatype:"json",
		success:function(data){
			if(data.sList!=''){
			var str = '';
			str += "<tr id='colume'><td>체크</td><td>전표번호</td><td>유형</td><td>거래처명</td><td>사업자번호</td><td>입력날짜</td><td>입력자</td></tr>"
			for ( var i in data.sList) {
				str += "<tr><td><input name='checknum' type='radio' class='check' value='"+data.sList[i].s_num+"'></td>";
				str += "<td><input class='data2' type='text' name='s_num' value="+data.sList[i].s_num+"></td>";
				str += "<td><input class='data2' type='text' name='s_kind' value="+data.sList[i].s_kind+"></td>";
				str += "<td><input class='data2' type='text' name='s_company' value="+data.sList[i].s_company+"></td>";
				str += "<td><input class='data2' type='text' name='s_comnum' value="+data.sList[i].s_comnum+"></td>";
				str += "<td><input class='data2' type='text' name='s_date' value="+data.sList[i].s_date+"></td>";
				str += "<td><input class='data2' type='text' name='s_employee' value="+data.sList[i].s_employee+"></td></tr>";
			}
			$("#testTable").html(str);
			}else{
				alert("검색할 데이터가 없습니다");
			}
		},
		error:function(error){
			console.log(error);
		}

	});

});



$("#detaile").click(function() {
	var check = '';
$("input[name='checknum']:checked").each(function() {
				check = $(this).attr('value');
				console.log(check);
                if(check!=""){
                	if(check.indexOf("AS")){
					window.open('/erp/Account/SaleDetaileAS?check=' + check,
							'SaleDetaileAS', 'width=1400,height=700');
                	}else{
					window.open('/erp/Account/SaleDetaileAP?check=' + check,
							'SaleDetaileAP', 'width=1400,height=700');
                	}
				}else{
                	alert("체크한 항목이 없습니다");
                }
			});
});

function saleInsertInfo(){
       var obj = $("#saleInfo").serialize();
       $.ajax({
    	  url:'/erp/rest/Account/saleinsert',
    	  type:'post',
    	  data:obj,
    	  success:function(data){
    		  console.log(data);
    		  alert("데이터입력성공");
    		  $("input").val("");
    	  },
    	  error:function(error){
    		  console.log(error);
    		  alert("데이터 입력실패");
    	  }

       });

};


$("#approval").click(function(){
	var check = '';
	$("input[name='checknum']:checked").each(function() {
						check = $(this).attr('value');
	      });
						if(check==""){
							alert("체크한 항목이 없습니다");
						}else{
							$.ajax({
								url:'/erp/rest/Account/comparecode?code='+check,
								type:'post',
								datatype:'json',
								success:function(data){
									console.log(data);
									if(data.sList.length==1){
										alert("이미 결재요청된 데이터 입니다.");
									}else{
										window.open('/erp/Account/acApproval?check='+check,'acApproval','width=1400,height=700');
									}
								},
								error:function(error){
									console.log(error);
								}
							});
						}
});

$("#addList").click(function() {
					var str = '';
					for (var i = 0; i < $("#qty").val(); i++) {
						str += "<tr><td><input type='radio' class='check'></td>"
						str += "<td><input class='data' type='text' name='s_pkind'/></td>"
						str += "<td><input class='data' type='text' name='s_cnt'/></td>"
						str += "<td><input class='data' type='text' name='s_price'/></td>"
						str += "<td><input class='data' type='text' name='s_price2'/></td>"
						str += "<td><input class='data' type='text' name='s_tax'/></td>"
						str += "<td><input class='data' type='text' name='s_total' /></td>"
						str += "<td><input class='data' name='s_memo' /></td></tr>"
					}
					$("#tBody").append(str);
					$("#qty").val(1);
				});


 function saleinsert(){
	//$("#comInfo").attr("display","inline-block");
	//$("#plusorminus").attr("display","inline-block");
	$("#testTable").html("");
	var str='';
	str += "<thead><tr><td>체크</td><td>품목</td><td>수량</td><td>단가(원)</td><td>공급가액(원)</td><td>부가세액(원)</td><td>합계(원)</td><td>적요</td></tr></thead>"
	str += "<tbody id='tBody'><tr><td><input type='checkbox' class='check'></td>"
		str += "<td><input class='data' type='text' name='s_pkind'/></td>"
		str += "<td><input class='data' type='text' name='s_cnt'/></td>"
		str += "<td><input class='data' type='text' name='s_price'/></td>"
		str += "<td><input class='data' type='text' name='s_price2'/></td>"
		str += "<td><input class='data' type='text' name='s_tax'/></td>"
		str += "<td><input class='data' type='text' name='s_total' /></td>"
		str += "<td><input class='data' name='s_memo' /></td></tr></tbody>"
	$("#testTable").html(str);
}

	$("#taxbill").click(function() {
				var check = '';
		$("input[name='checknum']:checked").each(function() {
							check = $(this).attr('value');
							console.log(check);
                            if(check!=""){
							if (check.indexOf("AS")) {
								window.open('/erp/Account/taxbill?check=' + check,
										'taxbillAS', 'width=1400,height=700');

							} else {
								window.open('/erp/Account/taxbill?check=' + check,
										'taxbillAP', 'width=1400,height=700');
							}
                            }else{
                            	alert("체크한 항목이 없습니다");
                            }
						});
			});
	$("#saledetails").click(function() {
				var check = '';
		$("input[name='checknum']:checked").each(function() {
							check = $(this).attr('value');
							console.log(check);
                            if(check!=""){
							if (check.indexOf("P")) {
								window.open('/erp/Account/saledetails?check=' + check,
										'saledetails', 'width=1400,height=700');

							} else {
								alert("매입은 거래명세표를 발급할 수 없습니다")
							}
                            }else{
                            	alert("체크한 항목이 없습니다");
                            }
						});
			});

	function getList(code) {
		 $("#comInfo").attr("display","none");
		 $("#plusorminus").attr("display","none");
		console.log(code);
		//var json = JSON.stringify(code);
		$
				.ajax({
					url : '/erp/rest/Account/getList?code=' + code,
					type : 'post',
					datatype : 'json',
					success : function(data) {
						console.log(data);
						var str = '';
						str += "<tr id='colume'><td>체크</td><td>전표번호</td><td>유형</td><td>거래처명</td><td>사업자번호</td><td>입력날짜</td><td>입력자</td></tr>"
						for ( var i in data.sList) {
							str += "<tr><td><input name='checknum' type='radio' class='check' value='"+data.sList[i].s_num+"'></td>";
							str += "<td><input class='data2' type='text' name='s_num' value="+data.sList[i].s_num+"></td>";
							str += "<td><input class='data2' type='text' name='s_kind' value="+data.sList[i].s_kind+"></td>";
							str += "<td><input class='data2' type='text' name='s_company' value="+data.sList[i].s_company+"></td>";
							str += "<td><input class='data2' type='text' name='s_comnum' value="+data.sList[i].s_comnum+"></td>";
							str += "<td><input class='data2' type='text' name='s_date' value="+data.sList[i].s_date+"></td>";
							str += "<td><input class='data2' type='text' name='s_employee' value="+data.sList[i].s_employee+"></td></tr>";
						}
						$("#testTable").html(str);
					},
					error : function(error) {
						console.log(error);
					}
				});
	}
	$("#getList").click(function() {
						$("#comInfo").attr("display","none");
						$("#plusorminus").attr("display","none");
						$.ajax({
									url : '/erp/rest/Account/getsaleList',
									type : 'get',
									datatype : 'json',
									success : function(data) {
										console.log(data)
										var str = '';
										str += "<tr id='colume'><td>체크</td><td>전표번호</td><td>유형</td><td>거래처명</td><td>사업자번호</td><td>입력날짜</td><td>입력자</td></tr>"
										for ( var i in data.sList1) {
											str += "<tr><td><input name='checknum' type='radio' class='check' value='"+data.sList1[i].s_num+"' readonly></td>"
											str += "<td><input class='data2' type='text' name='s_num' value="+data.sList1[i].s_num+" readonly></td>"
											str += "<td><input class='data2' type='text' name='s_kind' value="+data.sList1[i].s_kind+" readonly></td>"
											//str += "<td><input class='data2' type='text' name='s_pkind' value="+data.sList[i].s_pkind+"></td>"
											//str += "<td><input class='data2' type='text' name='s_cnt' value="+data.sList[i].s_cnt+"></td>"
											//str += "<td><input class='data2' type='text' name='s_price' value="+data.sList[i].s_price+"></td>"
											//str += "<td><input class='data2' type='text' name='s_price2' value="+data.sList[i].s_price2+"></td>"
											//str += "<td><input class='data2' type='text' name='s_tax' value="+data.sList[i].s_tax+"></td>"
											str += "<td><input class='data2' type='text' name='s_company' value="+data.sList1[i].s_company+" readonly></td>"
											//str += "<td><input class='data2' type='text' name='s_total' value="+data.sList[i].s_total+"></td>"
											str += "<td><input class='data2' type='text' name='s_comnum' value="+data.sList1[i].s_comnum+" readonly></td>"
											str += "<td><input class='data2' type='text' name='s_date' value="+data.sList1[i].s_date+" readonly></td>"
											str += "<td><input class='data2' type='text' name='s_employee' value="+data.sList1[i].s_employee+" readonly></td>"
											//str += "<td><input class='data2' type='text' name='s_memo' value="+data.sList[i].s_memo+"></td></tr>";
										}
										$("#testTable").html(str);
									},
									error : function(error) {
										console.log(error)
									}

								});

					});

	$("#deleteCheck").click(function() {
		for (var i = 0; i < $(".check").length; i++) {
			if ($(".check")[i].checked == true) {
				$(".check")[i].parentElement.parentElement.remove();
				i--;
			}
		}
	});

	$("#delete").click(function() {
						var cnt = $("input[name='checknum']:checked").length;
						var arr = new Array();
						$("input[name='checknum']:checked").each(function() {
							arr.push($(this).attr('value'));

						});
						if (cnt == 0) {
							alert("선택된 내용이 없습니다");
						} else {

							$.ajax({
										url : '/erp/rest/Account/deleteSale',
										type : 'post',
										traditional : true,
										data : 'ARR=' + arr + '&CNT=' + cnt,
										datatype : 'json',
										success : function(data) {
											var str = '';
											str += "<tr id='colume'><td>체크</td><td>전표번호</td><td>유형</td><td>거래처명</td><td>사업자번호</td><td>입력날짜</td><td>입력자</td></tr>"
											for ( var i in data.sList) {
												str += "<tr><td><input name='checknum' type='radio' class='check' value='"+data.sList[i].s_num+"'></td>";
												str += "<td><input class='data2' type='text' name='s_num' value="+data.sList[i].s_num+"></td>";
												str += "<td><input class='data2' type='text' name='s_kind' value="+data.sList[i].s_kind+"></td>";
												str += "<td><input class='data2' type='text' name='s_company' value="+data.sList[i].s_company+"></td>";
												str += "<td><input class='data2' type='text' name='s_comnum' value="+data.sList[i].s_comnum+"></td>";
												str += "<td><input class='data2' type='text' name='s_date' value="+data.sList[i].s_date+"></td>";
												str += "<td><input class='data2' type='text' name='s_employee' value="+data.sList[i].s_employee+"></td></tr>";
											}
											$("#testTable").html(str);
										},
										error : function(error) {
											console.log(error)
										}

									});
						}
					});
</script>

</html>
