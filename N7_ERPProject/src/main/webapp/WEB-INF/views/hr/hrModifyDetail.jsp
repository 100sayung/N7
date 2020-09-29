<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<title>Insert title here</title>
<style>
.modifyMode{
	background-color: skyblue;
}
.registMode{
	background-color:red;
}
img{
width: 200px;
height: 200px;
}
span{
	float: left;
}
.info{
	height:60px;
}

.attendance{
	border: 1px solid black;
}
#dataTable{
	border: 1px solid black;
	width: 300px;
}
tr{
	border: 1px solid black;
	border-collapse: collapse;
}
.dataSpan{
	width:250px;
	float:left;
	align-content: center;
	text-align: center;
}
#hrmenu{
	float:none;
	width:800px;
}
#member{
	height:300px;
}


</style>

<meta charset="UTF-8">
</head>
<body>
<h1>인사카드 세부정보 / 수정 / 사용한 월차 null로 뜸. 매달 0으로 초기화되는 기능 알아야함.</h1>
<div id="member"></div>

<br><br><br>


<div id="hrmenu">1</div>

<form id="form" method="post">
<div id="hrDetailInfo">

<table id="hrDetail" border="1" cellspacing="0">
</table>

<div id="addRecord">
</div>
</div>
<input type='hidden' value='' id='current'>
<input type='button' value='추가하기' class = 'infobtn' onclick='addRecord()' id='addRecordBtn'>
<input type='button' value='수정하기'  class = 'infobtn' onclick='changeMode()' id='changeBtn'>
<input type='submit' value='등록하기'  class = 'infobtn' disabled="disabled" id='registBtn'>
</form>


<script>
var num;
var id = location.search.substr(4);
$(document).ready(function(){
	$.ajax({
		url:"/erp/rest/hr/memberfromid",
		data:{m_id:id},
		dataType:"json",
		method:"get",
		contentType : 'application/json',
		success : function(data){
				console.log(data);
				let info = "";
				info += '<div class="dataSpan"><img style="width:200px; height: 250px;" src="/erp/upload/'+data.m_photo+'"></div>';
				info += '<div class="dataSpan"><table id="dataTable"><tr  class="infomenu"><td>이름</td></tr>'
				info += '<tr><td id="m_name">'+data.m_name+'</td></tr>';
				info += '<tr  class="infomenu"><td>생년월일</td></tr>';
				info += '<tr><td id="m_birth">'+data.m_birth+'</td></tr>';
				info += '<tr  class="infomenu"><td>전화번호</td></tr>';
				info += '<tr><td id="m_phonenum">'+data.m_phonenum+'</td></tr>';
				info += '<tr  class="infomenu"><td conlspan="2">주소</td></tr>'
				info += '<tr style="height:80px;"><td id="m_address" colspan="2">'+data.m_address+'</td></tr></table></div>';
				$("#member").html(info);
		},error : function(err){
		}
	});
	$.ajax({
		url:"/erp/rest/hr/hrcodefromid",
		data:{m_id:id},
		dataType:"json",
		method:"get",
		contentType: 'application/json',
		success : function(data){
			let str="";
			str+='<tr><td><a href="javascript:InCompanyInfo()"><button class = "infobtn" >사내정보</button></a></td>';
			if(data){
				str +='<td><a href="javascript:AcademicInfo()"> <button class = "infobtn">학력</button></a></td>';
				str +='<td><a href="javascript:CareerInfo() "> <button class = "infobtn">이력</button> </a></td>';
				str +='<td><a href="javascript:CertificationInfo()"> <button class = "infobtn">자격증</button> </a></td>';
			}
			str+='</tr>';
			$("#hrmenu").html(str);
		}, error : function(err){
			console.log(err);
		}
	});
	console.log("load");
});

/* var str1 = Number(replaceAll($('.checkDate')[0].value,"-",""));
var str2;
if($('.checkDate')[1].value!=''){
str2 = Number(replaceAll($('.checkDate')[1].value,"-",""));
console.log(str1);
if(str1>str2){
   alert("종료일은 시작일보다 이전일 수 없습니다.");
   return;
}
} */


function replaceAll(str, searchStr, replaceStr) {
    return str.split(searchStr).join(replaceStr);
 }
 
function checkDateValue(val1, val2){
	let date1 = Number(replaceAll(val1.value, "-", ""));
	let date2 = Number(replaceAll(val2.value, "-", ""));
	if(date1>date2){
		alert("종료일은 시작일보다 이전일 수 없습니다.");
		val2.value = "";
	}
}

