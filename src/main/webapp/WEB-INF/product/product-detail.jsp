<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 13.
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.7.1/mo.umd.js"></script>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <title></title>
    <style>
        *:hover {
        }

        /*하트스타일*/
        .button#heart {
            float: right;
            width: 50px;
            height: 50px;
            border-radius: 5px;
            background: none;
            cursor: pointer;
            transition: background 0.5s ease;
            scale: 0.5;
        }

        .active#heart:before, .active#heart:after {
            background: red !important;
        }

        #heart {
            width: 100px;
            height: 45px;
            transition: background 0.5s ease;
        }

        #heart:before,
        #heart:after {
            transition: background 0.5s ease;
            position: absolute;
            content: "";
            left: 50px;
            top: 0;
            width: 50px;
            height: 80px;
            background: dimgrey;
            border-radius: 50px 50px 0 0;
            transform: rotate(-45deg);
            transform-origin: 0 100%;
        }

        #heart:after {
            left: 0;
            transform: rotate(45deg);
            transform-origin: 100% 100%;
        }


        /*<!-- Link Swiper's CSS -->*/
        /*<!-- Demo styles -->*/
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        .swiper {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        body {
            background: #000;
            color: #000;
        }

        .swiper {
            width: 100%;
            height: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .swiper-slide {
            background-size: cover;
            background-position: center;
        }

        .mySwiper2 {
            height: 80%;
            width: 100%;
        }

        .mySwiper {
            height: 20%;
            box-sizing: border-box;
            padding: 10px 0;
        }

        .mySwiper .swiper-slide {
            width: 25%;
            height: 100%;
            opacity: 0.4;
        }

        .mySwiper .swiper-slide-thumb-active {
            opacity: 1;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 0.5rem;
        }


        /*드롭다운 스타일*/
        .dropdown {
            position: absolute;
            display: none;
            top: 0;
            right: 0;
        }

        <c:if test="${sessionScope.usernum eq productDto.usernum and productDto.productstatus eq '판매 중'}">
        .dropdown {
            display: block;
        }

        </c:if>

        .chat-menu {
            transform: translate(0, 10%);
            cursor: pointer;
        }

        .drop-content {
            width: 70px;
            text-align: center;
            vertical-align: middle;
            height: auto;
            border-radius: 5px;
            border: 1px solid #dcdcdc;

            background-color: #f4f4f4;
            position: absolute;
            top: 0;
            right: 0;
            transform: translateX(105%);
            z-index: 1;
        }

        .drop-content a {
            display: block;
            font-size: 14px;
            padding: 2px;
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .drop-content a:hover {
            background-color: #e3e3e3;
        }
    </style>
</head>
<body>

<!--
// v0 by Vercel.
// https://v0.dev/t/4WkJbGjVd8r
-->
<div class="bg-white  text-gray-900  min-h-screen">
    <button onclick="login()">login</button>
    <button onclick="logout()">logout</button>
    <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8 sm:py-12 lg:py-16">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 lg:gap-12">
            <div class="h-screen">
                <!-- Swiper -->

                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff"
                     class="swiper mySwiper2 rounded-lg">
                    <div class="swiper-wrapper">
                        <c:forEach items="${imageDtoList}" var="imageDto">
                            <div class="swiper-slide">
                                <img src="https://kr.object.ncloudstorage.com/semi/panda/${imageDto.imagefilename}"/>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <c:forEach items="${imageDtoList}" var="imageDto">
                            <div class="swiper-slide">
                                <img src="https://kr.object.ncloudstorage.com/semi/panda/${imageDto.imagefilename}"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Swiper JS -->
                <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

                <!-- Initialize Swiper -->
                <script>
                    var swiper = new Swiper(".mySwiper", {
                        loop: true,
                        spaceBetween: 10,
                        slidesPerView: 4,
                        freeMode: true,
                        watchSlidesProgress: true,
                    });
                    var swiper2 = new Swiper(".mySwiper2", {
                        loop: true,
                        spaceBetween: 10,
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev",
                        },
                        thumbs: {
                            swiper: swiper,
                        },
                    });
                </script>

            </div>
            <div class="grid gap-6">
                <div>
                    <h1 class="text-3xl font-bold text-[black]">${productDto.producttitle}
                        <c:if test="${sessionScope.usernum != null}">
                            <%--찜버튼, class에 active 넣으면 활성화--%>
                            <div id='heart' class='button'></div>
                        </c:if>
                    </h1>
                    <p class="text-lg text-gray-500 " id="productAddress">
                        ${productDto.productaddress}
                    </p>
                    <div class="flex items-center justify-between my-3">
                        <div class="text-4xl font-bold text-[#4CAF50]">
                            <fmt:formatNumber value="${productDto.productprice}" type="currency"/>
                        </div>
                    </div>
                    <div class="flex items-center gap-2">
                            <span class="relative flex shrink-0 overflow-hidden rounded-full w-10 h-10 border-2 border-[#4CAF50]">
                                <img class="aspect-square h-full w-full" alt="Seller"
                                     src="https://generated.vusercontent.net/placeholder-user.jpg"/>
                            </span>
                        <div>
                            <div class="font-medium text-[black]">${productUserDto.username}</div>
                            <div class="text-sm text-gray-500 ">Top Seller</div>
                        </div>

                    </div>
                    <div class="prose max-w-none">
                        <h2 class=" text-[black] font-bold text-2xl my-3">Item Description</h2>
                        <p class=" text-[black]">
                            ${productDto.productcontent}
                        </p>
                    </div>
                </div>
                <div class="grid gap-4">
                    <p>${productDto.productaddress}</p>
                    <!-- 지도를 표시할 div 입니다 -->
                    <div id="map" style="width:100%;height:250px;"></div>


                    <div class="flex gap-4">
                        <c:if test="${(sessionScope.usernum eq productDto.usernum or sessionScope.usernum eq productDto.customernum) and productDto.productstatus eq '예약 중'}">
                            <button
                                    class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-gray-0 text-gray-900 h-11 rounded-md px-8 border-1 border-black hover:bg-gray-200"
                                    onclick="alertReserveCancelBtn()"
                            >
                                예약 취소
                            </button>
                            <button
                                    class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-gray-900 text-white h-11 rounded-md px-8"
                                    onclick="alertCompleteBtn()"
                            >
                                거래 완료
                            </button>
                        </c:if>

                        <c:if test="${sessionScope.usernum != productDto.usernum and (productDto.productstatus eq '예약 중' or productDto.productstatus eq '판매 중')}">
                            <button
                                    class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#4CAF50] text-white h-11 rounded-md px-8 border-[#4CAF50]"
                                    onclick="alertOpenChatting()"
                            >
                                Chat Now
                            </button>
                            <div class="hidden fixed inset-0 z-50 bg-black/80" id="alertBg"
                                 style="pointer-events: auto;" data-aria-hidden="true" aria-hidden="true"></div>
                            <div class="hidden fixed left-[50%] top-[40%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-white p-6 shadow-lg duration-200 sm:rounded-lg sm:max-w-[400px]"
                                 id="alertContent"
                            >
                                <div class="flex flex-col space-y-1.5 text-center sm:text-left">
                                    <h2
                                            class="whitespace-nowrap text-lg font-semibold leading-none tracking-tight"
                                    >Alert</h2>
                                </div>
                                <p class="text-sm text-muted-foreground my-3">로그인을 하셔야 채팅 신청이 가능합니다.</p>
                                <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
                                    <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2"
                                            onclick="alertClose()"
                                    >Cancel
                                    </button>
                                    <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 hover:bg-blue-500 bg-blue-500 text-white h-10 px-4 py-2"
                                            onclick="location.href=`/login`"
                                    >Login
                                    </button>
                                </div>
                                <button type="button"
                                        class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground"
                                        onclick="alertClose()"
                                >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="lucide lucide-x h-4 w-4">
                                        <path d="M18 6 6 18"></path>
                                        <path d="m6 6 12 12"></path>
                                    </svg>
                                    <span class="sr-only">Close</span></button>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.usernum eq productDto.usernum and productDto.productstatus eq '판매 중'}">

                            <button
                                    class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#E5E7EB] text-[black] h-11 rounded-md px-8 border-[#4CAF50] hover:bg-blue-500 hover:text-white"
                                    onclick="location.href=`./update`"
                            >
                                Update
                            </button>

                            <button
                                    class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#E5E7EB] text-[black] h-11 rounded-md px-8 border-[#4CAF50] hover:bg-red-500 hover:text-white"
                                    onclick="deleteProductBtn()"
                            >
                                Delete
                            </button>
                            <div class="hidden fixed inset-0 z-50 bg-black/80"
                                 id="deleteBg"
                                 style="pointer-events: auto;" data-aria-hidden="true" aria-hidden="true"></div>
                            <div
                                    class="hidden bg-white fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg sm:max-w-[425px]"
                                    style="pointer-events: auto;"
                                    id="deleteContent"
                            >
                                <div class="flex flex-col space-y-1.5 text-center sm:text-left"><h2
                                        class="whitespace-nowrap text-lg font-semibold leading-none tracking-tight"
                                >글 삭제</h2></div>

                                <p class="text-sm text-muted-foreground mt-2">
                                <p>이 글을 삭제하시겠습니까?</p>
                                <div class="my-3">
                                    <p>계속 진행하시면,</p>
                                    <ul class="list-disc pl-6">
                                        <li>해당 제품이 삭제됩니다.</li>
                                        <li>해당 제품을 다시 등록하셔야됩니다.</li>
                                    </ul>
                                </div>

                                <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
                                    <button class="bg-red-500 inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background
                                                   text-gray-100 hover:text-red-500 transition-colors hover:bg-red-100 h-10 px-4 py-2"
                                            onclick="deleteProduct()"
                                    >글 삭제하기
                                    </button>
                                    <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors
                                                    border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2"
                                            onclick="deleteCancel()"
                                    >cancel
                                    </button>
                                </div>
                                <button type="button"
                                        class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2
                                        focus:ring-ring focus:ring-offset-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="lucide lucide-x h-4 w-4"
                                         onclick="deleteCancel()">
                                        <path d="M18 6 6 18"></path>
                                        <path d="m6 6 12 12"></path>
                                    </svg>
                                    <span class="sr-only">Close</span></button>
                            </div>
                        </c:if>


                    </div>
                    <script type="text/javascript"
                            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e18b4a131af7b6c7a7ea0d069757da3a&libraries=services"></script>

                    <script>

                        var locationX = ${productDto.productlocationx};
                        var locationY = ${productDto.productlocationy};
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(locationX, locationY), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };

                        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        var point = new kakao.maps.LatLng(locationX, locationY);
                        marker = new kakao.maps.Marker({position: point});
                        marker.setMap(map);
                        getAddr();

                        function getAddr() {
                            let geocoder = new kakao.maps.services.Geocoder();
                            let callback = function (result) {
                            }
                            geocoder.coord2Address(point.getLng(), point.getLat(), callback);
                        }
                    </script>
                </div>
            </div>
        </div>


        <!--
        채팅 신청 로그
        // v0 by Vercel.
        // https://v0.dev/t/5ItBx9Nadon
        -->

        <div class="flex flex-col bg-white">
            <div class="flex-1 overflow-y-auto p-4">
                <div class="space-y-4" id="chatArea">


                    <%--                    &lt;%&ndash;                    구매자 채팅 시작&ndash;%&gt;--%>
                    <%--                    <div class="flex items-start gap-3">--%>
                    <%--                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">--%>
                    <%--                          <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">--%>
                    <%--                              <img class="aspect-square h-full w-full" alt="Seller"--%>
                    <%--                                   src="https://generated.vusercontent.net/placeholder-user.jpg"/>--%>
                    <%--                          </span>--%>
                    <%--                        </span>--%>
                    <%--                        <div class="bg-[#4CAF50] text-white px-4 py-2 rounded-lg max-w-[75%] relative">--%>
                    <%--                            <p class="font-medium">John Doe</p>--%>
                    <%--                            <p>John Doe님이 채팅을 시작하였습니다.</p>--%>


                    <%--                            <div class="dropdown">--%>
                    <%--                                <span class="material-symbols-outlined chat-menu"--%>
                    <%--                                      onclick="">more_vert</span>--%>
                    <%--                                <div style="display: none;" class="drop-content">--%>
                    <%--                                    <a class="text-gray-900"--%>
                    <%--                                       onclick="alertChatLogOpen()"--%>
                    <%--                                    >거래예약</a>--%>
                    <%--                                    <a href='#'>거래완료</a>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>

                    <%--                        </div>--%>
                    <%--                    </div>--%>


                    <%--                    &lt;%&ndash;                    판매자 채팅&ndash;%&gt;--%>
                    <%--                    <div class="flex items-start gap-3 justify-end">--%>
                    <%--                        <div class="bg-gray-200 text-gray-900 px-4 py-2 rounded-lg max-w-[75%]">--%>
                    <%--                            <p class="font-medium">Jane Smith</p>--%>
                    <%--                            <p>John Doe님과 거래 예약되었습니다.</p>--%>
                    <%--                        </div>--%>
                    <%--                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center">--%>
                    <%--                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JS</span>--%>
                    <%--                        </span>--%>
                    <%--                    </div>--%>


                    <%--                    &lt;%&ndash;                    판매자 채팅&ndash;%&gt;--%>
                    <%--                    <div class="flex items-start gap-3 justify-end">--%>
                    <%--                        <div class="bg-gray-200 text-gray-900 px-4 py-2 rounded-lg max-w-[75%]">--%>
                    <%--                            <p class="font-medium">Jane Smith</p>--%>
                    <%--                            <p>John Doe님과 거래 완료되었습니다.</p>--%>
                    <%--                        </div>--%>
                    <%--                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center">--%>
                    <%--                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JS</span>--%>
                    <%--                        </span>--%>
                    <%--                    </div>--%>


                </div>
                <div class="hidden fixed inset-0 z-50 bg-black/80" id="alertChatLogBG"
                     style="pointer-events: auto;" data-aria-hidden="true" aria-hidden="true"></div>
                <div class="hidden fixed left-[50%] top-[40%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-white p-6 shadow-lg duration-200 sm:rounded-lg sm:max-w-[400px]"
                     id="alertChatLogContent"
                >
                    <div class="flex flex-col space-y-1.5 sm:text-left">
                        <h2
                                class="whitespace-nowrap text-lg font-semibold leading-none tracking-tight"
                                id="alertChatLogTitle"
                        >Alert</h2>
                    </div>
                    <p class="text-sm text-muted-foreground my-3" id="alertChatLogText"></p>
                    <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
                        <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2"
                                onclick="alertChatLogClose()"
                        >Cancel
                        </button>
                        <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 hover:bg-blue-500 bg-blue-500 text-white h-10 px-4 py-2"
                                id="alertChatLogOkBtn"
                        >Login
                        </button>
                    </div>
                    <button type="button"
                            class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground"
                            onclick="alertChatLogClose()"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                             fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                             stroke-linejoin="round" class="lucide lucide-x h-4 w-4">
                            <path d="M18 6 6 18"></path>
                            <path d="m6 6 12 12"></path>
                        </svg>
                        <span class="sr-only">Close</span></button>
                </div>
            </div>

        </div>


    </div>
