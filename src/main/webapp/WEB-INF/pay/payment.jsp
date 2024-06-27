<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
        .container {
            font-family: "Comic Sans MS";
            background-color: #656565;
            border-radius: 15px;
            max-width: 500px;
            width: 100%;
            text-align: center;
            margin-top: 60px;
        }
        .paymentLabels:hover {
            background-color: white;
            font-weight: bold;
        }
        .paymentLabels.selected {
            background-color: white;
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
</head>
<body>

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
</script>


<div class="container">
    <div class="rounded-lg bg-card text-card-foreground" data-v0-t="card">
        <div class="flex flex-col space-y-1.5 p-6">
            <img src="https://kr.object.ncloudstorage.com/semi/panda/logo.png" style="width: 200px; height: auto">
        </div>
        <div class="p-6 grid gap-6">
            <div>
                <button type="button" role="radio" aria-checked="true" data-state="checked" value="point"
                        class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                        id="point" tabindex="-1" data-radix-collection-item="">
                            <span data-state="checked" class="flex items-center justify-center">
                            </span>
                </button>
                <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" checked="" value="point"/>
                <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                       for="point">
                    <i class="bi bi-currency-bitcoin" style="font-size: 2em; color: #4CAF50; margin-bottom: 10px;"></i>
                    <p style="font-size: 1.2em; font-weight: bold">포인트 결제</p>
                </label>
            </div>
            <div role="radiogroup" aria-required="false" dir="ltr" class="grid grid-cols-2 gap-4" tabindex="-1" style="outline:none">
                <div>
                    <button type="button" role="radio" aria-checked="true" data-state="checked" value="card"
                            class="aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 peer sr-only"
                            id="카드" tabindex="-1" data-radix-collection-item="">
                            <span data-state="checked" class="flex items-center justify-center">
                            </span>
                    </button>
                    <input type="radio" aria-hidden="true" style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0" tabindex="-1" checked="" value="card"/>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 flex flex-col items-center justify-between rounded-md border-2 border-muted bg-popover p-4 hover:bg-accent hover:text-accent-foreground peer-data-[state=checked]:border-primary [&:has([data-state=checked])]:border-primary paymentLabels"
                           for="카드">
                        <i class="bi bi-credit-card icon"></i>
                        <p style="font-size: 1.2em; font-weight: bold">카드</p>
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
                        <p style="font-size: 1.2em; font-weight: bold">가상계좌</p>
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
                        <p style="font-size: 1.2em; font-weight: bold">계좌이체</p>
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
                        <p style="font-size: 1.2em; font-weight: bold">휴대폰 결제</p>
                    </label>
                </div>
            </div>
            <div class="flex items-center gap-2" style="margin-top: 40px; margin-left: 50px;">
                <label style="min-width: 120px;height: 30px; margin-right: 30px;" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="name">
                    <p style="line-height: 30px; font-size: 22px; color: white">본인 닉네임</p>
                </label>
                <input value="${sessionScope.usernickname}" style="width: 200px; text-align: center; font-size: 18px;" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" id="name"/>
            </div>
            <div class="flex items-center gap-2" style="margin-left: 50px;">
                <label style="min-width: 120px; height: 30px; margin-right: 30px;" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="seller">
                    <p style="line-height: 30px; font-size: 22px; color: white">판매자 닉네임</p>
                </label>
                <input name="seller" style="width: 200px; font-size: 18px;" placeholder="Enter the Nickname..." class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" id="seller"/>
            </div>
            <div class="flex items-center gap-2" style="margin-left: 50px;">
                <label style="min-width: 120px; height: 30px; margin-right: 30px;" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="amount">
                    <p style="line-height: 30px; font-size: 22px; color: white">Price</p>
                </label>
                <input name="pointamount" style="width: 200px; font-size: 18px;" placeholder="Enter the Price..." class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" type="number" id="amount"/>
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
