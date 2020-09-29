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
        <button type="button" id="businessitemfrm">영업 실적조회</button>${msg}
        <button type="button" id="print" onclick="window.print()">영업실적 인쇄</button>
        <br>
        <br>
        <div style="width:auto; background-color:#FFB2D9;  color:white; padding:1%;">영업활동</div>
         <select id="choice" style="width:180px;">
                      <option value="ba_ocode">영업코드</option>
                      <option value="ba_hrcode">사원코드</option></select>
          <input type="text" name="search" id="search">    
          <button type="button" id="searchh" value="검색">검색</button>   
        <form id="businessactivitiesinput">
        <div border="1" style="height:80px; padding-top:25px; background-color:#F8F7F7;">
        <table style="margin-left:180px;">
         <thead>
            <tr>
               <th>영업코드</th>
               <th><input type="text" name="ba_ocode" placeholder="자동생성" readonly></th>
               <th>회사코드</th>
               <th><input type="text" name="ba_ccode"></th>
               <th>거래처회사코드</th>
               <th><input type="text" name="ba_clcode"></th>
               <th>사원코드</th>
               <th><input type="text" name="ba_hrcode"></th>
            </tr>
            <tr>
               <th>사업단위</th>
               <th><input type="text" name="ba_unit"></th>
               <th>영업기간 시작</th>
               <th><input type="date" name="ba_startperiod" min="2000-01-01" max="2030-12-31" style="width:140px;"></th>
               <th>영업기간 끝</th>
               <th><input type="date" name="ba_endperiod" min="2000-01-01" max="2030-12-31" style="width:140px;"></th>
            </tr>
         </thead>
      </table>
      </div> 
            <div style="background-color:#ECEBEA;">
            <table id="item" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1"
              style="margin-left:140px;">
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
                        <th>날짜</th>
                        <th>내용</th>
                  <th>예상매출금액</th>
                  <th>실제매출금액</th>
                  <th>종료일자</th>
                  <th>메모</th>
                  </tr>
                </thead>
                <tbody id="tBody">
                    <tr>
                        <td><input type="radio" class="each"></td>          
                        <td><input type="date" name="ba_date" id="add"></td>
                        <td><input type="text" name="ba_content"  required></td>
                        <td><input type="number" name="ba_estimatedsalesamount" required></td>
                        <td><input type="number" name="ba_actualsalesamount"></td>                
                        <td><input type="text" name="ba_enddate" required></td>
                        <td><input type="text" name="ba_memo" required></td>    
                    </tr>
                </tbody>
            </table>
            </div>  
        </form>
        <br>
        <br>
            <button type="button" id="addList" value="추가">추가</button>
            <button type="button" id="deleteCheck" value="삭제">삭제</button>
            <button type="button" id="sub" value="저장">저장</button>
      </div>
     <br>
    <br>
    <br>

    
    <script type="text/javascript">        
        //추가삭제
        $(document).ready(function(){
              $('.addList').click(function(){
                 $('#tBody').append('<tr><td><input type="radio" name="each_check" class="each"></td><td><input type="text" name="ba_date" class="input-text"></td><td><input type="text" name="ba_content" class="input-text" ></td><td><input type="number" name="ba_estimatedsalesamount" class="input-text" ></td><td><input type="number" name="ba_actualsalesamount" class="input-text" ></td><td><input type="text" name="ba_enddate" class="input-text" ></td><td><input type="text" name="ba_memo" class="input-text" ></td><td><input type="button" value="삭제" id="deleteCheck" onclick="javascript:thisRowDel(this);"></td></tr>');
              });                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
          }); 
           function thisRowDel(row){
                console.log(row);
                let tr = row.parentNode.parentNode;
                tr.parentNode.removeChild(tr);
         }   
        
        
      $('#businessitemfrm').click(function(){
           var str="";
           
           $.ajax({
              url:'/erp/rest/sales/businessitem',
              type: 'get',
              dataType: "json",
              success:function(data){
                 console.log(data);
                 
                 for(var i in data.bList){
                    str+="<tr><td><input type='radio' name='checknum' value="+data.bList[i].ba_ocode+"></td>";
                    str+="<td><input type='text' value="+data.bList[i].ba_date+"></td>";
                    str+="<td><input type='text' value="+data.bList[i].ba_content+"></td>";
                    str+="<td><input type='text' value="+data.bList[i].ba_estimatedsalesamount+"></td>";
                    str+="<td><input type='text' value="+data.bList[i].ba_actualsalesamount+"></td>";
                    str+="<td><input type='text' value="+data.bList[i].ba_enddate+"></td>";
                    str+="<td><input type='text' value="+data.bList[i].ba_memo+"></td></tr>";

                 }
                    $('#tBody').html(str);
              },
              error:function(error){
                 console.log(error);
              }
           })
        });
        
       $('#sub').click(function(){
           var obj= $('#businessactivitiesinput').serialize();

           $.ajax({
                 type : 'post',
                 url : '/erp/rest/sales/businessactivitiesinput',
                 data:obj,
                 success : function(data) {
                    console.log(data);
                    alert("등록이 완료되었습니다.");
                 },
                 error : function(error) {
                    console.log(error);
                 }
              });
               $('input').val("");
           });           
        
       $('#searchh').click(function(){
         var choice=$('#choice').val();
         var search=$('#search').val();
         
         $.ajax({
            type : 'post',
             url : '/erp/rest/sales/businessactivitiessearch',
             data: "choice="+choice+"&search="+search,
             dataType: "json",
             success : function(data){
                console.log(data);
                
                var str="";
                if(data.bList!=""){
                 for(var i in data.bList){
                  str+="<tr class='tr'><td><input type='radio' name='each_check' value="+data.bList[i].ba_ocode+"></td>";
                str+="<td><input type='text' value="+data.bList[i].ba_date+"></td>";
                str+="<td><input type='text' value="+data.bList[i].ba_content+"></td>";
                str+="<td><input type='text' value="+data.bList[i].ba_estimatedsalesamount+"></td>";
                str+="<td><input type='text' value="+data.bList[i].ba_actualsalesamount+"></td>";
                str+="<td><input type='text' value="+data.bList[i].ba_enddate+"></td>";
                str+="<td><input type='text' value="+data.bList[i].ba_memo+"></td>";
                 }
                   $('#tBody').html(str);
                }else{
                   alert("데이터가 없습니다.");
                }
             },
             error : function(error){
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
                url : '/erp/rest/sales/businessactivitiesdelete',
                data: {check:check},
                dataType: "json",
                success : function(data) {                   
                   console.log(data);
                   var str="";
                   for(var i in data.sList){
                       str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].ba_ocode+"></td>";
                       str+="<td><input type='text' value="+data.sList[i].ba_date+"></td>";
                       str+="<td><input type='text' value="+data.sList[i].ba_content+"></td>";
                       str+="<td><input type='text' value="+data.sList[i].ba_estimatedsalesamount+"></td>";
                       str+="<td><input type='text' value="+data.sList[i].ba_actualsalesamount+"></td>";
                       str+="<td><input type='text' value="+data.sList[i].ba_enddate+"></td>";
                       str+="<td><input type='text' value="+data.sList[i].ba_memo+"></td>";

                    }
                       $('#tBody').html(str);
                },
                error : function(error) {
                   console.log(error);
                }
             });
          }); 

</script>
</body>
</html>