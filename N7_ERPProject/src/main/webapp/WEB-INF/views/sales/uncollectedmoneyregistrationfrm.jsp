<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
#center{
text-align:center;
}
</style>
<body>
    <div id="center">
        <br>
        <button type="button" id="uncollectedmoneyitemfrm" value="미수금품목 현황">미수금품목 현황</button>
        <button type="button" id="uncollectedsearch" value="미수금 조회하기">미수금 조회하기</button>
        <button type="button" id="fullpaymentcheck" value="완납 처리하기">완납 처리하기</button>
        <button type="button" id="fullpaymentsearch" value="완납현황 조회하기">완납현황 조회하기</button>
        <br>
        <br>
        <div style="width:auto; background-color:#FFB2D9; color:white; padding:1%;">미수금 등록</div>
          <select id="choice" style="width:180px;">                    
                      <option value="bu_clcode">거래처회사코드</option>
                      <option value="bu_person">등록자</option>
          </select>
        <input type="text" name="search" id="search">    
        <button id="searchh">검색</button>   
        <form id="uncollectedmoneyinput">
        <div border="1" style="height:60px; padding-top:25px; background-color:#F8F7F7;">
        <table style="margin-left:100px;">
         <thead>
            <tr>
               <th>회사코드</th>
               <th><input type="text" name="bs_ccode"></th>
               <th>거래처회사코드</th>
               <th><input type="text" name="bs_clcode"></th>
               <th>제품코드</th>
               <th><input type="text" name="bs_itcode"></th>
               <th>수주번호</th>
               <th><input type="text" name="bs_bonum"></th>
               <th>등록자</th>
               <th><input type="text" name="bu_person"></th>
            </tr>
         </thead>
      </table>
      </div> 
            <div style="background-color:#ECEBEA;">
            <table id="item" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1"
               style="margin-left:350px;">
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
                        <th>날짜(출하의뢰일)</th>
                        <th>판매단가</th>
                        <th>수량</th>
                        <th>현미수액</th>
               </tr>
                </thead>
                <tbody id="tBody">
                    <tr>
                        <td><input type="radio" class="each_check"></td>          
                        <td><input type="text" name="bs_date" placeholder="자동생성" readonly></td>
                        <td><input type="number" name="bs_unit"  required></td>
                        <td><input type="number" name="bs_quantity"  required></td>
                        <td><input type="number" name="bs_price" required></td>                  
                    </tr>
                </tbody>
            </table>
            </div>  
            <br>  
            <div>
            <button type="button" id="addList" value="추가">추가</button>
            <button type="button" id="sub" value="저장">저장</button>
            </div>
        </form>
       </div> 
    <br>
    <br>

    <script type="text/javascript">    
     $('#uncollectedmoneyitemfrm').click(function(){
       var str="";
       
       $.ajax({
          url:'/erp/rest/sales/uncollectedmoneyitem',
          type: 'get',
          dataType: "json",
          success:function(data){
             console.log(data);
             
             for(var i in data.sList){//개별 등록한 거
                str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bu_person+"></td>";
                 str+="<td><input type='text' value="+data.sList[i].bs_date+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_unit+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_quantity+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_price+"></td>";
             }
              for(var i in data.sList2){ //결재창에서 끌고 온거
                 str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bs_bonum+"></td>";
                 str+="<td><input type='text' value="+data.sList[i].bs_date+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_unit+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_quantity+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_price+"></td>";
              }
               $('#tBody').html(str);
           
          },
          error:function(error){
             console.log(error);
          }
       });
     });
     
     $('#sub').click(function(){
        var obj= $('#uncollectedmoneyinput').serialize();

        $.ajax({
              type : 'post',
              url : '/erp/rest/sales/uncollectedmoneyinput',
              data:obj,
              success : function(data) {
                 console.log(data);
                 alert("미수금 등록이 완료되었습니다.");
              },
              error : function(error) {
                 console.log(error);
                 alert("미수금 등록에 실패하였습니다.");
              }
           });
            $('input').val("");
        }); 
      
     //추가삭제
     $(document).ready(function(){
           $('.addList').click(function(){
              $('#tBody').append('<tr><td><input type="radio" name="each_check" class="each"></td><td><input type="text" name="bs_date" class="input-text"></td><td><input type="number" name="bs_unit" class="input-text" ></td><td><input type="number" name="bs_quantity" class="input-text" ></td><td><input type="number" name="bs_price" class="input-text" ></td><td><input type="button" value="삭제" id="deleteCheck" onclick="javascript:thisRowDel(this);"></td></tr>');
           });                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
       }); 
        function thisRowDel(row){
             console.log(row);
             let tr = row.parentNode.parentNode;
             tr.parentNode.removeChild(tr);
      } 
     
     
      $('#searchh').click(function(){
        var choice=$('#choice').val();
         var search=$('#search').val();
         console.log(choice);
         console.log(search);
         $.ajax({
               type : 'post',
               url : '/erp/rest/sales/uncollectedmoneysearch',
               data: "choice="+choice+"&search="+search,
               dataType: "json",
               success : function(data) {                   
                  console.log(data);
                  
                  var str="";
                   if(data.sList!=""){
                  for(var i in data.sList){
                     str+="<tr class='tr'><td><input type='radio' name='each_check' value="+data.sList[i].bs_clcode+"></td>";
                     str+="<td><input type='text' value="+data.sList[i].bs_date+"></td>";
                     str+="<td><input type='number' value="+data.sList[i].bs_unit+"></td>";
                     str+="<td><input type='number' value="+data.sList[i].bs_quantity+"></td>";
                     str+="<td><input type='number' value="+data.sList[i].bs_price+"></td>";
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
     
    
      //완납 처리 버튼
      $('#fullpaymentcheck').click(function(){

       var check="";
             $("input[name=each_check]:checked").each(function(){
                check = $(this).attr("value");
                if(check==""){
                   alert("완납처리할 버튼을 체크해주세요");
                }else{
                     
          $.ajax({
           url: '/erp/rest/sales/fullpaymentprocess',
           type: 'post',
           data: {check:check},
           dataType: "json",
           success:function(data){
              console.log(data);
              alert("완납처리 되었습니다.");
 
              var str="";
              
              for(var i in data.sList){
                 str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bs_bonum+"></td>";
                 str+="<td><input type='text' value="+data.sList[i].bs_basedate+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_unit+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_quantity+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_price+"></td>";
              }
              
                 $('#tBody').html(str);
                 
           },
           error:function(error){
              console.log(error);
           }
          });
        } 
     }); 
     });
      
     //결재창에서 끌고 온 미수금 조회
     $('#uncollectedsearch').click(function(){
    
       $.ajax({
          url:'/erp/rest/sales/creditsearch',
          type: 'get',
          dataType: "json",
          success:function(data){
             console.log(data);
       
             var str="";
             
             for(var i in data.sList){
                str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bs_bonum+"></td>";
                 str+="<td><input type='text' value="+data.sList[i].bs_basedate+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_unit+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_quantity+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_price+"></td>";
             }
                $('#tBody').html(str);
                
          },
          error:function(error){
             console.log(error);
          }
       });
    }); 
     //완납 현황 조회
     $('#fullpaymentsearch').click(function(){
           
        $.ajax({
           url:'/erp/rest/sales/fullpaymentsearch',
           type: 'get',
           dataType: "json",
           success:function(data){
              console.log(data);
        
              var str="";
              
              for(var i in data.sList){
                 str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bs_credit+"></td>";
                 str+="<td><input type='text' value="+data.sList[i].bs_basedate+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_unit+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_quantity+"></td>";
                 str+="<td><input type='number' value="+data.sList[i].bs_price+"></td>";
              }
                 $('#tBody').html(str);
                 
           },
           error:function(error){
              console.log(error);
           }
        });
     }); 
</script>
</body>
</html>