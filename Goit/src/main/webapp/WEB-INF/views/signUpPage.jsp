<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나도 고양이 있어</title>
    <style>
    	@font-face {
		    font-family: 'Dovemayo_gothic';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		body,button,textarea {
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
        table{
            margin-left: auto; margin-right: auto;
            margin-top: 40px; margin-bottom: 40px;
            border: 0.2px solid gray;
            border-radius: 5px;
            align-content: center;
            padding: 20px;
            border-collapse: separate;
			border-spacing: 0 0 0 20px;
        }
        tr{
        	margin: 15px;
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
        #signUp{
            border: none;
            border-radius: 5px;
            width: 100px;
            height: 30px;
            font-size: medium;
        }
        #signUp:hover{
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
				<form method="post" action="signUp" name="signup">
					<table>
						<caption><h2>회원가입</h2></caption>
						<tr>
			                <td>아이디</td>
						</tr>
						<tr>
			                <td style="color: gray; font-size: small;">
			                	영어,숫자,_,-만 사용 가능하고 5~10자
			                </td>
						</tr>
			            <tr>
			                <td>
			                    <!-- <input type="text" name="id" id="id" placeholder="아이디를 입력하세요"> -->
			                    <input type="text" name="id" id="id" class="write" size="60" maxlength="10">
			                </td>
			            </tr>
						<tr id="idX" style="display: none;">
							<td style="height: 10px;">
			                   	<span class="displaynone">사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.</span>
			                </td>
						</tr>
						<tr id="idO" style="display: none;">
			                <td>
			                    <span class="displaynone">사용 가능한 아이디 입니다.</span>
			                </td>
						</tr>
						<tr>
			                <td>
			                	비밀번호
			                </td>
						</tr>
						<tr>
			                <td style="color: gray; font-size: small;">
			                	<span>5~15자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</span>
			                </td>
						</tr>
			            <tr>
			                <td>
			                    <input type="password" id="pwd1" class="write" size="60" maxlength="15">
			                </td>
			            </tr>
						<tr>
			                <td>비밀번호 확인</td>
						</tr>
			            <tr>
			                <td>
			                    <input type="password" name="pwd" id="pwd2" class="write" size="60" maxlength="15">
			                </td>
			            </tr>
			            <tr id="pwdX" style="display: none;">
			                <td>
			                    <span class="displaynone">비밀번호가 일치하지 않습니다.</span>
			                </td>
			            </tr>
			            <tr id="pwdO" style="display: none;">
			                <td>
								<span class="displaynone">비밀번호가 일치합니다.</span>
			                </td>
			            </tr>
						<tr>
			                <td>이름</td>
						</tr>
						<tr>
			                <td style="color: gray; font-size: small;">
			                	한글 2~6자
			                </td>
						</tr>
			            <tr>
			                <td colspan="2">
			                    <input type="text" name="name" id="name" class="write" size="60" maxlength="6">
			                </td>
			            </tr>
						<tr>
			                <td>이메일</td>
						</tr>
			            <tr>
			                <td colspan="2">
			                    <input type="text" name="email" id="email" class="write" size="60">
			                </td>
			            </tr>
			            <tr>
			                <td align="center">
			                    <div style="margin: 20px;">
			                        <button type="button" id="signUp">회원가입</button>
			                    </div>
			                </td>
			            </tr>
					</table>
				</form>
			</div><!-- 본문 -->
		</div><!-- main1 -->
	</div><!-- main2 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        var idCheck = false;
        var pwdCheck = false;
        $("#id").on("propertychange change keyup paste input", function () {
        	var id = $(this).val();
            $.ajax({
                url: "idCheck",
                type: "post",
                data: {id : id},
                dataType: "json",
                success : function(result) {
                    if (result == 2) {
                        $("#idO").show();
                        $("#idX").hide();
                        idCheck = true;
                    }else if (result == 1) {
                        $("#idX").show();
                        $("#idO").hide();
                        idCheck;
                    }
                },
                error: function(){
                    alert("오류");
                }
            });
        });
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
//      아이디, 비밀번호, 이름, 이메일 유효성검사를 위한 정규식
// 		영어,숫자,_,-만 사용 가능하고 5~10자
        var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,10}$/);
//      영문 대/소문자, 숫자, 특수문자를 하나 이상 포함하여 5~15자
        var userPwdCheck = (/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*?]).{5,15}$/);
//         한글 2~6자
        var userNameCheck = RegExp(/^[가-힣]{2,6}$/);
       								
        var userEmailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        
//      회원가입 버튼 눌렀을때
        $("#signUp").on("click", function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if(!userIdCheck.test($("#id").val())){
		        alert("아이디 형식에 맞게 입력해주세요.");
		        $("#id").focus();
		        return false;
	      	}
        	if (idCheck == false) {
        		alert("이미 존재하는 아이디 입니다.");
				$("#id").focus();
				return false;
			}
			if ($("#id").val().length < 5) {
				alert("아이디는 5글자 이상이여야 합니다");
				$("#id").focus();
				return false;
			}
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
			if ($("#name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if(!userNameCheck.test($("#name").val())){
		        alert("정확한 이름을 적어주세요.");
		        $("#name").focus();
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
			document.signup.submit();
		});
    </script>
</body>
</html>