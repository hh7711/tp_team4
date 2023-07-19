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
aside, footer {
	margin: 3px;
 	text-align: center;
	/* border: 1px solid black; */
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
	width: 230px;
	padding: auto;
}

#section {
	flex-grow: 1;
}

#aisdeRight {
	flex-grow: 0;
	width: 200px;
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

table {
margin: 5px auto;
border: 1px solid rgb(207, 207, 207);
width: 850px;
border-collapse: collapse;
margin-top: 10px;
}

th, td {
border: 1px solid rgb(207, 207, 207); 
border-collapse: collapse;
}

.div_page ul {
display: flex;
justify-content: center;
list-style: none;
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
					<a href="mainPage"> 
					<span style="font-size: x-large; position: absolute; left: 0px; color: black; width: 200px;">
						Room & Bloom</span>
					</a>
				</div>
				<div class="category" style="position: absolute; top: 70px;">
					<ul style="width: 200px;">
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
						<li><a href="noticePage">Notice</a></li>
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
	notice/list  
	조은유    |     23-07-05     |              프론트	화면 배열 , css 적용
	=================================================================
	-->
	
  <!-- 본문 -->
  <section id="section">
    <article>
      <div id="article">

	        <div style="text-align: center; margin-bottom: 10px;">Notice </div>
	        <div style="text-align: center; font-size: small; color: grey;">공지사항</div>
	        <!-- <h1 align="center">NOTICE 관리</h1> -->
	        <br>
	          
	        <table align="center" style="margin-bottom: 30px;">
	          <tr height="40px;">
	            <td width="50" align="center">No</td>
	            <td width="530" align="center">Subject</td>
	            <td width="70" align="center">Writer</td>
	            <td width="110" align="center">Date</td>
	          </tr>
	          <c:forEach items="${list}" var="dto">
	            <tr height="40px;">
	              <td align="center">${dto.noticode}</td>
	              <td>
	                <!-- content_view : 컨트롤러단 호출 --> 
	                <a href="content_view?noticode=${dto.noticode}" style="margin-left:10px;">${dto.notititle}</a>
	              </td>
	              <%-- <td>${dto.notiauth}</td> --%>
	              <td align="center">admin</td>
	              <td align="center">${dto.notidate}</td>
	            </tr>
	          </c:forEach>
	          <!-- 		<tr> -->
	          <!-- 			<td colspan="5"> -->
	          <!-- 				<a href="write_view">글작성</a> -->
	          <!-- 			</td> -->
	          <!-- 		</tr> -->
	        </table>
	        
	        <div class="div_page" style="margin-top:50px;">
	          <ul class="pagination">
	            <c:if test="${pageMaker.prev}">
	              <li class="paginate_button" style="margin-right: 5px;">
	                <!-- 시작페이지 - 1 하면 이전의 10개 페이지 표시 --> 
	                <!-- ex>11->10(1~10), 21->20(11~20) -->
	                <a href="${pageMaker.startPage - 1}"> [이전] </a>
	              </li>
	            </c:if>
	            <c:forEach var="num" begin="${pageMaker.startPage}"
	              end="${pageMaker.endPage}">
	              <li class="paginate_button" style="width:30px; height:30px;"
	                ${pageMaker.cri.pageNum == num ? "style='background-color:white'":""}>
	                <!-- 클릭한 현재페이지 번호를 링크로 연결 --> 
	                <a href="${num}"> ${num} </a>
	              </li>
	            </c:forEach>
	            <c:if test="${pageMaker.next}">
	              <li class="paginate_button">
	                <!-- 끝페이지 + 1 하면 이후의 10개 페이지 표시 --> 
	                <!-- ex>10->11(11~20), 20->21(21~30) -->
	                <a href="${pageMaker.endPage + 1}"> [다음] </a>
	              </li>
	            </c:if>
	          </ul>
	        </div>
	
	        <form method="get" id="actionForm" action="#">
	          <input type="hidden" name="pageNum"
	            value="${pageMaker.cri.pageNum}"> 
	            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	        </form>
        
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
					<div class="cart"
						style="position: absolute; top: 80px; right: 0px;">
<!-- 						<ul> -->
<!-- 							<li><a href="#" style="width: 200px;">Cart - 0</a></li> -->
<!-- 						</ul> -->
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
			        <div class="search" style="position: absolute; top: 600px; right: 10px;">
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
	<footer id="footer" style="font-family: notosans; text-align: left;">
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
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//페이징
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
	//기본 동작 막음: 페이지 링크를 통해서 이동
	e.preventDefault();
	console.log("click~!!!");
	console.log("@# href ===>"+$(this).attr("href"));
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.attr("action", "list");
	actionForm.submit();
	});
</script>