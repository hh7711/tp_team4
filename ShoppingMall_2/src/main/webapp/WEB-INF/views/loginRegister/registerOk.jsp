<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room and Bloom</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <style>
    

      /* @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
 */


aside, section, footer {
  margin: 3px;
  text-align: center;
}
footer{
  position: absolute;
  left:260px;
  font-size: small;
}
.container {
  display: flex;
  margin: 0 auto;
  margin-top: 80px;
  max-width:100%;
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
  flex-grow: 1;
  padding: auto;
  
}
#aisdeLeft {
flex-grow: 0;
width:200px;
padding: auto;
}
#section {flex-grow:1;}
#aisdeRight {
flex-grow: 0;
width:250px;
padding: auto;
}
#aisdeLeft ul li{
  list-style: none;
  text-align: left;
  font-size: small;
  line-height: 2em;
}
#aisdeRight ul li{
  list-style: none;
  text-align: right;
  margin-right: 30px;
  line-height: 2em;

}
a{
  text-decoration: none;
  color: gray;
}
.thumbnail{
  padding: 10px;
  width: 30%;
  display: inline-block;
}
section{margin-top: 40px;}
#log_ul{font-size: small;}
a:hover{
  color: black;
}
#prdImg img{
  max-width: 100%;

  height: auto; 
  display: block;
  overflow: hidden;
}
#search{
  border-top: none;
  border-left: none;
  border-right: none;
}
.loginbtn{
  border-top: none;
  border-left: none;
  border-right: none;
  border-bottom: none;
  width: 100px;
  height: 30px;

}

  </style>

<!-- Custom styles for this template -->
<!-- <link href="css/signin.css" rel="stylesheet"> -->

</head>

<body>

  <main id="main">
    <div class="container">

      <aside id="aisdeLeft">
        <div id="title">
          <a href="mainPage">
            <span style="font-size: x-large; position: absolute; left: 0px; color: black;  width: 200px;">Room & Bloom</span>
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
              <li>
                  Mon-Fri 10:00-19:00
                  <br>
                  Weekend,Holiday off
              </li>
          </ul>
      </div>        

      </aside>
    
    <!-- 
    =================================================================
    회원가입 완료 화면 
    조은유    |   23-07-04       |    프론트	   회원가입 완료 화면 설정
    =================================================================
    -->
    
    <!-- 본문 -->
      <section id="section" style="width: 600px;" >
        <article>
          <div id="article">
            <div style=" display: inline-block; margin-top: 130px;">
                <table style="width: 400px; border: 1px solid #ced4da;">
                    <form action="login" method="post">
                    <tr>
                        <td>
                            <strong>회원가입 완료</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ${registerOk.name}님 가입을 축하합니다!
                            <br>
                            (ID : ${registerOk.id} )
                        </td>
                    </tr>
                    <tr height="50px">
                        <td>
                            <input type="submit" value="Log in" name="loginbtn" class="loginbtn">
                        </td>
                    </tr>
                    </form>
                </table>
            </div>

          </div>
        </article>
      </section>


      <!-- 우측 사이드바 -->
      <aside id="aisdeRight">
        <div class="rightbar">
          <div class="cart" style="position: absolute; top: 80px; right: 0px;">
              <ul>
                  <li><a href="#" style="color: black; width: 200px;">Cart - 0</a></li>
              </ul>
          </div>
          <div class="login" style="position: absolute; top: 160px; right: 0px;">
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
          <form method="post" action="#">
              <fieldset>
                  <input type="text" id="search">
                  <a href="#">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                      </svg>
                  </a>
              </fieldset>    
            </form>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

