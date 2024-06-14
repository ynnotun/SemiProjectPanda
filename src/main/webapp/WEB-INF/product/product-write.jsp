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
<div class="bg-white dark:bg-gray-950 text-gray-950 dark:text-gray-50 min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">

        <div class="bg-white dark:bg-gray-950 p-4 md:p-6 grid gap-6">

            <!-- Post Your Item -->
            <div class="grid gap-2">
                <h1 class="text-2xl font-bold">Post Your Item</h1>
                <p class="text-gray-500 dark:text-gray-400">List your item for sale on our second-hand trading
                    platform.</p>
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

                <!-- 사진 여러장 업로드 + 미리보기 -->
                <div>
                    <label
                            class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">
                        Photos
                    </label>

                    <!-- 사진 미리보기 -->
                    <div id="preview" class="mt-3 flex flex-wrap gap-2">

                    </div>

                    <!-- 사진 업로드 -->
                    <div class="mt-3">
                        <button
                                type="button"
                                id="upload-button"
                                class="inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 dark:bg-green-700 dark:hover:bg-green-800">
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
                            Upload Photos
                        </button>
                        <input type="file" id="file-input" accept="image/*" multiple class="hidden">
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
                        <!-- 클릭하면 도로명 주소 입력 API 팝업 출력 -->
                        <input
                                class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                                id="location"
                                placeholder="Enter the location"
                                onclick="openDaumPostcode()"/>
                    </div>
                </div>

                <!-- 해시태그 입력 -->
                <div class="grid gap-2">
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">
                        Hashtags
                    </label>

                    <!-- 입력받은 해시태그들 나열 -->
                    <div class="flex flex-wrap gap-2" id="hashtag-container"></div>

                    <!-- 해시태그 입력 -->
                    <!-- 5개까지만 추가 되게 수정 필요 -->
                    <div>
                        <input
                                id="hashtag-input"
                                class="flex h-10 w-full border border-input text-sm ring-offset-background
            file:border-0 file:bg-transparent file:text-sm file:font-medium
            placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2
            focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed
            disabled:opacity-50 bg-green-50 dark:bg-green-900/20 text-green-500 dark:text-green-400
            px-3 py-1 rounded-full"
                                placeholder="Add a hashtag"
                                onkeyup="handleHashtagInput(event)"
                        />
                    </div>
                </div>

                <!-- 게시글 등록 버튼 -->
                <!-- 클릭시 마이페이지로 이동 -->
                <div class="flex justify-end">
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
    </div>
</div>

<script>
    document.getElementById('upload-button').addEventListener('click', function () {
        document.getElementById('file-input').click();
    });

    document.getElementById('file-input').addEventListener('change', function (event) {
        const files = event.target.files;
        const previewContainer = document.getElementById('preview');
        previewContainer.innerHTML = ''; // 미리 보기 영역을 비웁니다.

        if (files.length > 0) {
            Array.from(files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = 'h-32 w-32 object-cover rounded-md border';
                    previewContainer.appendChild(img);
                };
                reader.readAsDataURL(file);
            });
        }
    });

    // 해시태그 추가 : 조금 더 수정 필요
    function handleHashtagInput(event) {
        const input = event.target;
        const container = document.getElementById('hashtag-container');
        const value = input.value.trim();

        // 해시태그 구분을 위해 입력된 #를 포함한 문자열 분리
        if (event.key === 'Enter' || event.key === ' ') {
            const hashtags = value.split(/[\s#]+/).filter(tag => tag.trim() !== '');
            input.value = '';

            hashtags.forEach(tag => {
                if (tag) {
                    const hashtagHTML = `<div class="bg-green-50 dark:bg-green-900/20 text-green-500 dark:text-green-400 px-3 py-1 rounded-full">#${tag.trim()}</div>`;
                    container.innerHTML += hashtagHTML;
                }
            });
        }
    }
</script>

<!-- 주소입력 팝업 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('location').value = data.address;
            }
        }).open();
    }
</script>
</body>
</html>