<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <title></title>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="font-size: 20px; font-weight: bold;">회원 탈퇴</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>회원 탈퇴를 진행하시겠습니까? 이 작업은 되돌릴 수 없습니다.</p>
                <br>
                <p>탈퇴를 진행하면 다음 항목에 대한 접근을 잃게 됩니다 :
                <ul>
                    <li>∙ 프리미엄 콘텐츠 및 기능</li>
                    <li>∙ 저장된 설정 및 데이터</li>
                </ul>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="confirmDelete" style="background-color: #ff4141; border: 0px;">Delete</button>
            </div>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="max-w-md mx-auto px-4 py-8 sm:px-6 lg:px-8">
    <div class="space-y-6">
        <div>
            <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="nickname">닉네임 변경</label>
            <div class="mt-1 flex items-center">
                <input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                       type="text" id="nickname" placeholder="Enter your nickname" value="${userDto.usernickname}"/>
                <button id="checkNickname" type="button" class="ml-3 inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 whitespace-nowrap">중복체크</button>
            </div>
        </div>
        <div>
            <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="password">비밀번호 변경</label>
            <input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                   type="password" id="password" placeholder="Enter your password"/>
        </div>
        <div>
            <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="confirm-password">비밀번호 확인</label>
            <input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                   type="password" id="confirm-password" placeholder="Confirm your password"/>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 ">프로필 사진 변경</label>
            <div class="mt-1 grid grid-cols-3 gap-3">
                <div class="relative">
                    <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-full">
                        <img id="photo" src="https://kr.object.ncloudstorage.com/semi/panda/${userDto.userprofileimage}" alt="Profile 1" class="h-full w-full object-cover"/>
                        <input type="file" name="myfile" id="photoupload" style="display: none;">
                    </div>
                    <div class="absolute inset-0 flex items-center justify-center bg-green-500 bg-opacity-75 opacity-0 transition-opacity hover:opacity-100">
                        <button type="button" class="inline-flex items-center rounded-full bg-white px-2 py-1 text-xs font-medium text-green-600 shadow-sm hover:bg-green-100 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">Select</button>
                    </div>
                </div>
            </div>
            <div class="mt-3">
                <button onclick="$('#photoupload').trigger('click')" type="file" class="inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2 h-5 w-5">
                        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                        <polyline points="17 8 12 3 7 8"></polyline>
                        <line x1="12" x2="12" y1="3" y2="15"></line>
                    </svg>
                    Upload Photo
                </button>
            </div>
        </div>

    </div>
        <hr style="margin-bottom: 10px; margin-top: 30px;">
    <div style="margin-bottom: 10px;">
        <button type="button" id="completeRegister" class="w-full inline-flex items-center justify-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">변경하기</button>
    </div>
    <!-- Button trigger modal -->
    <button id="deleteAccount" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color: #ff4141; border: 0px; float: right; font-size: 13px;">Delete Account</button>
    <div style="clear: both"></div>
</div>
<script>
    $(document).ready(function() {
        const urlParams = new URLSearchParams(window.location.search);
        const usernum = urlParams.get('usernum');

        $('#checkNickname').click(function() {
            const nickname = $('#nickname').val();

            $.ajax({
                url: '/mypage/checkNickname',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ nickname: nickname }),
                success: function(response) {
                    if (response.exists) {
                        alert('이미 사용중인 닉네임입니다.');
                    } else {
                        alert('사용가능한 닉네임입니다.');
                    }
                },
                error: function(xhr, status, error) {
                    console.log(error);
                    alert(error);
                }
            });
        });

        $("#photoupload").change(function () {
            const file = this.files[0];
            if (file) {
                const formData = new FormData();
                formData.append("upload", file);
                formData.append("num", usernum); // 사용자 번호 추가

                $.ajax({
                    url: '/upload',
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            $("#photo").attr("src", e.target.result);
                            $("#photo").css({
                                "width": "150px",
                                "height": "150px",
                                "top": "0px",
                                "left": "0px"
                            });
                        }
                        reader.readAsDataURL(file);
                    },
                    error: function(xhr, status, error) {
                        console.log('Error:', error);
                    }
                });
            }
        });

        $('#completeRegister').click(function() {
            const usernickname = $('#nickname').val();
            const userpassword = $('#password').val();
            const userprofileimage = $('#photo').attr('src'); // 업로드된 이미지의 URL

            $.ajax({
                url: '/mypage/updatecomplete',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ usernum: usernum, usernickname: usernickname, userpassword: userpassword, userprofileimage: userprofileimage }),
                success: function(response) {
                    alert(response);
                    logout();
                },
                error: function(xhr, status, error) {
                    console.log('Error:', error);
                    alert(error);
                }
            });
        });

        $('#confirmDelete').click(function() {
            $.ajax({
                url: '/mypage/delete',
                type: 'POST',
                data: { usernum: usernum },
                success: function(response) {
                    alert(response);
                    window.location.href = '/quit'; //또 확인하는 의미없는 페이지로 넘기기
                },
                error: function(xhr, status, error) {
                    console.log('Error:', error);
                    alert('Failed to delete account: ' + error);
                }
            });
        });
    });

    function logout(){
        // 로그아웃 요청
        $.ajax({
            type: "get",
            dataType: "text",
            url: '/member/logout',
            success: function(logoutResponse) {
                window.location.href = '${root}/login'; // 로그인 페이지로 리디렉션
            },
            error: function(xhr, status, error) {
                console.log('Logout Error:', error);
            }
        });
    }
</script>

</body>
</html>
