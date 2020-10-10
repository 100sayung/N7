<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#center{
text-align: center;
width:1300px;
}
input{
text-align: center;
}
#list{
width: 1140px; 
border: 1px solid silver;
}
.select{
width: 160px;
}
</style>
</head>
<body>
${msg}
	<div id="center">
		<br>
         <button type="button" id="Oinfo" style="padding-left: 5px;">발주조회</button>
         <button type="button" id="Pinfo" style="padding-left: 5px;">구매조회</button>
     	<br>
     	<br>
      <div style="width:1280px; background-color:#3D6B9B;  color:white; padding:1%;">발주관리</div>
					<select id="choice">
						<option value="o_ccode">발주번호</option>
						<option value="o_pdocucode">구매번호</option>
					</select>
					<input type="text" id="search" name="search" style="height: 18px;">
					<button id="searchbtn">검색</button>
		<form id="a">
         <div border="1" style="width:1280px; height:80px; padding-top:25px; background-color:#F8F7F7;">
            <table summary="Code page support in different versions of MS Windows."
               rules="groups" frame="hsides" border="1"  id="list" style="width: 1280px; height: 70px; background-color: #ECEBEA;">
               <colgroup align="center">
               </colgroup>
               <colgroup align="left">
               </colgroup>
               <colgroup span="2" align="center">
               </colgroup>
               <colgroup span="3" align="center">
               </colgroup>
               <thead valign="top">
						<tr style="height: 30px;">
							<th><input type="checkbox" id="allCheck"></th>
                     		<th>발주번호</th>
                     		<th>구매번호</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td><input type="checkbox" name="each_check" class="each"></td>
                     		<td><input type="text" name="o_code" placeholder="자동생성"></td>
                     		<td><input type="text" name="o_pdocucode"></td>
                    	</tr>
					</tbody>
				</table>
			</div>
			<div style="padding-top: 10px">
				<button type="button" id="save">등록</button>
			</div>
         </form>
	</div>
	
	  <script type="text/javascript">

	  $('#save').click(function(){
         var obj = $("#a").serialize();
         console.log(obj);
         $.ajax({
            url: "/erp/rest/Purchase/orderinsert",
            type: "post",
            data: obj,
            success: function(data){
               //consloe.log(data);
            $('input').val("");
            alert("등록이 완료되었습니다.");
            },
            error: function(error){
            	console.log(error);
            }
         });
      });
      
       $('#Oinfo').click(function(){
    		$.ajax({
    			url: '/erp/rest/Purchase/orderInfo',
    			type: 'get',
    			dataType: 'json',
    			success: function(data){
    				console.log(data);
    				var str="";
    				str+="<tr class='tr'><th><span>선택</span></th><th>발주번호</th><th>구매번호</th></tr>";
    				for(var i in data.pList){
    	    			str+="<tr class='tr'><td><input type='radio' value="+data.pList[i].o_ccode+" name='each_check' class='each_check'></td>";
		    			str+="<td>"+data.pList[i].o_ccode+"</td>";
		    			str+="<td>"+data.pList[i].o_pdocucode+"</td><tr>";
    				}
    				$('#list').html(str); 
    				$("#save").attr("style","visibility: hidden");
    			},
    			error: function(err){
    				console.log(err);
    			}
    		});
      });
       

       $('#Pinfo').click(function(){
      		$.ajax({
      			url: '/erp/rest/Purchase/orderpinfo',
      			type: 'get',
      			dataType: 'json',
      			success: function(data){
      				console.log(data);
      				 var str="";
    				str+="<tr class='tr'><th><span>선택</span></th><th>회사코드</th><th>제품번호</th><th>날짜</th></tr>";
    				for(var i in data.pList){
    					str+="<tr class='tr'><td><input type='radio' value="+data.pList[i].ap_docunum+" name='each_check' class='each_check'></td>";
    					str+="<td>"+data.pList[i].ap_ccode+"</td>";
    					str+="<td>"+data.pList[i].ap_docunum+"</td>";
    					str+="<td>"+data.pList[i].ap_date+"</td></tr>";
    				}
       				$('#list').html(str);  
      				$("#save").attr("style","visibility: hidden");
      			},
      			error: function(error){
      				console.log(error);
      			}
      		});
        });

       
       $('#searchbtn').click(function(){
			 var choice = $('#choice').val();
			 var search = $('#search').val();
			 console.log(choice);
			 console.log(search);
			 $.ajax({
				 url: '/erp/rest/Purchase/orderSearch',
				 type: 'post',
				 data: "choice="+choice+"&search="+search,
				 dataType: 'json',
				 success: function(data){
					 var str="";
					 str+="<tr class='tr'><th><span>선택</span></th><th>구매번호</th><th>제품번호</th><th>담당자</th><th>거래처</th><th>구매일</th></tr>";
					 if(data.pList!=""){
						 for(var i in data.pList){
		    	    			str+="<tr class='tr'><td><input type='radio' value="+data.pList[i].o_ccode+" name='each_check' class='each_check'></td>";
				    			str+="<td>"+data.pList[i].o_ccode+"</td>";
				    			str+="<td>"+data.pList[i].o_pdocucode+"</td><tr>";
		    				}
		    				$('#list').html(str); 
					 }else{
						alert("데이터가 없습니다.");
					 }
				 },
				 error: function(error){
					 console.log(error);
				 }
			 });
    	});
	  
       

  	
   </script>
</body>
</html>