<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
   <script src="https://cdn.tailwindcss.com"></script>
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

   <style>
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

      /* 카테고리 스크롤 */
      #scroll {
         display: flex;
         overflow-x: auto;
         -webkit-overflow-scrolling: touch;
         scrollbar-width: none; /* Firefox */
         scroll-behavior: smooth;
      }
      #scroll::-webkit-scrollbar {
         display: none;
      }
      #scroll > a {
         flex: 0 0 auto;
         width: 100px;
         margin-right: 70px;
         text-align: center;
      }

      .slider-button {
         position: absolute;
         top: 50%;
         margin-left: -30px;
         margin-right: -30px;
         transform: translateY(-50%);
         background-color: #45a049;
         color: white;
         border: none;
         border-radius: 50%;
         width: 40px;
         height: 40px;
         cursor: pointer;
         z-index: 1000;
      }

      .slider-button:hover {
         color: #45a049;
         background-color: white;
      }

      .prev {
         left: 5px;
      }

      .next {
         right: 5px;
      }

      div.sel{
         margin-left: 88%;
      }
   </style>
</head>
<body>


<div class="bg-white  text-gray-900  min-h-screen">
   <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8 sm:py-12 lg:py-16">
<div class="flex flex-col min-h-screen relative">

   <section class="py-8 px-6 md:px-8 bg-gray-100 relative">
      <button class="slider-button prev" onclick="slide(-1)">&#10094;</button>
      <button class="slider-button next" onclick="slide(1)">&#10095;</button>
      <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-6" id="scroll">
         <a class="flex flex-col items-center gap-2 hover:text-[#4CAF50] whitespace-nowrap"
            href="${root}?categorynum=0">
            <i class="bi bi-justify" style="font-size: 2em;"></i>
            <span>ALL</span>
         </a>
         <c:forEach var="ele" items="${categories}">
            <a class="flex flex-col items-center gap-2 hover:text-[#4CAF50] whitespace-nowrap"
               href="${root}?categorynum=${ele.categorynum}">
               <i class="${ele.categoryicon}" style="font-size: 2em;"></i>
               <span>${ele.categoryname}</span>
            </a>
         </c:forEach>
      </div>
   </section>
   <br>
   <section class="py-8 px-6 md:px-8">
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
         <c:forEach var="ele" items="${products}">
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
               <img src="https://kr.object.ncloudstorage.com/semi/panda/${ele.imagefilename}"
                    width="300" height="200" alt="Product" class="cursor-pointer rounded-t-lg object-cover w-full h-48" style="aspect-ratio:300/200;object-fit:cover"
                    onclick="location.href='${root}/product/detail?productnum=${ele.productnum}'"/>
               <div class="p-4">

                  <h3 class="cursor-pointer text-lg font-medium mb-2"
                      onclick="location.href='${root}/product/detail?productnum=${ele.productnum}'">
                        ${ele.producttitle}</h3>
                  <div class="mb-2">
                     <span class="text-gray-500 mr-1">${ele.productprice}원</span>
                     <span class="text-gray-500">${ele.productstatus}</span>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
   </section>
</div>

<!-- 위로 가는 버튼 -->
<button onclick="scrollToTop()" class="scroll-to-top" id="scrollToTopBtn">
   <i class="bi bi-caret-up-fill"></i>
</button>
   </div>
</div>
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

   // 슬라이드 버튼 기능
   function slide(direction) {
      const scrollContainer = document.getElementById('scroll');
      const scrollAmount = 300; // 원하는 스크롤 양 설정
      scrollContainer.scrollBy({
         top: 0,
         left: direction * scrollAmount,
         behavior: 'smooth'
      });
   }
</script>

</body>
</html>

