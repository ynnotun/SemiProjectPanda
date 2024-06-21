
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 13.
  Time: 오전 11:07
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

    <title></title>
    <style>
        .button-primary:hover {
            background-color: rgb(30 41 59) !important;
        }
    </style>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="font-size: 20px; font-weight: bold;">Confirm
                    Password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>For security reasons, please re-enter your current</p>
                <p>password to continue </p>
                <br>
                <label style="font-weight: bold;">Password</label>&nbsp;&nbsp;
                <input style="width: 200px;" type="password" id="confirmPassword"
                       class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-black focus:border-black sm:text-sm"
                       placeholder="Enter your password">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirm"
                        style="background-color: black; border: 0px;">Confirm
                </button>
            </div>
        </div>
    </div>
</div>
<!--
// v0 by Vercel.
// https://v0.dev/t/rhPpxxFMCAR
-->
<div class="bg-white  text-gray-950  min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="grid ">
            <div class="grid gap-8">
                <%-- 내 정보 --%>
                <div class="grid gap-4">
                    <div class="flex items-center gap-4">
            <span class="relative flex shrink-0 overflow-hidden rounded-full w-16 h-16 border-2 border-green-500">
              <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                  <img src="https://kr.object.ncloudstorage.com/semi/panda/${dto.userprofileimage}" alt="" width="100%">
              </span>
            </span>
                        <div class="grid gap-1">
                            <h1 class="text-2xl font-bold">${dto.usernickname}</h1>

                            <%-- 주소 --%>
                            <%-- 유저 본인만 확인 가능--%>
                            <c:if test="${sessionScope.loginok!=null && sessionScope.usernum == usernum}">
                                <div class="flex items-center gap-2 text-sm text-gray-500 ">
                                    <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            stroke="currentColor"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="w-4 h-4"
                                    >
                                        <line x1="2" x2="5" y1="12" y2="12"></line>
                                        <line x1="19" x2="22" y1="12" y2="12"></line>
                                        <line x1="12" x2="12" y1="2" y2="5"></line>
                                        <line x1="12" x2="12" y1="19" y2="22"></line>
                                        <circle cx="12" cy="12" r="7"></circle>
                                    </svg>
                                    <span>${dto.useraddress}</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="flex items-center gap-4">
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                            <span class="text-green-500">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                     fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                     stroke-linejoin="round" class="w-4 h-4">
                                    <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                            </span>
                            <span>${star}</span>
                        </div>
                        <div data-orientation="vertical" role="none" class="shrink-0 bg-gray-100 w-[1px] h-6"></div>
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                 stroke-linejoin="round" class="w-4 h-4">
                                <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path>
                                <circle cx="9" cy="7" r="4"></circle>
                                <path d="M22 21v-2a4 4 0 0 0-3-3.87"></path>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                            </svg>
                            <span>${reviewCount} reviews</span>
                        </div>
                        <div data-orientation="vertical" role="none" class="shrink-0 bg-gray-100 w-[1px] h-6"></div>
                        <c:if test="${userGrade.equals('good')}">
                            <div class="flex items-center gap-2 text-sm text-gray-500 ">
                                <img src="../image/good-member.svg" alt="">
                                <span>우수회원</span>
                            </div>
                        </c:if>
                        <c:if test="${userGrade.equals('normal')}">
                            <div class="flex items-center gap-2 text-sm text-gray-500 ">
                                <img src="../image/normal-member.svg" alt="">
                                <span>일반회원</span>
                            </div>
                        </c:if>
                        <c:if test="${userGrade.equals('bad')}">
                            <div class="flex items-center gap-2 text-sm text-gray-500 ">
                                <img src="../image/bad-member.svg" alt="">
                                <span>주의회원</span>
                            </div>
                        </c:if>
                        <div data-orientation="vertical" role="none" class="shrink-0 bg-gray-100 w-[1px] h-6"></div>
                        <%-- 유저 본인만 확인 가능--%>
                        <c:if test="${sessionScope.loginok!=null && sessionScope.usernum == usernum}">
                            <button id="myupdate" data-usernum="${dto.usernum}"
                                    class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10"">

                                <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="w-4 h-4"
                                >
                                    <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"></path>
                                    <circle cx="12" cy="12" r="3"></circle>
                                </svg>
                                <span class="sr-only">Settings</span>
                            </button>
                        </c:if>
                    </div>
                </div>

                <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>

                <%-- 판매내역 --%>
                <section class="">
                    <div class="flex items-center justify-between mb-6">
                        <h2 class="text-2xl font-bold"><a
                                href="${root}/mypage/history?usernum=${usernum}&listname=sell">판매내역</a></h2>
                    </div>
                    <c:if test="${sellList.size()==0}">
                        <div class="w-full text-base text-gray-500">아직 판매한 이력이 없어요.</div>
                    </c:if>
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">

                        <c:forEach var="ele" items="${sellList}">
                            <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                                <img src="https://kr.object.ncloudstorage.com/semi/panda/${ele.imagefilename}"
                                     width="300" height="200" alt="Product"
                                     class="cursor-pointer rounded-t-lg object-cover w-full h-48"
                                     style="aspect-ratio:300/200;object-fit:cover"
                                     onclick="location.href='${root}/product/detail?productnum=${ele.productnum}'"/>
                                <div class="p-4">

                                    <h3 class="cursor-pointer text-lg font-medium mb-2"
                                        onclick="location.href='${root}/product/detail?productnum=${ele.productnum}'">
                                            ${ele.producttitle}</h3>
                                    <div class="mb-2">
                                        <span class="text-gray-500 mr-1">${ele.productprice}원</span>
                                        <span class="text-gray-500">${ele.productstatus}</span>
                                    </div>
                                    <c:if test="${sessionScope.loginok!=null && sessionScope.usernum == usernum}">
                                        <div class="flex">
                                            <c:if test="${ele.productstatus.equals('예약 중')}">
                                                <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                                                    예약 취소
                                                </button>
                                                <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black">
                                                    거래 완료
                                                </button>
                                            </c:if>
                                            <c:if test="${ele.productstatus.equals('거래 완료')}">
                                                <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black"
                                                        onclick="location.href='${root}/product/review?productnum=${ele.productnum}'">
                                                    리뷰작성
                                                </button>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>
                <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>
                <%-- 유저 본인만 구매내역 및 찜목록 확인 가능--%>
                <c:if test="${sessionScope.loginok!=null && sessionScope.usernum == usernum}">
                    <%-- 구매내역 --%>
                    <section class="">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-2xl font-bold"><a href="${root}/mypage/history?usernum=${usernum}&listname=buy">구매내역</a>
                            </h2>
                        </div>
                        <c:if test="${buyList.size()==0}">
                            <div class="w-full text-base text-gray-500">아직 구매한 이력이 없어요.</div>
                        </c:if>
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                            <c:forEach var="ele" items="${buyList}">
                                <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                                    <img src="https://kr.object.ncloudstorage.com/semi/panda/${ele.imagefilename}"
                                         width="300" height="200" alt="Product" class="cursor-pointer rounded-t-lg object-cover w-full h-48" style="aspect-ratio:300/200;object-fit:cover"
                                         onclick="location.href='${root}/product/detail?productnum=${ele.productnum}'"/>
                                    <div class="p-4">
                                        <h3 class="cursor-pointer text-lg font-medium mb-2"
                                            onclick="location.href='${root}/product/detail?productnum=${ele.productnum}'">${ele.producttitle}</h3>
                                        <div class="mb-2">
                                            <span class="text-gray-500 mr-1">${ele.productprice}원</span>
                                            <span class="text-gray-500">${ele.productstatus}</span>
                                        </div>
                                        <div class="flex">
                                            <c:if test="${ele.productstatus.equals('예약 중')}">
                                                <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                                                    예약 취소
                                                </button>
                                            </c:if>
                                            <c:if test="${ele.productstatus.equals('거래 완료')}">
                                                <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black"
                                                        onclick="location.href='${root}/product/review?productnum=${ele.productnum}'">
                                                    리뷰작성
                                                </button>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </section>
                    <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>

                    <%-- 찜목록 --%>
                    <div class="grid gap-4">
                        <h2 class="text-2xl font-bold"><a
                                href="${root}/mypage/history?usernum=${usernum}&listname=wish">찜목록</a></h2>
                        <c:if test="${wishList.size()==0}">
                            <div class="w-full text-base text-gray-500">아직 찜 한 이력이 없어요.</div>
                        </c:if>
                        <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                            <c:forEach var="ele" items="${wishList}">
                                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                                    <div class="p-6">
                                        <div class="flex items-center justify-between">
                                            <div class="flex items-center gap-2">
                                                <img
                                                        src="https://kr.object.ncloudstorage.com/semi/panda/${ele.imagefilename}"
                                                        alt="Product Image"
                                                        width="48"
                                                        height="48"
                                                        class="rounded-md"
                                                        style="aspect-ratio:48/48;object-fit:cover"
                                                />
                                                <div class="grid gap-1">
                                                    <div class="font-medium">${ele.producttitle}</div>
                                                    <div class="text-sm text-gray-500 ">${ele.productprice}원</div>
                                                </div>
                                            </div>
                                            <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3"
                                                    onclick="location.href='${root}/product/detail?productnum=${ele.productnum}'">
                                                View
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>
                </c:if>
                <%-- 리뷰 --%>
                <div class="grid gap-4 mt-8">
                    <h2 class="text-xl font-bold">Reviews</h2>

                    <c:if test="${reviews.size()==0}">
                        <div class="w-full text-base text-gray-500">아직 리뷰가 없어요.</div>
                    </c:if>
                    <div class="grid gap-6">
                        <c:forEach var="ele" items="${reviews}">
                            <%-- 리뷰 글 --%>
                            <div class="flex items-start gap-4">
                          <span class="relative flex shrink-0 overflow-hidden rounded-full w-10 h-10 border">
                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                                <img src="${root}/image/good-member.svg" alt="" width="100%" class="cursor-pointer"
                                     onclick="location.href='${root}/mypage?usernum=${ele.reviewsenduser}'">
                            </span>
                          </span>
                                <div class="grid gap-2">
                                    <div class="flex items-center gap-2 text-sm">
                                        <div class="cursor-pointer font-medium"
                                             onclick="location.href='${root}/mypage?usernum=${ele.reviewsenduser}'">
                                                ${ele.username}</div>
                                        <div class="flex items-center gap-1 text-green-500">
                                                <%-- 채워진 별점 출력 --%>
                                            <c:forEach var="i" begin="1" end="${ele.reviewstar}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                     class="w-4 h-4">
                                                    <polygon
                                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                </svg>
                                            </c:forEach>
                                                <%-- 빈 별점 출력 --%>
                                            <c:forEach var="i" begin="1" end="${5-ele.reviewstar}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                     class="w-4 h-4 fill-gray-300 stroke-gray-300">
                                                    <polygon
                                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                </svg>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <p class="text-sm text-gray-500 ">
                                            ${ele.reviewcontent}
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#myupdate').click(function () {
            $('#staticBackdrop').modal('show');
        });

        $('#confirm').click(function () {
            const confirmPassword = $('#confirmPassword').val();
            const usernum = $('#myupdate').data('usernum'); // usernum 가져오기

            $.ajax({
                url: '/mypage/confirm-password',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({password: confirmPassword}),
                success: function (confirmResponse) {
                    if (confirmResponse === 'success') {
                        window.location.href = `/mypage/update?usernum=` + usernum;
                    } else {
                        $("#confirmPassword").val("");
                        alert('비밀번호가 일치하지 않습니다.');
                    }
                },
                error: function (error) {
                    console.log('Password confirmation error:', error);
                    alert('비밀번호 확인 중 오류가 발생했습니다.');
                }
            });
        });
    });
</script>


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

<script>


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
            fetch('product/cancel', {
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