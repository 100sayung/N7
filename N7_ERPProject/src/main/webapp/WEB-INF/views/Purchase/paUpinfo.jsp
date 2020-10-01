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

#table, tr, th, td {
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
<form id="fo">
      <div style="width: auto; background-color: #FFB2D9; color: white; padding: 1%;">기안문  상세보기</div>
      <div style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table id="table">
            <tr>
               <th>제목</th>
               <th><input type="hidden" name="j_title" value="${pa.p_title}">${pa.p_title}
               </th>

            </tr>
            <tr>
               <th>결재자</th>
               <th id="line">
               <input type="hidden" value="${pa.p_apcode1}" name="code">
                  <input type="hidden" value="${pa.p_apcode2}" name="code">
                  <input type="hidden" value="${pa.p_apcode3}" name="code">
               </th>

            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <div style="border: 1px solid #EAEAEA; background-color: white;">
                     <div>
                        <table>
                           <tr>
                              <th colspan="2">문서번호</th>
                              <th colspan="6"><input type="text" name="p_documentcode"
                                 class="txt" value="${pa.p_documentcode}" readonly>

                           </tr>
                           <tr>
                              <th colspan="2">제품일련번호</th>
                              <td colspan="6"><input type="text" name="p_productnum"
                                 class="draft" value="${pa.p_productnum}" readonly></td>
                           </tr>
                           <tr>
                           	  <th colspan="2">상품명</th>
							  <th >품목코드</th>
							  <th>수량</th>
							  <th>단가</th>
							  <th colspan="2">합계</th>
                           </tr>
                           <tbody id="list"></tbody>
                           <tr>
                              <th colspan="2">적요</th>
                              <td colspan="6"><input type="text" name="p_etc"
                                 class="draft" value="${pa.p_etc}" readonly></td>
                           </tr>
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
<script type="text/javascript">
	 var str="";
	 var pList=${pList};
	 console.log(pList);
	 for(var i in pList){
		 str+="<tr><td colspan='2'>"+pList[i].p_name+"</td>";
		 str+="<td>"+pList[i].p_itcode+"</td>";
		 str+="<td>"+pList[i].p_amount+"</td>";
		 str+="<td>"+pList[i].p_unlit+"</td>";
		 str+="<td colspan='2'>"+pList[i].p_budget+"</td><tr>";
	 }
	$("#list").html(str);
	
	$(document).ready(function(){
		arr= new Array();
		var cnt= $("input[name='code']").length;
		
		$("input[name='code']").each(function(){
			arr.push($(this).attr('value'));
		});
	
		$.ajax({
			url : '/erp/rest/Purchase/getApprovalInfo',
			type : 'post',
			traditional : true,
			data : 'ARR=' + arr + '&CNT=' + cnt,
			success : function(data) {
				console.log(data);
				 var str = "";
		            for ( var i in data.pList) {
		               str +="<input type='text' name='p_apcode"+(Number(i)+Number(1))+"' value='"+data.pList[i].hc_hrcode+"' hidden='true'>";
		               str +=data.pList[i].hc_position+"/";
		               str +="<input style='width:50px;' type='text' name='p_approver"+(Number(i)+Number(1))+"' value='"+ data.pList[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
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