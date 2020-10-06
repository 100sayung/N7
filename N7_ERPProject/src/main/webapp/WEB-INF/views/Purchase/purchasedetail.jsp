<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
html,body{
text-align: center;
}
table, tr, th,td{
	margin-left: auto;
	margin-right: auto;
	border: 1px solid silver;
}
</style>
</head>
<body>
	<form action="purchasedetail">
		<table>
			<tr>
				<th>구매번호</th>
				<th>제품번호</th>
				<th>담당자</th>
				<th>거래처</th>
				<th>구매일</th>
			</tr>
			<tr>
				<td>${ps.p_documentcode}</td>
				<td>${ps.p_productnum}</td>
				<td>${ps.p_writer}</td>
				<td>${ps.p_clcode}</td>
				<td>${ps.p_day}</td>
			</tr>
			<tr>
				<th>상품번호</th>
				<th>상품코드</th>
				<th>단가</th>
				<th>수량</th>
				<th>합계</th>
			</tr>
			<tbody id="tbody"></tbody>
		</table>
	</form>

<script type="text/javascript">
	
	var str='';
		var pList=${pList};
		console.log(pList);
	for(var i in pList){
		str+= "<tr><td>"+pList[i].p_name+"</td>";
		str+="<td>"+pList[i].p_itcode+"</td>";
		str+="<td>"+pList[i].p_unlit+"</td>";
		str+="<td>"+pList[i].p_amount+"</td>";
		str+="<td>"+pList[i].p_budget+"</td></tr>";
	}
	$('#tbody').html(str);

</script>

</body>
</html>