<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" type="text/css"></link>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	

<style>
/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/

.border-md {
    border-width: 2px;
}

.btn-facebook {
    background: #405D9D;
    border: none;
}

.btn-facebook:hover, .btn-facebook:focus {
    background: #314879;
}

.btn-twitter {
    background: #42AEEC;
    border: none;
}

.btn-twitter:hover, .btn-twitter:focus {
    background: #1799e4;
}



/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/

body {
    min-height: 100vh;
    height: 800px;
}

.form-control:not(select) {
    padding: 1.5rem 0.5rem;
}

select.form-control {
    height: 52px;
    padding-left: 0.5rem;
}

.form-control::placeholder {
    color: #ccc;
    font-weight: bold;
    font-size: 0.9rem;
}
.form-control:focus {
    box-shadow: none;
}


/* #joinContainer {
	margin-top: 50px;
	width: 340px;
	margin-left: 600px;
	margin-bottom: 100px;
}

select {
	width: 300px;
	height: 35px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
} */

button {
	margin-top: 10px;
/* 	margin-left: 90px; */
	width: 100px;
	height: 50px;
	border: 0px;
	background-color: #FFB2D9;
	color: white;
	font-weight: bolder;
	border-radius: 8%;
}


</style>
</head>

<body>
<!-- Navbar-->
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-light py-3">
        <div class="container" style="padding-top:30px;">
<!--      Navbar Brand
            <a href="#" class="navbar-brand">
                <img src="https://res.cloudinary.com/mhmd/image/upload/v1571398888/Group_1514_tjekh3_zkts1c.svg" alt="logo" width="150">
            </a> -->
			<h3><a href="/erp/" style="color: black;  text-decoration: none;">N7 ERP SYSTEM</a></h3>
		</div>
        </div>
    </nav>
</header>


<div class="container">
    <div class="row py-5 mt-4 align-items-center" style="height:300px;">
        <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
            <img src="https://res.cloudinary.com/mhmd/image/upload/v1569543678/form_d9sh6m.svg" alt="" class="img-fluid mb-3 d-none d-md-block">
            <h1>Create an Account</h1>
            <p class="font-italic text-muted mb-0">Create a minimal registeration page using Bootstrap 4 HTML form elements.</p>
            <p class="font-italic text-muted">Snippet By <a href="https://bootstrapious.com" class="text-muted">
                <u>Bootstrapious</u></a>
            </p>
        </div>

        <!-- Registeration Form -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <form action="join" method="post" enctype="multipart/form-data" onsubmit="return sum();">
                <div class="row">

                    <!-- id -->
                    <div class="input-group col-lg-10 mb-4">
                        <div class="input-group-prepend">
                         <p class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user text-muted"></i>
                         </p>
                        </div>
                    <div><input id="id" type="text" name="m_id" placeholder="ID를 입력해주세요" class="form-control bg-white border-left-0 border-md" style="width:300px;" required></div> <!-- oninput="dupleID()" -->
                          &nbsp;&nbsp;<input type="button" value="중복체크" onclick="dupleID()">
                        <br><div id="dupleID"></div>
                    </div>

                    <!-- passward -->
                    <div class="input-group col-lg-10 mb-4">
                        <div class="input-group-prepend">
                             <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user text-muted"></i>
                            </span>
                        </div>
                    <input type="password" style="width:300px;" class="form-control bg-white border-left-0 border-md" placeholder="password를 입력해주세요" required id="pw" name="m_pw" required/>
                    </div>

                    <!-- name -->
                    <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-envelope text-muted"></i>
                            </span>
                        </div>
                        <input id="name" style="width:200px;" type="text" name="m_name" placeholder="이름을 입력해주세요" class="form-control bg-white border-left-0 border-md" required>
                    </div>

                    <!-- companycode -->
                    <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-phone-square text-muted"></i>
                            </span>
                        </div>                         


                     <!-- <font style="color:gray;">회사코드가 없으신분은</font><font style="font-weight : bold;">N7</font><font style="color:gray;">을 입력해주세요.</font><br/> -->
                          <br>
                          <br>
                    <div><input id="cCode" type="text" style="width:300px;" name="m_ccode" placeholder="회사코드가 없으신분은 N7을 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" required></div>
                        &nbsp;&nbsp;<input type="button" value="코드확인" onclick="dupleCCode()">
                        <br><span id="dupleCCode"></span>
                    </div>


                    <!--email-->
                    <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </span>
                        </div>
                      <input type="email" style="width:300px;" name="m_email" placeholder="이메일을 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" required>
                    </div>

                    <!-- 주소 -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <p class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </p>

                        </div> 
					    <input type="text" style="width:300px;" id="addr1" name="addr1" class="form-control postcodify_address bg-white border-md border-left-0 pl-3" value="" / required><br>
                        &nbsp;&nbsp;<button type="button" id="postcodify_search_button" style="width: 100px; height: 40px; background-color:#3D6B9B; ">주소검색</button>
                   </div>
                    
                     <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <p class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </p>
                        </div> 

					    <input id="addr2" type="text" name="addr2" class="form-control postcodify_details bg-white border-md border-left-0 pl-3" value="" /><br>
					    <input type="text" name="addr3" id="addr3" class="form-control postcodify_extra_info bg-white border-md border-left-0 pl-3" value="" / required>
                    </div>


                    <!-- 주민번호 -->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-black-tie text-muted"></i>
                            </span>
                        </div> 
                        <input type="text" name="m_birth" placeholder="주민번호 앞 6자리를 입력해주세요" maxlength="6" class="form-control bg-white border-md border-left-0 pl-3" required>
                    </div>

                    <!-- phone-->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </span>
                        </div> 
                      <input type="text" name="m_phonenum" placeholder="핸드폰 번호를 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" required>
                    </div>

                   <!--file-->
                    <div class="input-group col-lg-6 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </span>
                        </div>
                      <input type="file" name="m_photo" class="form-control bg-white border-md border-left-0 pl-3" required>
                    </div>


                    <!-- join -->
                    <div class="form-group col-lg-12 mx-auto mb-0">
                        <input type="hidden" name="m_address" id="addr"></input>
