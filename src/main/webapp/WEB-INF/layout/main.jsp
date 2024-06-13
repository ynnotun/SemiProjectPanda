<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
   <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
   <style>
      body {
         font-family: 'Jua', sans-serif;
      }
      .category-section {
         padding: 20px;
         background-color: #f8f9fa;
      }
      .category-list {
         display: flex;
         overflow-x: auto;
         white-space: nowrap;
         margin: 30px 0;
      }
      .category-list::-webkit-scrollbar {
         display: none; /* 스크롤바 숨기기 */
      }
      .category-item {
         display: inline-block;
         text-align: center;
         cursor: pointer;
         margin-right: 50px;
         flex: 0 0 auto;
         width: 150px;
      }
      .category-item span {
         display: block;
         margin-top: 10px;
         font-size: 1.2em;
      }
      .product-section {
         padding: 20px;
      }
      .product-card {
         margin-bottom: 20px;
         border: 1px solid #e0e0e0;
         border-radius: 10px;
         overflow: hidden;
         transition: transform 0.2s;
      }
      .product-card:hover {
         transform: scale(1.05);
      }
      .product-card img {
         width: 100%;
         height: auto;
      }
      .product-info {
         padding: 10px;
      }
      .product-info h3 {
         font-size: 1.5em;
         margin-bottom: 10px;
      }
      .product-info p {
         margin-bottom: 5px;
         color: #555;
      }

      /* 위로 가는 버튼 */
      .scroll-to-top {
         position: fixed;
         bottom: 30px;
         right: 30px;
         display: none;
         width: 50px;
         height: 50px;
         background-color: #4CAF50;
         color: white;
         border: none;
         border-radius: 50%;
         text-align: center;
         font-size: 24px;
         line-height: 50px;
         cursor: pointer;
         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
         z-index: 1000;
         transition: all 0.3s ease;
      }
      .scroll-to-top:hover {
         background-color: #45a049;
      }
      div.sel{
         float: right;
      }
   </style>
</head>
<body>
   <div style="width: 100%; height: 150px; background-color: #4CAF50">
      <b style="color: black; font-size: 100px; margin-left: 40%;">PANDA 🐼</b>
   </div>

<section class="category-section">
   <div class="category-list">
      <div class="category-item" id="allcate">
         <i class="bi bi-list" style="font-size: 2em;"></i>
         <span>All</span>
      </div>
      <div class="category-item" id="fashioncate">
         <i class="bi bi-incognito" style="font-size: 2em;"></i>
         <span>패션/잡화</span>
      </div>
      <div class="category-item" id="digitalcate">
         <i class="bi bi-pc-display-horizontal" style="font-size: 2em;"></i>
         <span>디지털기기</span>
      </div>
      <div class="category-item" id="housecate">
         <i class="bi bi-house" style="font-size: 2em;"></i>
         <span>생활가전</span>
      </div>
      <div class="category-item" id="furniturecate">
         <i class="bi bi-lamp" style="font-size: 2em;"></i>
         <span>가구/인테리어</span>
      </div>
      <div class="category-item" id="hobbycate">
         <i class="bi bi-controller" style="font-size: 2em;"></i>
         <span>취미/게임/음반</span>
      </div>
      <div class="category-item" id="beauticate">
         <i class="bi bi-scissors" style="font-size: 2em;"></i>
         <span>뷰티</span>
      </div>
      <div class="category-item" id="bookcate">
         <i class="bi bi-book" style="font-size: 2em;"></i>
         <span>도서/티켓</span>
      </div>
      <div class="category-item" id="sportcate">
         <i class="bi bi-bicycle" style="font-size: 2em;"></i>
         <span>스포츠</span>
      </div>
      <div class="category-item" id="petcate">
         <i class="bi bi-piggy-bank" style="font-size: 2em;"></i>
         <span>반려동물용품</span>
      </div>
      <div class="category-item" id="othercate">
         <i class="bi bi-box2" style="font-size: 2em;"></i>
         <span>기타 중고물품</span>
      </div>
   </div>
</section>
   <div class="sel">
   <label for="choices">Filter</label>
   <select id="choices" name="choices">
      <option value="">최신순</option>
      <option value="">추천순(찜)</option>
      <option value="">낮은가격순</option>
      <option value="">높은가격순</option>
   </select>
   </div>
   <br>
   <hr>
   <%-- AJAX 통해 글 주르륵 --%>
   <c:forEach var="product" items="${products}">
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3><c:out value="${product.title}"/></h3>
               <p><c:out value="${product.price}"/></p>
               <p><c:out value="${product.location}"/></p>
            </div>
         </div>
      </div>
   </c:forEach>
   <section class="product-section">
   <div class="row">
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$50</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$75</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$100</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="product-card">
            <img src="https://via.placeholder.com/300x200">
            <div class="product-info">
               <h3>우사기 탁상시계</h3>
               <p>$80</p>
               <p>서울시 금천구 독산동</p>
            </div>
         </div>
      </div>
   </div>
</section>

<!-- 위로 가는 버튼 -->
<button onclick="scrollToTop()" class="scroll-to-top" id="scrollToTopBtn">
   <i class="bi bi-caret-up-fill"></i>
</button>

<script>
   // category 스크롤
   window.onscroll = function() {
      var scrollToTopBtn = document.getElementById("scrollToTopBtn");
      if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
         scrollToTopBtn.style.display = "block";
      } else {
         scrollToTopBtn.style.display = "none";
      }
   };

   // 위로 가는 버튼
   function scrollToTop() {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
   }

   // ajax
   function Category(category) {
      $.ajax({
         url: '?', // 게시글을 로드할 경로
         type: 'GET',
         data: { category: category },
         success: function(data) {
            $('#product-list').html(data);
         },
         error: function() {
            alert('비상');
         }
      });
   }

   // 각 카테고리 클릭 -> category클래스에 카테고리 이름 보냄
   $("#allcate").click(function (){
      category('all');
   });
   $("#fashioncate").click(function (){
      category('fashion');
   });
   $("#digitalcate").click(function (){
      category('digital');
   });
   $("#housecate").click(function (){
      category('house');
   });
   $("#fashioncate").click(function (){
      category('fashion');
   });
   $("#hobbycate").click(function (){
      category('hobby');
   });
   $("#beauticate").click(function (){
      category('beauti');
   });
   $("#bookcate").click(function (){
      category('book');
   });
   $("#sportcate").click(function (){
      category('sport');
   });
   $("#petcate").click(function (){
      category('pet');
   });
   $("#othercate").click(function (){
      category('other');
   });


   // 이미지 슬라이더
   const sliderImages = document.getElementById('sliderImages');
   const images = sliderImages.getElementsByTagName('img');
   let currentIndex = 0;

   document.getElementById('prevBtn').addEventListener('click', function() {
      currentIndex = (currentIndex > 0) ? currentIndex - 1 : images.length - 1;
      updateSlider();
   });

   document.getElementById('nextBtn').addEventListener('click', function() {
      currentIndex = (currentIndex < images.length - 1) ? currentIndex + 1 : 0;
      updateSlider();
   });

   function updateSlider() {
      const translateX = -currentIndex * 300; // 이미지의 너비에 맞게 조정
      sliderImages.style.transform = `translateX(${translateX}px)`;
   }

</script>
</body>
</html>

