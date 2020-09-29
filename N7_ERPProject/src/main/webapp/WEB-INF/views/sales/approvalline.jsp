<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>결재라인</title>
<style>
div {
   border: 1px gray dotted;
   text-align: center;
}

table {
   width: 100%;
}

tr, td {
   border: 1px gray dotted;
   width: auto%;
}

#main1 {
   width: 28%;
   height: 500px;
   float: left;
   overflow: auto;
}

#main2 {
   width: 40%;
   height: 500px;
   float: left;
   overflow: auto;
}

#main3 {
   width: 5%;
   height: 500px;
   float: left;
   overflow: auto;
}
#main4 {
   width: 20%;
   height: 500px;
   float: left;
   overflow: auto;
}

.search {
   height: 10px;
   font-size: 15px;
   background-color: #3B77AF;
   color: white;
}

.addtable {
   height: 200px;
   overflow: auto;
}

.but{
margin-top: 110px;
margin-bottom: 10px;
}
.title{
height:10px;
}

</style>
</head>
<body>
   <h1>결재라인 주소록</h1>
   
   
   <div>
      <div id="main1">
         <table>
            <tr class="search">
               <td>주소록</td>
               
            </tr>
            <tr id="Info"></tr>
         </table>
      </div>

      <div id="main2">
         <table>
            <tr class="search">
               <td colspan="5">이름으로 찾기</td>
            </tr>
            <tr>
               <td colspan="4"><input id="name" type="text" name="m_name"></td>
               <td><button id="namesc">검색</button></td>
            </tr>
            <tr>
               <td style="width: 45px;">체크</td>
               <td style="width: 70px;">이름</td>
               <td style="width:112px;">부서</td>
               <td style="width:48px;">직급</td>
               <td style="width:214px;">이메일</td>
            </tr>
            <tbody id="nameInfo">

            </tbody>
         </table>
      </div>
      <div id="main3"><br>
      <button id="addapproval1" class="but">></button><br>
      <button id="deleteCheck1"><</button><br><br><br><br><br>
   <button id="addapproval2" class="but">></button><br>
   <button id="deleteCheck2"><</button><br><br>
   
      </div>
      <div id="main4">
         <h3 class="title">
            결재자<span id="cnt1" style="color:green;">0</span>
         </h3>
         <div class="addtable">
            <table class="table">
            <tr class="search"><td>체크</td><td>이름</td><td>작급</td><td>부서</td></tr>
               <tbody id="addAp1"></tbody>
            </table>
         </div>
         <h3 class="title">
            참조<span id="cnt2" style="color:green;">0</span>
         </h3>
         <div class="addtable">
            <table class="table">
            <tr class="search"><td>체크</td><td>이름</td><td>작급</td><td>부서</td></tr>
               <tbody id="addAp2"></tbody>
            </table>
         </div>
         
      </div>
   </div><br>
   <a  href="javascript:sendChildValue()"><button>결제라인 등록</button></a>
</body>
<script>
function sendChildValue(){
   
   if(count1==0){
      alert("선택한 사람이 없습니다");
   } else{
      
   var code1 = new Array();
   var code2 = new Array();
   for(var i =0; i<count1; i++){
      code1.push($(".addname1"+i).val());
   }
   for(var i =0; i<count2; i++){
      code2.push($(".addname2"+i).val());
   }
   
   $.ajax({
       url:"rest/approLinecom?code1="+code1+"&code2="+code2,
       type:'post',
       datatype:'json',
       success:function(data){
          console.log(data);
          
             opener.setChildValue(data);

             window.close();
       },
       error:function(error){
          console.log(error);
          
       }
      
   });
   
   }  
}




