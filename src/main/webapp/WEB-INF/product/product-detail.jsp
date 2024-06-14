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
        *:hover{
            transition: 500ms;
        }
        /*하트스타일*/
        .button {
            float: right;
            width: 50px;
            height: 50px;
            border-radius: 5px;
            background: none;
            cursor: pointer;
            transition: background 0.5s ease;
            scale: 0.5;
        }

        .button:hover {

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
            display: inline-block;
            top: 0;
            right: 0;
        }

        .dropdown .button {
            color: white;
            font-size: 40px;
            transform: translate(30%, -20%);
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
    <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8 sm:py-12 lg:py-16">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 lg:gap-12">
            <div class="">
                <!-- Swiper -->

                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff"
                     class="swiper mySwiper2 rounded-lg">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-1.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-2.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-3.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-4.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-5.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-6.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-7.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-8.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-9.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-10.jpg"/>
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-1.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-2.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-3.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-4.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-5.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-6.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-7.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-8.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-9.jpg"/>
                        </div>
                        <div class="swiper-slide">
                            <img src="https://swiperjs.com/demos/images/nature-10.jpg"/>
                        </div>
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
                    <h1 class="text-3xl font-bold text-[black]">Vintage Leather Briefcase
                        <%--                        찜버튼 class에 active 넣으면 활성화--%>
                        <div id='heart' class='button'></div>
                    </h1>
                    <p class="text-lg text-gray-500 " id="productAddress">
                        Handcrafted in Italy, this classic leather briefcase is in excellent condition.
                    </p>
                    <div class="flex items-center justify-between my-3">
                        <div class="text-4xl font-bold text-[#4CAF50]">$150</div>
                    </div>
                    <div class="flex items-center gap-2">
                            <span class="relative flex shrink-0 overflow-hidden rounded-full w-10 h-10 border-2 border-[#4CAF50]">
                                <img class="aspect-square h-full w-full" alt="Seller"
                                     src="https://generated.vusercontent.net/placeholder-user.jpg"/>
                            </span>
                        <div>
                            <div class="font-medium text-[black]">John Doe</div>
                            <div class="text-sm text-gray-500 ">Top Seller</div>
                        </div>

                    </div>
                    <div class="prose max-w-none">
                        <h2 class=" text-[black] font-bold text-2xl my-3">Item Description</h2>
                        <p class=" text-[black]">
                            This vintage leather briefcase is a timeless piece that exudes sophistication and
                            elegance. Crafted
                            with high-quality Italian leather, it features a spacious interior with multiple
                            compartments to
                            keep your belongings organized. The sturdy construction and well-designed details make
                            this
                            briefcase a durable and practical accessory for both professional and personal use.
                            This vintage leather briefcase is a timeless piece that exudes sophistication and
                            elegance. Crafted
                            with high-quality Italian leather, it features a spacious interior with multiple
                            compartments to
                            keep your belongings organized. The sturdy construction and well-designed details make
                        </p>
                    </div>
                </div>
                <div class="grid gap-4">
                    <!-- 지도를 표시할 div 입니다 -->
                    <div id="map" style="width:100%;height:250px;"></div>
                    <script type="text/javascript"
                            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e18b4a131af7b6c7a7ea0d069757da3a&libraries=services"></script>

                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };

                        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        var point = new kakao.maps.LatLng(33.450701, 126.570667);
                        marker = new kakao.maps.Marker({position: point});
                        marker.setMap(map);
                        getAddr();

                        function getAddr() {
                            let geocoder = new kakao.maps.services.Geocoder();
                            let callback = function (result) {
                                document.getElementById("productAddress").innerText = result[0].road_address.address_name;

                            }
                            geocoder.coord2Address(point.getLng(), point.getLat(), callback);
                        }
                    </script>
                </div>
                <div class="grid gap-4">

                    <div class="flex gap-4">
                        <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#4CAF50] text-primary-foreground hover:bg-primary/90 h-11 rounded-md px-8 hover:brightness-125">
                            Chat Now
                        </button>

                        <button
                                class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#E5E7EB] text-[black] h-11 rounded-md px-8 border-[#4CAF50] hover:bg-blue-500 hover:text-white"
                        >
                            Update
                        </button>

                        <button
                                class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#E5E7EB] text-[black] h-11 rounded-md px-8 border-[#4CAF50] hover:bg-red-500 hover:text-white"
                        >
                            Delete
                        </button>
                    </div>
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
                <div class="space-y-4">

                    <%--                    구매자 채팅 시작--%>
                    <div class="flex items-start gap-3">
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                          <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                              <img class="aspect-square h-full w-full" alt="Seller"
                                   src="https://generated.vusercontent.net/placeholder-user.jpg"/>
                          </span>
                        </span>
                        <div class="bg-[#4CAF50] text-white px-4 py-2 rounded-lg max-w-[75%] relative">
                            <p class="font-medium">John Doe</p>
                            <p>John Doe님이 채팅을 시작하였습니다.</p>

                            <div class="dropdown">
                                <span class="material-symbols-outlined button chat-menu"
                                      onclick="">more_vert</span>
                                <div style="display: none;" class="drop-content">
                                    <a href='#'>거래예약</a>
                                    <a href='#'>거래완료</a>
                                </div>
                            </div>
                        </div>
                    </div>



                    <%--                    판매자 채팅--%>
                    <div class="flex items-start gap-3 justify-end">
                        <div class="bg-gray-200 text-gray-900 px-4 py-2 rounded-lg max-w-[75%]">
                            <p class="font-medium">Jane Smith</p>
                            <p>John Doe님과 거래 예약되었습니다.</p>
                        </div>
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center">
                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JS</span>
                        </span>
                    </div>



                    <%--                    판매자 채팅--%>
                    <div class="flex items-start gap-3 justify-end">
                        <div class="bg-gray-200 text-gray-900 px-4 py-2 rounded-lg max-w-[75%]">
                            <p class="font-medium">Jane Smith</p>
                            <p>John Doe님과 거래 완료되었습니다.</p>
                        </div>
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center">
                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JS</span>
                        </span>
                    </div>


                </div>
            </div>

        </div>


    </div>
</div>


<script>
    $(document).ready(function () {
        var scaleCurve = mojs.easing.path('M0,100 L25,99.9999983 C26.2328835,75.0708847 19.7847843,0 100,0');
        var el = document.querySelector('.button'),
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
        $(".button").click(function () {
            if ($(this).hasClass('active')) {
                $(this).removeClass('active');
            } else {
                timeline.play();
                $(this).addClass('active');
            }
        });

    });
</script>


<script>
    let dropContent = document.getElementsByClassName("drop-content");
    let chatMenu = document.getElementsByClassName("chat-menu");
    for (let i = 0; i < chatMenu.length; i++) {
        chatMenu[i].addEventListener("click", function () {
            if (dropContent[i].style.display === "none") {
                for (let i = 0; i < dropContent.length; i++) {
                    dropContent[i].style.display = "none";
                }
                dropContent[i].style.display = "block";

            } else {
                dropContent[i].style.display = "none";

            }
        })
    }

    // function  {
    //     if (click.style.display === "none") {
    //         click.style.display = "block";
    //
    //     } else {
    //         click.style.display = "none";
    //
    //     }
    // }

</script>

</body>
</html>