</div>


<script>
    var el = document.querySelector('.button#heart'),
        // mo.js timeline obj
        timeline = new mojs.Timeline(),

        // tweens for the animation:

        // burst animation
        tween1 = new mojs.Burst({
            parent: el,
            radius: {0: 100},
            angle: {0: 45},
            y: -10,
            count: 10,
            radius: 100,
            children: {
                shape: 'circle',
                radius: 30,
                fill: ['red', 'white'],
                strokeWidth: 15,
                duration: 500,
            }
        });
    $(document).ready(function () {
        var scaleCurve = mojs.easing.path('M0,100 L25,99.9999983 C26.2328835,75.0708847 19.7847843,0 100,0');


        tween2 = new mojs.Tween({
            duration: 900,
            onUpdate: function (progress) {
                var scaleProgress = scaleCurve(progress);
                el.style.WebkitTransform = el.style.transform = 'scale3d(' + scaleProgress + ',' + scaleProgress + ',1)';
            }
        });
        tween3 = new mojs.Burst({
            parent: el,
            radius: {0: 100},
            angle: {0: -45},
            y: -10,
            count: 10,
            radius: 125,
            children: {
                shape: 'circle',
                radius: 30,
                fill: ['white', 'red'],
                strokeWidth: 15,
                duration: 400,
            }
        });

// add tweens to timeline:
        timeline.add(tween1, tween2, tween3);


// when clicking the button start the timeline/animation:
        $(".button#heart").click(function () {
            var username = ${sessionScope.usernum};
            var productnum = ${productDto.productnum};
            toggleWish(username, productnum);
        });

        let wishCheck = ${wishCheck};
        if (wishCheck === 1) {
            $(".button#heart").addClass('active');
        }


    });

    // 위시리스트에 추가/삭제
    async function toggleWish(usernum, productnum) {
        try {
            const response = await fetch(`/product/wish?usernum=\${usernum}&productnum=\${productnum}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            });

            const data = await response.json();
            console.log(data);

            if (data.status === 'wish add') {
                // 위시리스트에 추가됨
                console.log('위시리스트에 추가되었습니다.');
                timeline.play();
                $(".button#heart").addClass('active');

            } else if (data.status === 'wish delete') {
                // 위시리스트에서 삭제됨
                console.log('위시리스트에서 삭제되었습니다.');
                $(".button#heart").removeClass('active');
            }
        } catch (error) {
            console.error('Error:', error);
        }
    }
</script>


<%--오픈채팅 버튼--%>
<script>
    function openChatting() {
        fetch('./chat', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                "productnum": "${productDto.productnum}",
                "productUserNum": "${productDto.usernum}"
            })
        })
            .then(response => {
                console.log(response);
                if (response.ok) {
                    createChattingRoom(${productDto.productnum});
                } else {
                    // 등록 실패 처리
                    alert("fail");
                }
            })
            .catch(error => {
                // 네트워크 오류 처리
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
    }

    async function createChattingRoom(productnum) {
        try {
            const response = await fetch('/chatting/room', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({productnum})
            });

            const data = await response.json();

            if (data.status === 'success') {
                // 채팅방 생성 성공
                // 채팅방 번호를 사용하여 채팅 페이지로 이동
                window.location.href = "/chatting/" + data.chatRoomNum;
            } else {
                // 채팅방 생성 실패
                console.error('Failed to create chatting room');
            }
        } catch (error) {
            console.error('Error creating chatting room:', error);
        }
    }


    function alertClose() {
        document.getElementById("alertBg").style.display = "none";
        document.getElementById("alertContent").style.display = "none";
    }

    function alertOpen() {
        document.getElementById("alertBg").style.display = "block";
        document.getElementById("alertContent").style.display = "block";
    }

    function alertOpenChatting() {
        let connectUser = "${sessionScope.usernum}";
        if (connectUser === "") {
            alertOpen()
            return;
        } else {
        }
        document.getElementById("alertChatLogBG").style.display = "block";
        document.getElementById("alertChatLogContent").style.display = "block";

        document.getElementById("alertChatLogText").innerText = "채팅을 시작하시겠습니까?"
        document.getElementById("alertChatLogOkBtn").innerText = "채팅시작"
        document.getElementById("alertChatLogTitle").innerText = "채팅"
        $("#alertChatLogOkBtn").addClass("bg-yellow-500")

        document.getElementById("alertChatLogOkBtn").onclick = function () {
            openChatting();
        }
    }


    function deleteProductBtn() {
        document.getElementById("deleteBg").style.display = "block";
        document.getElementById("deleteContent").style.display = "block";
    }

    function deleteProduct() {
        fetch('./delete', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                "productnum": "${productDto.productnum}"
            })
        })
            .then(response => {
                console.log(response);
                if (response.ok) {
                    // 등록 성공 처리
                    location.href = `/`;
                } else {
                    // 등록 실패 처리
                    alert("fail");
                }
            })
            .catch(error => {
                // 네트워크 오류 처리
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });

    }

    function deleteCancel() {
        document.getElementById("deleteBg").style.display = "none";
        document.getElementById("deleteContent").style.display = "none";
    }

    function reserveDeal(usernickname, customerNum) {
        document.getElementById("alertChatLogBG").style.display = "block";
        document.getElementById("alertChatLogContent").style.display = "block";

        document.getElementById("alertChatLogText").innerText = usernickname + "님과 예약하시겠습니까?"
        document.getElementById("alertChatLogOkBtn").innerText = "예약하기"
        document.getElementById("alertChatLogTitle").innerText = "거래예약"

        document.getElementById("alertChatLogOkBtn").onclick = function () {
            fetch('./reservation', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    "productnum": "${productDto.productnum}",
                    "productUserNum": "${productDto.usernum}",
                    "customerNum": customerNum
                })
            })
                .then(response => {
                    console.log(response);
                    if (response.ok) {
                        // 등록 성공 처리
                        window.location.reload();
                    } else {
                        // 등록 실패 처리
                        alert("fail");
                    }
                })
                .catch(error => {
                    // 네트워크 오류 처리
                    console.error('Error:', error);
                    alert('An error occurred. Please try again later.');
                });
        }
    }

    function alertChatLogClose() {
        document.getElementById("alertChatLogBG").style.display = "none";
        document.getElementById("alertChatLogContent").style.display = "none";
        $("#alertChatLogOkBtn").removeClass("bg-red-500").removeClass("bg-yellow-500");
    }

    function completeDeal(usernickname, customerNum) {
        document.getElementById("alertChatLogBG").style.display = "block";
        document.getElementById("alertChatLogContent").style.display = "block";

        document.getElementById("alertChatLogText").innerText = usernickname + "님과 거래를 완료하셨습니까?"
        document.getElementById("alertChatLogOkBtn").innerText = "완료하기"
        document.getElementById("alertChatLogTitle").innerText = "거래완료"
        $("#alertChatLogOkBtn").addClass("bg-red-500")

        document.getElementById("alertChatLogOkBtn").onclick = function () {
            console.log(usernum)
        }
    }


    function alertReserveCancelBtn() {
        document.getElementById("alertChatLogBG").style.display = "block";
        document.getElementById("alertChatLogContent").style.display = "block";

        document.getElementById("alertChatLogText").innerText = "예약을 취소하시겠습니까?"
        document.getElementById("alertChatLogOkBtn").innerText = "예약 취소"
        document.getElementById("alertChatLogTitle").innerText = "예약취소"
        $("#alertChatLogOkBtn").addClass("bg-red-500")

        document.getElementById("alertChatLogOkBtn").onclick = function () {
            fetch('./cancel', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    "productnum": "${productDto.productnum}",
                    "productUserNum": "${productDto.usernum}",
                    "customerNum": "${productDto.customernum}"
                })
            })
                .then(response => {
                    console.log(response);
                    if (response.ok) {
                        // 등록 성공 처리
                        window.location.reload();
                    } else {
                        // 등록 실패 처리
                        alert("fail");
                    }
                })
                .catch(error => {
                    // 네트워크 오류 처리
                    console.error('Error:', error);
                    alert('An error occurred. Please try again later.');
                });
        }
    }

    function alertCompleteBtn() {
        document.getElementById("alertChatLogBG").style.display = "block";
        document.getElementById("alertChatLogContent").style.display = "block";

        document.getElementById("alertChatLogText").innerText = "거래를 완료하셨습니까?"
        document.getElementById("alertChatLogOkBtn").innerText = "거래 완료"
        document.getElementById("alertChatLogTitle").innerText = "거래완료"

        document.getElementById("alertChatLogOkBtn").onclick = function () {
            fetch('./finish', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    "productnum": "${productDto.productnum}",
                    "productUserNum": "${productDto.usernum}",
                    "customerNum": "${productDto.customernum}"
                })
            })
                .then(response => {
                    console.log(response);
                    if (response.ok) {
                        // 등록 성공 처리
                        window.location.reload();
                    } else {
                        // 등록 실패 처리
                        alert("fail");
                    }
                })
                .catch(error => {
                    // 네트워크 오류 처리
                    console.error('Error:', error);
                    alert('An error occurred. Please try again later.');
                });
        }
    }

</script>

<script>
    getChatLog();

    function getChatLog() {
        fetch(`/product/chat-log?productnum=${productDto.productnum}`)
            .then(response => response.json())
            .then(data => {
                // 가져온 채팅 내역 데이터를 화면에 표시하는 로직 구현
                displayChatLog(data);
            })
            .catch(error => {
                console.error('Error fetching chat log:', error);
            });
    }

    function displayChatLog(chatLogData) {
        // 채팅 내역을 화면에 표시하는 로직 작성
        const chatLogContainer = document.getElementById('chatArea');
        chatLogData.forEach(chat => {
            if (chat.usernum == "${productDto.usernum}") {
                chatLogContainer.innerHTML +=
                    `
                <%--                    판매자 채팅--%>
                    <div class="flex items-start gap-3 justify-end">
                        <div class="bg-gray-200 text-gray-900 px-4 py-2 rounded-lg max-w-[75%]">
                            <p class="font-medium">\${chat.usernickname}</p>
                            <p>\${chat.chatcontent}</p>
                        </div>
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                                <img class="aspect-square h-full w-full" alt="Seller"
                                   src="https://kr.object.ncloudstorage.com/semi/panda/\${chat.userprofileimage}"/>
                            </span>
                        </span>
                    </div>
                `;
            } else {

                chatLogContainer.innerHTML +=
                    `
                <%--                    구매자 채팅 시작--%>
                    <div class="flex items-start gap-3">
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                          <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                              <img class="aspect-square h-full w-full" alt="Seller"
                                   src="https://kr.object.ncloudstorage.com/semi/panda/\${chat.userprofileimage}"/>
                          </span>
                        </span>
                        <div class="bg-[#4CAF50] text-white px-4 py-2 rounded-lg max-w-[75%] relative">
                            <p class="font-medium">\${chat.usernickname}</p>
                            <p>\${chat.chatcontent}</p>

                                <div class="dropdown">
                                <span class="material-symbols-outlined chat-menu"
                                      onclick="">more_vert</span>
                                    <div style="display: none;" class="drop-content">
                                        <a class="text-gray-900"
                                           onclick="reserveDeal('\${chat.usernickname}','\${chat.usernum}')"
                                        >거래예약</a>
                                        <a class="text-gray-900"
                                           onclick="completeDeal('\${chat.usernickname}','\${chat.usernum}')"
                                        >거래완료</a>
                                    </div>
                                </div>

                        </div>
                    </div>
            `;
            }


        });

        toggleDropdown();
    }
</script>

<script>
    let dropContent = document.getElementsByClassName("drop-content");
    let chatMenu = document.getElementsByClassName("chat-menu");

    function toggleDropdown() {
        for (let i = 0; i < chatMenu.length; i++) {
            chatMenu[i].onclick = function () {
                if (dropContent[i].style.display === "none") {
                    for (let j = 0; j < dropContent.length; j++) {
                        dropContent[j].style.display = "none";
                    }
                    dropContent[i].style.display = "block";
                } else {
                    dropContent[i].style.display = "none";
                }
            }
        }
    }


    function logout() {
        fetch('/product/logout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({})
        })
            .then(response => {
                console.log(response);
                if (response.ok) {
                    // 등록 성공 처리
                    window.location.reload();
                } else {
                    // 등록 실패 처리
                    alert("fail");
                }
            })
            .catch(error => {
                // 네트워크 오류 처리
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
    }

    function login() {
        let usernum = prompt();
        fetch('/product/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                "usernum": usernum
            })
        })
            .then(response => {
                console.log(response);
                if (response.ok) {
                    // 등록 성공 처리
                    alert(usernum);
                    window.location.reload();
                } else {
                    // 등록 실패 처리
                    alert("fail");
                }
            })
            .catch(error => {
                // 네트워크 오류 처리
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
    }

</script>



</body>
</html>