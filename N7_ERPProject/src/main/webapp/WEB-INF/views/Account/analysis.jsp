<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>매출/매입분석</title>
<style>
#as, #ap {
	border: 3px #e1e1e1 double;
	border-radius: 8px;
	float: left;
	width: 40%;
	height: 700px;
	margin-left: 8%;
}
.table{
text-align:center;
width:100%;
height: 29%;
border:1px solid #e1e1e1;
}
td{
border:1px solid #e1e1e1;

}
</style>
</head>
<body>
	<div>
		<div id="as">
			<div id="salestatement" style="width: 100%; height: 500px;"></div>
			<table class="table">
				<tr>
					<td><select onchange="salestatement(value)" >
					<option value="--">--</option>
					<option value="2020">2020</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
					</select>
					년
					</td>
					<td><select onchange="salestatement2(value)">
					<option value="--">--</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select>
					월
					</td>
				</tr>
				<tr><td>총 매출액</td><td id="total"></td></tr>
				<tr><td>총 공급가액</td><td id="price"></td></tr>
				<tr><td>총 부가세액</td><td id="tax"></td></tr>
			</table>
		</div>

		<div id="ap">
			<div id="purchase" style="width: 100%; height: 500px;"></div>
			<table class="table">
				<tr>
					<td><select>
					<option value="--">--</option>
					<option value="2020">2020</option>
					<option value="2020">2019</option>
					<option value="2020">2018</option>
					</select>
					년
					</td>
					<td><select >
					<option value="--">--</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select>
					월
					</td>
				</tr>
				<tr><td>총 매입액</td><td></td></tr>
				<tr><td>총 공급가액</td><td></td></tr>
				<tr><td>총 부가세액</td><td></td></tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">

//매출 분석표
	var month ="";
	var year="";
	
    
    function salestatement(value){
    	var snum= new Array();
    	var total=0;
        var price=0;
        var tax=0;
        var pkind = new Array();
	 year = value;
    	console.log(value);
    	$.ajax({
    		url:'/erp/rest/Account/analysis',
    		dataType:'json',
    		type:'post',
    		success:function(data){
    			
    			console.log(data);
    			for(var i in data.sList){
    			if(data.sList[i].s_num.substring(0,2)=="AS" && data.sList[i].s_date.substring(0,4)==year){
    				snum.push(data.sList[i].s_num);
    			}
    			}
    				console.log(snum);
    		
    			for(var i=0; i<snum.length; i++){
    				for(var j=0; j<data.sList2.length; j++){
    					if(snum[i]==data.sList2[j].s_num){
    						pkind.push(data.sList2[j].s_pkind);
    						total+=Number(data.sList2[j].s_total);
    						price+=Number(data.sList2[j].s_price);
    						tax+=Number(data.sList2[j].s_tax);
    					}
    				}
    			}
    			var count=0;
    			pkind.sort();
    			var pkind2=Array.from(new Set(pkind));
    			pkind2.sort();
    			console.log(pkind);
    			console.log(pkind2);
    			for(var i=0; i<pkind2.length; i++){
    				for(var j=0; j<pkind.length;i++);
    				if(pkind[i]==pkind[j]){
    					count++;
    				}
    				}
    			$("#total").html(total+"(원)");
    			$("#price").html(price+"(원)");
    			$("#tax").html(tax+"(원)");
    			grafe(pkind2);
    		},
    		error:function(error){
    			console.log(error);
    		}
    	});
    };	
    
    function salestatement2(value2){
    	var snum= new Array();
    	var total=0;
        var price=0;
        var tax=0;
		 month="-"+value2+"월";
		 $.ajax({
	    		url:'/erp/rest/Account/analysis',
	    		dataType:'json',
	    		type:'post',
	    		success:function(data){
	    			
	    			console.log(data);
	    			for(var i in data.sList){
	    			if(data.sList[i].s_num.substring(0,2)=="AS" && data.sList[i].s_date.substring(0,4)==year && data.sList[i].s_date.substring(5,7)==value2){
	    				snum.push(data.sList[i].s_num);
	    			}
	    			}
	    				console.log(snum);
	    		
	    			for(var i=0; i<snum.length; i++){
	    				for(var j=0; j<data.sList2.length; j++){
	    					if(snum[i]==data.sList2[j].s_num){
	    						total+=Number(data.sList2[j].s_total);
	    						price+=Number(data.sList2[j].s_price);
	    						tax+=Number(data.sList2[j].s_tax);
	    					}
	    				}
	    			}
	    			$("#total").html(total+"(원)");
	    			$("#price").html(price+"(원)");
	    			$("#tax").html(tax+"(원)");
	    			grafe();
	    		},
	    		error:function(error){
	    			console.log(error);
	    		}
	    	});
		 
	 };
    function grafe(pkind2){
    	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart1);
	
	function drawChart1() {

		  var data = google.visualization.arrayToDataTable(['품목', '품목갯수'],[pkind2[0],10]);
				 
				

		var options = {
			title : year+month+'매출분석표',
			is3D : true ,
			
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('salestatement'));

		chart.draw(data, options);
	}
    };
    
	
	//매입 분석표
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart2);


	function drawChart2() {

		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
				[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

		var options = {
			title : '매입분석표'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('purchase'));

		chart.draw(data, options);
	}
</script>
</html>