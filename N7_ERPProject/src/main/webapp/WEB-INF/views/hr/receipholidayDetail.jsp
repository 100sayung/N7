<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div id="holidayDetail"></div>

   <table>
      <tr>
         <td>${apholi.hap_docunum }</td>
         <td>${apholi.hap_docuname }</td>
      </tr>
      <tr>
<!-- 09-24 change -->
         <td>신청인</td>
         <td>${fromapprover }</td>
         <td>결재자</td>
         <td>${toapprover }</td>
<!--  -->
      </tr>
      <tr>
         <td>휴가시작일</td>
         <td>휴가종료일</td>
         <td>결재상태</td>
         <td>신청일</td>
      </tr>
      <tr>
         <td>${apholi.hap_startday }</td>
         <td>${apholi.hap_endday }</td>
         <c:if test="${apholi.hap_status eq 1}">
         	<td>대기중</td>
         </c:if>
         <c:if test="${apholi.hap_status eq 3}">
         	<td>승인됨</td>
         </c:if>
         <td>${apholi.hap_applydate }</td>
      </tr>
      <tr>
         <td>${apholi.hap_reason }</td>
   </table>
      <c:if test="${apholi.hap_status eq 1 or apholi.hap_status eq 3}">
         <input type='hidden' value='${apholi.hap_docunum}' name='docunum' id="docunum">
        	 <c:if test="${apholi.hap_status eq 1}">
         <button id="ok" value="">승인</button> &nbsp;
        	 </c:if>
        	 <c:if test="${apholi.hap_status eq 3}">
        	 	<div>이미 승낙된것은 거부만 가능합니다.</div>
        	 </c:if>
         <button id='no'>거부</button>
      </c:if>
   
   <script>
   
      $(document).ready(function(){
         console.log("123");
         console.log(${apholi.hap_fromapprover});
      });
      
      $("button").click(function(){
         console.log(this.id);
         if(confirm("정말 확인하시겠습니까?")){
            regist(this.id);
         }else{
            alert("취소되었습니다.");
         }
      });
      
      function regist(yesno){
         $.ajax({
            url:"/erp/rest/hr/holidaystatus",
            dataType:"text",
            data:{yesno : yesno, docunum : $("#docunum").val()},
            method:"post",
            success : function(data){
               window.open("about:blank", "_self").close();
            }, error : function(err){
               console.log(err);
            }
         });
      }
      
            
   </script>
</body>
</html>