<!--                          <a href="#" class="btn btn-primary btn-block py-2">
                            <span class="font-weight-bold">Create your account</span>
                        </a> -->
                        <button class="btn btn-primary btn-block py-2" type="submit">Create your account</button>
                    </div>

                   <!--  Divider Text -->
                    <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                        <div class="border-bottom w-100 ml-5"></div>
                        <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                        <div class="border-bottom w-100 mr-5"></div>
                    </div>

                    <!-- Already Registered -->
                    <div class="text-center w-100">
                        <p class="text-muted font-weight-bold">Already Registered? <a href="/erp/login" class="text-primary ml-2">Login</a></p>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


	<script>
	// For Demo Purpose [Changing input group text on focus]
	$(function () {
	    $('input, select').on('focus', function () {
	        $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
	    });
	    $('input, select').on('blur', function () {
	        $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
	    });
	});


		var checkid;
		var checkccode

		function dupleID() {
			var $id = $("#id").val()
			if ($id == null || $id == '') {
				$("#dupleID").html(
						"<font style='color:red;'>ID를 입력해주세요.</font>");
			} else {

				console.log($id)
				$
						.ajax({
							url : "/erp/rest/home/dupleid",
							data : {
								m_id : $id
							},
							dataType : "text",
							method : "get",
							async : false,
							success : function(data) {
								console.log(data)
								if (data == 1) {
									checkid = false;
									$("#dupleID")
											.html(
													"<font style='color:red;'>아이디가 중복됩니다.</font>");
								} else {
									checkid = true;
									$("#dupleID").html("<font style='color:blue;'>가능한 아이디입니다.</font>");
								}
							},
							error : function(err) {
								console.log(err);
							}
						});
			}
		}

		function dupleCCode() {
			var $cCode = $("#cCode").val();
			console.log($cCode);
			$
					.ajax({
						url : "/erp/rest/home/dupleccode",
						data : {
							m_ccode : $cCode
						},
						dataType : "text",
						method : "get",
						async : false,
						success : function(data) {
							console.log(data)
							if (data == 1) {
								checkccode = true;
								$("#dupleCCode").html("<font style='color:blue;'>해당 회사코드가 존재합니다.</font>");
							} else {
								checkccode = false;
								$("#dupleCCode")
										.html(
												"<font style='color:red;'>해당 회사코드가 존재하지 않습니다.</font>");
							}
						},
						error : function(err) {
							console.log(err);
						}
					})
		}

		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});

		function sum() {
			console.log(checkid, checkccode);
			if (checkid && checkccode) {
				$("#addr").val(
						$('#addr1').val() + $('#addr2').val()
								+ $('#addr3').val());
				return true;
			} else {
				alert("회사코드 혹은 아이디 중복을 확인해주세요.");
				return false;
			}
		}
	</script>
</body>
</html>
