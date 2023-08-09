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
        .mainTable{
        	margin-left: auto; margin-right: auto; margin-bottom: 20px;
        }
        #b_title{
            border: 0.8px solid gray;
            border-radius: 5px;
            height: 23px;
            font-family: 'Dovemayo_gothic';
            font-size: medium;
			padding-top: 5px; padding-bottom: 5px; padding-left: 10px; padding-right: 10px;
        }
        #b_title:focus{
        	background-color: #E8F5FF;
            color: rgb(75, 75, 75);
            outline: 2px solid gray;
        }
        #b_content{
            padding: 10px;
            font-size: medium;
            border: 0.5px solid gray; 
            border-radius: 5px; 
            outline-color: #99d3ff;
        }
        .list,.submit{
        	border: none;
        	border-radius: 5px;
            width: 50px;
            height: 25px;
            font-size: 0.8em;
            font-weight: normal;
            color: rgb(34, 34, 34);
            background-color: rgb(222, 222, 222);
        }
        .list:hover{
            background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        .submit:hover{
            background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        .select_img{
        	margin-top: 20px;
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
              	<form method="post" action="boardWrite" id="writeForm" enctype="multipart/form-data">
	            	<table width="500">
                        <tr style="height: 50px;">
                	        <td>
			                    <input type="hidden" name="id" id="id" value="${dto.id}">
                	        	<input type="text" name="b_title" size="50" id="b_title" placeholder="제목을 입력해주세요.">
               	        	</td>
                        </tr>
                        <tr>
                        	<td>
                            	<textarea name="b_content" id="b_content" rows="10" cols="80" placeholder="내용을 입력해주세요."></textarea>
                            </td>
                        </tr>
                        <tr>
							<td>
								<div class="boardImg">
							   		<label for="b_img">이미지</label>
<!-- 							   		파일 선택시 jpg, jpeg, png,gif, bmp 확장자만 보임 -->
							   		<input type="file" id="b_img" name="imgfile" accept="image/jpg, image/jpeg, image/png, image/gif, image/bmp"/>
							   		<div class="select_img">
							   			<img id="img" src="" style="width: 200px;"/>
						   			</div>
								</div>
							</td>
                    	</tr>
                    	<tr>
                    		<td>
								<div>
									<button type="button" class="list" style="float: left;" onclick="location.href='boardList'">글목록</button>
									<button type="button" class="submit" style="float: right;" id="submitBtn">등록</button>
								</div>
							</td>
                    	</tr>
	                </table>
                </form>
			</div><!-- 본문 -->
		</div><!-- main1 -->
	</div><!-- main2 -->
<%-- 	<%= request.getRealPath("/") %> --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
// 		이미지를 올리면 어떤 이미지인지 볼 수 있게 해줌
	    $("#b_img").change(function(){
     		if(this.files && this.files[0]) {
	      		var reader = new FileReader;
	      		reader.onload = function(data) {
	       			$("#img").attr("src", data.target.result);          
	      		}
	      		reader.readAsDataURL(this.files[0]);
     		}
		});
		
		$("#submitBtn").on("click", function() {
			if ($("#b_title").val().length == 0) {
				alert("제목을 입력해주세요.");
				$("#b_title").focus();
				return;
			}
			if ($("#b_title").val().length > 30) {
			alert("제목은 30자 미만으로 입력하셔야 됩니다.");
		  	    $("#b_title").focus();
		  	    return;
	  	    }
			if ($("#b_content").val().length == 0) {
		  	    alert("내용을 입력해주세요");
		  	    $("#b_content").focus();
		  	    return;
	  	    }
			if ($("#b_content").val().length > 300) {
	      	    alert("내용은 300자 미만으로 입력하셔야 됩니다.");
	      	    $("#b_content").focus();
	      	    return;
      	    }
			if ($("#b_img").val() == "") {
	      	    alert("사진 첨부가 되지 않았습니다.");
	      	    return;
      	    }
			var images = ["jpg", "jpeg", "png", "gif", "bmp"];
		    var fileExtension = $("#b_img").val().split('.').pop().toLowerCase();
			if (!images.includes(fileExtension)) {
	      	    alert("jpg, jpeg, png,gif, bmp만 첨부 가능합니다.");
	      	    return;
      	    }
			var id = $("#id").val();
			var title = $("#b_title").val();
			var content = $("#b_content").val();
			var img = $("#b_img").val();

			console.log("아이디 ==>"+id);
			console.log("제목 ==>"+title);
			console.log("내용 ==>"+content);
			console.log("이미지 ==>"+img);
// 			document.getElementById("writeForm").submit();
			var formData = new FormData($("#writeForm").get(0));
			for (let value of formData.values()) {
			      console.log("폼내용 ==>"+value);
			}
			$.ajax({
			    type: "post",
			    url: "boardWrite",
			    data: formData,
			    processData: false,
			    contentType: false,
			    success: function (result) {
			    	if (result == "2") {
			    		console.log("result ==>"+result);
			      	    alert("정상적으로 글이 등록되었습니다.");
			      	  	window.location.href = "boardList";
// 			      	  	location.replace() = "boardList.jsp";
					}
			    	else if(result == "1"){
		      	    alert("03");
			      	    alert("안됨~!");
			    	}
			    },
			    error: function (xhr, status, error) {
			        console.error(error);
			        alert("오류");
			    }
			});
		});
	</script>
</body>
</html>