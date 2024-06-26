<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rate Your Experience</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <style>
        .star {
            width: 24px;
            height: 24px;
            fill: gray;
            cursor: pointer;
            stroke: black; /* 검은색 테두리 추가 */
            stroke-width: 2; /* 테두리 두께 설정 */
        }

        .star-filled {
            fill: #fdd835; /* 채워진 별 색상 */
        }
    </style>
</head>
<body>
<div class="bg-white  text-gray-950  min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="mx-auto max-w-md px-4 py-8 sm:px-6 lg:px-8">
            <div class="space-y-6">
                <div>
                    <h1 class="text-2xl font-bold">Rate Your Experience</h1>
                    <p class="text-gray-500">Please provide your feedback on the recent transaction.</p>
                </div>
                <form action="/product/review" method="post">
                    <input type="hidden" id="productnum" name="productnum" value="${productnum}">

                    <div class="grid gap-4">
                        <!-- 별점 추가 기능 -->
                        <div class="flex items-center gap-2" id="star-container">
                            <!-- SVG 폴리곤 별 아이콘들 -->
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    class="star"
                                    data-value="1">
                                <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    class="star"
                                    data-value="2">
                                <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    class="star"
                                    data-value="3">
                                <!-- 3점이 기본 클릭 상태로 -->
                                <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    class="star"
                                    data-value="4">
                                <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    class="star"
                                    data-value="5">
                                <polygon
                                        points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                        </div>

                        <!-- 별점 값 -->
                        <input type="hidden" name="reviewstar" id="reviewstar" value="0">

                        <!-- 리뷰 입력 텍스트필드 -->
                        <textarea
                                class="flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 resize-none"
                                placeholder="Write your review and feedback here..."
                                rows="4"
                                name="reviewcontent"
                                id="reviewcontent"
                        ></textarea>

                        <!-- 제출 버튼 -->
                        <button
                                class="inline-flex items-center justify-center whitespace-nowrap text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 w-full bg-[#4CAF50] hover:bg-[#43a047] text-white font-medium py-2 px-4 rounded"
                                type="submit">
                            Submit
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const stars = document.querySelectorAll('.star');
        const reviewStarInput = document.getElementById('reviewstar');

        stars.forEach(star => {
            star.addEventListener('click', function () {
                const value = this.getAttribute('data-value');
                highlightStars(value);
                reviewStarInput.value = value;
            });
        });

        function highlightStars(value) {
            stars.forEach(star => {
                if (star.getAttribute('data-value') <= value) {
                    star.classList.add('star-filled');
                } else {
                    star.classList.remove('star-filled');
                }
            });
        }
    });

    // reviewSubmit() 함수 정의
    function reviewSubmit() {
        const productnum = document.getElementById('productnum').value;
        const reviewstar = document.getElementById('reviewstar').value;
        const reviewcontent = document.getElementById('reviewcontent').value;

        // 서버로 전송할 데이터 구성
        const formData = new FormData();
        formData.append('productnum', productnum);
        formData.append('reviewstar', reviewstar);
        formData.append('reviewcontent', reviewcontent);

        // 서버로 데이터 전송
        fetch('/product/review', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                // 응답 처리
                console.log(response);
            })
            .catch(error => {
                // 오류 처리
                console.error(error);
            });

        // 페이지 리로드 방지
        return false;
    }
    //
    // function reviewSubmit() {
    //     let productnum = document.getElementById('productnum').value;
    //     let reviewstar = document.getElementById('reviewstar').value;
    //     let reviewcontent = document.getElementById('reviewcontent').value;
    //     fetch('/product/review', {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/x-www-form-urlencoded'
    //         },
    //         body: new URLSearchParams({
    //             "productnum": productnum,
    //             "reviewstar": reviewstar,
    //             "reviewcontent": reviewcontent
    //         })
    //     })
    //         .then(response => {
    //
    //         })
    //         .catch(error => {
    //         });
    // }
</script>
</body>
</html>
