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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
    <title></title>
    <style>

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



        /* slider__wrap */
        .slider__wrap {
            position: relative;
            width: 100%;
            height: 450px;
        }

        .slider__img {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .slider__img img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            transition: all 300ms ease-in-out;
        }

        .slider__img img.active {
            opacity: 1;
        }

        .slider__thumb {
            left: 50%;
            top: 50%;
            width: 100%;
            overflow: scroll;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .slider__thumb img {
            height: 100px;
            cursor: pointer;
            border: 2px solid transparent;
        }

        .slider__thumb img.active {
            border: 2px solid #fff;
        }

        .slider__btn a {
            position: absolute;
            top: 0;
            width: 100px;
            height: 100%;

            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 12px;


            transition: all 300ms ease-in-out;
        }

        .slider__btn a.next {
            right: 0;
        }







        /*드롭다운 스타일*/
        .dropdown {
            position: absolute;
            display: inline-block;
            top: 0;
            right: 0;
        }

        .button {
            color: white;
            font-size: 40px;
            transform: translate(30%, -20%);
        }

        #drop-content {
            width: 100px;
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

        #drop-content a {
            display: block;
            font-size: 18px;
            color: black;
            text-decoration: none;
        }

        #drop-content a:hover{
            background-color: #e3e3e3;
        }
    </style>
</head>
<body>

<!--
// v0 by Vercel.
// https://v0.dev/t/4WkJbGjVd8r
-->

