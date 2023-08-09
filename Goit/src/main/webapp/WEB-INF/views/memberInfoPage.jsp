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
        table{
            margin-left: auto; margin-right: auto;
            padding: 20px;
            border: 0.2px solid gray;
            border-radius: 5px;
        }
        tr,td{
        	padding: 5px;
        }
        input{
            border: 0.5px solid gray;
            border-radius: 5px;
            height: 23px;
            font-family: 'Dovemayo_gothic';
            padding: 5px;
        }
        .write:focus{
            background-color: #E8F5FF;
            color: rgb(75, 75, 75);
            outline: 2px solid gray;
        }
        #memberUpdate{
           border: none;
            border-radius: 5px;
            width: 100px;
            height: 30px;
            font-size: medium;
        }
        #memberUpdate:hover{
            background-color: #E8F5FF;
            box-shadow: 1px 1px 5px #ccc;
        }
        .displaynone{
        	color: red;
        	font-size: small;
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
					<div style="text-align: center; padding: 20px;">회원정보변경</div>
					<form method="post" action="memberUpdate" name="memberUpdateForm">
				<!-- 		<table border="2px solid"> -->
						<table>
							<tr>
				                <td>
				                	아이디
				                </td>
							</tr>
							<tr>
				                <td>
				                	<input type="text" value="${dto.id}" name="id" readonly id="id" size="30">
				                </td>
							</tr>
							<tr>
				                <td>
				                	비밀번호
				                </td>
							</tr>
							<tr>
				                <td style="color: gray; font-size: x-small;">
				                	5~15자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.
				                </td>
							</tr>
				            <tr>
				                <td>
				                    <input type="password" id="pwd1" class="write" size="30" maxlength="15" value="${dto.pwd}">
				                </td>
				            </tr>
							<tr>
				                <td>비밀번호 확인</td>
							</tr>
				            <tr>
				                <td>
				                    <input type="password" name="pwd" id="pwd2" class="write" size="30" maxlength="15" value="${dto.pwd}">
				                </td>
				            </tr>
				            <tr id="pwdX" style="display: none;" class="displaynone">
				                <td>
				                    비밀번호가 일치하지 않습니다.
				                </td>
				            </tr>
				            <tr id="pwdO" style="display: none;" class="displaynone">
				                <td>
									비밀번호가 일치합니다.
				                </td>
				            </tr>
							<tr>
				                <td>
				                	이름
				                </td>
							</tr>
							<tr>
				                <td>
				                	<input type="text" size="30" value="${dto.name}" readonly id="name">
				                </td>
							</tr>
							<tr>
				                <td>이메일</td>
							</tr>
				            <tr>
				                <td>
				                    <input type="text" name="email" id="email" class="write" size="30" value="${dto.email}">
				                </td>
				            </tr>
				            <tr>
				                <td align="center">
				                    <div style="margin: 20px;">
				                        <button type="button" id="memberUpdate">회원정보변경</button>
				                    </div>
				                </td>
				            </tr>
						</table>
					</form>						
				</div>
			</div><!-- 본문 -->
		</div><!-- main1 -->
	</div><!-- main2 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        var idCheck = false;
        var pwdCheck = false;
        $("#pwd2").on("propertychange change keyup paste input", function () {
        	console.log("비밀번호 입력중")
			if ($("#pwd1").val() != $("#pwd2").val()) {
			    $("#pwdX").show();
			    $("#pwdO").hide();
			}else if ($("#pwd1").val() == $("#pwd2").val()) {
			    $("#pwdO").show();
			    $("#pwdX").hide();
			}
        });
//      비밀번호, 이름, 이메일 유효성검사를 위한 정규식
//      영문 대/소문자, 숫자, 특수문자를 하나 이상 포함하여 5~15자
        var userPwdCheck = (/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*?]).{5,15}$/);
       								
        var userEmailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        
//      회원가입 버튼 눌렀을때
        $("#memberUpdate").on("click", function() {
			console.log("비밀번호 => "+$("#pwd2").val());
			console.log("아이디 => "+$("#id").val());
			console.log("이메일 => "+$("#email").val());
			if ($("#pwd1").val() == "" || $("#pwd2").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pwd1").focus();
				return false;
			}
			if ($("#id").val() == $("#pwd1").val()) {
				alert("아이디를 비밀번호로 사용할 수 없습니다.");
				$("#pwd1").val("");
				$("#pwd1").focus();
				return false;
			}
			if ($("#pwd1").val().length < 5) {
				alert("비밀번호는 5자 이상이여야 합니다.");
				$("#pwd1").focus();
				return false;
			}
			if ($("#pwd1").val() != $("#pwd2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#pwd1").focus();
				return false;
			}
			if(!userPwdCheck.test($("#pwd1").val())){
		        alert("비밀번호 형식에 맞게 입력해주세요.");
		        $("#pwd1").focus();
		        return false;
	      	}
			if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if(!userEmailCheck.test($("#email").val())){
		        alert("이메일주소가 올바르지 않습니다.");
		        $("#email").focus();
		        return false;
	      	}
			document.memberUpdateForm.submit();
			alert("회원정보 수정이 완료되었습니다.");
		});
	</script>
</body>
</html>