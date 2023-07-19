<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room and Bloom</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<style>
aside, section, footer {
	margin: 3px;
	text-align: center;
}

footer {
	position: absolute;
	left: 260px;
	font-size: small;
}

.container {
	display: flex;
	margin: 0 auto;
	margin-top: 80px;
	max-width: 100%;
	font-family: notosans;
}

#aisdeLeft {
	position: sticky;
	top: 0px;
	height: 500px;
}

#aisdeRight {
	position: sticky;
	top: 0px;
	height: 500px;
}

#article {
	height: 800px;
	flex-grow: 1;
	padding: auto;
}

#aisdeLeft {
	flex-grow: 0;
	width: 200px;
	padding: auto;
}

#section {
	flex-grow: 1;
}

#aisdeRight {
	flex-grow: 0;
	width: 250px;
	padding: auto;
}

#aisdeLeft ul li {
	list-style: none;
	text-align: left;
	font-size: small;
	line-height: 2em;
}

#aisdeRight ul li {
	list-style: none;
	text-align: right;
	margin-right: 30px;
	line-height: 2em;
}

a {
	text-decoration: none;
	color: gray;
}

.thumbnail {
	padding: 10px;
	width: 30%;
	display: inline-block;
}

section {
	margin-top: 40px;
}

#log_ul {
	font-size: small;
}

a:hover {
	color: black;
}

.thumbnail {
	float: left;
}
#search{
  border-top: none;
  border-left: none;
  border-right: none;
}
td{
	border: 1px solid gray;	color: gray;
	font-family: notosans; font-size: small;
}
table {
	margin-left:auto; margin-right:auto;
}
.write{
	float: right; width: 100px; color: white; background-color: black; 
	border: none; font-size: small; width: 80px; height: 30px; border-radius: 5px;
	margin-right: 10px; margin-top: 10px; margin-bottom: 5px;
}
.write:hover {
	background: white; color: black; border: 1px solid #ccc;
}
.search_all{
	float: left; 
	margin-left: 10px; margin-top: 10px; margin-bottom: 5px;
}
</style>
</head>

<body>

	<!-- 
    =================================================================
    메인 화면
    박정훈    |   23-06-17      |        전체 레이아웃 위치 세팅 및 스타일 적용 
    ================================================================= 
    -->

	<main id="main">
		<div class="container">
			<!-- 
    =================================================================
    좌측 사이드바 레이아웃 세팅
    작성자   |   수정자   |    작성 or 수정일    |     작업 내용
    조은유   |   박동명   |     23-06-16      |    사이드바 레이아웃 조정
    										 	카테고리 페이지 연결 
    ================================================================= 
    -->
			<!-- 좌측 사이드바 -->

			<aside id="aisdeLeft">
				<div id="title">
					<a href="mainPage"> <span
						style="font-size: x-large; position: absolute; left: 0px; color: black; width: 200px;">Room
							& Bloom</span>
					</a>
				</div>
				<div class="category" style="position: absolute; top: 70px;">
					<ul style="width: 200px;">
<!-- 						<li><a href="#">BEST</a></li> -->
						<li><a href="ProductList?catecode=1">의자</a></li>
						<li><a href="ProductList?catecode=2">침대</a></li>
						<li><a href="ProductList?catecode=3">테이블/식탁/책상</a></li>
						<li><a href="ProductList?catecode=4">소파</a></li>
						<li><a href="ProductList?catecode=5">서랍/수납장</a></li>
						<li><a href="ProductList?catecode=6">거실장/TV장</a></li>
						<li><a href="ProductList?catecode=7">선반</a></li>
						<li><a href="ProductList?catecode=8">진열장/책장</a></li>
						<li><a href="ProductList?catecode=9">행거/옷장</a></li>
						<li><a href="ProductList?catecode=0">화장대</a></li>
					</ul>
				</div>
				<div class="notice" style="position: absolute; top: 400px;">
					<ul>
<!-- 			<!--               <li><a href="noticePage">Notice</a></li> -->
              			<li><a href="notice/list">Notice</a></li>
              			<li><a href="Qna_list">QnA</a></li>
						<li><a href="rev_list">Review</a></li>
					</ul>
				</div>
				<div class="info" style="position: absolute; top: 550px;">
					<ul>
						<li>02-336-4363</li>
						<li>Mon-Fri 10:00-19:00 <br> Weekend,Holiday off
						</li>
					</ul>
				</div>

			</aside>

			<!-- 
    =================================================================
    본문   / 상품 화면 출력부 / 상품 가격및 이미지 출력 부분
    박정훈    |   23-06-16       |       a태그를 사용하여 클릭시 상세페이지 이동 
    =================================================================
    -->
			<!-- 본문 -->
			<section id="section" style="width: 600px;">
				<article style="margin-left: 40px">
					<div id="article" style="height: auto;">

