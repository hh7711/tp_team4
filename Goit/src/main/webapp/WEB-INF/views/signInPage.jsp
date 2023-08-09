<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나도 고양이 있어</title>
	<style type="text/css">
		@font-face {
		    font-family: 'Dovemayo_gothic';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		body,button,input {
			font-family: 'Dovemayo_gothic';
		}
		#main1{
			border: 5px solid lightblue;
			border-radius: 10px;
		}
		.headBtnDiv{
			margin-bottom: 30px; margin-top: 10px;
			margin-left: 20px; margin-right: 20px;
		}
        .headBtn{
        	border: 0.5px;
        	width: 90px;
        	height: 30px;
        	color: rgb(34, 34, 34);
        	border-radius: 5px;
        	font-size: medium;
        	font-weight: bold;
        	margin: 5px;
        }
        .headBtn:hover{
        	background-color: rgb(211, 253, 255);
        	box-shadow: 1px 1px 5px #ccc;
        }
        .headId{
        	font-size: medium;
        	font-weight: bold;
        	margin-top: 8px; margin-left: 5px; margin-right: 5px; margin-bottom: 10px;
        }
        .mainTable{
        	margin-left: auto; margin-right: auto; 
        	margin-top: 40px; margin-bottom: 40px;
        }
        .write{
            border: 0.8px solid gray;
            border-radius: 5px;
            height: 23px;
            font-family: 'Dovemayo_gothic';
            font-size: medium;
			padding-top: 5px; padding-bottom: 5px; padding-left: 10px; padding-right: 10px;
        }
        .write:focus{
            background-color: #E8F5FF;
            color: rgb(75, 75, 75);
            outline: 2px solid gray;
        }
        #signIn{
        	border: none;
        	border-radius: 5px;
            width: 55px;
            height: 30px;
            font-size: medium;
            font-weight: lighter;
            color: rgb(34, 34, 34);
            background-color: rgb(222, 222, 222);
            margin-top: 15px;
        }
        #signIn:hover{
        	 background-color: #ffffff;
        	 box-shadow: 1px 1px 5px #ccc;
        }
	</style>
</head>
<body>
<!-- 상단 -->
	<div>
		<a href="mainPage">
			<img style="height: 300px;" alt="오류" src="resources/main/main15.png" width="100%">
		</a>
	</div>
	<div class="headBtnDiv">
		<button type="button" class="headBtn" style="float: left;" onclick="location.href='boardList'">게시판</button>
		<c:if test="${dto == null}">
			<button type="button" class="headBtn" style="float: right;" onclick="location.href='signUpPage'">회원가입</button>
			&nbsp;<button type="button" class="headBtn" style="float: right;" onclick="location.href='signInPage'">로그인</button>
		</c:if>
		<c:if test="${dto != null}">
			<button type="button" class="headBtn" style="float: right;" onclick="location.href='signOut'">로그아웃</button>&nbsp;
			<button type="button" class="headBtn" style="float: right;" onclick="location.href='myPage'">마이페이지</button>
			<span class="headId" style="float: right;">${dto.id}님</span>
		</c:if>
	</div>
<!-- 상단 -->
	<div id="main1">
		<div id="main2">
			<div><!-- 본문 -->
<!-- 		<form name="formSignIn"> -->
				<table class="mainTable">
					<tr>
						<td>
							<input type="text" name="id" id="id" class="write" placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="pwd" id="pwd" class="write" placeholder="비밀번호">
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<button type="button" id="signIn">로그인</button>
						</td>
					</tr>
				</table>
			</div><!-- 본문 -->
		</div><!-- main1 -->
	</div><!-- main2 -->
<!-- 	</form> -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        $("#signIn").on("click", function () {
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			console.log("id ==> "+id)
			console.log("pwd ==> "+pwd)
            $.ajax({
                url: "signIn",
                type: "post",
                data: {id : id, pwd : pwd},
                dataType: "json",
                success : function(result) {
                    if (result == 2) {
                        alert("로그인 성공!");
                        location.href = "mainPage";
                    }else if (result == 1) {
			        	console.log("? 경고창 왜안떠");
                        alert("아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.");
                        $("#pwd").val("");
        				$("#pwd").focus();
                    }
                },
                error: function(){
                    alert("오류");
                }
            });
        });
    </script>
</body>
</html>