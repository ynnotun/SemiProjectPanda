<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <script src="${root}/js/modal.js"></script>
    <title></title>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<style>
    .emailchecked {
        background-color: #e6e6e6;
        border: 1px solid #e6e6e6;
        border-radius: 5px;
        position: relative;
        width: 150px;
        height: 40px;
        top: 12px;
        left: -55px;
    }
    .container {
        position: relative;
        width: 300%;
        height: 100vh;
        overflow: hidden;
    }
    .page {
        position: absolute;
        width: 100%;
        height: 100%;
        transition: transform 0.6s ease-in-out;
    }
    #page2 {
        transform: translateX(300%);
    }
    .w-full {
        width: 90%;
    }
    .w-full1 {
        width: 85%;
    }
    @media (min-width: 768px) {
        .md\:p-8 {
            padding: 2rem;
        }
    }
    #propileimg1, #propileimg2, #propileimg3 {
        border: 1px solid #ddd;
        width: 150px;
        height: 150px;
        border-radius: 200px;
        cursor: pointer;
    }
    .max-w-md {
        max-width: 35rem;
    }
    .hidden {
        display: none;
    }
    #timer {
        display: none; /* 초기에는 숨김 */
    }
    #loading {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 10px 20px;
        background-color: #000;
        color: #fff;
        border-radius: 5px;
        display: none; /* 처음엔 숨김 */
    }
