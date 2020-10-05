<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주번호 사용</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="js/jquery.serializeObject.js"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- BOOTSTRAP STYLES-->
    <link href="/erp/assets/css/bootstrap.css" rel="stylesheet">
     <!-- FONTAWESOME STYLES-->
    <link href="/erp/assets/css/font-awesome.css" rel="stylesheet">
        <!-- CUSTOM STYLES-->
    <link href="/erp/assets/css/custom.css" rel="stylesheet">
     <!-- GOOGLE FONTS-->
   <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="/erp/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="/erp/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="/erp/assets/js/custom.js"></script>
</head>
<body>
<div id="mainhead" class="main">
      <br>
      <!-- <form id="code"> -->
               <input type="text" id="code">
               <button type="button" id="codesearch">코드검색</button>
                       <!-- </form> -->
                       <!-- <button type="button" id="trens">사용안함</button> -->
                     <button type="button" id="Alllist">리스트출력</button>
				        활성<input type="radio" name="use" value="1"> 
				        비활성<input type="radio" name="use" value="0"> 
	                    <!-- <button type="button" id="trens">사용안함</button> -->
      
         <table id="Info" class="table">
            <tbody id="Tbody">
               
            </tbody>
         </table>
   </div>
</body>
<script>
      var use = "1";
$(document).ready(function(){
             
         $.ajax({
            url : '/erp/rest/sales/serchcomlist',
            type : 'post',
            data : {use:use},
            dataType : 'json',
            success : function(data) {
               console.log(data);
               var List="";
                  List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
                   for ( var i in data.sList) {
                      List+="<tr class='success'>";
                      List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.sList[i].bs_bonum+" hidden='true'>";
                      List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
                      List+="<td class='allinfo'><button onclick='useCom("+data.sList[i].bs_bonum+")'>사용</button></td>";
                      List+="</tr>";
                   }
                    $("#Tbody").html(List);
            },
            error : function(error) {
               console.log(error);
            }
         });

      });
      
      function useCom(code){
   
         $.ajax({
            url : '/erp/rest/sales/searchcode',
            type : 'post',
            data : {code:code,use:use},
            dataType : 'json',
            success : function(data) {
               console.log(data);
               opener.setChildValue(data);
               window.close();
            },
            error:function(error){
               console.log(error);
            }
            
         });
      }
      $("#codesearch").click(function(){
         var code = $("#code").val();
         $.ajax({
            url : '/erp/rest/sales/searchcode',
            type : 'post',
            data : {code:code,use:use},
            dataType : 'json',
            success : function(data) {
               console.log(data);
               var List="";
               List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
                for ( var i in data.sList) {
                   List+="<tr class='success'>";
                   List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.aList[i].bs_bonum+" hidden='true'>";
                   List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
                   List+="<td class='allinfo'><button onclick='useCom("+data.sList[i].bs_bonum+")'>사용</button></td>";
                   List+="</tr>";
                }
                 $("#Tbody").html(List);
            },
            error:function(error){
               console.log(error);
            }
            
         });
      });
      
      
      $("#Alllist").click(function(){
   	   var use = "";
   	$("input[name='use']:checked").each(function() {
   	    use=($(this).attr('value'));
   	    
   	   });
   	       
   	       console.log(use);
   	       if(use==null){
   	          alert("사용여부를 체크해주세요");
   	       }else{
   	          
   	      $.ajax({
   	         url : '/erp/rest/sales/serchcomlist',
   	         type : 'post',
   	         data : {use:use},
   	         dataType : 'json',
   	         success : function(data) {
   	            console.log(data);
   	            var List="";
   	            if(use==1){
   	               List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
   	                for ( var i in data.sList) {
   	                   List+="<tr class='success'>";
   	                   List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
   	                   List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.sList[i].bs_bonum+")'>비활성화</button></td>"; 
   	                   List+="</tr>";
   	                }
   	               
   	            }else{
   	               
   	               List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
   	                for ( var i in data.aList) {
   	                   List+="<tr class='success'>";
   	                   List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.sList[i].bs_bonum+" hidden='true'>";
   	                   List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
   	                   List+="<td class='allinfo'><button onclick='trensCom("+1+","+data.sList[i].bs_bonum+")'>활성화</button></td>";
   	                   List+="</tr>";
   	                }
   	            }
   	                 $("#Tbody").html(List);
   	                 $("input").html("");
   	         },
   	         error : function(error) {
   	            console.log(error);
   	         }
   	      });
   	       }

   	   });

   	   $("#codesearch").click(function() {
   	       var use = "";
   	       $("input[name='use']:checked").each(function() {
   	           use=($(this).attr('value'));
   	           
   	          });
   	              
   	              console.log(use);
   	              
   	      var code = $("#code").val();
   	      console.log(code);
   	       if(use==null){
   	          alert("사용여부를 체크해주세요");
   	       }else{
   	                  $.ajax({
   	                           url : '/erp/rest/sales/searchcode',
   	                           type : 'post',
   	                           data : {code:code,use:use},
   	                           dataType : 'json',
   	                           success : function(data) {
   	                           
   	                              console.log(data);
   	                              var List="";
   	                              if(use==1){
   	                                 List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
   	                                  for ( var i in data.sList) {
   	                                     List+="<tr class='success'>";
   	                                     List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.sList[i].bs_bonum+" hidden='true'>";
   	                                     List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
   	                                     List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.sList[i].bs_bonum+")'>비활성화</button></td>";
   	                                     List+="</tr>";
   	                                  }
   	                                 
   	                              }else{
   	                                 
   	                                 List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
   	                                  for ( var i in data.sList) {
   	                                     List+="<tr class='success'>";
   	                                     List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.sList[i].bs_bonum+" hidden='true'>";
   	                                     List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
   	                                     List+="<td class='allinfo'><button onclick='trensCom("+1+","+data.sList[i].bs_bonum+")'>활성화</button></td>";
   	                                     List+="</tr>";
   	                                  }
   	                              }
   	                                   $("#Tbody").html(List);
   	                            },
   	                           error : function(error) {
   	                              console.log(error);
   	                           }
   	                        });
   	       }
   	               });  
   	   
   	   $("#insertcomlist").click(function() {
   	                  var obj = $("#comInfo").serialize();
   	                  $.ajax({
   	                           url : '/erp/rest/sales/insertcomlist',
   	                           type : 'post',
   	                           data : obj,
   	                           dataType : 'json',
   	                           success : function(data) {
   	                              console.log(data);
   	                              var List="";
   	                              List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
   	                               for ( var i in data.aList) {
   	                                  List+="<tr class='success'>";
   	                                  List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.sList[i].bs_bonum+" hidden='true'>";
   	                                  List+="<td class='allinfo'>" + data.aList[i].bs_bonum + "</td>";
   	                                  List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.sList[i].bs_bonum+")'>비활성화</button></td>";
   	                                  List+="</tr>";
   	                               }
   	                                   $("#Tbody").html(List);
   	                                   $("input").val("");
   	                                   $("textarea").val("");
   	                           },
   	                           error : function(error) {
   	                              console.log(error);
   	                           }
   	                        });
   	               });
   	   
   	   function trensCom(use,code){
   	      
   	      console.log(code);
   	      
   	              $.ajax({
   	                 url:'/erp/rest/sales/trensCom',
   	                 type:'post',
   	                 traditional : true,
   	                 data:'CODE='+code+'&USE='+use,
   	                 datatype:'json',
   	                 success:function(data){
   	                    console.log(data);
   	                    var size=data.aList.length;
   	                    console.log(size);
   	                    var List="";
   	                    if(size>=1 && data.aList[0].cl_status=='0'){
   	                       
   	                   List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
   	                   for ( var i in data.sList) {
   	                      List+="<tr class='success'>";
   	                      List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.sList[i].bs_bonum+" hidden='true'>";
   	                      List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
   	                      List+="<td class='allinfo'><button onclick='trensCom("+1+","+data.sList[i].bs_bonum+")'>활성화</button></td>";
   	                      List+="</tr>";
   	                   }
   	                    }else{
   	                       
   	                   List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>사용여부</th></tr>";
   	                   for ( var i in data.sList) {
   	                      List+="<tr class='success'>";
   	                      List+="<input id="+data.sList[i].bs_bonum+" type='text' name='reportChkBxRow' value="+data.sList[i].bs_bonum+" hidden='true'>";
   	                      List+="<td class='allinfo'>" + data.sList[i].bs_bonum + "</td>";
   	                      List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.sList[i].bs_bonum+")'>비활성화</button></td>";
   	                      List+="</tr>";
   	                   }
   	                    }
   	                        $("#Tbody").html(List);
   	                       
   	                 },
   	                 error:function(error){
   	                    console.log(error);
   	                 }
   	                 
   	              });
   	           
   	   };
</script>
</html>