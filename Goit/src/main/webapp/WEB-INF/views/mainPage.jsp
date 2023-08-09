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
		body,button {
			font-family: 'Dovemayo_gothic';
		}
		#main1{
			border: 5px solid lightblue;
			border-radius: 10px;
/* 			margin: 30px; */
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
        }
        .headId{
        	font-size: medium;
        	font-weight: bold;
        	margin-top: 8px; margin-left: 5px; margin-right: 5px; margin-bottom: 10px;
        }
        a{
        	text-decoration: none;
        	color: black;
        }
        a:hover{
        	color: red;
        }
	</style>
</head>
<body>
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
	<div id="main1">
		<div id="main2">
			<div><!-- 본문 -->
<!-- 			<img alt="" src="resources/main.png" width="100%"> -->
				<div style="margin: 50px;">
<!-- 					<img alt="오류" src="resources/main/main1.jpg" width="100%"> -->
					<h2>이곳은 고양이를 자랑 하고 싶은데 자랑할 곳이 없던 분들을 위한 공간입니다.<br>
					마음껏 자랑해주시면 됩니다! 😸</h2>
					(나는 고양이 없음)
					<h3>처음 방문해주시는 분들은 회원가입 후 로그인하고 게시판 이용해주시면 됩니다.</h3>
					<br><br>
<!-- 					⬇️⬇️프로젝트 업로드⬇️⬇️ -->
<!-- 					<p><a href="#">github : www.~~~~</a></p> -->
<!-- 					<p><a href="#">notion : www.~~~~</a></p> -->
				</div>
			</div><!-- 본문 -->
		</div><!-- main1 -->
	</div><!-- main2 -->
</body>
</html>