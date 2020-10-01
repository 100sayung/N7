<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
#center{
text-align:center;
}
html, body {
text-align:center;
   height: 100%;
   margin: 0
}

tr,td{
text-align: center;
width: 150px;
border: 1px solid ;
}
#item{
text-align:center;
}

</style>
<body>
    <div id="center">
    <div style="width:auto; background-color:white; color:white; padding:1%;">
           <button type="button" id="orderitemfrm">수주품목 현황</button>
           <span style="padding-left: 5px"><a href="#"
         onclick="window.open('/erp/Account/comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
           <!-- <span style="padding-left: 5px"><a href="#"
         onclick="window.open('clientfrm','clientfrm','width=1200,height=700')"><button>거래처등록</button></a></span> -->
        </div> 
        <div style="width:auto; background-color:#3D6B9B;  color:white; padding:1%;">수주관리 양식</div>
              <select id="choice" style="width:180px;">                    
                      <option value="bo_num">수주번호</option>
                      <option value="bo_clcode">거래처회사코드</option>
                      <option value="bo_ccode">회사코드</option>
               </select>
        <input type="text" name="search" id="search">    
        <button id="searchh">검색</button>   
        <form id="orderregistrationinput">
        <div border="1" style="height:80px; padding-top:25px; background-color:#F8F7F7;">
        <table style="margin-left:300px;">
         <thead>
            <tr>
               <th>수주번호</th>
               <th><input type="number" name="bo_num" placeholder="자동생성" readonly></th> <!-- placeholder="자동생성" readonly -->
               <th>거래처회사코드</th>
               <th><input id="clcode" type="text" name="bo_clcode"><button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button></th>
               <th>회사코드</th>
               <th><input type="text" name="bo_ccode"></th>
            </tr>
            <tr>    
               <th>사업단위</th>
               <th><select name="bo_unit" style="width:180px;">
                   <option value="본사">본사</option>
                   <option value="지사">지사</option></select></th>
               <th>담당자</th>
               <th><input type="text" name="bo_manager"></th>             
               <th>부서</th>
               <th><input type="text" name="bo_dept"></th>
            </tr>
         </thead>
      </table>
      </div> 
            <div style="background-color:#ECEBEA;">
            <table id="item" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1"
              style="margin-left:80px; , border-color:gray;">
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
                  <th><input type="radio" id="allCheck"></th>    
                  <th>수주번호</th>              
                  <th>프로젝트명</th>
                  <th>프로젝트기간 시작</th>
                  <th>프로젝트기간 끝</th>
                  <th>수량</th>
                  <th>판매금액</th>
                  <th>수주예산</th>
               </tr>
                </thead>
                <tbody id="tBody">
                    <tr>
                        <td><input type="radio" name="each_check" class="each"></td> 
                        <td><input type="text" name="bo_num" placeholder="자동생성" readonly></td>
                        <td><input type="text" name="bo_pronum" id="add"  required></td>
                        <td><input type="date" name="bo_orderdate" min="2000-01-01" max="2030-12-31" style="width:180px;"></td>
                        <td><input type="date" name="bo_duedate" min="2000-01-01" max="2030-12-31" style="width:180px;"></td>
                        <td><input type="number" name="bo_proquantity"  required></td>
                        <td><input type="number" name="bo_prosalesamount"  required></td>
                        <td><input type="number" name="bo_orderbudget" required></td>
                    </tr>
                </tbody>
            </table>
            </div>
            <br>
            <div>
                 <button type="button" class="addList" value="추가">추가</button>
               <!-- <button type="button" id="change" value="변경" >변경</button> -->
                 <button type="button" id="deleteCheck" value="삭제">삭제</button>
               <button type="button" id="subb" value="저장">저장</button> 
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
        $('#orderitemfrm').click(function(){
           var str="";
           
           $.ajax({
              url:'/erp/rest/sales/orderitem',
              type: 'get',
              dataType: "json",
              success:function(data){
                 console.log(data);
                 
                 for(var i in data.sList){
                    str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bo_num+"></td>";
                    str+="<td><input type='text' value="+data.sList[i].bo_num+"></td>";
                    str+="<td><input type='text' value="+data.sList[i].bo_pronum+"></td>";
                    str+="<td><input type='text' value="+data.sList[i].bo_orderdate+"></td>";
                    str+="<td><input type='text' value="+data.sList[i].bo_duedate+"></td>";
                    str+="<td><input type='number' value="+data.sList[i].bo_proquantity+"></td>";
                    str+="<td><input type='number' value="+data.sList[i].bo_prosalesamount+"></td>";
                    str+="<td><input type='number' value="+data.sList[i].bo_orderbudget+"></td>";
                 }
                    $('#tBody').html(str);
              },
              error:function(error){
                 console.log(error);
              }
           })
        });
        
        
        //추가삭제
        
      $(document).ready(function(){
            $('.addList').click(function(){
               $('#tBody').append('<tr><td><input type="radio" name="each_check" class="each"></td><td><input type="text" name="bo_pronum" class="input-text"></td><td><input type="text" name="bo_orderdate" class="input-text" ></td><td><input type="text" name="bo_duedate" class="input-text" ></td><td><input type="number" name="bo_proquantity" class="input-text"></td><td><input type="number" name="bo_prosalesamount" class="input-text" ></td><td><input type="number" name="bo_orderbudget" class="input-text" ></td><td><input type="button" value="삭제" id="deleteCheck" onclick="javascript:thisRowDel(this);"></td></tr>');
            });                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        }); 
         function thisRowDel(row){
              console.log(row);
              let tr = row.parentNode.parentNode;
              tr.parentNode.removeChild(tr);
       } 
         
        $('#subb').click(function(){
           var obj= $('#orderregistrationinput').serialize();

           $.ajax({
                 type : 'post',
                 url : '/erp/rest/sales/orderregistrationinput',
                 data:obj,
                 success : function(data) {
                    console.log(data);
                    alert("수주등록이 완료되었습니다.");
                 },
                 error : function(error) {
                    console.log(error);
                    alert("수주등록에 실패하였습니다.");
                 }
              });
           $('input').val("");
           });   
   
         $('#searchh').click(function(){
            var choice=$('#choice').val();
           var search=$('#search').val();
           console.log(choice);
           console.log(search);
           $.ajax({
                 type : 'post',
                 url : '/erp/rest/sales/orderregistrationsearch',
                 data: "choice="+choice+"&search="+search,
                 dataType: "json",
                 success : function(data) {                   
                    console.log(data);
                    
                    var str="";
                     if(data.sList!=""){
                    for(var i in data.sList){
                        str+="<tr class='tr'><td><input type='radio' name='each_check' value="+data.sList[i].bo_num+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_num+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_pronum+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_orderdate+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_duedate+"></td>";
                        str+="<td><input type='number' value="+data.sList[i].bo_proquantity+"></td>";
                        str+="<td><input type='number' value="+data.sList[i].bo_prosalesamount+"></td>";
                        str+="<td><input type='number' value="+data.sList[i].bo_orderbudget+"></td>";
                       }
                        $('#tBody').html(str);
                     }else{
                        alert("데이터가 없습니다.");
                     }   
                 },
                 error : function(error) {
                    console.log(error);
                 }
              });
           });

        
         $('#deleteCheck').click(function(){
           var check="";
           $("input[name=each_check]:checked").each(function(){
              check = $(this).attr("value");
              console.log(check);
           });
           
           $.ajax({
                 type : 'post',
                 url : '/erp/rest/sales/orderregistrationdelete',
                 data: {check:check},
                 dataType: "json",
                 success : function(data) {                   
                    console.log(data);
                    var str="";
                    if(data.sList[0].bo_num==check){
                       alert("출하 등록된 자료입니다.");
                    }else{
                       
                    for(var i in data.sList){
                        str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bo_num+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_num+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_pronum+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_orderdate+"></td>";
                        str+="<td><input type='text' value="+data.sList[i].bo_duedate+"></td>";
                        str+="<td><input type='number' value="+data.sList[i].bo_proquantity+"></td>";
                        str+="<td><input type='number' value="+data.sList[i].bo_prosalesamount+"></td>";
                        str+="<td><input type='number' value="+data.sList[i].bo_orderbudget+"></td>";
                     }
                        $('#tBody').html(str);
                    }
                 },
                 error : function(error) {
                    console.log(error);
                 }
              });
           });    
</script>
</body>
</html>