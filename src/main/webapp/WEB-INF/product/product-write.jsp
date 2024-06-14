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
<div class="bg-white  text-gray-950  min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">

        <div class="bg-white  p-4 md:p-6 grid gap-6">

            <!-- Post Your Item -->
            <div class="grid gap-2">
                <h1 class="text-2xl font-bold">Post Your Item</h1>
                <p class="text-gray-500 ">List your item for sale on our second-hand trading
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
                            placeholder="Enter the title of your item"/>
                </div>

                <!-- 사진 여러장 업로드 + 미리보기 -->
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">
                        Photos
                    </label>
                    <!-- 사진 업로드와 미리보기 -->
                    <div class="mt-0 flex items-start gap-2">
                        <!-- 업로드 버튼 -->
                        <button type="button"
                                id="upload-button"
                                class="w-48 h-48 bg-[#e8e8e8] rounded flex items-center justify-center">
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="#585858"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="h-6 w-6">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                        </button>
                        <input type="file" id="file-input" accept="image/*" multiple class="hidden">

                        <!-- 사진 미리보기 -->
                        <div id="preview" class="mt-0 flex items-start gap-2">
                            <!-- 여기에 사진 미리보기 출력 -->
                        </div>
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

                <!-- 해시태그 이벤트 -->
                <div class="grid gap-2">
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">
                        Hashtags
                    </label>

                    <!-- 입력받은 해시태그들 나열 -->
                    <div class="flex flex-wrap gap-2" id="hashtag-container">
                        <!-- 해시태그가 여기에 나열됩니다 -->
                    </div>

                    <!-- 해시태그 입력 -->
                    <div>
                        <input
                                id="hashtag-input"
                                class="flex h-10 w-full border border-input text-sm ring-offset-background
        file:border-0 file:bg-transparent file:text-sm file:font-medium
        placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2
        focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed
        disabled:opacity-50 bg-green-50 text-green-500
        px-3 py-1 rounded-full"
                                placeholder="Add a hashtag"
                                onkeyup="handleHashtagInput(event)"
                        />
                    </div>
                </div>

                <!-- 게시글 등록 버튼 -->
                <!-- 클릭시 마이페이지로 이동 -->
                <div class="flex justify-end">
                    <button class="inline-flex items-center justify-center whitespace-nowrap
       text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none
       focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2
       disabled:pointer-events-none disabled:opacity-50 bg-black text-white
       hover:bg-primary/90 h-11 rounded-md px-8">
                        Post Item
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 이미지 업로드 이벤트 -->
<script>
    //이미지 여러장 업로드 이벤트
    document.getElementById('upload-button').addEventListener('click', function () {
        document.getElementById('file-input').click();
    });

    //업로드된 여러 사진 출력
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
                    img.className = 'h-48 w-48 object-cover rounded-md border';
                    previewContainer.appendChild(img);
                };
                reader.readAsDataURL(file);
            });
        }
    });
</script>

<!-- 해시태그 이벤트 -->
<script>
    const maxHashtags = 5;
    const hashtagContainer = document.getElementById('hashtag-container');
    const hashtagInput = document.getElementById('hashtag-input');
    let hashtags = [];

    //해시태그 입력중 enter가 입력되면 내용 잘라서 addHashtag함수 수행
    function handleHashtagInput(event) {
        if (event.key === 'Enter') {
            const inputValue = event.target.value.trim();
            if (inputValue && hashtags.length < maxHashtags) {
                addHashtag(inputValue);
                event.target.value = '';
            }
        }
    }

    //전달 받는 내용 조작
    function addHashtag(tag) {
        // # 안붙어 있으면 추가
        if (!tag.startsWith('#')) {
            tag = '#' + tag;
        }
        // hashtags 리스트에 중복되는 내용이 없을 경우만 renderHashtags()함수로 전달
        if (!hashtags.includes(tag)) {
            hashtags.push(tag);
            renderHashtags();
        }
    }

    //출력
    function renderHashtags() {
        hashtagContainer.innerHTML = '';
        hashtags.forEach(tag => {
            const tagElement = document.createElement('div');
            tagElement.className = 'bg-green-50 text-green-500 px-3 py-1 rounded-full';
            tagElement.textContent = tag;
            hashtagContainer.appendChild(tagElement);
        });
    }
</script>

<!-- 주소입력 팝업 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById('location').value = data.address;
            }
        }).open();
    }
</script>
</body>
</html>