$("#deleteCheck1").click(function() {
   for (var i = 0; i < $(".check1").length; i++) {
      if ($(".check1")[i].checked == true) {
         $(".check1")[i].parentElement.parentElement.remove();
         i--;
         count1--;
         $("#cnt1").html(count1);
      }
   }
});
$("#deleteCheck2").click(function() {
   for (var i = 0; i < $(".check2").length; i++) {
      if ($(".check2")[i].checked == true) {
         $(".check2")[i].parentElement.parentElement.remove();
         i--;
         count2--;
         $("#cnt2").html(count2);
      }
   }
});

   var list = ${aList};
   console.log(list);
   var str = "";
   for (var i = 0; i < list.length; i++) {
      str += "<tr><td><input name='checknum' type='checkbox' value="+list[i].m_code+"></td><td>"
            + list[i].m_name + "(" + list[i].m_email + ")" + "</td></tr>";
   }

   $("#Info").append(str);
     


   $("#namesc").click(function() {
      var str='';
                  var name = $("#name").val();
                  $.ajax({
                     url : 'rest/searchName?name=' + name,
                     type : 'post',
                     datatype : 'json',
                     success : function(data) {
                        console.log(data);
                        
                        for ( var i in data.aList) {
                           str += "<tr><td><input name='checknum' type='checkbox' value='"+data.aList[i].m_code+"'></td>";
                           str += "<td>"+ data.aList[i].m_name+ "</td>";
                           str += "<td>"+ data.aList[i].m_colume+ "</td>";
                           str += "<td>"+ data.aList[i].m_grade+ "</td>";
                           str += "<td>"+ data.aList[i].m_email+ "</td></tr>";
                           }
                              $("#nameInfo").html(str);
                           },
                           error : function(error) {
                              console.log(error);
                           }
                        });
               });
   
       var count1=0;
   $("#addapproval1").click(function(){
      var name =[];
      var cnt = $("input[name='checknum']:checked").length;
      var arr = new Array();
      
      if(cnt == 0){
         alert("선택한 이름이 없습니다");
   }else {
      $("input[name='checknum']:checked").each(function() {
         
         arr.push($(this).attr('value'));
               var code = $(this).attr('value');
             
            $.ajax({
               url : 'rest/addApproval',
               type : 'post',
               traditional : true,
               data : 'ARR=' + arr + '&CNT=' + cnt,
               datatype : 'json',
               success : function(data) {
                  console.log(data);
                  var str="";
                          console.log(code);
                  
                  
                     /* for(var j=0; j<=count; j++){
                        if(code==$(".addname"+j).val()&&count!=0){
                           alert("이미추가되었습니다");
                           
                           }else{ */
                     for(var i in data.aList){
                        str+="<tr><td><input class='check1' type='checkbox'></td>";
                        str+="<td><input class='addname1"+count1+"' type='text' value='"+data.aList[i].m_code+"' hidden='true'>"+data.aList[i].m_name+"</td>";
                        str+="<td>"+data.aList[i].m_grade+"</td>";
                        str+="<td>"+data.aList[i].m_colume+"</td></tr>";
                     $("#addAp1").append(str);
                              
                           }
                        /* } */
                     
                     /* } */
                     for(var k=0; k<=count1; k++){
                        name[k]=$(".addname1"+k).val();
                           
                        }
                     
                     console.log(name);
                     console.log(count1);
                    count1++;
                    $("#cnt1").html(count1);
            },
               error:function(error){
                  console.log(error);
               }   
      
      });
            
      });
   };      
   });
   var count2=0;
   $("#addapproval2").click(function(){
      var name =[];
      var cnt = $("input[name='checknum']:checked").length;
      var arr = new Array();
      
      if(cnt == 0){
         alert("선택한 이름이 없습니다");
   }else {
      $("input[name='checknum']:checked").each(function() {
         arr.push($(this).attr('value'));
               var code = $(this).attr('value');
             
            $.ajax({
               url : 'rest/addApproval',
               type : 'post',
               traditional : true,
               data : 'ARR=' + arr + '&CNT=' + cnt,
               datatype : 'json',
               success : function(data) {
                  console.log(data);
                  var str="";
                          console.log(code);
                  
                  
                     /* for(var j=0; j<=count; j++){
                        if(code==$(".addname"+j).val()&&count!=0){
                           alert("이미추가되었습니다");
                           
                           }else{ */
                     for(var i in data.aList){
                        str+="<tr><td><input class='check2' type='checkbox'></td>";
                        str+="<td><input class='addname2"+count2+"' type='text' value='"+data.aList[i].m_code+"' hidden='true'>"+data.aList[i].m_name+"</td>";
                        str+="<td>"+data.aList[i].m_grade+"</td>";
                        str+="<td>"+data.aList[i].m_colume+"</td></tr>";
                     $("#addAp2").append(str);
                              
                           }
                        /* } */
                     
                     /* } */
                     for(var k=0; k<=count2; k++){
                        name[k]=$(".addname2"+k).val();
                           
                        }
                     
                     console.log(name);
                     console.log(count2);
                    count2++;
                    $("#cnt2").html(count2);
            },
               error:function(error){
                  console.log(error);
               }   
      
      });
            
      });
   };      
   });
   

   
   
</script>
</html>