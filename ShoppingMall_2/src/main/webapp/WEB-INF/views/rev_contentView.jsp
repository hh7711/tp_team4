<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	text-align: left;
}
table {
	margin-left:auto; margin-right:auto;
}
.list {
	float: left; width: 100px; border: 1px solid #ccc; font-size: small; width: 80px; height: 30px; border-radius: 5px;
	margin-left: 10px; margin-bottom: 15px;
}
.delete{
	width: 100px; border: 1px solid #ccc; font-size: small; width: 80px; height: 30px; border-radius: 5px;
}
.edit {
	float: right; width: 100px; color: white; background-color: black; 
	border: none; font-size: small; width: 80px; height: 30px; border-radius: 5px;
	margin-right: 10px;
}
.list:hover {
	background: white; 
}
.delete:hover {
	background: white; 
}
.edit:hover {
	background: white; color: black; border: 1px solid #ccc;
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
    구나현	리뷰자세히보기, 
    		관리자가 단 리뷰 댓글만 볼 수있게 함
    =================================================================
    -->
			<!-- 본문 -->
			<section id="section" style="width: 600px;">
				<article style="margin-left: 40px">
					<div id="article" style="height: auto;">

<!-- 						@@@@본문 구나현 -->
						<div>Review<p>상품 후기</p></div>
						<table>
							<tr>
								<td>
									<a href="#">
	                					<img src="${rev_contentView.proimg}" alt="오류" style="width: 130px; margin: 15px;">
	        						</a>
								</td>
								<td style="width: 600px;">
									<div style="margin-left: 20px; margin-bottom: 5px;"><b>${rev_contentView.proname}</b></div>
									<div style="margin-left: 20px; margin-bottom: 10px;">
									<input type="hidden" id="cartcode" value="${rev_contentView.cartcode}">
										[옵션 : <span id="op1"></span> 
										/ <span id="op2"></span>]
									</div>
									<div style="margin-left: 20px;">
										<b>\</b>
										<fmt:formatNumber value="${rev_contentView.proprice}" pattern="#,###" />
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="margin: 35px;">
										<div style="margin-bottom: 15px;">${rev_contentView.revtitle}</div>
										<div>
											<span>Writer</span>&nbsp;&nbsp;<span style="color: black;">${rev_contentView.id}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>Date</span>&nbsp;&nbsp;<span style="color: black;">${rev_contentView.revdate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>Hit</span>&nbsp;&nbsp;<span style="color: black;">${rev_contentView.revhit}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="margin-left: 35px; margin-right: 35px; margin-top: 40px; margin-bottom: 40px;">
										<div style="color: black;">${rev_contentView.revcont}</div>
									</div>	
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="margin-top: 15px;">
										<input type="button" value="List" class="list" onclick="location.href='rev_list'">
									</div>
									<div style="float: right;">
										<input type="button" value="Delete" class="delete" id="deleteBtn">&nbsp;&nbsp;
										<input type="button" value="Edit" class="edit" id="editBtn">
									</div>
								</td>
							</tr>
						</table>
						<form method="post" action="rev_modifyView" id="contentEditForm">
							<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">			
							<input type="hidden" name="amount" value="${pageMaker.amount}">			
							<input type="hidden" name="revcode" value="${pageMaker.revcode}">
							<input type="hidden" name="revcode" value="${rev_contentView.revcode}">
							<input type="hidden" name="revtitle" value="${rev_contentView.revtitle}"> 
							<input type="hidden" name="revcont" value="${rev_contentView.revcont}"> 
							<input type="hidden" name="id" id="revid" value="${rev_contentView.id}"> 
							<input type="hidden" name="revdate" value="${rev_contentView.revdate}"> 
							<input type="hidden" name="cartcode" value="${rev_contentView.cartcode}"> 
							<input type="hidden" name="proprice" value="${rev_contentView.proprice}"> 
							<input type="hidden" name="proname" value="${rev_contentView.proname}"> 
							<input type="hidden" name="proimg" value="${rev_contentView.proimg}">
						</form>
						<form method="post" action="rev_delete" id="contentDeleteForm">
							<input type="hidden" name="revcode" value="${rev_contentView.revcode}">
							<input type="hidden" name="id" id="revid" value="${rev_contentView.id}"> 
						</form>
<!-- 						@@@@본문 구나현 -->
<!-- 					댓글목록 구나현 -->
						<table style="margin-top: 20px; width: 550px;">
							<c:forEach items="${RevCmtList}" var="cmt">
								<tr>
									<td colspan="2" style="width: 600px">
										<div style="margin: 13px;">
											<span><b>Room and Bloom</b></span>&nbsp;&nbsp;
											<span>${cmt.cmtdate}</span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="margin: 20px; color: black;">${cmt.cmtcont}</div>
									</td>
								</tr>
							</c:forEach>
						</table>
<!-- 					댓글목록 구나현 -->
					</div>
				</article>
			</section>

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
		var cartcodeText = $("#cartcode").val();
// 		console.log("cartcodeText ==>"+cartcodeText);
		
			var regex = /\/([^/]+)\/([^/]+)$/;
			var matches = cartcodeText.match(regex);

			if (matches && matches.length === 3) {
				var color = matches[1];
				var size = matches[2];
// 				옵션1,2 나눠진값 화면에 보임
				$("#op1").text(color);
				$("#op2").text(size);
			} else {
    			console.log("오류");
    		}
			
		$("#editBtn").on("click", function() {
			var revid = $("#revid").val();
			console.log("아이디값 ==>"+revid);
			$.ajax({
				url: "EDloginCheck",
				type: "POST",
				data: { id : revid },
				dataType: "json",
				success: function(result) {
					console.log("result값 == > "+result);
//			    	로그인 아이디 일치시 수정 화면으로 이동
					if (result == 2) {
						document.getElementById("contentEditForm").submit();
// 					아이디가 일치하지 않는 경우
				    } else if (result == 1) {
				    	alert("작성자가 아니라 수정할 수 없습니다.");
				    	location.href = "rev_list";
// 					로그인이 되어 있지 않은 경우, 로그인 페이지로 이동
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
		
		
		$("#deleteBtn").on("click", function() {
			var revid = $("#revid").val();
			console.log("아이디값 ==>"+revid);
			$.ajax({
				url: "EDloginCheck",
				type: "POST",
				data: { id : revid },
				dataType: "json",
				success: function(result) {
					console.log("result값 == > "+result);
//			    	로그인 아이디 일치시 삭제
					if (result == 2) {
							console.log("왜안됨?");
						if(confirm("리뷰 삭제를 하시겠습니까?")){
							document.getElementById("contentDeleteForm").submit();
							alert("정상적으로 삭제되었습니다.");
						}else{
						}
// 					아이디가 일치하지 않는 경우
				    } else if (result == 1) {
				    	alert("작성자가 아니라 삭제할 수 없습니다.");
				    	location.href = "rev_list";
// 					로그인이 되어 있지 않은 경우, 로그인 페이지로 이동
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