function addRecord(){
	let str ="";
	let cntAc = 0;
	let cntCt = 0;
	var $current = $("#current").val();
	console.log(num);
	if($current == 'Academic'){
		str += "<tr id='test'><td><input type='text' name='hac_school' class='detailInfo'></td>";
		str += "<td><input type='text' name='hac_major' class='detailInfo'></td>";
		str += "<td><input type='date' name='hac_year' class='detailInfo'></td>";
		str += "<td><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
	}else if($current =='Certification'){
		str += "<tr><td><input type='text' name='hct_name' class='detailInfo'></td>";
		str += "<td><input type='text' name='hct_agency' class='detailInfo'></td>";
		str += "<td><input type='date' name='hct_date' class='detailInfo'></td>"
			str += "<td><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
	}else if($current =='Career'){
		str += "<tr><td><input type='text' name='hcr_cname' class='detailInfo'></td>";
		str += "<td><input type='date' name='hcr_startperiod' id='chk"+(num*2)+"' class='detailInfo checkDate'><br>";
		str += "<input type='date' name='hcr_endperiod' id='chk"+((num*2)+1)+"' class='detailInfo checkDate' onchange='checkDateValue(chk"+(num*2)+", chk"+((num*2)+1)+")'></td>"
		str += "<td><input type='text' name='hcr_position' class='detailInfo'></td>";
		str += "<td><textarea rows='3' cols='20' name='hcr_content' class='detailInfo'></textarea></td>"
		str += "<td><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
		num++;
	}
//		$("#hrDetail > tbody:last").append(str);
	$("#infoTable > tbody:last").append(str);
}
function thisRowDel(row){	
	let tr = row.parentNode.parentNode;
	console.log(tr);
	tr.parentNode.removeChild(tr);
	var $current = $("#current").val();
	var num;
	if(tr.className=="origin"){
		if(confirm("정말 삭제하시겠습니까?")){
			if($current=="Academic"){
				num = tr.childNodes[2].children.hac_num.value;
			}else if($current == "Career"){
				num=tr.childNodes[3].children.hcr_num.value;
			}else if($current == "Certification"){
				num=tr.childNodes[2].children.hct_num.value;
			}
			$.ajax({
				url:"/erp/rest/hr/removeinfo",
				data:{num : num, type : $current},
				dataType:"text",
				method:"post",
				success : function(data){
					console.log(data);
				}, error : function(err){
					console.log(err);
				}
			});
		}else{
			alert("취소되었습니다.")
		}
		
	}
}	

function changeMode(){
	console.log($("#changeBtn").attr('class'));
	if($("#changeBtn").attr('class')=="infobtn mf"){
		$(".detailInfo").attr("readonly", true).addClass("modifyMode").removeClass("registMode");
		$("#registBtn").attr("disabled", false);
		for(let i = 0 ; i<$(".origin").length ; i++){
			if($("#origin_"+i)[0].lastChild.className=="removebtn"){
			$("#origin_"+i)[0].lastChild.remove();
			}
		}
	}else{
		$(".detailInfo").removeAttr("readonly").removeClass("modifyMode").addClass("registMode");
		$("#registBtn").attr("disabled", true);
		for(let i = 0 ; i <$(".origin").length ; i++){
			$("#origin_"+i).append("<td class='removebtn'><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td>");
		}
	}
	$("#changeBtn").toggleClass("mf");
	
}

var formURL = "/erp/hr";





function AcademicInfo(){
	$("#form").attr("action", formURL + "/newacademic/" + id);
	$("#current").val("Academic");
	console.log("aca");
	$.ajax({
		url:"/erp/rest/hr/academic",
		dataType:"json",
		data:{m_id : id},
		method:"get",
		contentType: 'application/json',
		success : function(data){
			if(data.length==undefined){
				var arr = [data]
				data = arr;
				}
			let str ="";
			str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
			str += "<td style='width:170px;'>학교/학위</td><td style='width:170px;'>전공</td><td style='width:140px;' colspan='2'>날짜</td></tr>";
			console.log(data);
			for(let i = 0 ; i <data.length ; i++){
			str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hac_school' class='detailInfo' value='"+data[i].hac_school+"' readonly></td>"
			str += "<td><input type='text' name='hac_major' class='detailInfo' value='"+data[i].hac_major+"' readonly></td>";
			str += "<td><input type='date' name='hac_year' class='detailInfo' value='"+data[i].hac_year+"' readonly>";
			str += "<input type='hidden' name='hac_num' value='"+data[i].hac_num+"'></td></tr>";
			}
			str += "</table>";
			$("#hrDetailInfo").html(str);
		},error : function(err){
			/* let str ="";
			str += "<table border='1px solid black'><tr>";
			str += "<td>학교/학위</td><td>전공</td><td>날짜</td></tr>";
			str += "<tr><td><input type='text' name='hac_school' class='detailInfo'></td>"
			str += "<td><input type='text' name='hac_major' class='detailInfo'></td>";
			str += "<td><input type='date' name='hac_year' class='detailInfo'></td></tr>";
			str += "</table>";
			$("#hrDetailInfo").html(str); */
		}
	});
}

