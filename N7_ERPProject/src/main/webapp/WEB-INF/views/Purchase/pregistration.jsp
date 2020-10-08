<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Details</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<style type="text/css">
#center{
text-align: center;
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
		 <span style="padding-left: 5px";><a href="#"
         onclick="window.open('/erp/Account/comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
         <span><a href=# onclick="window.open('/erp/stock/setcategory','PopupWin','width=500,height=600')"><button>분류코드 추가</button></a></span>
         <span><a href=# onclick="window.open('/erp/stock/setitemcode','PopupWin','width=500,height=600')"><button>품목코드 추가</button></a></span>
         <button type="button"id="stock">재고현황</button>
         <button type="button" id="Pinfo" style="padding-left: 5px;">구매조회</button>
         <button type="button" id="pDetail">상세보기</button>
     	<br>
     	<br>
      <div style="width:1150px; background-color:#3D6B9B;  color:white; padding:1%;">구매관리</div>
					<select id="choice">
						<option value="p_documentcode">구매번호</option>
						<option value="p_writer">담당자</option>
						<option value="p_day">구매일</option>
					</select>
					<input type="text" id="search" name="search" style="height: 18px;">
					<button id="searchbtn">검색</button>
		<form id="a">
         <div border="1" style="width:1175px; height:80px; padding-top:25px; background-color:#F8F7F7;">
				<table style="margin-right: 55px;">
                 	 <tr>
                 	 	<th>구매번호</th>
                    	<th><input type="text" name="p_documentcode" value="P" readonly id="p_documentcode" ></th>
                    	<th>제품번호</th>
                     	<th><input type="text" name="p_productnum" id="p_productnum"></th>
                     	<th>담당자</th>
                    	<th><input type="text" name="p_writer" id="p_writer"></th>
                    	<th>거래처</th>
                     	<th><input id="clcode" type="text" name="p_clcode" id="p_clcode"><button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button></th>
                     	<th>구매일</th>
                     	<th><input type="date" name="p_day" min="2000-01-01" max="2030-12-31" style="width: 161px;" id="p_day"></th>
                  	</tr>
            	</table>
			</div>
            <table summary="Code page support in different versions of MS Windows."
               rules="groups" frame="hsides" border="1"  id="list" style="width: 1175px; background-color: #ECEBEA;">
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
                     		<td><input type="text" name="p_name" class="p_name"></td>
                     		<!-- <td><input type="text" name="p_itcode"></td> -->
                     		<td class="it"></td>
                     		<td><input type="number" min="1" name="p_amount" class="p_amount"></td>
                     		<td><input class="unlit" type="text" name="p_unlit"></td>
                     		<td><input type="text" name="p_budget" class="p_budget"></td>
                    	</tr>
					</tbody>
				</table>
			<div style="float: left; padding-top: 5px">
				<button type="button" id="approval">결재요청</button>
				<button type="button" id="Pdelete">삭제</button>
				<button type="button" id="save">등록</button>
			</div>
			<div style="float: left; padding-top: 5px; margin-left: 1050px;" >
				<button type="button" class="addList">추가</button>
            	<button type="reset" id="reset">다시작성</button>
         	</div>
         </form>
	</div>
	
	  <script type="text/javascript">
	  
	  
	  $(document).on("keyup",".unlit",function(){
		 var cnt =$(this).parent().prev().children().val();
		 console.log(cnt);
		 var unlit = $(this).val();
		 var budget=cnt*unlit;
		 $(this).parent().next().children().val(budget);
	  });
	  
	  function setChildValue(data) {
		   console.log(data)
		   for(var i in data.aList){ 
		   var clcode=data.aList[i].cl_code;
		   }
		   
		   $("#clcode").val(clcode);
		};
		
	 $(document).ready(function(){
		 var select;
			$.ajax({
				url: "/erp/stock/getitemcode",
				type: "get",
				dataType: 'json',
				success: function(data){
					select=makeSelectBox(data);
					$(".it").html(select);
				},
				error: function(err){
					console.log(err);
				}
			})
			function makeSelectBox(arr){
				var arrStr="<select class='select' name='p_itcode'><option></option>";
				if(arr.length==0){
					arrStr+="<option>품목코드를 먼저 작성해주세요</option>";
				}else{
					for(var i=0; i<arr.length; i++){
						arrStr+="<option value='"+arr[i].it_code+"'>"+arr[i].it_code+"</option>";
					}
				}
				arrStr+="</select>";
				return arrStr;
			}
			
		 $('.addList').click(function(){
			 $('#tbody').append('<tr><td><input type="checkbox" name="each_check" class="each"></td><td><input type="text" name="p_name"></td><td class="it"></td><td><input type="number" min="1" name="p_amount"></td><td><input class="unlit" type="text" name="p_unlit"></td><td><input type="text" name="p_budget"></td><td><input type="button" value="삭제" onclick="javascript:thisRowDel(this);"></td></tr>');
		
	var select;
	$.ajax({
		url: "/erp/stock/getitemcode",
		type: "get",
		dataType: "json",
		success: function(data){
			select=makeSelectBox(data);
			$(".it").html(select);
		},
		error: function(err){
			console.log(err);
		}
	})
	function makeSelectBox(arr){
		var arrStr="<select class='select' name='p_itcode'><option></option>";
		if(arr.length==0){
			arrStr+="<option>품목코드를 먼저 작성해주세요</option>";
		}else{
			for(var i=0; i<arr.length; i++){
				arrStr+="<option value='"+arr[i].it_code+"'>"+arr[i].it_code+"</option>";
			}
		}
		arrStr+="</select>";
		return arrStr;
	}
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
            $("select").val("");
            alert("등록이 완료되었습니다.");
            },
            error: function(error){
            	console.log(error);
            	alert("데이터가 없습니다.");
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
    	    			str+="<tr class='tr'><td><input type='radio' value="+data.pList[i].p_documentcode+" name='each_check' class='each_check'></td>";
		    			str+="<td>"+data.pList[i].p_documentcode+"</td>";
		    			str+="<td>"+data.pList[i].p_productnum+"</td>";
		    			str+="<td>"+data.pList[i].p_writer+"</td>";
		    			str+="<td>"+data.pList[i].p_clcode+"</td>";
		    			str+="<td>"+data.pList[i].p_day+"</td><tr>";
    				}
    				$('#list').html(str); 
    				$("#save").attr("style","visibility: hidden");
    				$(".addList").attr("style","visibility: hidden");
    				$("#reset").attr("style","visibility: hidden");
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
               	window.open("/erp/Purchase/purchasedetail?check="+check,"purchasedetail", "width=1000, height=500, top=80 left=350");
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
			    			str+="<td>"+data.pList[i].p_day+"</td><tr>";
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
    					str+="<td>"+data.pList[i].p_day+"</td><tr>";
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
			  url:"/erp/rest/Purchase/getstocklist",
			  type: "get",
			  dataType: "json",
			  success: function(data){
				  console.log(data);
				  var str="";
				  str+="<tr style='text-align: center;'><th>품목코드</th><th>상품명</th><th>재고량</th><th>단위</th><th>크기</th></tr>";
				  for(var i in data.sList){
				  	str+="<tr style='text-align: center;'><td>"+data.sList[i].it_code+"</td>";
					str+="<td>"+data.sList[i].it_pname+"</td>";
				  	str+="<td>"+data.sList[i].it_stock+"</td>";
				  	str+="<td>"+data.sList[i].it_unit+"</td>";
				  	str+="<td>"+data.sList[i].it_size+"</td><tr>";
				  }
				  $('#list').html(str);
			  },
			  error: function(err){
				  console.log(err);
			  }
		  })
  	})
  	
   </script>
</body>
</html>