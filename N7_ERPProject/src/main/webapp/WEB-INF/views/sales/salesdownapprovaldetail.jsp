<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
     <br>
     <br>
      <div style="width: auto; background-color: #FFB2D9; color: white; padding: 1%;">기안문 상세보기</div>
      <div style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table>
            <tr>
               <th>제목</th>
               <th><input type="hidden" name="bs_docuname" value="${sb.bs_docuname}">${sb.bs_docuname}</th>
            </tr>
            <tr>
               <th>결재자</th>
               <th id="line">
                  <input type="hidden" value="${sb.bs_approver1}" name="bs_approver1"> //<!-- code -->
                  <input type="hidden" value="${sb.bs_approver2}" name="bs_approver2"> <!-- code -->
                  <input type="hidden" value="${sb.bs_approver3}" name="bs_approver3"> <!-- code -->
               </th>

            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <div style="border: 1px solid #EAEAEA; background-color: white;"><div>
                        <table>
                           <tr>
                              <th colspan="2">출하번호</th>
                              <th colspan="2"><input type="text" name="bs_docunum" class="txt" value="${sb.bs_docunum}" readonly></th>
                              <th colspan="2">거래처 회사코드</th>
                              <th colspan="2"><input type="text" name="bs_clcode" class="txt" value="${sb.bs_clcode}" readonly>
<%--                          <input type="hidden" name="j_grade" class="draft3" value="${ac.j_grade}" readonly></th>
                              <td>결재상태</td> --%>

                           </tr>
                           <tr>
                            <th colspan="2">회사코드</th>
                              <th colspan="2"><input type="text" name="bs_ccode" class="txt" value="${sb.bs_ccode}" readonly>
                              <%-- <input type="hidden" name="j_ccode" class="txt" value="${ac.j_ccode}" readonly></th> --%>
                              <th colspan="2">품목코드</th>
                              <th colspan="2"><input type="text" name="bs_itcode" class="txt" value="${sb.bs_itcode}" readonly></th> 
                           </tr>
                           <tr>
                              <th colspan="2">제품명</th>
                              <td colspan="2"><input type="text" name="bs_proname" class="draft3" value="${sb.bs_proname}" readonly></td>
                              <th colspan="2">예상납기일</th>
                              <td colspan="2"><input type="text" name="bs_basedate" class="draft3" value="${sb.bs_basedate}" readonly></td>

                           </tr>
                          <tr>
                              <th colspan="2">판매단가</th>
                              <td colspan="5"><input type="text" name="bs_unit" class="draft" value="${sb.bs_unit}" readonly></td>
                           </tr>
                           <tr>
                              <th colspan="2">수량</th>
                              <td colspan="5"><input type="text" name="bs_quantity" class="draft" value="${sb.bs_quantity}" readonly></td>
                           </tr>

                           <tr>
                              <th>판매금액</th>
                              <td colspan="7"><input type="text" name="bs_price" class="draft" value="${sb.bs_price}" readonly></td>
                           </tr>
                            <tr>
                              <th>반려사유</th>
                              <th colspan="8"><input type="text" name="bs_ect" id="ect"></th>
                           </tr>
                        </table>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
      </form>  
         <br>
         <button type="button" id="submit">제출하기</button>
         <button type="button" id="">반려하기</button>

</body>
<script>

/*	$('#for').click(function() {

		var obj = $("#for").serialize();
		console.log(obj);

		$.ajax({
			url : '/erp/rest/sales/downapprovaldetailinput',
			type : 'post',
			data : obj,
			dateType : "json",
			success : function(data) {
				if (data == 1) {
					console.log(data);
					$("#for")[0].reset();
					alert("결재안 저장을 완료하였습니다.");
				} else {
					alert("결재안 저장이 실패하였습니다.");
					console.log(data);
				}
			},
			error : function(error) {
				 console.log(error);
			}
		});
	});*/

/*	$(document).ready(function() {
						arr = new Array();
						var cnt = $("input[name='code']").length;

						$("input[name='code']").each(function() {
							arr.push($(this).attr('value'));
						});

						$.ajax({
									url : '/erp/rest/sales/getApprinfo',
									type : 'post',
									traditional : true,
									data : 'ARR=' + arr + '&CNT=' + cnt,
									success : function(data) {
										console.log(data);
										var str = "";
										for ( var i in data.sList) {
											str += "<input type='text' name='bs_apcode"+i+"' value='"+data.sList[i].hc_hrcode+"' hidden='true'>";
											str += data.sList[i].hc_position
													+ "/";
											str += "<input style='width:50px;' type='text' name='bs_approver"+i+"' value='"+ data.sList[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
										}
										console.log(str)
										$("#line").html(str);

									},
									error : function(error) {
										console.log(error);
									}
								});
					});*/
</script>
</html>