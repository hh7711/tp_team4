<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		body,button,pre {
			font-family: 'Dovemayo_gothic';
		}
		#main1{
			border: 5px solid lightblue;
			border-radius: 10px;
		}
		#Cmtsubmit{
			border: none;
            border-radius: 5px;
            width: 85x;
            height: 30px;
            font-size: 0.5em;
            font-weight: normal;
            color: rgb(34, 34, 34);
           }
		#Cmtsubmit:hover{
            background-color: rgb(211, 253, 255);
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
			margin-left: 25px; margin-right: 25px;
        }
        #listBtn,#editBtn,#deleteBtn{
        	border: none;
            border-radius: 5px;
            width: 90x;
            height: 30px;
            font-size: 0.8em;
            font-weight: normal;
            color: rgb(34, 34, 34);
            margin-left: 20px; margin-right: 20px;
        }
        #listBtn:hover{
            background-color: rgb(211, 253, 255);
            box-shadow: 1px 1px 5px #ccc;
        }
        #editBtn:hover{
            background-color: rgb(211, 253, 255);
            box-shadow: 1px 1px 5px #ccc;
        }
        #deleteBtn:hover{
            background-color: rgb(211, 253, 255);
            box-shadow: 1px 1px 5px #ccc;
        }
        #cmtAll{
        	border-radius: 10px;
            background-color: rgb(233, 233, 233);
			padding: 20px;
			margin-bottom: 20px; margin-left: 20px; margin-right: 20px;
        }
        .writerDiv{margin-left: 13px; margin-right: 13px;}
        .writer{
            font-size: 0.7em; 
            padding: 2px; padding-left: 4px; padding-right: 4px; 
            border: none; background-color: rgb(211, 253, 255); border-radius: 15px;
        }
        .cmt{margin-left: 20px; margin-right: 13px; font-size: 1em; margin-bottom: 10px;}
        .eBtn,.dBtn,.cmtEditBtn{
        	border: none;
            border-radius: 5px;
            width: 32px;
            height: 20px;
            font-size: 0.7em;
            font-weight: normal;
            color: rgb(34, 34, 34);
            background-color: rgb(222, 222, 222);
       	}
        .eBtn:hover{
            background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        .dBtn:hover{
            background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        .cmtEditBtn:hover{
            background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        .cmtEditdiv{
            margin-left: 20px; margin-bottom: 5px;
            float: right; margin-right: 5px;
        }
        .xxx{
            border: 0.2px solid gray;
            border-radius: 5px;
            width: 20px;
            height: 20px;
            font-size: 0.5em;
            font-weight: normal;
            color: rgb(34, 34, 34);
        }
        .xxx:hover{
            background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        .cmtEditBtnDiv{
            margin-left: 20px; margin-bottom: 15px; margin-top: 3px;
        }
        .editText{
            border: none; border-radius: 5px; outline-color: #99d3ff;
        }
        .editTextDiv{
            color: black; margin-left: 20px;
        }
        textarea{
            padding: 10px;
        }
        .cdate{
        	padding-top: 20px;
        }
        .bookMarkO,.bookMarkX{
        	display: none;
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
		        <table class="mainTable">
		            <tr>
		                <td>
		                    <h3>
		                    	${ContentView.b_title}
	                    		<c:if test="${dto != null}">
				                    <span class="bookMarkO">
				                    	<a href="#" class="favO">
				                    		<img alt="오류" src="resources/main/bookMarkO.png" style="width: 35px;">
			                    		</a>
		                    		</span>
				                    <span class="bookMarkX">
				                    	<a href="#" class="favX">
				                    		<img alt="오류" src="resources/main/bookMarkX.png" style="width: 35px;">
				                    	</a>
			                    	</span>
			                    </c:if>
	                    	</h3>
		                </td>
		            </tr>
		            <tr>
		                <td>
		                	<div style="margin-bottom: 20px; font-size: small;">
			                	 &nbsp;<span id="contentId">${ContentView.id}</span> · &nbsp; 
			                	<span style="color: gray;">${ContentView.b_date}</span> · &nbsp;
			                	<span style="color: gray;">${ContentView.b_hit}</span>
		                	</div>
	                	</td>
		            </tr>
		            <tr>
		                <td>
		                	<div>
		                		 &nbsp;<img alt="오류" src="/Goit/resources${ContentView.b_img}" style="width: 60%">
		                    </div>
<!-- 		                    <div style="margin-bottom: 10px; margin-top: 5px; white-space: pre-wrap;"> -->
		                    <div style="white-space: pre-wrap;">
${ContentView.b_content}
		                    </div>
		                </td>
		            </tr>
		        </table>
		        <div style="margin: 15px;"><!-- 리스트, 수정, 삭제 -->
		            <span>
		                <button type="button" id="listBtn" onclick="location.href='boardList'">List</button>
		            </span>
<!-- 		                <button type="button" id="check">check</button> -->
		            
		            <!-- 세션 아이디, 글쓴아이디 일치시 수정, 삭제 버튼 생성 -->
		            <c:if test="${ContentView.id eq dto.id}">
		            	<span style="float: right;">
			                <button type="button" id="editBtn">Edit</button>
			                <button type="button" id="deleteBtn">Delete</button>
		                </span>
		            </c:if>
		        </div><!-- 리스트, 수정, 삭제 -->
			</div><!-- 본문 -->
<!-- 		댓글목록 -->
			<div id="cmtAll">
			<table id="commentList">
			</table>
<!-- 		댓글목록 -->
<!-- 		댓글 작성(로그인시 보임) -->
			<c:if test="${dto != null}">
				<form method="post" id="CmtWriteForm">
					<table style="margin-top: 20px; width: 550px;">
						<tr>
							<td colspan="2" style="background-color: white;">
								<input type="hidden" name="b_no" value="${ContentView.b_no}">
								<input type="hidden" name="id" value="${dto.id}">
								<div style="background-color: white; padding: 7px;">
									<div>
										<textarea id="texta" rows="5" cols="80" name="c_content" size="300" style="border: none; border-radius: 5px; outline-color: #99d3ff" placeholder="댓글을 작성해 주세요."></textarea>		
									</div>
									<div style="float: right; margin-right: 15px; margin-top: 5px; margin-bottom: 7px;">
										<button type="button" id="Cmtsubmit" style="font-size: small;">댓글등록</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			</div>
<!-- 		댓글 작성 -->
		</div><!-- main1 -->
	</div><!-- main2 -->
	
		<input type="hidden" name="id" id="iid" value="${dto.id}">
	<form method="post" action="boardEditPage" id="contentEditForm">
		<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">			
		<input type="hidden" name="amount" value="${pageMaker.amount}">			
		<input type="hidden" name="b_no" id="pageBno" value="${pageMaker.b_no}">
<%-- 		<input type="hidden" name="b_no" id="contBno" value="${ContentView.b_no}"> --%>
		<input type="hidden" name="id" id="id" value="${ContentView.id}">
		<input type="hidden" name="b_title" value="${ContentView.b_title}"> 
		<input type="hidden" name="b_img" value="${ContentView.b_img}">
		<input type="hidden" name="b_thumb" value="${ContentView.b_thumb}">
		<input type="hidden" name="b_content" value="${ContentView.b_content}"> 
	</form>
	<form method="post" action="boardDelete" id="contentDeleteForm">
		<input type="hidden" name="b_no" id="b_no" value="${ContentView.b_no}">
		<input type="hidden" name="id" id="id" value="${ContentView.id}">
	</form>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 	날짜 출력 하려고 사용 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script type="text/javascript">
		$("#check").on("click", function() {
			var contentId = $("#id").val();
			var id = $("#iid").val();
			var bno = $("#b_no").val();
			var pageBno = $("#pageBno").val();
			var contBno = $("#contBno").val();
			console.log("게시글 id ==>"+contentId);
			console.log("dto id ==>"+id);
			console.log("글번호 ==>"+bno);
			console.log("페이지 글번호 ==>"+pageBno);
			console.log("내용 글번호 ==>"+contBno);
		});
		
// 		게시글 수정
		$("#editBtn").on("click", function() {
			var id = $("#id").val();
			console.log("아이디값 ==>"+id);
			$.ajax({
				url: "EDloginCheck",
				type: "POST",
				data: { id : id },
				dataType: "json",
				success: function(result) {
					console.log("result값 == > "+result);
//			    	로그인 아이디 일치시 수정 화면으로 이동
					if (result == 2) {
						document.getElementById("contentEditForm").submit();
// 					아이디가 일치하지 않는 경우
				    } else if (result == 1) {
				    	alert("작성자가 아니라 수정할 수 없습니다.");
				    	location.href = "boardList";
// 					로그인이 되어 있지 않은 경우, 로그인 페이지로 이동
				    } else if (result == 3){
				    	alert("로그인 정보가 없습니다.");
				    	location.href = "signInPage";
				  	}
				},
				error: function () {
					alert("오류");
	            }
			});
		});
		
// 		게시글 삭제
		$("#deleteBtn").on("click", function() {
			var id = $("#id").val();
			console.log("아이디값 ==>"+id);
			$.ajax({
				url: "EDloginCheck",
				type: "POST",
				data: { id : id },
				dataType: "json",
				success: function(result) {
					console.log("result값 == > "+result);
//			    	로그인 아이디 일치시 삭제
					if (result == 2) {
						if(confirm("게시글을 삭제를 하시겠습니까?")){
							document.getElementById("contentDeleteForm").submit();
							alert("정상적으로 삭제되었습니다.");
						}else{
						}
// 					아이디가 일치하지 않는 경우
				    } else if (result == 1) {
				    	alert("작성자가 아니라 삭제할 수 없습니다.");
				    	location.href = "boardList";
// 					로그인이 되어 있지 않은 경우, 로그인 페이지로 이동
				    } else if (result == 3){
				    	alert("로그인 정보가 없습니다.");
				    	location.href = "signInPage";
				  	}
				},
				error: function () {
					alert("오류");
	            }
			});
		});
		
// 		댓글 작성
		$("#Cmtsubmit").on("click", function() {
			var formData = $("#CmtWriteForm").serialize();
			
			$.ajax({
				url: "boardCmtWrite",
				type: "POST",
				data: formData,
// 				dataType: "json",
				success: function(result) {
					console.log("result값 == > "+result);
					if (result == "2") {
				    	$("#texta").val("");
				    	getComments();
				    	alert("댓글 작성이 완료 되었습니다.");
				    }
				},
				error: function () {
					alert("오류");
	            }
			});
		});
		
// 		댓글목록 불러오기
		function getComments() {
			var b_no = $("#b_no").val();
			console.log("댓글 목록 불러오기 b_no값 == > "+b_no);
	        $.ajax({
	            type: "GET",
	            url: "boardCmtList",
	            data: { b_no: b_no },
	            dataType: "json",
	            success: function (commentList) {
	                // 댓글 목록을 가공하여 commentList 영역에 추가
	                var cmtList = $("#commentList");
	                cmtList.empty();
	                $.each(commentList, function (index, comment) {
	                var c_date = moment(comment.c_date).format('YYYY-MM-DD');
	                    var html =				'<tr>'
                    		+	'<td colspan="2">' 
                    		+		'<form action="boardCmtDelete" method="post" class="cmtDelete">'
                   			+			'<input type="hidden" name="c_no" value="' + parseInt(comment.c_no) + '">' 
                    		+			'<input type="hidden" name="id" value="' + comment.id + '">' 
                    		+		'</form>' 
                    		+		'<div class="writerDiv">' 
                    		+			'<span><b>' + comment.id + '</b></span>';
                    		
                    		if ('${ContentView.id}' == comment.id) {
                    		    html += '&nbsp;<span class="writer">작성자</span>';
                    		}
                    		html +=			'&nbsp;&nbsp;<span class="cdate">' + c_date + '</span>&nbsp;'; 
                    		
                    		if (comment.id == '${dto.id}') {
                    		    html +=	'<span style="float: right;">'
                    		    	+	'<button type="button" class="eBtn">수정</button>&nbsp;'
                    		    	+	'<button type="button" class="dBtn">삭제</button>'
                    		    	+ '</span>';
                    		}
                    		html +=		'</div>' 
                    		+	'</td>' 
                    		+'</tr>' 
                    		+'<tr>' 
                    		+	'<td colspan="2">' 
                    		+		'<div class="cmt" style="white-space: pre-wrap;">' + comment.c_content + '</div>' 
                    		+	'</td>' 
                    		+'</tr>' 
                    		+'<tr>' 
                    		+	'<td colspan="2" class="editShow" style="display: none;">' 
                    		+'<form method="post" action="boardCmtEdit" class="cmtEdit">' 
                    		+		'<div class="cmtEditdiv">' 
                    		+			'<button type="button" class="xxx">x</button>' 
                    		+		'</div>' 
                    		+		'<div class="editTextDiv">' 
                    		+			'<textarea rows="5" cols="68" name="c_content" size="300" class="editText">' + comment.c_content + '</textarea>' 
                    		+			'<input type="hidden" name="c_no" value="' + parseInt(comment.c_no) + '">' 
                    		+			'<input type="hidden" name="id" value="' + comment.id + '">' 
                    		+		'</div>' 
                    		+		'<div class="cmtEditBtnDiv">' 
                    		+			'<button type="button" class="cmtEditBtn">수정</button>'
                    		+		'</div>' 
                    		+	'</form>' 
                    		+	'</td>' 
                    		+'</tr>';
	                	cmtList.append(html);
	                });
	            },
	            error: function (xhr, status, error) {
	                console.error(error);
	            }
	        });
 		}

//		댓글 목록을 불러오도록 호출
    	$(document).ready(function () {
//     		댓글을 가져올 게시물 번호
        	var b_no = $("#b_no").val();
        	console.log("ㅈㅔ말이 들리시나요?ㅋ b_no값 == > "+b_no);
        	getComments();
    	});
		
		
		
// 		댓글 수정 열고 닫기
		$(document).ready(function () {
// 			$(".eBtn").on("click", function() {
			$(document).on("click", ".eBtn", function() {
	//			누른곳의 tr값 다음 다음 tr 값
				console.log("수정버튼 눌러짐?");
				var editRow = $(this).closest("tr").next("tr").next("tr").find(".editShow");
				editRow.show();
			});
		});
		
		$(document).ready(function () {
			$(document).on("click", ".xxx", function() {
// 			$(".xxx").on("click", function() {
			var editRow = $(this).closest("tr").find(".editShow");
			editRow.hide();
			});
		});

// 		댓글 수정
		$(document).ready(function () {
			$(document).on("click", ".cmtEditBtn",function() {
				console.log("댓글수정이요 제발");				
				var formData = $(this).closest("tr").find(".cmtEdit").serialize();
				
				$.ajax({
					url: "boardCmtEdit",
					type: "POST",
					data: formData,
					success: function(result) {
						console.log("result값 == > "+result);
						if (result == "2") {
					    	getComments();
					    	alert("댓글 수정이 완료 되었습니다.");
					    }
					},
					error: function () {
						alert("오류");
		            }
				});
			});
		});
// 		댓글 삭제
		$(document).ready(function () {
			$(document).on("click", ".dBtn", function() {
				var formData = $(this).closest("tr").find(".cmtDelete").serialize();
				if (confirm("정말 삭제 하시겠습니까?")) {
					$.ajax({
						url: "boardCmtDelete",
						type: "POST",
						data: formData,
						success: function(result) {
							console.log("result값 == > "+result);
							if (result == "2") {
						    	getComments();
						    	alert("댓글이 삭제 되었습니다.");
						    }
						},
						error: function () {
							alert("오류");
			            }
					});
				}
			});
		});
		
// 		북마크 여부 불러오기
		function getBookmark() {
			var b_no = $("#b_no").val();
			var id = $("#iid").val();
			console.log("북마크 불러오기 b_no값 == > "+b_no);
			console.log("북마크 불러오기 id값 == > "+id);
	        $.ajax({
	            type: "GET",
	            url: "bookMarkCheck",
	            data: { b_no: b_no,
	            		id : id},
	            dataType: "json",
	            success: function (favDto) {
// 					alert("favDto ==>"+favDto)            	
					if (favDto == 2) {
						$(".bookMarkO").show();
						$(".bookMarkX").hide();
					}else{
						$(".bookMarkX").show();
						$(".bookMarkO").hide();
					}
	            },
	            error: function (xhr, status, error) {
	                console.error(error);
	            }
	        });
 		}
		
//		북마크 여부를 불러오도록 호출
    	$(document).ready(function () {
//     		북마크 여부 확인할 게시물 번호
        	var b_no = $("#b_no").val();
        	getBookmark();
    	});
    	
// 		북마크O 클릭시 삭제
// 		북마크X 클릭시 추가
		$(".favX").on("click", function() {
			var b_no = $("#b_no").val();
			var id = $("#iid").val();
			console.log("북마크 b_no값 == > "+b_no);
			console.log("북마크 id값 == > "+id);
			
			$.ajax({
				url: "bookMark",
				type: "POST",
				data: { b_no: b_no,
            			id : id},
				dataType: "json",
				success: function(result) {
					console.log("result값 == > "+result);
					if (result == "2") {
				    	getBookmark();
				    }
				},
				error: function () {
					alert("오류");
	            }
			});
		});
// 		북마크O 클릭시 삭제
		$(".favO").on("click", function() {
			var b_no = $("#b_no").val();
			var id = $("#iid").val();
			console.log("북마크 b_no값 == > "+b_no);
			console.log("북마크 id값 == > "+id);
			
			$.ajax({
				url: "bookMarkDelete",
				type: "POST",
				data: { b_no: b_no,
            			id : id},
				dataType: "json",
				success: function(result) {
					console.log("result값 == > "+result);
					if (result == "2") {
				    	getBookmark();
				    }
				},
				error: function () {
					alert("오류");
	            }
			});
		});
		
	</script>
	<footer style="font-size: 0.1em; color: lightgray;">
		<a href="https://kr.freepik.com/free-vector/blue-pastel-background-grid-pattern-cute-design-vector_20346221.htm#query=%EA%B7%80%EC%97%AC%EC%9A%B4%20%ED%8C%A8%ED%84%B4&position=6&from_view=keyword&track=ais">작가 rawpixel.com</a> 출처 Freepik
	</footer>
</body>
</html>