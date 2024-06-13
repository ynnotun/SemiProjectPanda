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
</head>
<body>
<!--
// v0 by Vercel.
// https://v0.dev/t/8KsWYqI17QP
-->

<div class="mx-auto max-w-md space-y-6 py-12">
    <div class="space-y-2 text-center">
        <h1 class="text-3xl font-bold">비밀번호 재설정</h1>
        <p class="text-gray-500 dark:text-gray-400">
            안전한 비밀번호로 내정보를 보호하세요.
        </p>
        <p class="text-gray-500 dark:text-gray-400">
            다른 아이디/사이트에서 사용한 적 없는 비밀번호,
        </p>
        <p class="text-gray-500 dark:text-gray-400">
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
                <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                    취소하기
                </button>
                </button>
                <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black">
                    변경하기
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>