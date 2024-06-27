<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <title>나의 내역</title>

    <style>
        .round-button {
            border-radius: 20px;
        }

        .active {
            background-color: black;
            color: white !important;
        }

        .grayscale {
            filter: grayscale(50%);
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.25rem;
            color: gray;
            text-align: center;
        }

        .relative {
            position: relative;
        }
    </style>
</head>
<body>

<div class="bg-white text-gray-950 min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="flex flex-col min-h-screen">
            <section class="py-8 px-6 md:px-8">
                <div class="search-result-message items-center justify-between mb-6">
                    <c:if test="${sessionScope.usernum == usernum}">
                        <h2 class="text-2xl font-bold"><a href="">나의 내역</a></h2>
                    </c:if>
                    <c:if test="${sessionScope.usernum != usernum}">
                        <h2 class="text-2xl font-bold"><a href="">${usernickname}의 내역</a></h2>
                    </c:if>
                </div>
                <div class="flex items-center justify-between">
                    <a class="text-sm underline" href="./mypage/history?usernum=${usernum}&listname=sell"> </a>
                    <div id="menubutton" class="flex w-full justify-start mb-4">
                        <button id="sell"
                                class="tab-button round-button inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                            판매내역
                        </button>
                        <c:if test="${sessionScope.usernum == usernum}">
                            <button id="buy"
                                    class="tab-button round-button inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                                구매내역
                            </button>
                            <button id="wish"
                                    class="tab-button round-button inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                                찜목록
                            </button>
                        </c:if>
                    </div>
                </div>
                <div class="page active-page grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6"
                     id="page1">
                    <!-- 검색 결과가 표시될 영역 -->
                </div>
                <div id="no-result-message" class="w-full text-base text-gray-500" style="display: none;">
                    아직 판매한 이력이 없어요.
                </div>
            </section>
        </div>
    </div>
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
        <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 bg-blue-500 text-white h-10 px-4 py-2"
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

