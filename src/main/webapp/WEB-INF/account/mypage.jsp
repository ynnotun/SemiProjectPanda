
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
                  <%--<img src="${root}/${dto.userprofileimage}" alt="">--%>
                  <img src="${root}/image/good-member.svg" alt="" width="100%">
              </span>
            </span>
                        <div class="grid gap-1">
                            <h1 class="text-2xl font-bold">${dto.username}</h1>

                            <%-- 주소 --%>
                            <c:if test="${'유저본인인가에 대한 조건'}">
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
                                <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="w-4 h-4">
                                    <polygon
                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                            </span>
                            <span>${star}</span>
                        </div>
                        <div data-orientation="vertical" role="none" class="shrink-0 bg-gray-100 w-[1px] h-6"></div>
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
                        <%--<c:if test="${'유저본인인가에 대한 조건'}">--%>
                        <button id="myupdate" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10"
                        onclick="location.href='${root}/mypage/update?usernum=${usernum}'">

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
                        <%--</c:if>--%>
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
                                <img src="" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48" style="aspect-ratio:300/200;object-fit:cover"/>
                                <div class="p-4">
                                    <h3 class="text-lg font-medium mb-2">${ele.producttitle}</h3>
                                    <div class="mb-2">
                                        <span class="text-gray-500 mr-1">${ele.productprice}원</span>
                                        <span class="text-gray-500">${ele.productstatus}</span>
                                    </div>
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
                                                    onclick="location.href='${root}/product/review'">
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
                <%--<c:if test="${'유저본인인가에 대한 조건'}">--%>
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
                                <img src="" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48" style="aspect-ratio:300/200;object-fit:cover"/>
                                <div class="p-4">
                                    <h3 class="text-lg font-medium mb-2">${ele.producttitle}</h3>
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
                                                onclick="location.href='${root}/product/review'">
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
                                                src=""
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
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                        View
                                    </button>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>
                <%--</c:if>--%>
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
                                <img src="${root}/image/good-member.svg" alt="" width="100%">
                            </span>
                          </span>
                                <div class="grid gap-2">
                                    <div class="flex items-center gap-2 text-sm">
                                        <div class="font-medium">${ele.username}</div>
                                        <div class="flex items-center gap-1 text-green-500">
                                            <%-- 채워진 별점 출력 --%>
                                            <c:forEach var="i" begin="1" end="${ele.reviewstar}">
                                                <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        width="24"
                                                        height="24"
                                                        viewBox="0 0 24 24"
                                                        fill="currentColor"
                                                        stroke="currentColor"
                                                        stroke-width="2"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                        class="w-4 h-4"
                                                >
                                                    <polygon
                                                            points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                                </svg>
                                            </c:forEach>
                                            <%-- 빈 별점 출력 --%>
                                            <c:forEach var="i" begin="1" end="${5-ele.reviewstar}">
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
                                                        class="w-4 h-4 fill-gray-300 stroke-gray-300"
                                                >
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
    $(document).ready(function() {
        $.ajax({
            url: '/mypage/update', // 이 URL이 유효한지 확인
            type: 'GET',
            success: function(response) {
                console.log('AJAX success response:', response); // 응답 로그 추가
                const usernum = response.usernum; // 응답에서 usernum 가져오기
                $('#myupdate').click(function() {
                    window.location.href = `/mypage/update?usernum=` + usernum;
                });
            },
            error: function(error) {
                console.log('AJAX error:', error); // 에러 로그 추가
            }
        });
    });
</script>

</body>
</html>