<div class="bg-white dark:bg-gray-950 text-gray-900 dark:text-gray-50 min-h-screen">
    <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8 sm:py-12 lg:py-16">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 lg:gap-12">
            <div class="grid">
                <div class="slider__wrap">
                    <div class="slider__img rounded-lg"></div>
                    <div class="slider__thumb"></div>
                    <div class="slider__btn">
                        <a class="prev" title="이전이미지"></a>
                        <a class="next" title="다음이미지"></a>
                    </div>
                </div>
                <!-- //main -->

            </div>
            <div class="grid gap-6">
                <div>
                    <h1 class="text-3xl font-bold text-[black]">Vintage Leather Briefcase
                        <%--                        찜버튼 class에 active 넣으면 활성화--%>
                        <div id='heart' class='button'></div>
                    </h1>
                    <p class="text-lg text-gray-500 dark:text-gray-400" id="productAddress">
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
                            <div class="text-sm text-gray-500 dark:text-gray-400">Top Seller</div>
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
                        <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#4CAF50] text-primary-foreground hover:bg-primary/90 h-11 rounded-md px-8">
                            Chat Now
                        </button>

                        <button
                                class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#E5E7EB] text-[black] h-11 rounded-md px-8 border-[#4CAF50] hover:bg-[blue] hover:text-white"
                        >
                            Update
                        </button>

                        <button
                                class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-[#E5E7EB] text-[black] h-11 rounded-md px-8 border-[#4CAF50] hover:bg-[red] hover:text-white"
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

        <div class="flex flex-col bg-white dark:bg-gray-900">
            <div class="flex-1 overflow-y-auto p-4">
                <div class="space-y-4">


                    <%--                    구매자 채팅--%>
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
                                <span class="material-symbols-outlined button" onclick="dp_menu()">more_vert</span>
                                <div style="display: none;" id="drop-content">
                                    <a href='#'>거래예약</a>
                                    <a href='#'>거래완료</a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%--                    구매자 채팅--%>
                    <div class="flex items-start gap-3">
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center">
                          <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JD</span>
                        </span>
                        <div class="bg-[#4CAF50] text-white px-4 py-2 rounded-lg max-w-[75%]">
                            <p class="font-medium">John Doe</p>
                            <p>John Doe님이 채팅을 시작하였습니다.</p>
                        </div>
                    </div>


                    <%--                    판매자 채팅--%>
                    <div class="flex items-start gap-3 justify-end">
                        <div class="bg-gray-200 dark:bg-gray-800 text-gray-900 dark:text-gray-100 px-4 py-2 rounded-lg max-w-[75%]">
                            <p class="font-medium">Jane Smith</p>
                            <p>John Doe님과 거래 예약되었습니다.</p>
                        </div>
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center">
                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JS</span>
                        </span>
                    </div>


                    <%--                    구매자 채팅--%>
                    <div class="flex items-start gap-3">
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center">
                          <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JD</span>
                        </span>
                        <div class="bg-[#4CAF50] text-white px-4 py-2 rounded-lg max-w-[75%]">
                            <p class="font-medium">John Doe</p>
                            <p>John Doe님이 채팅을 시작하였습니다.</p>
                        </div>
                    </div>


                    <%--                    판매자 채팅--%>
                    <div class="flex items-start gap-3 justify-end">
                        <div class="bg-gray-200 dark:bg-gray-800 text-gray-900 dark:text-gray-100 px-4 py-2 rounded-lg max-w-[75%]">
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
    let images = [
        "https://generated.vusercontent.net/placeholder.svg",
        "https://generated.vusercontent.net/placeholder-user.jpg",
        "https://generated.vusercontent.net/placeholder.svg",
        "https://generated.vusercontent.net/placeholder-user.jpg",
        "https://generated.vusercontent.net/placeholder.svg",
        "https://generated.vusercontent.net/placeholder-user.jpg",
        "https://generated.vusercontent.net/placeholder.svg",
        "https://generated.vusercontent.net/placeholder-user.jpg",
        "https://generated.vusercontent.net/placeholder.svg",
        "https://generated.vusercontent.net/placeholder-user.jpg",
        "https://generated.vusercontent.net/placeholder.svg",
        "https://generated.vusercontent.net/placeholder-user.jpg"
    ];

    function imageSlider(parent, images) {
        let currentIndex = 0;

        // 선택자
        let slider = {
            parent: parent,
            images: parent.querySelector(".slider__img"),
            thumbnails: parent.querySelector(".slider__thumb"),
            prevBtn: parent.querySelector(".slider__btn .prev"),
            nextBtn: parent.querySelector(".slider__btn .next")
        };

        // 이미지 출력하기
        slider.images.innerHTML = images.map((image, index) => {
            return `<img src="\${image}" alt="이미지\${index}" class="rounded-lg mx-2">`;
        }).join("");

        // 이미지 활성화(active)하기
        let imageNodes = slider.images.querySelectorAll("img");
        imageNodes[currentIndex].classList.add("active");


        // 썸네일 이미지 출력하기
        slider.thumbnails.innerHTML = slider.images.innerHTML;

        // 썸네일 활성화(active)하기
        let thumnailNodes = slider.thumbnails.querySelectorAll("img");
        thumnailNodes[currentIndex].classList.add("active");

        // 썸네일 이미지 클릭하기_for문
        // for(let i=0; i<thumnailNodes.length; i++){
        //     thumnailNodes[i].addEventListener("click", function(){      //this값을 가져올 수 있음
        //         slider.thumbnails.querySelector("img.active").classList.remove("active");
        //         thumnailNodes[i].classList.add("active");

        //         imageNodes[currentIndex].classList.remove("active");
        //         currentIndex = i;
        //         imageNodes[currentIndex].classList.add("active");
        //     });
        // }

        // 썸네일 이미지 클릭하기_forEach()
        thumnailNodes.forEach((thumb, index) => {
            thumb.addEventListener("click", function () {
                thumnailNodes[currentIndex].classList.remove("active");
                thumnailNodes[index].classList.add("active");

                imageNodes[currentIndex].classList.remove("active");
                currentIndex = index;
                imageNodes[currentIndex].classList.add("active");
            });
        });

        // 왼쪽 버튼 클릭하기
        slider.prevBtn.addEventListener("click", () => {
            imageNodes[currentIndex].classList.remove("active");
            currentIndex--;

            // 0 4 3 2 1 0 4 3 2 1...
            if (currentIndex < 0) currentIndex = images.length - 1;

            imageNodes[currentIndex].classList.add("active");

            // 썸네일 버튼 클릭하기
            thumnailNodes[currentIndex].classList.remove("active");
            thumnailNodes[currentIndex].classList.add("active");
        });

        // 오른쪽 버튼 클릭하기
        slider.nextBtn.addEventListener("click", () => {
            imageNodes[currentIndex].classList.remove("active");
            thumnailNodes[currentIndex].classList.remove("active");

            // 1 2 3 4 0 1 2 3 4...
            currentIndex = (currentIndex + 1) % images.length;

            imageNodes[currentIndex].classList.add("active");
            thumnailNodes[currentIndex].classList.add("active");


        });


    };

    imageSlider(document.querySelector(".slider__wrap"), images);

</script>




<script>
    let click = document.getElementById("drop-content");

    function dp_menu() {
        if (click.style.display === "none") {
            click.style.display = "block";

        } else {
            click.style.display = "none";

        }
    }

</script>

</body>
</html>