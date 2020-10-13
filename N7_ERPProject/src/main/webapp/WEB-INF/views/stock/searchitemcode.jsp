<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>N7 ERP - 품목코드 검색</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>

#description {
	float: left;
    height:100%;
    width:1150px;
    position: absolute;
}

td, th {
	width: 100px;
	height: 30px;
}

tr {
	text-align: center;
}

body{
font-size: 20px;
font-weight: bolder;
}
body{
position: relative;
}
td{
width: 300px;
}
</style>
</head>
<body>
<input type="text"  placeholder="품목코드를 검색해주세요." onkeyup="searchItemCode(this)">
<div id="description">

</div>
<script>
searchItemCode()
function searchItemCode(id){
	$.ajax({
		url:"/erp/stock/searchitcode",
		data:{it_code : $(id).val()},
		type:"get",
		dataType:"json",
		success:function(result){
			console.log(result)
			var str ="<table><tr><td>품목코드</td><td>품목명</td><td>규격</td><td>단위</td></tr>";
			for(var i =0;i<result.length;i++){
				str+="<tr><td>"+result[i].it_code+"</td>"
				str+="<td>"+result[i].it_pname+"</td>"
				str+="<td>"+result[i].it_size+"</td>"
				str+="<td>"+result[i].it_unit+"</td></tr>"
			}str+="</table>";
			$("#description").html(str)
		},
		error:function(err){
			console.log(err);
		}
	})	
}
</script>
</body>
</html>