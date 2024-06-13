<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 13.
  Time: 오전 10:33
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
// https://v0.dev/t/wV48KM6fZ1E
-->
<div class="bg-white dark:bg-gray-950 p-4 md:p-6 grid gap-6">

    <!-- Post Your Item -->
    <div class="grid gap-2">
        <h1 class="text-2xl font-bold">Post Your Item</h1>
        <p class="text-gray-500 dark:text-gray-400">List your item for sale on our second-hand trading platform.</p>
    </div>

    <form class="grid gap-6">
        <!-- 게시글 제목 입력란 -->
        <div class="grid gap-2">
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="title">
                Title
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    id="title"
                    placeholder="Enter the title of your item"
            />
        </div>

        <!-- 사진 여러장 업로드.... -->
        <!-- 사진 미리보기 필요? -->
        <div class="grid gap-2">
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="photos">
                Photos
            </label>
            <!-- 여러 파일 업로드 -->
            <div class="guestformarea" style="width:400px;">
                <input type="file" id="photoupload" multiple="multiple">
            </div>

            <!-- 미리보기 만들기 -->
            <div>
                # 미리보기 리스트 출력? #
            </div>

        </div>

        <!-- 중고제품 설명 입력 -->
        <!-- description -->
        <div class="grid gap-2">
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="description">
                Description
            </label>
            <textarea
                    class="flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    id="description"
                    placeholder="Provide a detailed description of your item"
                    rows="4"></textarea>
        </div>

        <div class="grid md:grid-cols-2 gap-6">

            <!-- 가격 입력 -->
            <div class="grid gap-2">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="price">
                    Price
                </label>
                <div class="flex items-center gap-2">
                    <input
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                            type="number"
                            id="price"
                            placeholder="Enter the price"/>
                    <div>
                        Negotiable<!-- 생략? -->
                    </div>
                </div>
            </div>

            <!-- 거래 희망 지역 입력 -->
            <!-- 주소 입력 API 추가 -->
            <div class="grid gap-2">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="location">
                    Location
                </label>
                <!-- 클릭하면 도로명 주소 입력 API로 이동 -->
                <input
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        id="location"
                        placeholder="Enter the location"/>
            </div>
        </div>

        <div class="grid gap-2">
            <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">
                Hashtags
            </label>
            <div class="flex flex-wrap gap-2">
                <!-- 입력받은 해시태그들 나열 -->
                <!-- 어떻게 입력? -->
                <%-- # 칠때마다 새로 갱신 || 띄어쓰기마다 새로 갱신 || 엔터마다 새로 갱신 --%>

                <%--<div class="bg-green-50 dark:bg-green-900/20 text-green-500 dark:text-green-400 px-3 py-1 rounded-full">
                    #secondhand
                </div>
                <div class="bg-green-50 dark:bg-green-900/20 text-green-500 dark:text-green-400 px-3 py-1 rounded-full">
                    #tradingapp
                </div>
                <div class="bg-green-50 dark:bg-green-900/20 text-green-500 dark:text-green-400 px-3 py-1 rounded-full">
                    #useditems
                </div>
                <div class="bg-green-50 dark:bg-green-900/20 text-green-500 dark:text-green-400 px-3 py-1 rounded-full">
                    #bargains
                </div>--%>

                <!-- Hashtag 출력위치 -->
                <div>

                </div>

            </div>
            <div>
                <input
                        class="flex h-10 w-full border border-input text-sm ring-offset-background
                        file:border-0 file:bg-transparent file:text-sm file:font-medium
                        placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2
                        focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed
                        disabled:opacity-50 bg-green-50 dark:bg-green-900/20 text-green-500 dark:text-green-400
                        px-3 py-1 rounded-full"
                        placeholder="Add a hashtag"/>
            </div>
        </div>

        <!-- 게시글 등록 버튼 -->
        <!-- 클릭시 마이페이지로 이동 -->
        <div class="flex justify-end">
            <%--<button class="inline-flex items-center justify-center whitespace-nowrap
            text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none
            focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2
            disabled:pointer-events-none disabled:opacity-50 bg-black text-white
            hover:bg-primary/90 h-11 rounded-md px-8">
                Post Item
            </button>--%>

            <!-- 주소 조금 더 수정 필요 -->
            <a href="/product/detail"
               class="inline-flex items-center justify-center whitespace-nowrap
       text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none
       focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2
       disabled:pointer-events-none disabled:opacity-50 bg-black text-white
       hover:bg-primary/90 h-11 rounded-md px-8">
                Post Item
            </a>
        </div>

    </form>
</div>
</body>
</html>