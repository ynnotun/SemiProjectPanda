
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
        #pay {
            background-color: #4CAF50;
            width: 100px;
            color: white;
            border-radius: 20px;
        }
    </style>
</head>
<body>
<!--pay 구역 -->
<script src="https://js.tosspayments.com/v1/payment"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script src="${root}/js/modal.js"></script>
<style>
    body {
        justify-content: center;
        align-items: center;
        height: 120vh;
        background-color: #f0f0f0;
    }
    .container2 {
        font-family: "Comic Sans MS";
        background-image: linear-gradient(112.37deg, #0dc56c 2.34%, #09aa9e);
        border-radius: 15px;
        text-align: center;
        margin-top: 60px;
    }

    .icon {
        font-size: 2rem;
        color: black;
        margin-bottom: 10px;
    }

    #pay-button {
        background-color: black;
        color: white;
    }
    #pay-button:hover {
        background-color: black;
    }
</style>
<script>
    $(function(){
        function pay(method){
            var clientKey = 'test_ck_jExPeJWYVQwONKXNQEXx849R5gvN';
            var tossPayments = TossPayments(clientKey);

            var amount = document.getElementById("amount").value;
            var orderId = createOrderId('${sessionScope.usernickname}');
            var orderName = document.getElementById("seller").value;
            var customerName = document.getElementById("name").value;

            var successUrl = 'http://localhost:9000/paymentSuccess?customerName=' + customerName + '&orderName=' + orderName + '&amount=' + amount;
            var failUrl = 'http://localhost:9000/paymentFail';

            tossPayments
                .requestPayment(method, {
                    amount: amount,
                    orderId: orderId,
                    orderName: orderName,
                    customerName: customerName,
                    successUrl: successUrl,
                    failUrl: failUrl
                })
                .catch(function (error) {
                    console.log(error);
                    if (error.code === 'USER_CANCEL') {
                        location.reload();
                        openModal('PANDA', '결제 취소되었습니다.', `closeModal()`)
                    } else if (error.code === 'INVALID_CARD_COMPANY') {
                        location.reload();
                        openModal('PANDA', '카드번호 재확인해주세요.', `closeModal()`)
                    }
                })
        }
        $('.pay-button').click(function() {
            var method = $(this).val();
            pay(method);
        });
        $('label.paymentLabels').click(function() {
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
                $(".pay-button").val("");
            } else {
                $('label.paymentLabels').removeClass('selected');
                $(this).addClass('selected');
                $(".pay-button").val($(this).attr("for"));
                console.log($(this).attr("for"));
            }
        });
    });

    function generateRandomUppercaseLetters(length) {
        const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        let result = '';
        for (let i = 0; i < length; i++) {
            result += letters.charAt(Math.floor(Math.random() * letters.length));
        }
        return result;
    }

    function createOrderId(user_no) {
        const randomLetters = generateRandomUppercaseLetters(5);
        const timestamp = new Date().getTime(); // 타임스탬프 추가로 고유성 보장
        return randomLetters + timestamp;
    }
</script>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="font-size: 20px; font-weight: bold;">포인트 결제하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div style="display: flex; margin-bottom: 40px;">
                    <label style="font-weight: bold; min-width: 100px;">나의 포인트</label>
                    <h2>${pointamount}원</h2>
                </div>
                <input type="hidden" value="${sessionScope.usernickname}">
                <div style="display: flex; margin-bottom: 15px;">
                    <label style="font-weight: bold; min-width: 100px; margin-right: 50px;">판매자 닉네임</label>
                    <input id="pointseller" name="seller" style="width: 200px;" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"/>
                </div>
                <div style="display: flex">
                    <label style="font-weight: bold; min-width: 100px; margin-right: 50px;">Price</label>
                    <input id="pointamount" style="width: 200px;" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"/>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="purchase"
                        style="background-color: black; border: 0px;">결제하기
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#point').click(function () {
            $('#staticBackdrop').modal('show');
        });

        $('#purchase').click(function () {

            var buyerId = "${sessionScope.usernickname}";
            var sellerNickname = $('#pointseller').val();
            var amount = $('#pointamount').val();

            $.ajax({
                url: '/pointPayment',
                type: 'POST',
                data: {
                    buyerId: buyerId,
                    sellerNickname: sellerNickname,
                    amount: amount
                },
                success: function (response) {
                    alert(response);
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert('결제 처리 중 오류가 발생했습니다: ' + error);
                }
            });
        });
    });

    function payopen(){
        document.getElementsByClassName("container2")[0].style.left = "1000px";
    }
    function payclose(){
        document.getElementsByClassName("container2")[0].style.left = "-1000px";
    }

</script>

