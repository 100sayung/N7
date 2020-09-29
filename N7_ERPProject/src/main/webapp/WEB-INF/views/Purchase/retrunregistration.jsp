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
input{
text-align: center;
}
#list{
width: 1140px;
border: 1px solid silver;
}
</style>
</head>
<body>
       <div style="width: auto; background-color: white; padding: 1%;">
            <button id="Wearing">입고현황</button>
            <button id="rInfo">반품조회</button>
         </div>
      <div style="width: auto; background-color: #FFB2D9; color: white; padding: 1%;">반품관리</div>
               <select id="choice">
                  <option value="r_documentcode">반품번호</option>
                  <option value="r_ieseqnum">입고번호</option>
                  <option value="r_writer">담당자</option>
                  <option value="r_date">반품일</option>
               </select>
               <input type="text" id="search" name="search" style="height: 18px";>
               <button id="searchbtn">검색</button>
      <form id="rRegistration">
         <div style="height: 80px; padding-top: 25px; background-color: #F8F7F7;">
            <div style="margin-left: 55px">
            <table>
                     <tr>
                       <th>반품번호</th>
                       <th><input type="text" name="r_documentcode" value="R" readonly></th>
                       <th>입고번호</th>
                        <th><input type="text" name="r_ieseqnum"></th>
                        <th>담당자</th>
                       <th><input type="text" name="r_writer"></th>
                       <th>거래처</th>
                        <th><input type="text" name="r_clcode"></th>
                        <th>반품일</th>
                        <th><input type="date" name="r_date" min="2000-01-01" max="2030-12-31" style="width: 161px;"></th>
                     </tr>
               </table>
            </div>
         </div>
         <div style="background-color: #ECEBEA;">
            <table summary="Code page support in different versions of MS Windows."
               rules="groups" frame="hsides" border="1"  id="list" style="width: 100%;">
               <colgroup align="center">
               </colgroup>
               <colgroup align="left">
               </colgroup>
               <colgroup span="2" align="center">
               </colgroup>
               <colgroup span="3" align="center">
               </colgroup>
               <thead valign="top">
                  <tr>
                     <th><input type="checkbox" id="allCheck"></th>
                           <th>상품명</th>
                           <th>상품코드</th>
                           <th>수량</th>
                           <th>단가</th>
                           <th>합계</th>
                           <th>적요</th>
                  </tr>
               </thead>
               <tbody id="tbody">
                  <tr>
                     <td><input type="checkbox" name="each_check" class="each"></td>
                           <td><input type="text" name="r_name" ></td>
                           <td><input type="text" name="r_itcode" ></td>
                           <td><input type="number" min="1" name="r_amount"></td>
                           <td><input type="text" name="r_unlit"></td>
                           <td><input type="text" name="r_budget"></td>
                           <td><input type="text" name="r_reason"></td>
                       </tr>
               </tbody>
            </table>
         </div>
         <div style="float: left;">
            <button type="button" id="save">저장</button>
            <button type="button" id="rDelete">삭제</button>
            <button type="button" id="print" onclick="window.print()">인쇄</button>
            <button type="reset">다시작성</button>
            </div>
         </form>

     <script type="text/javascript">
     
    $(function() {
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});
	}); 
    
	  $('#save').click(function(){
	         var obj = $('#rRegistration').serialize();
	         $.ajax({
	            url: '/erp/rest/Purchase/rRegistration',
	            type: 'post',
	            data: obj,
	            success: function(data){
	               //consloe.log(data);
	            },
	            error: function(error){
	            	console.log(error);
	            }
	         });
	            $('input').val("");
	      });
	  
	  $('#rInfo').click(function(){
		  $.ajax({
			  url: '/erp/rest/Purchase/rInfo',
			  type: 'get',
			  dataType: 'json',
			  success: function(data){
				  console.log(data);
				  var str="";
				  str+="<tr><th><span>선택</span></th><th>반품번호</th><th>입고번호</th><th>상품명</th><th>상품코드</th><th>담당자</th><th>거래처</th><th>반품일</th><th>수량</th><th>단가</th><th>합계</th><th>적요</th></tr>";
			 	  for(var i in data.rList){
			 		 str+="<tr class='tr'><td><input type='radio' value='"+data.rList[i].r_documentcode+"' name='each_check' class='each_check'></td>";
	  				 str+="<td>"+data.rList[i].r_documentcode+"</td>"
		  				 str+="<td>"+data.rList[i].r_ieseqnum+"</td>";
		  				 str+="<td>"+data.rList[i].r_name+"</td>";
		  				 str+="<td>"+data.rList[i].r_itcode+"</td>";
		  				 str+="<td>"+data.rList[i].r_writer+"</td>";
		  				 str+="<td>"+data.rList[i].r_clcode+"</td>";
		  				 str+="<td>"+data.rList[i].r_date+"</td>";
		  				 str+="<td>"+data.rList[i].r_amount+"</td>";
		  				 str+="<td>"+data.rList[i].r_unlit+"</td>";
		  				 str+="<td>"+data.rList[i].r_budget+"</td>";
		  				 str+="<td>"+data.rList[i].r_reason+"</td></tr>";
			 	  }
			 	  $('#list').html(str);
			  },
			  error: function(error){
				  console.log(error);
			  }
		  })
	  })
	  
 	  	  $('#rDelete').click(function(){
  	  		  var check_list=[];
  	  		  $("input[name=each_check]:checked").each(function(){
  	  			  var cid= $(this).val();
  	  			  console.log(check_list);
  	  			  
  	  			  $.ajax({
  	  				  url: '/erp/rest/Purchase/rdelete',
  	  				  type: 'post',
  	  				  data: {check_list:cid},
  	  				  dataType: 'json',
  	  				  success: function(data){
  	  				  console.log(data);
  					  var str="";
  					  str+="<tr><th><span>선택</span></th><th>반품번호</th><th>입고번호</th><th>상품명</th><th>상품코드</th><th>담당자</th><th>거래처</th><th>반품일</th><th>수량</th><th>단가</th><th>합계</th><th>적요</th></tr>";
  				 	  for(var i in data.rList){
  				 		 str+="<tr class='tr'><td><input type='radio' value='"+data.rList[i].r_documentcode+"' name='each_check' class='each_check'></td>";
		  				 str+="<td>"+data.rList[i].r_documentcode+"</td>"
  		  				 str+="<td>"+data.rList[i].r_ieseqnum+"</td>";
  		  				 str+="<td>"+data.rList[i].r_name+"</td>";
  		  				 str+="<td>"+data.rList[i].r_itcode+"</td>";
  		  				 str+="<td>"+data.rList[i].r_writer+"</td>";
  		  				 str+="<td>"+data.rList[i].r_clcode+"</td>";
  		  				 str+="<td>"+data.rList[i].r_date+"</td>";
  		  				 str+="<td>"+data.rList[i].r_amount+"</td>";
  		  				 str+="<td>"+data.rList[i].r_unlit+"</td>";
  		  				 str+="<td>"+data.rList[i].r_budget+"</td>";
  		  				 str+="<td>"+data.rList[i].r_reason+"</td></tr>";
  				 	  }
  				 	  $('#list').html(str);
  				 	  
  	  				  },
  	  				  error: function(error){
  	  					  consoel.log(error);
  	  				  }
  	  			  })
  	  		  })
  	  	  })  
  	  
	 	$('#searchbtn').click(function(){
			var choice= $('#choice').val();
			var search= $('#search').val();
			console.log(choice);
			console.log(search);
			$.ajax({
				url: '/erp/rest/Purchase/retrunsearch',
				type: 'post',
				data: "choice="+choice+"&search="+search,
				dataType: 'json',
				  success: function(data){
  	  				  console.log(data);
  					  var str="";
  					  str+="<tr><th><span>선택</span></th><th>반품번호</th><th>입고번호</th><th>상품명</th><th>상품코드</th><th>담당자</th><th>거래처</th><th>반품일</th><th>수량</th><th>단가</th><th>합계</th><th>적요</th></tr>";
  				 	  for(var i in data.rList){
  				 		 str+="<tr class='tr'><td><input type='radio' value='"+data.rList[i].r_documentcode+"' name='each_check' class='each_check'></td>";
  		  				 str+="<td>"+data.rList[i].r_documentcode+"</td>"
  		  				 str+="<td>"+data.rList[i].r_ieseqnum+"</td>";
  		  				 str+="<td>"+data.rList[i].r_name+"</td>";
  		  				 str+="<td>"+data.rList[i].r_itcode+"</td>";
  		  				 str+="<td>"+data.rList[i].r_writer+"</td>";
  		  				 str+="<td>"+data.rList[i].r_clcode+"</td>";
  		  				 str+="<td>"+data.rList[i].r_date+"</td>";
  		  				 str+="<td>"+data.rList[i].r_amount+"</td>";
  		  				 str+="<td>"+data.rList[i].r_unlit+"</td>";
  		  				 str+="<td>"+data.rList[i].r_budget+"</td>";
  		  				 str+="<td>"+data.rList[i].r_reason+"</td></tr>";
  				 	  }
  				 	  $('#list').html(str);
  				 	  
  	  				  },
  	  				  error: function(error){
  	  					  consoel.log(error);
  	  				  }
  	  			  })
			})	  
			
	
	$('#Wearing').click(function(){
		$.ajax({
			url: "/erp/stock/getimportlist",
			type: "post",
			dataType: "json",
			success: function(data){
				console.log(data);
			},
			error: function(err){
				console.log(err);
			}
		});
	});
   </script>
</body>
</html>