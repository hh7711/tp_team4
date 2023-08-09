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
		body,button,input,textarea {
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
        #memberDelete{
           border: none;
           border-radius: 5px;
           width: 100px;
           height: 30px;
           font-size: medium;
        }
        #memberDelete:hover{
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
			<div><!-- 본문 -->
				<div style="margin: 50px;">
					<div style="text-align: center; padding: 20px; font-size:1.2em; font-weight: bold;">회원탈퇴</div>
					<form method="post" action="memberDelete" name="memberDeleteForm">
						<table>
							<tr>
				                <td>
				                	아이디&nbsp;&nbsp;
				                	<input type="text" value="${dto.id}" name="id" id="id" class="write" readonly size="30">
				                </td>
							</tr>
							<tr>
				                <td>
				                	비밀번호
				                    <input type="password" name="pwd" id="pwd" class="write" size="30" maxlength="15">
				                </td>
							</tr>
				            <tr id="pwdX" style="display: none;">
				                <td>
				                    <span class="displaynone">비밀번호가 일치하지 않습니다.</span>
				                </td>
				            </tr>
				            <tr>
				                <td align="center">
				                    <div style="margin: 20px;">
				                        <button type="button" id="memberDelete">탈퇴</button>
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
        var pwdCheck = false;
        $("#pwd").on("propertychange change keyup paste input", function () {
        	var pwd = $(this).val();
        	var id = $("#id").val();
            $.ajax({
                url: "pwdCheck",
                type: "post",
                data: {pwd : pwd, id : id},
                dataType: "json",
                success : function(result) {
//                 	비밀번호 일치 2, 비밀번호 틀리면 1
                    if (result == 2) {
                        $("#pwdX").hide();
                        pwdCheck = true;
                    }else if (result == 1) {
                        $("#pwdX").show();
                        pwdCheck;
                    }
                },
                error: function(){
                    alert("오류");
                }
            });
        });
        $("#memberDelete").on("click", function() {
			console.log("비밀번호 => "+$("#pwd").val());
			console.log("아이디 => "+$("#id").val());
			if (confirm("정말로 탈퇴 하시겠습니까?")) {
				if ($("#pwd").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#pwd").focus();
					return false;
				}
				if (pwdCheck == false) {
	        		alert("비밀번호가 일치하지 않습니다.\n다시 입력해 주세요.");
					$("#pwd").focus();
					return false;
				}
				document.memberDeleteForm.submit();
				alert("탈퇴 완료 되었습니다.");
			} else {
				
			}
		});
	</script>
</body>
</html>