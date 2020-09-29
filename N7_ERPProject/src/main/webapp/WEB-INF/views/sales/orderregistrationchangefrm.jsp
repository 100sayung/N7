<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
   <div style="background-color:#FFB2D9; color:white; padding:1%; ">수주변경 양식
   <input type="button" id="sub" value="저장" style="float:right;">
   </div>
   <div id="a" border="1" style="height:80px; padding-top:25px; background-color:#F8F7F7;">
        <table>
         <thead>
            <tr>
               <th>사업단위</th>
               <th><select name="unit" style="width:180px;">
                   <option value="">본사</option>
                   <option value="지사">지사</option></select></th>
               <th>수주일</th>
               <th><input type="text"></th>
               <th>수주번호</th>
               <th><input type="text"></th>
               <th>변경회차</th>
               <th><input type="text"></th>
            </tr>
            <tr>   
               <th>거래처</th>
               <th><input type="text"></th>
               <th>거래처번호</th>
               <th><input type="text"></th>
               <th>담당자</th>
               <th><input type="text"></th>
               <th>부서</th>
               <th><input type="text"></th>
            </tr>
         </thead>
      </table>
    </div> 
    <div>
       <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1">
                <colgroup align="center">
                </colgroup>
<!--                  <colgroup align="left">
                </colgroup>
                <colgroup span="2" align="center">
                </colgroup>
                <colgroup span="3" align="center">
                </colgroup> -->
                <thead valign="top">
                    <tr>
                        <th><input type="checkbox" id="allCheck"></th>
                        <th>품명</th>
                        <th>품번</th>				
						<th>수량</th>
						<th>납기일</th>
						<th>판매단가</th>
						<th>판매금액</th>
						<th>판매금액합계</th>
					</tr>
                </thead>
                <tbody id="tBodyy">
                    <tr>
                        <td><input type="checkbox" class="each"></td>          
                        <td><input type="text" name="pro_name" id="add" required></td>
                        <td><input type="text" name="pro_num"  required></td>
                        <td><input type="text" name="pro_quantity" required></td>
                        <td><input type="text" name="due_date" required></td>
                        <td><input type="text" name="pro_price" required></td>
                        <td><input type="text" name="pro_sales_amount" required></td>
                        <td><input type="text" name="pro_tsales_amount" required></td>                
                    </tr>
                </tbody>
          </table>
      </div> 
    </div> 
</body>
<script>
('#sub').click(function(){
	var str="";
	
	$.ajax({
		url:'rest/orderregistrationchange',
		type: 'get',
		dataType: "json",
		success:function(data){
			console.log(data);
			
			for(var i in data.sList){
				str+="<tr><td>"+data.sList[i].pro_name+"</td>";
				str+="<td>"+data.sList[i].pro_num+"</td>";
				str+="<td>"+data.sList[i].pro_size+"</td>";
				str+="<td>"+data.sList[i].pro_price+"</td>";
				str+="<td>"+data.sList[i].pro_quantity+"</td>";
				str+="<td>"+data.sList[i].pro_sales_amount+"</td>";
				str+="<td>"+data.sList[i].pro_house+"</td></tr>";
/*         				str+="<td>"+data.sList[i].changed_circuit+"</td>";
				str+="<td>"+data.sList[i].pro_tsales_amount+"</td></tr>"; */
			}
				$('#tBodyy').html(str);
		},
		error:function(error){
			console.log(error);
		}
	})
});    

</script>
</html>