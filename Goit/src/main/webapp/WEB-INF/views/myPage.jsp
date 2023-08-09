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
			padding: 20px;
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
        	margin-top: 5px; margin-left: 5px; margin-right: 5px; margin-bottom: 30px;
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
        .BtnDiv{
        	margin-left: auto; margin-right: auto;
        }
        table{
            margin-left: auto; margin-right: auto;
            padding: 20px;
            border-radius: 5px;
        }
        .tableBtn{
        	border: none;
        	width: 200px;
        	height: 50px;
        	font-size: 1em;
        }
        .tableBtn:hover {
			background-color: #E8F5FF;
        	box-shadow: 1px 1px 5px #ccc;
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
			<button type="button" class="headBtn" style="float: right;" onclick="location.href='signUpPage'">회원가입</button>&nbsp;
			<button type="button" class="headBtn" style="float: right;" onclick="location.href='signInPage'">로그인</button>
		</c:if>
		<c:if test="${dto != null}">
			<button type="button" class="headBtn" style="float: right;" onclick="location.href='signOut'">로그아웃</button>&nbsp;
			<button type="button" class="headBtn" style="float: right;" onclick="location.href='myPage'">마이페이지</button>
			<span class="headId" style="float: right;">${dto.id}님</span>
		</c:if>
	</div>
	<div id="main1">
		<div id="main2">
			<div class="BtnDiv"><!-- 본문 -->
				<table>
					<tr>
						<td>
							<div>
								<button type="button" id="memberInfo" class="tableBtn">회원정보 변경</button>
							</div>
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<div> -->
<!-- 								<button type="button" id="myPageBoardList" class="tableBtn">❌본인이 쓴 게시글 조회</button> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<div> -->
<!-- 								<button type="button" id="myPageBoardCmtList" class="tableBtn">❌본인이 쓴 댓글 조회</button> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<div> -->
<!-- 								<button type="button" id="myPageBookMarkList" class="tableBtn">❌북마크</button> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<td>
							<div>
								<button type="button" class="tableBtn" id="memberDelete">회원 탈퇴</button>
							</div>
						</td>
					</tr>
				</table>
			</div><!-- 본문 -->
		</div><!-- main1 -->
	</div><!-- main2 -->
	<form id="formId" name="formId" method="post">
		<input type="hidden" value="${dto.id}" name="id">
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    	$("#memberInfo").on("click", function() {
    		$("#formId").attr("action", "memberInfoPage");
    		console.log($("#formId input[name='id']").val());
    		$("#formId").submit();
    	});
//     	$("#myPageBoardList").on("click", function() {
//     		$("#formId").attr("action", "myPageBoardList");
//     		console.log($("#formId input[name='id']").val());
//     		$("#formId").submit();
//     	});
//     	$("#myPageBoardCmtList").on("click", function() {
//     		$("#formId").attr("action", "myPageBoardCmtList");
//     		console.log($("#formId input[name='id']").val());
//     		$("#formId").submit();
//     	});
//     	$("#myPageBookMarkList").on("click", function() {
//     		$("#formId").attr("action", "myPageBookMarkList");
//     		console.log($("#formId input[name='id']").val());
//     		$("#formId").submit();
//     	});
    	$("#memberDelete").on("click", function() {
    		$("#formId").attr("action", "memberDeletePage");
    		console.log($("#formId input[name='id']").val());
    		$("#formId").submit();
    	});
    </script>
</body>
</html>