function CertificationInfo(){
	$("#form").attr("action", formURL + "/newcertification/" + id);
	$("#current").val("Certification");
	$.ajax({
		url:"/erp/rest/hr/certification",
		dataType:"json",
		method:"get",
		data:{m_id : id},
		success : function(data){
			if(data.length==undefined){
			var arr = [data]
			console.log(arr);
			data = arr;
			}
			let str ="";
			str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
			str += "<td style='width:170px;'>자격증</td><td style='width:170px;'>발급처</td><td style='width:140px;' colspan='2'>발급일</td></tr>";
			for(let i = 0 ; i <data.length ; i++){
			str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hct_name' class='detailInfo' value='"+data[i].hct_name+"' readonly ></td>"
			str += "<td><input type='text' name='hct_agency' class='detailInfo' value='"+data[i].hct_agency+"' readonly ></td>";
			str += "<td><input type='date' name='hct_date' class='detailInfo' value='"+data[i].hct_date+"' readonly></td>";
			str += "<input type='hidden' name='hct_num' value='"+data[i].hct_num+"'></td></tr>";
			}str += "</table>";
			$("#hrDetailInfo").html(str);
		},error : function(err){
			/* let str ="";
			str += "<table border='1px solid black'><tr>";
			str += "<td>자격증</td><td>발급처</td><td>발급일</td></tr>";
			str += "<tr><td><input type='text' name='hct_name' class='detailInfo'></td>"
			str += "<td><input type='text' name='hct_agency' class='detailInfo'></td>";
			str += "<td><input type='date' name='hct_date' class='detailInfo' required pattern='\d{4}-\d{2}-\d{2}'></td></tr>";
			str += "</table>";
			$("#hrDetailInfo").html(str); */
		}
	});
}
function CareerInfo(){
	$("#form").attr("action", formURL + "/newcareer/" + id);
	$("#current").val("Career");
	$.ajax({
		url:"/erp/rest/hr/career",
		dataType:"json",
		method:"get",
		data:{m_id : id},
		success : function(data){
			let str ="";
			str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
			str += "<td style='width:140px;'>회사/프로젝트명</td><td style='width:140px;'>기간</td><td style='width:140px;'>직책</td><td style='width:170px;' colspan='2'>내용</td></tr>";
			for(let i=0; i<data.length ; i++){
			str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hcr_cname' class='detailInfo' value='"+data[i].hcr_cname+"' readonly ></td>"
			str += "<td><input type='date' name='hcr_startperiod' id='chk"+(i*2)+"'class='detailInfo checkDate' value='"+data[i].hcr_startperiod+"' readonly >부터"
			str += "<input type='date' name='hcr_endperiod' id='chk"+((i*2)+1)+"' class='detailInfo checkDate' value='"+data[i].hcr_endperiod+"' readonly onchange='checkDateValue(chk"+(i*2)+", chk"+((i*2)+1)+")'>까지</td>"
			str += "<td><input type='text' name='hcr_position' class='detailInfo' value='"+data[i].hcr_position+"' readonly ></td>";
			str += "<td><textarea rows='3' cols='20' name='hcr_content' class='detailInfo' value='"+data[i].hcr_content+"'></textarea>";
			str += "<input type='hidden' name='hcr_num' value='"+data[i].hcr_num+"'></td></tr>'";
			}
			str+="</table>";
			$("#hrDetailInfo").html(str);
			num=data.length;
		},error : function(err){
			console.log(err);
		}
	});
}function InCompanyInfo(){
	$("#form").attr("action", formURL + "/newhrcard/" +id);
	$("#current").val("HRCard");
	$.ajax({
		url :"/erp/rest/hr/deptlist",
		dataType:"json",
		method :"get",
		success : function(deptList){
			$.ajax({
				url:"/erp/rest/hr/hrcard",
				data:{m_id:id},
				dataType:"json",
				method:"get",
				success : function(data){
					console.log(deptList);
					console.log(data);
					var married ="";
					var status ="";
					var work="";
					if(data.hc_status==1){
						status="근무";
					}else if(data.hc_status==0){
						status="퇴근"
					}else{
						status="휴가";
					}
					if(data.hc_work==1){
						work="재직";
					}else if(data.hc_work==2){
						work="휴직";
					}else{
						work="퇴사";
					}
					let str ="";
					str += "<table border='1px solid black'><tr>";
					str += "<td>사원코드</td><td>부서</td><td>직책</td></tr>";
					str += "<tr><td><input type='text' name='hc_code' value='"+data.hc_hrcode+"' readonly></td>"
					str += "<td><select name='hc_dept' class='detailInfo' onchange='changeDept(this)'>"
					for(let i = 0 ; i<deptList.deptList.length ; i++){
						if(data.hc_dept===deptList.deptList[i]){
							str += "<option value='"+deptList.deptList[i]+"' selected='selected'>"+deptList.deptList[i]+"</option>";
						}else{
						str += "<option value='"+deptList.deptList[i]+"'>"+deptList.deptList[i]+"</option>";
						}
					}
					str += "</select></td><td><span id='position'></td></tr>";
					str += "<tr><td colspan='3'>입사일</td></tr>";
					str += "<td colspan='3'><input type='date' name='hc_joindate' value='"+data.hc_joindate+"' class='detailInfo' readonly></td>"
					str += "<tr><td>현재 상태</td><td>재/휴직 상태</td><td>사용한 월차</td></tr>";
					str += "<td><input type='text' value='"+status+"' readonly></td>"
					str += "<td><input type='text' value='"+work+"'readonly></td>"
					str += "<td><input type='text' value='"+data.hc_numholi+"' readonly></td></tr></table>";
					console.log(data.hc_joindate);
					$("#hrDetailInfo").html(str);
				},error : function(err){
					console.log(deptList);
					console.log(err);
					let str ="";
					str += "<table border='1px solid black'><tr>";
					str += "<td>사원코드</td><td>부서</td><td>직책</td></tr>";
					str += "<tr><td><input type='text' name='hc_code' placeholder='---' readonly></td>"
					str += "<td><select name='hc_dept' class='detailInfo' onchange='changeDept(this)'>"
						for(let i = 0 ; i<deptList.deptList.length ; i++){
							str += "<option>"+deptList.deptList[i]+"</option>";
						}
					str += "</select></td><td><span id='position'></td></tr>";
					str += "<tr><td colspan='3'>입사일</td></tr>";
					str += "<td colspan='3'><input type='date' name='hc_joindate' class='detailInfo' required></td></tr>"
					str += "<tr><td>현재 상태</td><td>재/휴직 상태</td><td>사용한 월차</td></tr>";
					str += "<td><input type='text' placeholder='---' readonly></td>"
					str += "<td><input type='text' placeholder='---' readonly></td>"
					str += "<td><input type='text' placeholder='---' readonly></td></tr></table>";
					$("#hrDetailInfo").html(str);
				} 
			}); 
		},error : function(err){
			console.log(err);
		}
	});
}

function changeDept(id){

	console.log(id.value)
	$.ajax({
		url:"/erp/rest/hr/positionfromdept",
		method : "get",
		dataType : "json",
		data : {"dept" : id.value},
		success : function(data){
			console.log(data);
			let str = "";
			str += "<select name='hc_position' class='detailInfo'>";
			for(let i = 0 ; i<data.length ; i++){
				str += "<option value='"+data[i]+"'>"+data[i]+"</option>";
			}
			$("#position").html(str);
		}, error : function(err){
			console.log(err);
		}
	});
	
/*	for(let i = 0 ; i<deptList.positionList.length ; i++){
		if(data.hc_position===deptList.positionList[i]){
			str += "<option value='"+deptList.positionList[i]+"' selected='selected'>"+deptList.positionList[i]+"</option>";
		}else{
		str += "<option value='"+deptList.positionList[i]+"'>"+deptList.positionList[i]+"</option>";
		}
	} */
}
</script>
</body>
</html>
