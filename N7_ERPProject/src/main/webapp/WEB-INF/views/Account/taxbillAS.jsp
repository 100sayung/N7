<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td,th {
    font-size:10px;
	border: 1px red solid;
	text-align: center;
	width:auto;
}
th{
color:blue;
}

input {
	border: 0px;
	width: auto;
	height: auto;
	text-align: center;
}
#title{
font-size: 20px;
}
</style>
</head>
<body>
	
		<div id="main">
			<table>
				<tr>
					<th colspan="10" id="title">세금계산서</th>
					</tr>
					<c:forEach var="taxbill" items="${tList1}">
				<tr>		
					<th colspan="10">전표번호<input type="text" value=" ${taxbill.s_num}"readonly>
					아래 금액을 (영수<input type="radio" name="stat">
					청구<input type="radio" name="stat">) 함</th>
				</tr>
				</c:forEach>
				<tr>
					<th rowspan="4">공급자</th>
					<th>사업자번호</th>
					<td colspan="3"><input type="text" value="${mc.c_comnum}"
						readonly></td>
					<th rowspan="4">공급받는자</th>
					<th>사업자번호</th>
					<td colspan="3"><input type="text" value="${ac.cl_comnum}"
						readonly></td>
				</tr>
				<tr>
					<th>상호(법인명)</th>
					<td><input type="text" value="${mc.c_name}" readonly></td>
					<th>성명(대표자)</th>
					<td><input type="text" value="${mc.c_ceo}" readonly></td>
					<th>상호(법인명)</th>
					<td><input type="text" value="${ac.cl_name}" readonly></td>
					<th>성명(대표자)</th>
					<td><input type="text" value="${ac.cl_ceo}" readonly></td>
				</tr>
				<tr>
					<th>사업장주소</th>
					<td colspan="3"><input type="text" value="${mc.c_addr}"
						readonly></td>
					<th>사업장주소</th>
					<td colspan="3"><input type="text" value="${ac.cl_addr}"
						readonly></td>
				</tr>
				<tr>
					<th>업태</th>
					<td><input type="text" value="${mc.c_kind}" readonly></td>
					<th>종목</th>
					<td><input type="text" value="${mc.c_kind2}" readonly></td>
					<th>업태</th>
					<td><input type="text" value="${ac.cl_kind}" readonly></td>
					<th>종목</th>
					<td><input type="text" value="${ac.cl_kind2}" readonly></td>
				</tr>
				<tr>
					<th colspan="2">작성날자</th>
					<th colspan="2">공급가액</th>
					<th colspan="3">부가세액</th>
					<th colspan="3">비고</th>
				</tr>
				<tr>
					<td colspan="2" id="date"></td>
					<td colspan="2" id="allprice"></td>
					<td colspan="3" id="alltax"></td>
					<td colspan="3"><input type="text" value=""></td>
				</tr>
				<tr>
					<th colspan='2'>품목</th>
					<th>수량</th>
					<th>단가</th>
					<th colspan="2">공급가액</th>
					<th colspan='2'>세액</th>
					<th>합계</th>					
					<th>비고</th>
				</tr>
				<tbody id="tbody">
				
				</tbody>
				<tr>
					<th colspan="2">합계금액</th>
					<th colspan="2">현금</th>
					<th colspan="2">수표</th>
					<th colspan="2">어음</th>
					<th colspan="2">외상미수금</th>
				</tr>
				<tr>
					<td colspan="2" id="alltotal"></td>
					<td colspan="2"><input type="radio" name="kind"></td>
					<td colspan="2"><input type="radio" name="kind"></td>
					<td colspan="2"><input type="radio" name="kind"></td>
					<td colspan="2"><input type="text"></td>
				</tr>
			</table>
		</div>
	<a href="#" onclick="window.print()"><button>인쇄</button></a>
</body>
<script>
var saleList = ${tList2};
console.log(saleList);
var str="";
var price2=0;
var tax=0;
var total=0;
for(var i in saleList){
	str+="<tr><td colspan='2'>"+saleList[i].s_pkind+"</td>";
	str+="<td>"+saleList[i].s_cnt+"</td>";
	str+="<td>"+saleList[i].s_price+"</td>";
	str+="<td colspan='2'>"+saleList[i].s_price2+"</td>";
	str+="<td colspan='2'>"+saleList[i].s_tax+"</td>";
	str+="<td>"+saleList[i].s_total+"</td>";
	str+="<td colspan='2'>"+saleList[i].s_memo+"</td></tr>";
	price2+=Number(saleList[i].s_price2);
	tax+=Number(saleList[i].s_tax);
	total+=Number(saleList[i].s_total);
}
$("#tbody").html(str);
var date = new Date();
date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()+"<br>"+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
console.log(price2);
console.log(tax);
$("#date").html(date);
$("#allprice").html(price2+"(원)");
$("#alltax").html(tax+"(원)");
$("#alltotal").html(total+"(원)");
</script>
</html>