<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<title>영업실적조회</title>
<style>
#salesResult{
border: 3px #e1e1e1 double;
	border-radius: 8px;
	float: left;
	margin-left: 8%;
	float: left;
}
.table{
text-align:center;
border:1px solid #e1e1e1;
}

td{
border:1px solid #e1e1e1;

}
.column,.value{
width:100px;
}

</style>
</head>

<body>
<div id="as">
			<div id="salesResult" style="width: 800px;%; height: 500px;"></div>
			<table class="table">
			<tr><td class="column">이름</td></tr>
			<tr><td class="value" id="hrcode"></td></tr>
				<tr>
					<td class="year">
					년
					</td></tr>
					<tr><td id="month">
			
					</td>
				</tr>
				<tr><td>총 영업예산</td></tr>
				<tr><td id="total"></td></tr>
				<tr><td>총 영업매출</td></tr>
				<tr><td id="price"></td></tr>
				<tr><td>영업이익</td></tr>
				<tr><td id="gain"></td></tr>
			</table>
		</div>
</body>
<script>
	var bList= ${bList};
$(document).ready(function(){
			 var str="";
			 var str2="";
			 var str3="";
			var date = new Array();
			var hrcode = new Array();
			var month = new Array();
			for(var i in bList){
				date.push(bList[i].ba_date.substring(0,4));
				hrcode.push(bList[i].ba_hrcode);
				month.push(bList[i].ba_date.substring(5,7))
				}
			
			var date2=Array.from(new Set(date));
			var month2=Array.from(new Set(month));
				console.log(month2);
			
			str+="<select id='change'>";
			str+="<option>--</option>";
			for(var i=0; i<date2.length; i++){
				str+="<option  value="+date2[i]+">"+date2[i]+"</option>";
			}
			str+="</select>";
			$(".year").html(str+"년");
			
			
			str2+="<select id='name'>";
			str2+="<option>--</option>";
			for(var i=0; i<hrcode.length; i++){
				str2+="<option  value="+hrcode[i]+">"+hrcode[i]+"</option>";
			}
			str2+="</select>";
			$("#hrcode").html(str2);
			
			str3+="<select id='month2'>";
			str3+="<option>--</option>";
			for(var i=0; i<month2.length; i++){
				str3+="<option  value="+month2[i]+">"+month2[i]+"</option>";
			}
			str3+="</select>";
			$("#month").html(str3+("월"));
			
			
			
});

 var year = "";
 var allmonth = "";
 var name ="";
$(document).on("change","#change",function(){
		 year = $("#change").val();
	var total=0;
    var price=0;
    var pkind = new Array();
    var cnt = new Array();
	
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
	
});

$(document).on("change","#name",function(){
	    name = $("#name").val();
	var total=0;
    var price=0;
    var pkind = new Array();
    var cnt = new Array();
    if(year==""){
    	alert("년도를 선택해주세요");
    	window.location.reload();
    }else if(allmonth==""){
    	
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_hrcode==name){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
    }else{
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_hrcode==name && bList[i].ba_date.substring(5,7)==allmonth){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
    	
    }
	
	
});

$(document).on("change","#month2",function(){
	     allmonth =$("#month2").val();
	var total=0;
    var price=0;
    var pkind = new Array();
    var cnt = new Array();
    if(year==""){
    	alert("년도를 선택해주세요");
    	window.location.reload();
    }else if(name==""){
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_date.substring(5,7)==allmonth){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
    }else{
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_hrcode==name && bList[i].ba_date.substring(5,7)==allmonth){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
    	
    }
});

function grafe(pkind,cnt){
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		  var data =new google.visualization.DataTable();
		   data.addColumn('string','수주이름');
		   data.addColumn('number','액수');
		 for(var i=0; i<pkind.length; i++){  
		  data.addRows([[pkind[i],cnt[i]]]);
		  }
		
		var options = {
			title : year+"-"+allmonth+'영업실적',
			is3D : true ,
			
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('salesResult'));

		chart.draw(data, options);
	}
    };
</script>
</html>