<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		body,option,button,select,input,a {
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
        .titleA{
        	text-decoration: none; color: black; font-size: 1em; font-weight: bold;
        	border-radius: 10px;
        	padding: 5px;
        }
        .titleA:hover{
        	color: red;
        	box-shadow: 1px 1px 5px #ccc;
        }
        table{border-collapse: collapse;}
        .searchBtn,.write{
        	border: none;
        	border-radius: 5px;
            width: 50px;
            height: 25px;
            font-size: 0.8em;
            font-weight: normal;
            color: rgb(34, 34, 34);
            background-color: rgb(222, 222, 222);
        }
        .searchBtn:hover{
        	background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        .write:hover{
        	background-color: #ffffff;
            box-shadow: 1px 1px 5px #ccc;
        }
        ul{
			display: table;
			margin-left: auto;
			margin-right: auto;
  			justify-content: center;
        }
        li{
 			list-style: none;
        	display: inline-block;
		}
		.paginate_button{
			border: 2px solid rgb(163, 151, 198);
			border-radius: 50%; margin: 0 auto; width: 23px; height: 23px;
			text-align: center;
		}
		.paginate_a{
			text-decoration: none; color: black;
		}
		.paginate_button:hover{
			border: 2px solid rgb(163, 151, 198);
			background-color: rgb(163, 151, 198);
			border-radius: 50%; margin: 0 auto; width: 23px; height: 23px;
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
<!-- 				<img alt="오류" src="/Goit/resources/imgUpload/2023/08/01/s/s_5694f62e-06e3-458e-b6c4-eb18c243fbc9_main1.jpg" width="100%"> -->
	            <table class="mainTable" style="width: 80%;">
					<c:forEach items="${boardList}" var="dto">
	<!-- 			<img alt="" src="resources/main.png" width="100%"> -->
	                    <tr style="border-bottom: 0.5px solid lightgray;">
	                    	<td style="text-align: center;">
	                    		<span>${dto.b_no}</span>
                    		</td>
	                        <td style="width: 150px; height: 150px;">
	                            <div style="width: 150px; height: 150px; padding: 10px; text-align: center;">
	                                <img alt="오류" src="/Goit/resources${dto.b_thumb}" style="height: 100%; width: 100%;">
<!-- 	                                <img alt="오류" src="\imgUpload\${dto.b_thumb}" width="100%"> -->
	                            </div>
	                        </td>
	                        <td>
	                            <div style="margin-left: 15px; margin-bottom: 10px;">
	                                <span><a href="boardContentView?b_no=${dto.b_no}" class="titleA">
	                                	${dto.b_title}
	                                </a></span>
	                            </div> 
	                            <div style="margin-left: 15px;">
	                                <span>😸${dto.id}</span>&nbsp;·
	                                <!-- <span>QAZWSXEDCR</span>&nbsp;· -->
	                                <span>📆${dto.b_date}</span>&nbsp;·
	                                <!-- <span>2023.07.27</span>&nbsp;· -->
	                                <span>👁️‍🗨️${dto.b_hit}</span>&nbsp;
	                                <!-- <span>23</span>&nbsp; -->
	                            </div>
	                        </td>
	                        <td style="text-align: center; width: 40px;">
	                        	<div style="border: 2.5px solid rgb(163, 151, 198); border-radius: 50%; margin: 0 auto; width: 23px; height: 23px; text-align: center;">
	                        		${dto.comm_cnt}
                        		</div>
	                        </td>
	                    </tr>
					</c:forEach>
					<tr>
						<td colspan="3">
							<div style="margin-top: 10px;">
								<span style="float: left;">
									<form method="post" action="searchList" id="searchForm">
										<select name="type" id="skey">
											<option value="ITP" <c:out value="${pageMaker.cri.type eq 'ITC' ? 'selected' : ''}"/>>전체</option>
											<option value="I" <c:out value="${pageMaker.cri.type eq 'I' ? 'selected' : ''}"/>>아이디</option>
											<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
											<option value="P" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>글내용</option>
			   							</select>
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
										<input type="text" name="keyword" id="value" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
		  								<button type="submit" class="searchBtn" style="font-size: small;">검색</button>
		      						</form>
	      						</span>
	      						<span style="float: right; margin-left: 50px;">
		      						<button type="button" class="write" onclick="location.href='loginCheck'">
		      							글작성
		      						</button>
	      						</span>
      						</div>
						</td>
					</tr>
	            </table>
			</div><!-- 본문 -->
			<div><!-- 검색 -->
				<ul>
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button">
			            	<a href="${pageMaker.startPage - 1}" class="paginate_a">
			                	<
			                </a>
						</li>
					</c:if>
			        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			        	<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:white'":""}>
				    		<a class="paginate_a" href="${num}">
				            	&nbsp;&nbsp;${num}&nbsp;&nbsp;
							</a>
						</li>&nbsp;
					</c:forEach>
			        <c:if test="${pageMaker.next}">
			        	<li class="paginate_button">
			            	<a href="${pageMaker.endPage + 1}" class="paginate_a">
			                	>
							</a>
		                </li>
		            </c:if>
	            </ul>
            </div>
		</div><!-- main1 -->
	</div><!-- main2 -->
	<form method="get" id="actionForm" action="boardList">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
	    $("#skey").find("option[value='${skey}']").attr("selected", "selected");
	    
	    $("#svalue").val("${svalue}");
	    
	    $("#skey").on("change",function(){
	        $("#svalue").val("");      
	    });
	    
	});
	
	   var actionForm = $("#actionForm");
	   
	//    페이지번호 처리
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();      
			var b_no = actionForm.find("input[name='b_no']").val();
			if (b_no != '') {//글번호에 내용이 있으면 삭제해줌
	 			actionForm.find("input[name='b_no']").remove();
			}
	      
	//       페이지번호
			console.log("@# href ===>"+$(this).attr("href"));
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.attr("action","boardList");
			actionForm.submit();
		});
	   
	//    게시글 처리
		$(".move_link").on("click", function(e){
			e.preventDefault();
			var targetBno = $(this).attr("href");
		
			var b_no = actionForm.find("input[name='b_no']").val();
			if (b_no != '') {
		   		actionForm.find("input[name='b_no']").remove();
			}
			actionForm.append("<input type='hidden' name='b_no' value='"+targetBno+"'>");
			actionForm.attr("action","boardContentView");
		});
	</script>
</body>
</html>