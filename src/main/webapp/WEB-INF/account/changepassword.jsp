<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
<div class="mx-auto max-w-md space-y-6 py-12">
    <div class="space-y-2 text-center">
        <input type="hidden" id="email" name="email" value="${email}" />
        <h1 class="text-3xl font-bold">비밀번호 재설정</h1>
        <p class="text-gray-500 ">
            안전한 비밀번호로 내정보를 보호하세요.
        </p>
        <p class="text-gray-500 ">
            다른 아이디/사이트에서 사용한 적 없는 비밀번호,
        </p>
        <p class="text-gray-500 ">
            이전에 사용한 적 없는 비밀번호가 안전합니다.
        </p>
    </div>
    <div class="space-y-4">
        <div class="space-y-2">
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="new-password"
            >
                새로운 비밀번호
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    id="new-password"
                    placeholder="새로운 비밀번호를 입력하세요"
                    required=""
                    type="password"
                    name="newpassword"
            />
        </div>
        <div class="space-y-2">
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="confirm-password"
            >
                비밀번호 확인
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    id="confirm-password"
                    placeholder="새로운 비밀번호를 한 번 더 입력해 주세요"
                    required=""
                    type="password"
            />
        </div>
        <div class="flex items-center justify-between">
            <a class="text-sm underline" href="#">
            </a>
            <div class="flex">
                <button type="button" id="cancel" class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                    취소하기
                </button>
                <button type="button" id="changePassword" class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black">
                    변경하기
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        const urlParams = new URLSearchParams(window.location.search);
        const usernum = urlParams.get('usernum');

        $('#changePassword').click(function () {
            const newPassword = $('#new-password').val();
            const confirmPassword = $('#confirm-password').val();

            if (newPassword !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다.');
                return;
            }

            $.ajax({
                url: '/password/change',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ usernum: usernum, newPassword: newPassword }),
                success: function (response) {
                    alert(response);
                    window.location.href = '/login';
                },
                error: function (xhr, status, error) {
                    alert('비밀번호 변경에 실패했습니다.');
                }
            });
        });

        $("#cancel").click(function () {
            window.location.href = '/login';
        });
    });
</script>
</body>
</html>