<script>
    $(function () {
        $(`#${listname}`).addClass("active");
        if ("${listname}" === "sell") {
            getSell();
        } else if ("${listname}" === "buy") {
            getBuy();
        } else if ("${listname}" === "wish") {
            getWish();
        }

        $(".tab-button").click(function () {
            $(this).addClass("active");
            $(this).siblings().removeClass("active");
        })

        $("#sell").click(function () {
            getSell();
        })
        $("#buy").click(function () {
            getBuy();
        })
        $("#wish").click(function () {
            getWish();
        })
    })

    function getSell() {
        $.ajax({
            type: "get",
            url: "${root}/getsell?usernum=${usernum}",
            dataType: "json",
            success: function (data) {
                let s = "";
                if (data.length === 0) {
                    s = `<div class="w-full text-base text-gray-500">아직 판매한 이력이 없어요.</div>`;
                } else {
                    $.each(data, function (idx, ele) {
                        s += `
                        <div class="relative rounded-lg border bg-card text-card-foreground shadow-sm">
                        <div class="relative w-full h-48">
                            <img src="https://kr.object.ncloudstorage.com/semi/panda/\${ele.imagefilename}" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48 \${ele.productstatus === '거래 완료' ? 'grayscale' : ''}" style="aspect-ratio:300/200;object-fit:cover"onclick="location.href='/product/detail?productnum=\${ele.productnum}'"/>
                             `;
                        if (ele.productstatus.includes("완료")) {
                            s += `<div class="overlay">SOLD</div>`;
                        }
                        s += `
                            </div>
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2" onclick="location.href='/product/detail?productnum=\${ele.productnum}'">\${ele.producttitle}</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">\${ele.productprice}원</span>
                                    <span class="text-gray-500">\${ele.productstatus}</span>
                                </div>
                                <div class="flex">
                    `;
                        if (ele.productstatus === "예약 중" && "${sessionScope.usernum}" == ele.usernum) {
                            s += `
                           <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200"
                            onClick="alertReserveCancelBtn(\${ele.productnum}, \${ele.usernum}, \${ele.customernum})"
                        >
                            예약 취소
                        </button>
                        <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black"
                            onClick="alertCompleteBtn(\${ele.productnum}, \${ele.usernum}, \${ele.customernum})"
                        >
                            거래 완료
                        </button>
                            `;
                        }
                        if ((ele.productstatus === "거래 완료" || ele.productstatus === "구매자 리뷰 완료" ) && "${sessionScope.usernum}" == ele.usernum) {
                            s += `
                            <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black"
                            onClick="location.href='/product/review?productnum=\${ele.productnum}'">
                            리뷰작성
                        </button>
                            `;
                        }

                        s += `

                                </div>
                            </div>
                        </div>
                        `

                    });
                }
                $("#page1").html(s);
            }
        });
    }

    function getBuy() {
        $.ajax({
            type: "get",
            url: "${root}/getbuy?customernum=${usernum}",
            dataType: "json",
            success: function (data) {
                let s = "";
                if (data.length === 0) {
                    s = `<div class="w-full text-base text-gray-500">아직 구매한 이력이 없어요.</div>`;
                } else {
                    $.each(data, function (idx, ele) {
                        s += `
                        <div class="relative rounded-lg border bg-card text-card-foreground shadow-sm">
                            <div class="relative w-full h-48">
                            <img src="https://kr.object.ncloudstorage.com/semi/panda/\${ele.imagefilename}" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48 \${ele.productstatus === '거래 완료' ? 'grayscale' : ''}" style="aspect-ratio:300/200;object-fit:cover"
                            onclick="location.href='/product/detail?productnum=\${ele.productnum}'"/>
                             `;
                        if (ele.productstatus.includes("완료")) {
                            s += `<div class="overlay">SOLD</div>`;
                        }
                        s += `
                            </div>
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2" onclick="location.href='/product/detail?productnum=\${ele.productnum}'">\${ele.producttitle}</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">\${ele.productprice}원</span>
                                    <span class="text-gray-500">\${ele.productstatus}</span>
                                </div>
                                <div class="flex">
                    `;
                        if (ele.productstatus === "예약 중" && "${sessionScope.usernum}" == ele.customerNum) {
                            s += `
                           <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200"
                            onClick="alertReserveCancelBtn(\${ele.productnum}, \${ele.usernum}, \${ele.customernum})"
                        >
                            예약 취소
                        </button>
                        <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black"
                            onClick="alertCompleteBtn(\${ele.productnum}, \${ele.usernum}, \${ele.customernum})"
                        >
                            거래 완료
                        </button>
                            `;
                        }
                        if (ele.productstatus === "거래 완료" || ele.productstatus === "판매자 리뷰 완료" ) {
                            s += `
                            <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black"
                            onClick="location.href='/product/review?productnum=\${ele.productnum}'">
                            리뷰작성
                        </button>
                            `;
                        }

                        s += `

                                </div>
                            </div>
                        </div>
                        `

                    });
                }
                $("#page1").html(s);
            }
        });
    }

    function getWish() {
        $.ajax({
            type: "get",
            url: "${root}/getwish?usernum=${usernum}",
            dataType: "json",
            success: function (data) {
                let s = "";
                if (data.length === 0) {
                    s = `<div class="w-full text-base text-gray-500">아직 찜한 이력이 없어요.</div>`;
                } else {
                    $.each(data, function (idx, ele) {
                        s += `
                            <div class="relative rounded-lg border bg-card text-card-foreground shadow-sm">
                                <div class="relative w-full h-48">
                                <img src="https://kr.object.ncloudstorage.com/semi/panda/\${ele.imagefilename}" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48 \${ele.productstatus === '거래 완료' ? 'grayscale' : ''}" style="aspect-ratio:300/200;object-fit:cover"
                                        onclick="location.href='/product/detail?productnum=\${ele.productnum}'"/>
`
                        if (ele.productstatus.includes("완료")) {
                            s += `<div class="overlay">SOLD</div>`;
                        }

                        s += `</div>
                                <div class="p-4">
                                    <h3 class="text-lg font-medium mb-2" onclick="location.href='/product/detail?productnum=\${ele.productnum}'">\${ele.producttitle}</h3>
                                    <div class="mb-2">
                                        <span class="text-gray-500 mr-1">\${ele.productprice}원</span>
                                        <span class="text-gray-500">\${ele.productstatus}</span>
                                    </div>
                                </div>
                            </div>
                    `;
                    });
                }
                $("#page1").html(s);
            }
        });
    }


    function alertChatLogClose() {
        document.getElementById("alertChatLogBG").style.display = "none";
        document.getElementById("alertChatLogContent").style.display = "none";
        $("#alertChatLogOkBtn").removeClass("bg-red-500");
    }


    function alertReserveCancelBtn(productnum, usernum, customernum) {
        document.getElementById("alertChatLogBG").style.display = "block";
        document.getElementById("alertChatLogContent").style.display = "block";

        document.getElementById("alertChatLogText").innerText = "예약을 취소하시겠습니까?"
        document.getElementById("alertChatLogOkBtn").innerText = "예약 취소"
        document.getElementById("alertChatLogTitle").innerText = "예약취소"
        $("#alertChatLogOkBtn").addClass("bg-red-500")

        document.getElementById("alertChatLogOkBtn").onclick = function () {
            fetch('/product/cancel', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    "productnum": productnum,
                    "productUserNum": usernum,
                    "customerNum": customernum
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

    function alertCompleteBtn(productnum, usernum, customernum) {
        document.getElementById("alertChatLogBG").style.display = "block";
        document.getElementById("alertChatLogContent").style.display = "block";

        document.getElementById("alertChatLogText").innerText = "거래를 완료하셨습니까?"
        document.getElementById("alertChatLogOkBtn").innerText = "거래 완료"
        document.getElementById("alertChatLogTitle").innerText = "거래완료"

        document.getElementById("alertChatLogOkBtn").onclick = function () {
            fetch('/product/finish', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    "productnum": productnum,
                    "productUserNum": usernum,
                    "customerNum": customernum
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
</body>
</html>