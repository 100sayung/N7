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
${msg}
	<div id="aaa">
       <div style="width: auto; background-color: white; padding: 1%;">
		 <span style="padding-left: 5px";><a href="#"
         onclick="window.open('/erp/Account/comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
		 <!-- <span><a href="#" onclick="window.open('/erp/stock/getimportlist','stock','width=1200, height=620, top=80 left=200')"><button>재고현황</button></a></span> -->
         <button type="button"id="stock">재고현황</button>
         <button type="button" id="Pinfo" style="padding-left: 5px;">구매조회</button>
		<button type="button" id="pDetail">상세보기</button>
      	</div>
      <div style="width: auto; background-color: #FFB2D9; color: white; padding: 1%;">구매관리</div>
					<select id="choice">
						<option value="p_documentcode">구매번호</option>
						<option value="p_writer">담당자</option>
						<option value="p_day">구매일</option>
					</select>
					<input type="text" id="search" name="search" style="height: 18px;">
					<button id="searchbtn">검색</button>
		<form id="a">
         <div style="height: 80px; padding-top: 25px; background-color: #F8F7F7;">
            <div style="margin-left: 55px">
				<table>
                 	 <tr>
                 	 	<th>구매번호</th>
                    	<th><input type="text" name="p_documentcode" value="P" readonly></th>
                    	<th>제품번호</th>
                     	<th><input type="text" name="p_productnum"></th>
                     	<th>담당자</th>
                    	<th><input type="text" name="p_writer"></th>
                    	<th>거래처</th>
                     	<th><input type="text" name="p_clcode"></th>
                     	<th>구매일</th>
                     	<th><input type="date" name="p_day" min="2000-01-01" max="2030-12-31" style="width: 161px;"></th>
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
						<tr>
							<th><input type="checkbox" id="allCheck"></th>
                     		<th>상품명</th>
                     		<th>상품코드</th>
                     		<th>수량</th>
                     		<th>단가</th>
                     		<th>합계</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td><input type="checkbox" name="each_check" class="each"></td>
                     		<td><input type="text" name="p_name"></td>
                     		<td><input type="text" name="p_itcode"></td>
                     		<td><input type="number" min="1" name="p_amount"></td>
                     		<td><input type="text" name="p_unlit"></td>
                     		<td><input type="text" name="p_budget"></td>
                    	</tr>
					</tbody>
				</table>
			</div>
			<div style="float: left;; padding-top: 5px">
				<button type="button" id="save">등록</button>
				<button type="button" id="approval">결재</button>
			</div>
			<div style="float: right;; padding-top: 5px">
				<button type="button" id="Pdelete">삭제</button>
				<button type="button" class="addList">추가</button>
            	<button type="reset">다시작성</button>
				<button type="button" id="print" onclick="window.print()">인쇄</button>
         	</div>
         </form>
	</div>
	
	  <script type="text/javascript">
	  
	 $(document).ready(function(){
		 $('.addList').click(function(){
			 $('#tbody').append('<tr><td><input type="checkbox" name="each_check" class="each"></td><td><input type="text" name="p_name"></td><td><input type="text" name="p_itcode"></td><td><input type="number" min="1" name="p_amount"></td><td><input type="text" name="p_unlit"></td><td><input type="text" name="p_budget"></td><td><input type="button" value="삭제" onclick="javascript:thisRowDel(this);"></td></tr>');
		 });
	 });
	 function thisRowDel(row){
		   console.log(row);
		   let tr = row.parentNode.parentNode;
		   tr.parentNode.removeChild(tr);
		}
	 
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
         var obj = $("#a").serialize();
         console.log(obj);
         $.ajax({
            url: '/erp/rest/Purchrase/pregistration',
            type: 'post',
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
      
       $('#Pinfo').click(function(){
    		$.ajax({
    			url: '/erp/rest/Purchase/pference',
    			type: 'get',
    			dataType: 'json',
    			success: function(data){
    				//console.log(data);
     				var str="";
     				str+="<tr class='tr'><th><span>선택</span></th><th>구매번호</th><th>제품번호</th><th>담당자</th><th>거래처</th><th>구매일</th></tr>";
    				for(var i in data.pList){
    					str+="<tr class='tr'><td><input type='radio' value='"+data.pList[i].p_documentcode+"' name='each_check' class='each_check'></td>";
    					str+="<td>"+data.pList[i].p_documentcode+"</td>";
    					str+="<td>"+data.pList[i].p_productnum+"</td>";
    					str+="<td>"+data.pList[i].p_writer+"</td>";
    					str+="<td>"+data.pList[i].p_clcode+"</td>";
    					str+="<td>"+data.pList[i].p_day+"</td></tr>";
    				}
    				$('#list').html(str); 
    			},
    			error: function(error){
    				console.log(error);
    			}
    		});
      });
 	  
 	  $("#pDetail").click(function(){
 		  console.log("여기들어와?");
           $("input[name=each_check]:checked").each(function(){
               var check = $(this).attr("value");
               console.log(check);
               
               if(check!=""){
               	window.open("/erp/Purchase/purchasedetail?check="+check,"purchasedetail", "width=700, height=460, top=80 left=350");
               }
            });
 		});
       
      $('#searchbtn').click(function(){
			 var choice = $('#choice').val();
			 var search = $('#search').val();
			 console.log(choice);
			 console.log(search);
			 $.ajax({
				 url: '/erp/rest/Purchase/pfsearch',
				 type: 'post',
				 data: "choice="+choice+"&search="+search,
				 dataType: 'json',
				 success: function(data){
					 var str="";
					 str+="<tr class='tr'><th><span>선택</span></th><th>구매번호</th><th>제품번호</th><th>담당자</th><th>거래처</th><th>구매일</th></tr>";
					 if(data.pList!=""){
						 for(var i in data.pList){
			    			str+="<tr class='tr'><td><input type='radio' value="+data.pList[i].p_documentcode+" name='each_check' class='each_check'></td>";
			    			str+="<td>"+data.pList[i].p_documentcode+"</td>";
			    			str+="<td>"+data.pList[i].p_productnum+"</td>";
			    			str+="<td>"+data.pList[i].p_writer+"</td>";
			    			str+="<td>"+data.pList[i].p_clcode+"</td>";
			    			str+="<td>"+data.pList[i].p_day+"</td>";
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
      
		$('#Pdelete').click(function(){
			 var check_list = [];
			//전체 체크라는 체크박스 제외 반복문
			$("input[name=each_check]:checked").each(function(){
				var cid =$(this).val();
				console.log(check_list); 
			
			$.ajax({
				url: '/erp/rest/Purchase/pfdelete',
				type: 'post',
				data: {check_list:cid},
				dataType: 'json',
				success: function(data){
					console.log(data);
					alert("데이터 삭제 완료");
					var str="";
     				str+="<tr class='tr'><th><span>선택</span></th><th>구매번호</th><th>제품번호</th><th>담당자</th><th>거래처</th><th>구매일</th></tr>";
    				for(var i in data.pList){
    					str+="<tr class='tr'><td><input type='radio' value="+data.pList[i].p_documentcode+" name='each_check' class='each_check'></td>";
    					str+="<td>"+data.pList[i].p_documentcode+"</td>";
    					str+="<td>"+data.pList[i].p_productnum+"</td>";
    					str+="<td>"+data.pList[i].p_writer+"</td>";
    					str+="<td>"+data.pList[i].p_clcode+"</td>";
    					str+="<td>"+data.pList[i].p_day+"</td>";
    				}
    				$('#list').html(str); 
				},
				error: function(error){
					console.log(error);
				}
			});
		}); 
	});
		
      $('#approval').click(function(){
    	 console.log("들어가라");
    	 $("input[name=each_check]:checked").each(function(){
    		 var check= $(this).attr("value");
    		 console.log(check);
    		 
    		 if(check!=""){
    			 window.open("/erp/Purchase/pprogramwrite?check="+check,"pprogramwrite", "width=1200, height=620, top=80 left=200");
             }
    	 });
      });
      
      $("#stock").click(function(){
    	  $.ajax({
    		  url: "/erp/stock/getbyitemstocklist",
    		  type: "post",
    		  dataType: "json",
    		  success: function(data){
    			  console.log(data);
    		  },
    		  error: function(err){
    			  console.log(err);
    		  }
    	  })
      })
     
   </script>
</body>
</html>