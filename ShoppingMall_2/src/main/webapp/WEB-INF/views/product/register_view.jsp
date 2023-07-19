<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Room and Bloom</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

      <style>
        aside,
        footer {
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
          flex-grow: 1;
          padding: auto;
          margin-bottom: 150px;
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

        section {
          margin-top: 40px;
        }

        #log_ul {
          font-size: small;
        }

        a:hover {
          color: black;
        }

        #search {
          border-top: none;
          border-left: none;
          border-right: none;
        }

        td {
          font-size: large;
        }

        input {
          height: 50px;
        }

        .btn {
          background-color: #508FED;
          color: white;
          border: 1px solid #ced4da;
          border-radius: 3px;
          width: 70px;
          height: 30px;
          line-height: 10px;
        }

        .btn:hover {
          background-color: #467DCF;
          color: white;
        }

        input {
          width: 200px;
          height: 40px;
        }
      </style>
    </head>

    <body>

      <main id="adminMain2">
        <div class="container">

          <aside id="aisdeLeft">
            <div id="title">
              <a href="/ShoppingMall/mainPage">
                <span style="font-size: x-large; position: absolute; left: 0px; color: black; width: 200px;">
                  Room & Bloom
                </span>
              </a>
            </div>
            <div class="category" style="position:absolute; top:70px;">
              <ul style="width: 200px;">
                <li><a href="/ShoppingMall/notice/list">공지사항</a></li>
                <li><a href="/ShoppingMall/mem_mgmt/memberList">회원 관리</a></li>
                <li><a href="/ShoppingMall/product/productList">상품 관리</a></li>
                <li><a href="/ShoppingMall/order/orderListPaging">주문 현황</a></li>
              </ul>
            </div>
            <div class="notice" style="position: absolute; top: 400px;">
              <ul>
                <li><a href="/ShoppingMall/noticePage">Notice</a></li>
                <li><a href="/ShoppingMall/QnAPage">QnA</a></li>
                <!-- <li><a href="/ShoppingMall/tp_main_review.html">Review</a></li> -->
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
    register_view 
    조은유    |     23-07-07     |              프론트	화면 배열 , css 적용
    =================================================================
    -->

          <!-- 본문 -->
          <section id="section">
            <article>
              <div id="article">

                <div style="margin-bottom: 30px;">
                  <h2 align="center" style="color:#508FED;">상품 등록</h2>
                </div>

                <table align="center">
                  <form method="post" action="register">
                    <tr>
                      <td>상품명</td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" required name="proName" size="70" placeholder=" ">
                      </td>
                    </tr>
                    <tr class="div_color_size">
                      <td>색상</td>
                    </tr>
                    <tr class="div_color_size">
                      <td>
                        <input type="text" class="color_size_input" name="color1" size="70" placeholder="1">
                        <input type="text" class="color_size_input" name="color2" size="70" placeholder="2">
                        <input type="text" class="color_size_input" name="color3" size="70" placeholder="3">
                      </td>
                    </tr>
                    <tr class="div_color_size">
                      <td>사이즈</td>
                    </tr>
                    <tr class="div_color_size">
                      <td>
                        <input type="text" class="color_size_input" name="size1" size="70" placeholder="1">
                        <input type="text" class="color_size_input" name="size2" size="70" placeholder="2">
                        <input type="text" class="color_size_input" name="size3" size="70" placeholder="3">
                      </td>
                    </tr>
                    <tr>
                      <td>가격</td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" required name="proPrice" size="70" placeholder=" ">
                      </td>
                    </tr>
                    <tr>
                      <td>세일가</td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" name="proSale" size="70" placeholder=" ">
                      </td>
                    </tr>
                    <tr>
                      <td>수량</td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" required name="proQty" size="70" placeholder=" ">
                      </td>
                    </tr>
                    <tr>
                      <td>썸네일</td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" required name="proThumb" size="70" placeholder=" ">
                      </td>
                    </tr>
                    <tr>
                      <td>카테고리</td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" required name="cateCode" size="70" placeholder=" ">
                      </td>
                    </tr>
                    <tr>
                      <td>상세이미지</td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" required name="proImg" size="70" placeholder=" ">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        &nbsp;
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2">
                        <textarea name="proInfo" cols="80" rows="10"></textarea>
                      </td>
                    </tr>
                    <tr style="float:left">
                      <td><input type="submit" value="등록" class="btn"></td>
                    </tr>
                    <tr style="float:left">
                      <td>
                        <a href=productList>
                          <input type="button" value="목록보기" class="btn" style="width: 90px;">
                        </a>
                      </td>
                    </tr>
                  </form>
                </table>

              </div>
            </article>
          </section>


          <!-- 우측 사이드바 -->
          <aside id="aisdeRight">
            <div class="rightbar">
              <div class="cart" style="position: absolute; top: 80px; right: 0px;">

              </div>
              <div class="login" style="position: absolute; top: 160px; right: 0px;">
                <ul id="log_ul" style="width: 200px;">
                  	<!--                      로그인한 상태 -->
                     <c:if test="${ admindto != null }">
                        <li>${admindto.id} 님</li>
                        <li><a href="/ShoppingMall/logout">Log out</a></li>
                     </c:if> 
                </ul>
              </div>
              <!-- 검색기능 -->
              <!-- <div class="search"
						style="position: absolute; top: 600px; right: 10px;">
						<form method="post" action="#">
							<fieldset>
								<input type="text" id="search" style="width: 120px;"> 
								<a href="/ShoppingMall/#"> 
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                          		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                      			</svg>
								</a>
							</fieldset>
						</form> -->
            </div>
          </aside>
        </div>
      </main>
      <footer id="footer" style="font-family: notosans; text-align: left;">
        <a href="/ShoppingMall/adminMain2" style="color: black;">Room & Bloom</a> <br>
        <p style="line-height: 2em;">
          <a href="#">About us</a>
        </p>
      </footer>
      <div style="position: fixed; bottom: 5px; left: 50%; right: 50%;">
        <a href="#" style="font-size: xx-large;">^</a>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    </body>

    </html>