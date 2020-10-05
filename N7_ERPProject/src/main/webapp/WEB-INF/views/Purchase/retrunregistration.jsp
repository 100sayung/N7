<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#aaa{
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
	<div id="aaa">
       <div style="width: auto; background-color: white; padding: 1%;">
        	<span style="padding-left: 5px";><a href="#"
         	onclick="window.open('/erp/Account/comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
            <button id="Wearing">입고현황</button>
            <button id="rInfo">반품조회</button>
         </div>
      <div style="width: auto; background-color: #3D6B9B; color: white; padding: 1%;">반품관리</div>
               <select id="choice">
                  <option value="r_documentcode">반품번호</option>
                  <option value="r_ieseqnum">입고번호</option>
                  <option value="r_writer">담당자</option>
                  <option value="r_date">반품일</option>
               </select>
               <input type="text" id="search" name="search" style="height: 18px";>
               <button id="searchbtn">검색</button>
      <form id="o_return">
         <div style="height: 80px; padding-top: 25px; background-color: #F8F7F7;">
            <div style="margin-left: 55px">
            <table>
                     <tr>
                       <th>반품번호</th>
                       <td><input type="text" name="r_documentcode" value="R" readonly></td>
                       <th>입고번호</th>
                       <!-- <td><input type="text" name="r_ieseqnum"></td> -->
                       <td id="ie"></td>
                       <th>담당자</th>
                       <td><input type="text" name="r_writer"></td>
                      <th>거래처</th>
                     	<th><input id="clcode" type="text" name="r_clcode"><button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button></th>
                       <th>반품일</th>
                       <td><input type="date" name="r_date" min="2000-01-01" max="2030-12-31" style="width: 161px;"></td>
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
                     	   <td id="name"></td>
                          <!--  <td><input type="text" name="r_name"></td> -->
                          <!--  <td><input type="text" name="r_itcode" ></td> -->
                           <td id="it"></td>
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
	</div>
<script type="text/javascript">
     
	  function setChildValue(data) {
		   console.log(data)
		   for(var i in data.aList){ 
		   var clcode=data.aList[i].cl_code;
		   }
		   $("#clcode").val(clcode);
		};
     
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
	         var obj = $("#o_return").serialize();
	         console.log(obj);
	         $.ajax({
	            url: "/erp/rest/Purchase/rRegistration",
	            type: "post",
	            data: obj,
	            success: function(data){
	               //consloe.log(data);
	            $("input").val("");
	            alert("등록이 완료되었습니다.");
	            },
	            error: function(error){
	            	console.log(error);
	            	alert("등록이 실패하였습니다.");
	            }
	         });
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
			
		$("#Wearing").click(function(){
			  $.ajax({
				  url:"/erp/rest/Purchase/stocklist",
				  type: "get",
				  dataType: "json",
				  success: function(data){
					  console.log(data);
					  var str="";
					  str+="<tr style='text-align: center;'><th>입고번호</th><th>품목코드</th><th>거래처</th><th>날짜</th><th>수량</th><th>가격</th></tr>";
					  for(var i in data.sList){
					  	str+="<tr style='text-align: center;'><td>"+data.sList[i].ie_seqnum+"</td>";
						str+="<td>"+data.sList[i].ie_itcode+"</td>";
						str+="<td>"+data.sList[i].ie_clcode+"</td>";
					  	str+="<td>"+data.sList[i].ie_date+"</td>";
					  	str+="<td>"+data.sList[i].ie_qty+"</td>";
					  	str+="<td>"+data.sList[i].ie_price+"</td><tr>";
					  }
					  $('#list').html(str);
				  },
				  error: function(err){
					  console.log(err);
				  }
		 	 })
  		})
  	
  		 var select;
    	 $.ajax({
    	       url:"/erp/stock/getitemcode",
           dataType:"json",
           type:"get",
           success:function(data){
              select = makeSelectBox(data);
              
              $("#it").html(select);
           },
           error:function(err){
              console.log(err);
           }
        });
	     function makeSelectBox(arr){
	         var arrStr = "<select class='select' name = 'r_itcode'><option></option>"
	         if(arr.length==0){
	            arrStr+="<option>품목코드를 먼저 작성해주세요 </option>";
	         }else{
	            for(var i = 0; i<arr.length;i++){
	               arrStr+="<option value='"+arr[i].it_code+"'>"+arr[i].it_code+"</option>"; 
	            }
	         }
	         arrStr+="</select>";
	         return arrStr;
	      }
  	
		 var select2;
		     $.ajax({
		    	 url: "/erp/stock/getimportlist",
		         dataType: "json",
		         type: "post",
		         success:function(data){
		              select = makeSelectBox2(data);
		              $("#ie").html(select);
		         },
		         error:function(err){
		             console.log(err);
		         }
		     });
	     function makeSelectBox2(arr){
	         var arrStr = "<select class='select' name = 'r_ieseqnum'><option></option>"
	         if(arr.length==0){
	            arrStr+="<option>품목코드를 먼저 작성해주세요 </option>";
	         }else{
	            for(var i = 0; i<arr.length;i++){
	               arrStr+="<option value='"+arr[i].ie_seqnum+"'>"+arr[i].ie_seqnum+"</option>"; 
	            }
	         }
	         arrStr+="</select>";
	         return arrStr;
	      }
	     
	   var select3;
	     $.ajax({
	           url:"/erp/stock/getitemcode",
	           dataType:"json",
	           type:"get",
	           success:function(data){
	              select = makeSelectBox3(data);
	              $("#name").html(select);
	           },
	           error:function(err){
	              console.log(err);
	           }
	        });
	     function makeSelectBox3(arr){
	         var arrStr = "<select class='select' name = 'r_name'><option></option>"
	         if(arr.length==0){
	            arrStr+="<option>품목코드를 먼저 작성해주세요 </option>";
	         }else{
	            for(var i = 0; i<arr.length;i++){
	               arrStr+="<option value='"+arr[i].it_pname+"'>"+arr[i].it_pname+"</option>"; 
	            }
	         }
	         arrStr+="</select>";
	         return arrStr;
	      }
  	
  	
</script>
</body>
</html>