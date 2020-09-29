<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="/erp/css/default.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <style>
        #container {
            width: 700px;
            margin-top: 100px;
        }

        button {
            margin-top: 10px;
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
    <div id="header" class="container">
        <div id="logo">
            <h1><a href="/erp/" style="color: black;">N7 ERP SYSTEM</a></h1>
        </div>
        <div id="menu">
            <ul>
                <li><a href="/erp/" accesskey="4" title="">MAIN</a></li>
                <li><a href="/erp/introducecompany" accesskey="2" title="">회사 소개</a></li>
                <li><a href="/erp/erpboard" accesskey="3" title="">상담 게시판</a></li>
                <li><a href="/erp/login" accesskey="5" title="">LOGIN</a></li>
                <li><a href="/erp/join" accesskey="6" title="">JOIN</a></li>
                <li class="current_page_item"><a href="#">ERP시작</a></li>
            </ul>
        </div>
    </div>
    <center>
        <div id="container">
            <h1>erp 신청</h1>
            <form>
                <table class="table table-condensed">
                    <tr>
                        <td>회사명</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>대표자명</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>구분</td>
                        <td><input type="radio" name="division" value="법인"> 법인 <input type="radio" name="division"
                                value="개인">개인</td>
                    </tr>
                    <tr>
                        <td>필요 기능</td>
                        <td><input type="checkbox" name="require"> 인사 관리
                            <input type="checkbox" name="require"> 영업 관리
                            <input type="checkbox" name="require"> 구매 관리
                            <input type="checkbox" name="require"> 자재 관리
                            <input type="checkbox" name="require"> 회계 관리
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><button style="margin-left: 305px;">신청</button></td>
                    </tr>

                </table>
            </form>
        </div>
    </center>
</body>

</html>