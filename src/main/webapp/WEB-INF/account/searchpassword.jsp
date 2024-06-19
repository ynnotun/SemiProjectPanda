<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find Password</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <style>
        .emailchecked {
            background-color: #e6e6e6;
            border: 1px solid #e6e6e6;
            border-radius: 5px;
            position: relative;
            width: 150px;
            height: 40px;
            top: 12px;
        }

        .max-w-md {
            max-width: 35rem;
        }

        @media (min-width: 768px) {
            .md\:p-8 {
                padding: 2rem;
            }
        }
    </style>
</head>
<body>
<div class="w-full max-w-md mx-auto p-6 md:p-8 container">
    <h1 class="text-2xl font-bold mb-6 text-center">Find Password</h1>
    <div class="flex items-center" style="padding-bottom: 15px;">
        <div class="flex-1">
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="email">
                Email
            </label>
            <input
                    class="flex h-10 w-full1 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your email" style="width: 95%"/>
        </div>
        <button class="emailchecked" id="verification">
            인증코드 전송
        </button>
    </div>
    <div id="verificationSection" class="flex items-center" style="padding-bottom: 15px;">
        <div class="flex-1">
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="code">
                인증코드
            </label>
            <input
                    class="flex h-10 w-full1 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    name="code"
                    placeholder="Enter the code" style="width: 95%"/>
        </div>
        <button class="emailchecked" id="verificationcheck">
            인증
        </button>
    </div>
    <button
            class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 w-full bg-[#4CAF50] hover:bg-[#43a047] text-white"
            type="button" id="find" style="margin-top: 15px">
        Find
    </button>
</div>
<script>
    let isVerified = false;

    function sendCode() {
        const mailDto = {
            email: $('#email').val(),
            message: ''
        };

        $.ajax({
            url: '/mail/send',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(mailDto),
            success: function (response) {
                alert('인증번호를 전송했습니다.');
                $('#verificationSection').show();
            },
            error: function (error) {
                alert('인증번호 전송에 실패했습니다.');
            }
        });
    }

    function verifyCode() {
        const email = $('#email').val();
        const code = $('input[name="code"]').val();

        $.ajax({
            url: '/mail/verify',
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            data: $.param({email: email, code: code}),
            success: function (response) {
                if (response === "인증 성공") {
                    alert('인증 성공했습니다.');
                    isVerified = true;
                    $('#find').prop('disabled', false);
                } else {
                    alert('인증 실패했습니다.');
                }
            },
            error: function (xhr, status, error) {
                alert('인증에 실패했습니다.');
            }
        });
    }

    function findUserNumAndRedirect() {
        const email = $('#email').val();
        if (!isVerified) {
            alert('이메일 인증을 완료해주세요.');
            return;
        }

        $.ajax({
            url: '/findPassword', // URL 경로가 올바른지 확인
            type: 'POST', // 요청 메서드가 POST인지 확인
            contentType: 'application/x-www-form-urlencoded',
            data: $.param({email: email}),
            success: function (response) {
                const usernum = response.usernum;
                console.log('Response: ', response); // 응답 로그 추가
                if (usernum) {
                    window.location.href = `/password?usernum=` + usernum;
                } else {
                    alert('유저를 찾을 수 없습니다.');
                }
            },
            error: function (xhr, status, error) {
                console.error('XHR: ', xhr); // XHR 로그 추가
                console.error('Status: ', status); // Status 로그 추가
                console.error('Error: ', error); // Error 로그 추가
                alert('유저 번호 찾기에 실패했습니다.');
            }
        });
    }

    $(document).ready(function () {
        $('#verification').click(function () {
            sendCode();
        });

        $('#verificationcheck').click(function () {
            verifyCode();
        });

        $('#find').click(function () {
            findUserNumAndRedirect();
        });

        $('#verificationSection').hide();
    });
</script>
</body>
</html>
