<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업결재 상세페이지</title>
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
   <form id="fo">
     <br>
     <br>
      <div style="width: auto; background-color: #FFB2D9; color: white; padding: 1%;">기안문 상세보기</div>
      <div style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table>
            <tr>
               <th>제목</th>
               <th><input type="hidden" name="bs_docuname" value="${sb.bs_docuname}"></th>
            </tr>
            <tr>
               <th>결재자</th>
               <th id="line">
                  <input type="hidden" value="bs_approver1" name="bs_approver1">결재자1: ${ap.bs_approver1} || 
                  <input type="hidden" value="bs_approver2" name="">결재자2: ${ap.bs_approver2} || 
                  <input type="hidden" value="bs_approver3" name="">결재자3: ${ap.bs_approver3} ||
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
   <script>
/*    $(document).ready(function(){
    $.ajax({
       
    });
   }); */
  
   
   </script>
</body>
</html>