<!-- 						@@@본문추가 구나현 -->
						<div>
					 		<p style="color: black;">Question</p>
					 		<p>상품문의</p>
						</div>
						<table>
	    					<tr>
								<td scope="col" style="padding:10px; width: 75px;">No</td><!-- 글번호 -->
								<td scope="col" style="padding:10px; width: 300px;">Subject</td><!-- 제목 -->
								<td scope="col" style="padding:10px; width: 100px;">Writer</td><!-- 작성자 -->
								<td scope="col" style="padding:10px; width: 90px;">Date</td><!-- 작성날짜 -->
	    					</tr>
	    					<c:forEach items="${Qna_list}" var="dto">
	    					<tr>
	    						<form method="post" class="qnacontentview" action="Qna_contentView">
	    							<input type="hidden" name="qnacode" value="${dto.qnacode}">
	    						</form>
	      						<td class="qnacode">${dto.qnacode}</td>
	     						<td>
<%-- 	        						<a href="Qna_contentView?qnacode=${dto.qnacode}" class="move_link"> --%>
<%-- 	          							${dto.qnatitle} --%>
<!-- 	        						</a> -->
	        						<a href="${dto.qnacode}" class="move_link">
	          							${dto.qnatitle}
	        						</a>
	      						</td>
	      						<td class="qnaid">${dto.id}</td>
	      						<td>${dto.qnadate}</td>
	    					</tr>
	    					</c:forEach>
<!-- 	    					검색 -->
	    					<tr>
	    						<td colspan="6" style="height: 40px;">
	    							<div class="search_all">
	    								<form method="post" action="QnaSearchList" id="searchForm">
<!-- 	                    					<div> -->
												<select name="type" id="skey">
													<option value="ITP" <c:out value="${pageMaker.cri.type eq 'IT' ? 'selected' : ''}"/>>전체</option>
													<option value="I" <c:out value="${pageMaker.cri.type eq 'I' ? 'selected' : ''}"/>>아이디</option>
													<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
                     							</select>
<!--                     						</div> -->
<!-- 											<div class="form-group"> -->
												<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
												<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
												<input type="text" name="keyword" id="value" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
<!-- 											</div> -->
                  							<button type="submit" class="btn btn-default" style="font-size: small;">Search</button>
                 						</form>
                 					</div>
                    				<!-- 글작성 -->
                    				<div class="W_notice">
                    					<input type="button" class="write" value="Write" onclick="location.href='QnaLogincheck'">
				                    </div>
	    						</td>
	    					</tr>
	  					</table>
<!-- 						페이징 -->
						<nav aria-label="Page navigation example" style="position: relative; margin-top: 50px; left: 42%; right: 50%;">
							<ul class="pagination">
	                  			<c:if test="${pageMaker.prev}">
	                     			<li class="paginate_button">
	                        			<a href="${pageMaker.startPage - 1}">
	                           				[prev]
	                        			</a>
	                     			</li>
	                  			</c:if>
	                  			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                     			<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:white'":""}>
		                        		<a href="${num}">
		                           			${num}&nbsp;&nbsp;
		                        		</a>
	                     			</li>
	                  			</c:forEach>
	                  			<c:if test="${pageMaker.next}">
	                     			<li class="paginate_button">
	                        			<a href="${pageMaker.endPage + 1}">
	                           				[next]
	                        			</a>
	                     			</li>
	                  			</c:if>
	               			</ul>
	               		</nav>
					</div>
				</article>
			</section>
			
<!-- 			<form method="get" id="actionForm" action="Qna_list"> -->
			<form method="get" id="actionForm">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
   			</form>