<div class="container2" style="position: fixed; width: 500px; height: auto; left: -1000px; top: 30px;">
    <div class="rounded-lg bg-card text-card-foreground" data-v0-t="card">
        <div class="flex flex-col space-y-1.5 p-6" style="margin-bottom: 30px;">
            <img src="https://kr.object.ncloudstorage.com/semi/panda/logo.png" style="width: 200px; height: auto; position: fixed">
            <div class="absolute right-3 top-3 chat-close" id="chatbot-close" onclick="payclose()">
            <span class="material-symbols-outlined">
            close
            </span>
            </div>
        </div>
        <label style="margin-top: 30px; min-width: 120px; margin-right: 30px;" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="name">
            <p style="font-size: 22px; color: white">${sessionScope.usernickname}님의 결제창</p>
        </label>
        <div class="p-6 grid gap-6">
            <div style="background-color: white; color: black; border-radius: 10px; box-shadow: 2px 2px 2px #595858;">
                <button type="button" role="radio" aria-checked="true" data-state="checked" value="point"
                        class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                        id="point" tabindex="-1" data-radix-collection-item="">
                            <span data-state="checked" class="flex items-center justify-center">
                            </span>
                </button>
                <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" checked="" value="point"/>
                <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                       for="point">
                    <i class="bi bi-currency-bitcoin" style="font-size: 2em; color: black; margin-bottom: 10px;"></i>
                    <p style="font-size: 1.2em; font-weight: bold">포인트 결제</p>
                </label>
            </div>
            <div role="radiogroup" aria-required="false" dir="ltr" class="grid grid-cols-2 gap-4" tabindex="-1" style="outline:none">
                <div style="background-color: white; color: black; border-radius: 10px; box-shadow: 2px 2px 2px #595858;">
                    <button type="button" role="radio" aria-checked="true" data-state="checked" value="card"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="카드" tabindex="-1" data-radix-collection-item="">
                            <span data-state="checked" class="flex items-center justify-center">
                            </span>
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" checked="" value="card"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="카드">
                        <i class="bi bi-credit-card icon"></i>
                        <p style="font-size: 1.2em; font-weight: bold">카드</p>
                    </label>
                </div>
                <div style="background-color: white; color: black; border-radius: 10px; box-shadow: 2px 2px 2px #595858;">
                    <button type="button" role="radio" aria-checked="false" data-state="unchecked" value="virtual-account"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="가상계좌" tabindex="-1" data-radix-collection-item="">
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" value="virtual-account"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="가상계좌">
                        <i class="bi bi-wallet icon"></i>
                        <p style="font-size: 1.2em; font-weight: bold">가상계좌</p>
                    </label>
                </div>
                <div style="background-color: white; color: black; border-radius: 10px; box-shadow: 2px 2px 2px #595858;">
                    <button type="button" role="radio" aria-checked="false" data-state="unchecked" value="bank-transfer"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="계좌이체" tabindex="-1" data-radix-collection-item="">
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" value="bank-transfer"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="계좌이체">
                        <i class="bi bi-cash icon"></i>
                        <p style="font-size: 1.2em; font-weight: bold">계좌이체</p>
                    </label>
                </div>
                <div style="background-color: white; color: black; border-radius: 10px; box-shadow: 2px 2px 2px #595858;">
                    <button type="button" role="radio" aria-checked="false" data-state="unchecked" value="mobile-payment"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="휴대폰" tabindex="-1" data-radix-collection-item="">
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" value="mobile-payment"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="휴대폰">
                        <i class="bi bi-phone icon"></i>
                        <p style="font-size: 1.2em; font-weight: bold">휴대폰 결제</p>
                    </label>
                </div>
            </div>

            <div class="flex flex-col gap-2 align-top p-8">
                <div class="flex gap-2" style="margin-top: 40px; justify-content: space-between;">
                    <input value="${sessionScope.usernickname}" style="width: 200px; text-align: center; font-size: 18px; box-shadow: 2px 2px 2px #595858;" type="hidden" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" id="name"/>
                </div>
                <div class="flex gap-2" style="justify-content: space-between;">
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="seller">
                        <p style="line-height: 30px; font-size: 22px; color: white">판매자 닉네임</p>
                    </label>
                    <input name="seller" style="width: 200px; font-size: 18px; box-shadow: 2px 2px 2px #595858;" placeholder="Enter the Nickname..." class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" id="seller"/>
                </div>
                <div class="flex gap-2" style="justify-content: space-between;">
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="amount">
                        <p style="line-height: 30px; font-size: 22px; color: white">Price</p>
                    </label>
                    <input name="pointamount" style="box-shadow: 2px 2px 2px #595858; width: 200px; font-size: 18px;" placeholder="Enter the Price..." class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" type="number" id="amount"/>
                </div>
            </div>
        </div>
        <div class="flex items-center p-6" style="width: 100%; justify-content: center; align-items: center;">
            <button value="" type="button" id="pay-button"
                    class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 pay-button"
                    style="color: white; font-weight: bold; background-color: black;">
                결제하기
            </button>

        </div>
    </div>
</div>
<!-- pay end -->


<!-- Modal -->
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel2" style="font-size: 20px; font-weight: bold;">
                    비밀번호 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label style="font-weight: bold;">Password</label>&nbsp;&nbsp;
                <input style="width: 200px;" type="password" id="confirmPassword"
                       class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-black focus:border-black sm:text-sm"
                       placeholder="Enter your password">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirm"
                        style="background-color: black; border: 0px;">확인
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
                                    class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10">

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
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                            <span>나의 포인트 : </span> ${pointamount}P
                        </div>
                        <!-- 결제버튼 -->
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                                <button onclick= "payopen()" id="pay" >
                                    <p>PAY</p>
                                </button>
                            </div>
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
                                                <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200"
                                                        onclick="alertReserveCancelBtn(${ele.productnum}, ${ele.usernum}, ${ele.customernum})"
                                                >
                                                    예약 취소
                                                </button>
                                                <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black"
                                                        onclick="alertCompleteBtn(${ele.productnum}, ${ele.usernum}, ${ele.customernum})"
                                                >
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
                                                <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200"
                                                >
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
                                <img src="https://kr.object.ncloudstorage.com/semi/panda/${ele.userimage}" alt="" width="100%" class="cursor-pointer"
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
            $('#staticBackdrop2').modal('show');
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