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

    <style>
        #reviewstar fieldset{
            display: inline-block;
            direction: rtl;
            border:0;
        }
        #reviewstar fieldset legend{
            text-align: right;
        }
        #reviewstar input[type=radio]{
            display: none;
        }
        #reviewstar label{
            font-size: 3em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }
        #reviewstar label:hover{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #reviewstar label:hover ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #reviewstar input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
    </style>

</head>
<body>
<!--
// v0 by Vercel.
// https://v0.dev/t/Q9GBgLaNBI4
-->
<div class="bg-white dark:bg-gray-950 text-gray-950 dark:text-gray-50 min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
<div class="mx-auto max-w-md px-4 py-8 sm:px-6 lg:px-8">
    <div class="space-y-6">

        <div>
            <h1 class="text-2xl font-bold">Rate Your Experience</h1>
            <p class="text-gray-500">Please provide your feedback on the recent transaction.</p>
        </div>

        <div class="grid gap-4">

            <!-- 별점 추가 기능 + 애니메이션 추가 -->
            <div class="flex items-center gap-2">
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
                        class="w-6 h-6 fill-yellow-400"
                >
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                </svg>
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
                        class="w-6 h-6 fill-yellow-400"
                >
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                </svg>
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
                        class="w-6 h-6 fill-yellow-400"
                >
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                </svg>
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
                        class="w-6 h-6 fill-yellow-400"
                >
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                </svg>
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
                        class="w-6 h-6 fill-gray-300"
                >
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                </svg>
            </div>

            <!-- 별점주기 예시 -->
            <div id="reviewstar">
                <fieldset>
                    <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">★</label>
                    <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label>
                    <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label>
                    <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label>
                    <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">★</label>
                </fieldset>
            </div>



            <!--  =============================================================================== -->

            <!-- 리뷰 입력 텍스트필드 -->
            <textarea
                    class="flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 resize-none"
                    placeholder="Write your review and feedback here..."
                    rows="4"
            ></textarea>

            <!-- 제출 버튼 -->
            <button
                    class="inline-flex items-center justify-center whitespace-nowrap text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 w-full bg-[#4CAF50] hover:bg-[#43a047] text-white font-medium py-2 px-4 rounded"
                    type="submit"
            >
                Submit
            </button>
            <!-- -->

        </div>
    </div>
</div>
    </div>
</div>
</body>
</html>