</style>
<body>
<div class="w-full mx-auto p-6 md:p-8 container">
    <h1 class="text-2xl font-bold mb-6 text-center">Register</h1>
    <form class="space-y-4" action="./save" method="post" enctype="multipart/form-data">
        <div class="page" id="page1" style="width: 100%">
            <div style="padding-bottom: 15px; width: 40%; margin: auto;">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="name">
                    Name
                </label>
                <input
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        type="text"
                        id="name"
                        name="username"
                        placeholder="Enter your full name"/>
            </div>
            <div style="padding-bottom: 15px; width: 40%; margin: auto;">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="phone">
                    Phone Number
                </label>
                <input
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        type="tel"
                        id="phone"
                        name="userphonenumber"
                        placeholder="Enter your phone number"/>
            </div>
            <div style="padding-bottom: 15px; width: 40%; margin: auto;">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="address">
                    Address
                </label>
                <input
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        type="text"
                        id="address"
                        name="useraddress"
                        placeholder="Enter your address"
                        onclick="openDaumPostcode()"/>
            </div>
            <input type="hidden" id="latitude" name="productlocationx"/>
            <input type="hidden" id="longitude" name="productlocationy"/>
            <div class="flex items-center" style="padding-bottom: 15px; width: 40%; margin: auto;">
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
                            name="useremail"
                            placeholder="Enter your email"/>
                </div>
                <button class="emailchecked" id="checkButton" type="button">
                    인증코드 전송
                </button>
            </div>
            <div class="flex items-center hidden" id="emailCheckSection" style="padding-bottom: 15px; width: 40%; margin: auto;">
                <div class="flex-1">
                    <label
                            class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                            for="email">
                        인증코드 입력
                    </label>
                    <div id="timer" style="color: red">남은시간 03:00</div>
                    <div id="loading">전송 중...</div>
                    <input
                            class="flex h-10 w-full1 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                            id="emailcheck"
                            placeholder="Enter verification code"/>
                </div>
                <button class="emailchecked" type="button" id="verifyButton">
                    인증
                </button>
            </div>
            <div style="padding-bottom: 15px; width: 40%; margin: auto;">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="password">
                    Password
                </label>
                <input
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        type="password"
                        id="password"
                        name="userpassword"
                        placeholder="Enter your password"/>
            </div>
            <div style="padding-bottom: 15px; width: 40%; margin: auto;">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="confirm-password">
                    Confirm Password
                </label>
                <input
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        type="password"
                        id="confirm-password"
                        placeholder="Confirm your password"/>
            </div>
            <div style="padding-bottom: 15px; width: 40%; margin: auto;">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="dob">
                    Date of Birth
                </label>
                <input
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        type="date"
                        name="userbirthday"
                        id="dob" style="margin-bottom: 15px;"/>
                <form id="frm1">
                    <div class="g-recaptcha" data-sitekey="6Ldh4_0pAAAAAFZ33u3F4pw06gtabPhgMytSIham" style="margin-bottom: 15px; justify-content: center; display: flex"></div>
                </form>
                <button
                        class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 w-full bg-[#4CAF50] hover:bg-[#43a047] text-white"
                        type="button" id="next">
                    Next
                </button>
            </div>
        </div>
        <div class="page" id="page2" style="width: 100%">
            <div class="max-w-md mx-auto px-4 py-8 sm:px-6 lg:px-8">
                <div class="space-y-6">
                    <div>
                        <button
                                class="inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2"
                                type="button" id="back" style="margin-bottom: 15px;">
                            back
                        </button>
                        <label for="nickname" class="block text-sm font-medium text-gray-700 ">
                            Nickname
                        </label>
                        <div class="mt-1 flex items-center">
                            <input
                                    id="nickname"
                                    name="usernickname"
                                    type="text"
                                    class="block w-full rounded-md border-gray-300 shadow-sm focus:border-green-500 focus:ring-green-500 sm:text-sm"
                                    placeholder="Enter your nickname" style="height: 30px"/>
                            <button
                                    type="button"
                                    id="nicknamebtn"
                                    class="ml-3 inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
                                Check Availability
                            </button>
                        </div>
                    </div>
                    <div style="padding-top: 15px;">
                        <label class="block text-sm font-medium text-gray-700 ">Default Profile Options</label>
                        <div class="mt-1 grid grid-cols-3 gap-3">
                            <div class="relative">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-full" id="propileimg1">
                                    <img src="https://kr.object.ncloudstorage.com/semi/panda/%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%841.png"
                                         alt="Profile 1" class="h-full w-full object-cover profilephoto"
                                         id="photo"
                                         style="width: 100px; height: 100px;position: relative; top: 25px;left: 25px;"/>
                                    <input type="file" name="myfile" id="photoupload" style="display: none;">
                                    <input type="radio" name="userprofileimage" id="radio1" style="display: none;">
                                </div>
                                <span style="display: flex;flex-direction: column;align-items: center;">버튼을 눌러서</span>
                                <span style="display: flex;flex-direction: column;align-items: center;">사진 업로드</span>
                            </div>
                            <div class="relative">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-full" id="propileimg2">
                                    <img src="https://kr.object.ncloudstorage.com/semi/panda/기본프로필2.jpeg"
                                         alt="Profile 2" class="h-full w-full object-cover profilephoto"
                                         style="width: 150px; height: 150px;"/>
                                    <input type="radio" name="userprofileimage" value="기본프로필2.jpeg" id="radio2" style="display: none;">
                                </div>
                            </div>
                            <div class="relative">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-full" id="propileimg3">
                                    <img src="https://kr.object.ncloudstorage.com/semi/panda/기본프로필3.jpeg"
                                         alt="Profile 3" class="h-full w-full object-cover profilephoto"
                                         style="width: 150px; height: 150px;"/>
                                    <input type="radio" name="userprofileimage" value="기본프로필3.jpeg" id="radio3" style="display: none;">
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <button
                                    type="button"
                                    onclick="$('#photoupload').trigger('click')"
                                    class="inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
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
                                        class="mr-2 h-5 w-5">
                                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                    <polyline points="17 8 12 3 7 8"></polyline>
                                    <line x1="12" x2="12" y1="3" y2="15"></line>
                                </svg>
                                Upload Photo
                            </button>
                        </div>
                    </div>
                    <div>
                        <button
                                type="submit"
                                class="w-full inline-flex items-center justify-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
                            Complete Registration
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    let isEmailVerified = false;
    let isRecaptchaVerified = false;
    var timerInterval;

    $("#back").click(function() {
        $("#page1").css("transform", "translateX(0)");
        $("#page2").css("transform", "translateX(100%)");
    });

    function verifyEmailCode() {
        const email = $('#email').val();
        const code = $('#emailcheck').val();

        $.ajax({
            url: '/mail/verify',
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            data: $.param({ email: email, code: code }),
            success: function(response) {
                if (response === "인증 성공") {
                    openModal('PANDA', '이메일 인증이 성공하였습니다.', `closeModal()`)
                    isEmailVerified = true;
                    clearInterval(timerInterval); // 타이머 정지
                    document.getElementById('timer').style.display = 'none'; // 타이머 숨기기
                    document.getElementById('emailCheckSection').classList.add('hidden'); // 인증 섹션 숨기기
                } else {
                    openModal('PANDA', '이메일 인증이 실패하였습니다.', `closeModal()`)
                }
            },
            error: function(xhr, status, error) {
                if (xhr.status === 400) {
                    alert('인증 실패했습니다.');
                } else {
                    alert('Failed to verify code.');
                }
            }
        });
    }

    function verifyRecaptcha() {
        $.ajax({
            url: '/VerifyRecaptcha',
            type: 'post',
            data: { recaptcha: $("#g-recaptcha-response").val() },
            success: function(res) {
                const data = JSON.parse(res);
                if (data.success) {
                    isRecaptchaVerified = true;
                    if (isEmailVerified) {
                        $("#page1").css("transform", "translateX(-100%)");
                        $("#page2").css("transform", "translateX(0)");
                    } else {
                        alert("이메일 인증을 완료해주세요.");
                    }
                } else {
                    isRecaptchaVerified = false;
                    alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                }
            },
            error: function() {
                alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
            }
        });
    }

    $("#next").click(function() {
        verifyRecaptcha();
    });

    $("#verifyButton").click(function() {
        verifyEmailCode();
    });

    $("#propileimg1").click(function() {
        $("#propileimg1").css("border", "3px solid black");
        $("#propileimg2").css("border", "1px solid #ddd");
        $("#propileimg3").css("border", "1px solid #ddd");
        $("#radio1").prop("checked", true);
    });

    $("#propileimg2").click(function() {
        $("#propileimg1").css("border", "1px solid #ddd");
        $("#propileimg2").css("border", "3px solid black");
        $("#propileimg3").css("border", "1px solid #ddd");
        $("#radio2").prop("checked", true);
    });

    $("#propileimg3").click(function() {
        $("#propileimg1").css("border", "1px solid #ddd");
        $("#propileimg2").css("border", "1px solid #ddd");
        $("#propileimg3").css("border", "3px solid black");
        $("#radio3").prop("checked", true);
    });

    $("#photoupload").change(function() {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $("#photo").attr("src", e.target.result);
                $("#photo").css({
                    "width": "150px",
                    "height": "150px",
                    "top": "0px",
                    "left": "0px"
                });
            }
            reader.readAsDataURL(file);
        }
    });

    $(function() {
        $("#nicknamebtn").click(function() {
            if ($("#nickname").val() == '') {
                openModal('PANDA', '가입할 닉네임을 작성해주세요.', `closeModal()`)
                return;
            }
            $.ajax({
                type: "get",
                dataType: "json",
                url: "./nicknamecheck",
                data: { "searchnickname": $("#nickname").val() },
                success: function(data) {
                    if (data.count == 0) {
                        openModal('PANDA', '가입이 가능한 닉네임입니다.', `closeModal()`)
                        jungbok = true;
                    } else {
                        openModal('PANDA', '이미 사용중인 닉네임입니다.', `closeModal()`)
                        jungbok = false;
                        $("#nickname").val("");
                    }
                }
            })
            //아이디를 입력시 다시 중복확인을 누르도록 중복변수를 초기화
            $("#nickname").keyup(function() {
                jungbok = false;
            })
        })//

        function check() {
            if (!jungbok) {
                openModal('PANDA', '닉네임 중복확인을 해주세요.', `closeModal()`)
                return false; // false반환시 action 실행을 안함
            }
        }
    });

    $(function() {
        $("#checkButton").click(function() {
            if ($("#email").val() == '') {
                openModal('PANDA', '가입할 이메일을 입력해주세요.', `closeModal()`)
                return;
            }
            $.ajax({
                type: "get",
                dataType: "json",
                url: "./emailcheck",
                data: { "searchemail": $("#email").val() },
                async: false,
                success: function(data) {
                    if (data.count === 0) {
                        openModal('PANDA', '가능한 이메일입니다.', `closeModal()`)
                        jungbok = true;
                        $("#loading").show();
                        const email = $('#email').val();
                        const mailDto = {
                            email: email,
                            message: ''
                        };
                        $.ajax({
                            url: '/mail/send',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify(mailDto),
                            success: function(response) {
                                $("#loading").hide();
                                openModal('PANDA', '이메일전송이 되었습니다.', `closeModal()`)
                                $('#emailCheckSection').removeClass('hidden');
                                clearInterval(timerInterval);
                                var duration = 180;
                                var display = document.getElementById('timer');
                                display.style.display = 'block';
                                var timer = duration, minutes, seconds;
                                timerInterval = setInterval(function() {
                                    minutes = parseInt(timer / 60, 10);
                                    seconds = parseInt(timer % 60, 10);
                                    minutes = minutes < 10 ? "0" + minutes : minutes;
                                    seconds = seconds < 10 ? "0" + seconds : seconds;
                                    display.textContent = "남은시간 " + minutes + ":" + seconds;
                                    if (--timer < 0) {
                                        clearInterval(timerInterval);
                                        openModal('PANDA', '시간이 초과되었습니다.', `closeModal()`)
                                    }
                                }, 1000);
                            },
                            error: function(error) {
                                $("#loading").hide();
                                openModal('PANDA', '전송이 실패하였습니다.', `closeModal()`)
                            }
                        });
                    } else {
                        openModal('PANDA', '이미 생성된 이메일입니다.', `closeModal()`)
                        jungbok = false;
                        $("#email").val("");
                        clearInterval(timer); // 타이머 정지
                        document.getElementById('timer').style.display = 'none'; // 타이머 숨기기
                        document.getElementById('emailCheckSection').classList.add('hidden'); // 인증 섹션 숨기기
                    }
                }
            })
        })
    });

    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var geocoder = new kakao.maps.services.Geocoder();
                var roadAddr = data.roadAddress;
                var callback = function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        console.log(result);
                        var lat = result[0].y;
                        var lng = result[0].x;
                        document.getElementById('latitude').value = lat;
                        document.getElementById('longitude').value = lng;
                        console.log('위도:', lat, '경도:', lng);
                    }
                };
                document.getElementById('address').value = roadAddr;
                console.log(roadAddr);
                geocoder.addressSearch(roadAddr, callback);
            }
        }).open();
    }
</script>
<!-- 주소입력 팝업 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- kakao 주소찾기 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0988ea389a80dcfa4f93816fc3b6129&libraries=services"></script><!-- kakao JS appkey 콩비꺼 넣음 -->
</body>
</html>
