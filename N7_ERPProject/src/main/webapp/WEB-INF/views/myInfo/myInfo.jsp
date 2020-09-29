<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
	media="all" />
<style>
#header {
	width: 100%;
	height: 200px;
}

#side_menu {
	height: 100%;
	width: 250px;
	font-size: 20px;
	font-weight: bolder;
	float: left;
	border-right:1px solid #E6E6E6;
}

#side_menu #menuList {
	list-style: none;
	margin-top: 150px;
}

#side_menu #menuList li {
	margin: 20px;
}

a {
	text-decoration: none;
}

#description {
	float: left;
	height: 100%;
	width: 80%;
}

ul {
	list-style: none;
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
</head>
<body>
	<div id="header">
		<div id="logo">
			<h1>
				<a href="#">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu">
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
			<li><a href="/erp/myinfo/checkattendance">출/퇴근 등록</a></li>
			<li><a href="/erp/myInfo/myInfo">내 정보 보기</li>
			<li><a href="/erp/myinfo/myPaycheck">급여명세서 보기</li>
			<li><a href="/erp/myinfo/myattendance">내 출결 보기</li>
			<li><a href="/erp/myinfo/myholiday">내 휴가 보기</li>
			<li><a href="/erp/myinfo/applyholiday">휴가신청</a></li>
			<li id="showMenu1">나의 결재함</li>
			<ul id="menu2" style="display: none;">
				<li id="apupPayment">내가 올린 결재함</li>
				<li id="apdownPayment">내가 받은 결재함</li>
				<li id="acTemporary">임시저장 결재함</li>
			</ul>
		</ul>
	</div>
<div id="description">
<div id="member"></div>

<br><br><br>

부서/직책 등록시 부서부터 고르게 설정. 그 후 부서가 등록되면 그부서에맞는 직책만 뜨게 설정해야함.



<div id="hrmenu"></div>

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



</div>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
	<script>
		var num;
		$(document).ready(function(){
			$.ajax({
				url:"/erp/rest/myinfo/myinfo",
				dataType:"json",
				method:"get",
				success : function(data){
					console.log(data);
					let info = "";
					info += '<div class="dataSpan"><img style="width:200px; height: 250px;" src="/erp/upload/'+data.photo+'"></div>';
					info += '<div class="dataSpan"><table id="dataTable"><tr  class="infomenu"><td>이름</td></tr>'
					info += '<tr><td id="m_name">'+data.name+'</td></tr>';
					info += '<tr  class="infomenu"><td>생년월일</td></tr>';
					info += '<tr><td id="m_birth">'+data.birth+'</td></tr>';
					info += '<tr  class="infomenu"><td>전화번호</td></tr>';
					info += '<tr><td id="m_phonenum">'+data.phonenum+'</td></tr>';
					info += '<tr  class="infomenu"><td conlspan="2">주소</td></tr>'
					info += '<tr style="height:80px;"><td id="m_address" colspan="2">'+data.address+'</td></tr></table></div>';
					$("#member").html(info);
				}, error : function(err){
					console.log(err);
				}
			});

			$.ajax({
				url:"/erp/rest/myinfo/hrexistfromid",
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

		var formURL = "/erp/myinfo";


		function AcademicInfo(){
			$("#form").attr("action", formURL + "/newacademic");
			$("#current").val("Academic");
			$.ajax({
				url:"/erp/rest/myinfo/academic",
				dataType:"json",
				method:"get",
				contentType: 'application/json',
				success : function(data){
					if(data.length==undefined){
						var arr = [data]
						data = arr;
						}
					let str ="";
					str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
					str += "<td>학교/학위</td><td>전공</td><td>날짜</td></tr>";
					for(let i = 0 ; i <data.length ; i++){
					console.log(data[i].hac_year);
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
			$("#form").attr("action", formURL + "/newcertification");
			$("#current").val("Certification");
			$.ajax({
				url:"/erp/rest/myinfo/certification",
				dataType:"json",
				method:"get",
				success : function(data){
					if(data.length==undefined){
					var arr = [data]
					console.log(arr);
					data = arr;
					}
					let str ="";
					str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
					str += "<td>자격증</td><td>발급처</td><td>발급일</td></tr>";
					for(let i = 0 ; i <data.length ; i++){
					str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hct_name' class='detailInfo' value='"+data[i].hct_name+"' readonly ></td>"
					str += "<td><input type='text' name='hct_agency' class='detailInfo' value='"+data[i].hct_agency+"' readonly ></td>";
					str += "<td><input type='date' name='hct_date' class='detailInfo' value='"+data[i].hct_date+"' readonly>";
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
			$("#form").attr("action", formURL + "/newcareer");
			$("#current").val("Career");
			$.ajax({
				url:"/erp/rest/myinfo/career",
				dataType:"json",
				method:"get",
				success : function(data){
					console.log("안됨?");
					let str ="";
					str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
					str += "<td>회사/프로젝트명</td><td>기간</td><td>직책</td><td colspan='2'>내용</td></tr>";
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
		}
		function InCompanyInfo(){
			$("#form").attr("action", formURL + "/newhrcard");
			$("#current").val("HRCard");
			$.ajax({
				url:"/erp/rest/myinfo/hrcard",
				dataType:"json",
				method:"get",
						success : function(data){
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
							str += "<table border='1px solid black' ><tr class='infomenu'>";
							str += "<td>사원코드</td><td>부서</td><td>직책</td></tr>";
							str += "<tr><td><input type='text' name='hc_code' value='"+data.hc_hrcode+"' readonly></td>";
							str += "<td><input type='text' name='hc_dept' value='"+data.hc_dept+"' readonly></td>";
							str += "<td><input type='text' name='hc_position' value='"+data.hc_position+"' readonly></td>";
							str += "</tr><td colspan='3' class='infomenu'>입사일</td></tr>";
							str += "<td colspan='3'><input type='date' name='hc_joindate' value='"+data.hc_joindate+"' class='detailInfo' readonly></td>"
							str += "<tr class='infomenu'><td>현재 상태</td><td>재/휴직 상태</td><td>사용한 월차</td></tr>";
							str += "<td><input type='text' value='"+status+"' readonly></td>"
							str += "<td><input type='text' value='"+work+"'readonly></td>"
							str += "<td><input type='text' value='"+data.hc_numholi+"' readonly></td></tr></table>";
							$("#hrDetailInfo").html(str);
						},error : function(err){
							console.log(deptList);
							console.log(err);
							let str ="";
							str += "<table border='1px solid black'><tr class='infomenu'>";
							str += "<td>사원코드</td><td>부서</td><td>직책</td></tr>";
							str += "<tr><td><input type='text' name='hc_code' placeholder='---' readonly></td>"
							str += "<td><input type='text' name='hc_dept' value='"+data.hc_dept+"' readonly></td>";
							str += "<td><input type='text' name='hc_position' value='"+data.hc_position+"' readonly></td>";
							str += "</tr><td colspan='3'>입사일</td></tr>";
							str += "<td colspan='3'><input type='date' name='hc_joindate' readonly></td></tr>"
							str += "<tr><td>현재 상태</td><td>재/휴직 상태</td><td>사용한 월차</td></tr>";
							str += "<td><input type='text' placeholder='---' readonly></td>"
							str += "<td><input type='text' placeholder='---' readonly></td>"
							str += "<td><input type='text' placeholder='---' readonly></td></tr></table>";
							$("#hrDetailInfo").html(str);
						}
					});
		}
	</script>
</body>
</html>
