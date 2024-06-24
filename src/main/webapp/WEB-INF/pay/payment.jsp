<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://js.tosspayments.com/v1/payment"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        .container {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .paymentLabels:hover {
            background-color: #cdfafa;
            font-weight: bold;
        }
        .paymentLabels.selected {
            background-color: #cdfafa;
            font-weight: bold;
        }
        .icon {
            font-size: 2rem;
            color: #45a049;
            margin-bottom: 10px;
        }

        #pay-button {
            background-color: #45a049;
            color: white;
        }
        #pay-button:hover {
            background-color: #3d8d3b;
        }
    </style>
    <script>
        $(function(){
            function pay(method){
                var clientKey = 'test_ck_jExPeJWYVQwONKXNQEXx849R5gvN';
                var tossPayments = TossPayments(clientKey);

                var amount = document.getElementById("amount").value;
                var orderId = createOrderId('0');
                var orderName = '테스트 결제';
                var customerName = document.getElementById("name").value;

                tossPayments
                    .requestPayment(method, {
                        amount: amount,
                        orderId: orderId,
                        orderName: orderName,
                        customerName: customerName,
                        successUrl: 'http://localhost:9000',
                        failUrl: 'http://localhost:9000/payment'
                    })
                    .catch(function (error) {
                        console.log(error);
                        if (error.code === 'USER_CANCEL') {
                            alert("결제 취소");
                            location.reload();
                        } else if (error.code === 'INVALID_CARD_COMPANY') {
                            alert("카드번호 확인 요망");
                            location.reload();
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
            return randomLetters + user_no;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="rounded-lg border bg-card text-card-foreground shadow-sm w-full max-w-md" data-v0-t="card">
        <div class="flex flex-col space-y-1.5 p-6">
            <h3 class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">결제 수단 선택</h3>
            <p class="text-sm text-muted-foreground">결제 수단을 선택하고 결제 정보를 입력하세요.</p>
        </div>
        <div class="p-6 grid gap-6">
            <span style="font-weight: lighter;font-size: 12px">미선택 시 선택창이 열립니다.</span>
            <div role="radiogroup" aria-required="false" dir="ltr" class="grid grid-cols-2 gap-4" tabindex="-1" style="outline:none">
                <div>
                    <button type="button" role="radio" aria-checked="true" data-state="checked" value="card"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="카드" tabindex="-1" data-radix-collection-item="">
                            <span data-state="checked" class="flex items-center justify-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle h-2.5 w-2.5 fill-current text-current">
                                    <circle cx="12" cy="12" r="10"></circle>
                                </svg>
                            </span>
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" checked="" value="card"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="카드">
                        <i class="bi bi-credit-card icon"></i>
                        카드
                    </label>
                </div>
                <div>
                    <button type="button" role="radio" aria-checked="false" data-state="unchecked" value="virtual-account"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="가상계좌" tabindex="-1" data-radix-collection-item="">
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" value="virtual-account"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="가상계좌">
                        <i class="bi bi-wallet icon"></i>
                        가상계좌
                    </label>
                </div>
                <div>
                    <button type="button" role="radio" aria-checked="false" data-state="unchecked" value="bank-transfer"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="계좌이체" tabindex="-1" data-radix-collection-item="">
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" value="bank-transfer"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="계좌이체">
                        <i class="bi bi-cash icon"></i>
                        계좌이체
                    </label>
                </div>
                <div>
                    <button type="button" role="radio" aria-checked="false" data-state="unchecked" value="mobile-payment"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="휴대폰" tabindex="-1" data-radix-collection-item="">
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" value="mobile-payment"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="휴대폰">
                        <i class="bi bi-phone icon"></i>
                        휴대폰 결제
                    </label>
                </div>
            </div>
            <div class="flex items-center gap-2" style="margin-top: 40px;">
                <label style="min-width: 80px;" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="name">
                    Nickname
                </label>
                <input value="${sessionScope.usernickname}" style="width: 200px; text-align: center" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" id="name"/>
            </div>
            <div class="flex items-center gap-2">
                <label style="min-width: 80px;" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="amount">
                    Price
                </label>
                <input style="width: 200px;" placeholder="Enter the price..." class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" type="number" id="amount"/>
            </div>
        </div>
        <div class="flex items-center p-6" style="width: 100%; justify-content: center; align-items: center;">
            <button value="" type="button" id="pay-button"
                    class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 pay-button"
                    style="color: white; font-weight: bold; background-color: #45a049;">
                결제하기
            </button>

        </div>
    </div>
</div>
</body>
</html>