<!-- 						@@@본문추가 구나현 -->

			<!-- 
    =================================================================
    우측 사이드바 레이아웃 세팅
    조은유   |   23-06-16      |                      사이드바 레이아웃 조정 
    ================================================================= 
    -->
			<!-- 우측사이드바 -->
			<aside id="aisdeRight">
               <div class="rightbar">
                   <div class="cart" style="position: absolute; top: 80px; right: 0px;">
                       <ul>
                           <c:if test="${ dto == null }">
            		 			<li><a href="login" style="color: black;">Cart</a></li>
              				</c:if>
              				<c:if test="${ dto != null }">
              					<li><a href="Gu_cart" style="width: 200px; color: black;">Cart</a></li>
              				</c:if>
                       </ul>
                   </div>
	<!-- 
    =================================================================
    로그인시 회원 이름 보이게 수정
      조은유    |   23-06-29       |                          
    =================================================================
    -->
					<div class="login"
						style="position: absolute; top: 160px; right: 0px;">
						<ul id="log_ul" style="width: 200px;">
							<!-- 로그인 하지 않은 상태 -->
							<c:if test="${ dto == null }">
								<li><a href="login">Log in</a></li>
								<li><a href="register">Register</a></li>
							</c:if>
							<!-- 로그인한 상태 -->
							<c:if test="${ dto != null }">
								<li>${dto.name} 님</li>
								
								<li><a href="logout">Log out</a></li>
							</c:if>

							<!-- 로그인 하지 않은 상태 -->
							<c:if test="${ dto == null }">
								<li><a href="login">Order</a></li>
							</c:if>
							<!-- 로그인한 상태 -->
							<c:if test="${ dto != null }">
								
								<li><a href="userOrder/userOrderList">Order</a></li>
							</c:if> 
							
							<!-- 로그인 하지 않은 상태 -->
							<c:if test="${ dto == null }">
								<li><a href="login">My Page</a></li>
							</c:if>
							<!-- 로그인한 상태 -->
							<c:if test="${ dto != null }">
								
								<li><a href="myPage">My Page</a></li>
							</c:if> 
						</ul>
					</div>
					 <!-- 검색기능 -->
<!-- 			        <div class="search" style="position: absolute; top: 600px; right: 10px;"> -->
<!-- 			          <form method="post" action="#"> -->
<!-- 			              <fieldset> -->
<!-- 			                  <input type="text" id="search"> -->
<!-- 	                  <a href="#"> -->
<!--                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"> -->
<!--                           <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/> -->
<!--                       </svg> -->
<!--                   </a> -->
<!--               </fieldset>     -->
<!--             </form> -->
          </div>
			</aside>

		</div>
	</main>
	<footer id="footer" style="font-family: notosans; text-align: left; margin-top: 30px">
		<a href="mainPage" style="color: black;">Room & Bloom</a> <br>
		<p style="line-height: 2em;">
			<a href="#">About us</a>
		</p>
	</footer>
	<div style="position: fixed; bottom: 5px; left: 50%; right: 50%;">
		<a href="#" style="font-size: xx-large;">^</a>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

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
   		var revcode = actionForm.find("input[name='qnacode']").val();
   		if (revcode != '') {//글번호에 내용이 있으면 삭제해줌
      		actionForm.find("input[name='qnacode']").remove();
   		}
      
//       페이지번호
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action","Qna_list");
		actionForm.submit();
	});
   
//    게시글 처리
	$(".move_lin").on("click", function(e){
		e.preventDefault();
		var targetBno = $(this).attr("href");
	
		var qnacode = actionForm.find("input[name='qnacode']").val();
		if (qnacode != '') {
	   		actionForm.find("input[name='qnacode']").remove();
		}
		actionForm.append("<input type='hidden' name='qnacode' value='"+targetBno+"'>");
		actionForm.attr("action","rev_contentView");
	});
	
	$(".move_link").on("click", function() {
		var qnaid = $(this).closest("tr").find(".qnaid").text();
		var qnacode = $(this).closest("tr").find(".qnacode").text();
		console.log("게시글아이디값 ==>"+qnaid);
		var qnacontentview = $(this).closest("tr").find(".qnacontentview")
		$.ajax({
			url: "QnaViewCheck",
			type: "POST",
			data: { id : qnaid },
			dataType: "json",
			success: function(result) {
				console.log("result값 == > "+result);
//		    	로그인 아이디 일치시 이동
				if (result == 2) {
// 					document.getElementById("qnacontentview").submit();
// 					document.getElementById("qnacontentview").submit();
			    	location.href = "Qna_contentView?qnacode="+qnacode;
// 			    	location.href = "Qna_contentView";
// 					qnacontentview.attr("action", "Qna_contentView").submit();
//					아이디가 일치하지 않는 경우
			    } else if (result == 1) {
			    	alert("권한이 없습니다.");
			    	location.href = "Qna_list";
//					로그인이 되어 있지 않은 경우, 로그인 페이지로 이동
			    } else if (result == 3){
			    	alert("로그인 정보가 없습니다.");
			    	location.href = "login";
			  	}
			},
			error: function () {
				alert("오류");
            }
		});
	});
</script>
</body>
</html>