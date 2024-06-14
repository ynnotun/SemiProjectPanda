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
    <style>
        .button-primary:hover{
            background-color: rgb(30 41 59) !important;
        }
    </style>
</head>
<body>

<!--
// v0 by Vercel.
// https://v0.dev/t/rhPpxxFMCAR
-->
<div class="bg-white  text-gray-950  min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="grid ">
            <div class="grid gap-8">

                <div class="grid gap-4">
                    <div class="flex items-center gap-4">
            <span class="relative flex shrink-0 overflow-hidden rounded-full w-16 h-16 border-2 border-green-500">
              <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JD</span>
            </span>
                        <div class="grid gap-1">
                            <h1 class="text-2xl font-bold">John Doe</h1>
                            <div class="flex items-center gap-2 text-sm text-gray-500 ">
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
                                        class="w-4 h-4"
                                >
                                    <line x1="2" x2="5" y1="12" y2="12"></line>
                                    <line x1="19" x2="22" y1="12" y2="12"></line>
                                    <line x1="12" x2="12" y1="2" y2="5"></line>
                                    <line x1="12" x2="12" y1="19" y2="22"></line>
                                    <circle cx="12" cy="12" r="7"></circle>
                                </svg>
                                <span>San Francisco, CA</span>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center gap-4">
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                           <span class="text-green-500">
                                <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="w-4 h-4"
                                >
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                            </span>
                            <span>4.8</span>
                        </div>
                        <div data-orientation="vertical" role="none" class="shrink-0 bg-gray-100 w-[1px] h-6"></div>
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
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
                                    class="w-4 h-4"
                            >
                                <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path>
                                <circle cx="9" cy="7" r="4"></circle>
                                <path d="M22 21v-2a4 4 0 0 0-3-3.87"></path>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                            </svg>
                            <span>125 reviews</span>
                        </div>
                        <div data-orientation="vertical" role="none" class="shrink-0 bg-gray-100 w-[1px] h-6"></div>
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                            <img src="../image/good-member.svg" alt="">
                            <span>우수회원</span>
                        </div>
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                            <img src="../image/normal-member.svg" alt="">
                            <span>일반회원</span>
                        </div>
                        <div class="flex items-center gap-2 text-sm text-gray-500 ">
                            <img src="../image/bad-member.svg" alt="">
                            <span>주의회원</span>
                        </div>
                        <div data-orientation="vertical" role="none" class="shrink-0 bg-gray-100 w-[1px] h-6"></div>
                        <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10">
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
                                    class="w-4 h-4"
                            >
                                <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                            <span class="sr-only">Settings</span>
                        </button>
                    </div>
                </div>
                <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>
                <section class="">
                    <div class="flex items-center justify-between mb-6">
                        <h2 class="text-2xl font-bold"><a href="">판매내역</a></h2>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <img
                                    src="/placeholder.svg"
                                    width="300"
                                    height="200"
                                    alt="Product"
                                    class="rounded-t-lg object-cover w-full h-48"
                                    style="aspect-ratio:300/200;object-fit:cover"
                            />
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">Vintage Camera</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">$50</span>
                                    <span class="text-gray-500">예약중</span>
                                </div>

                                <div class="flex">
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                                        예약 취소
                                    </button>
                                    <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black">
                                        거래 완료
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <img
                                    src="/placeholder.svg"
                                    width="300"
                                    height="200"
                                    alt="Product"
                                    class="rounded-t-lg object-cover w-full h-48"
                                    style="aspect-ratio:300/200;object-fit:cover"
                            />
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">Vintage Camera</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">$50</span>
                                    <span class="text-gray-500">예약중</span>
                                </div>

                                <div class="flex">
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                                        예약 취소
                                    </button>
                                    <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black">
                                        거래 완료
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <img
                                    src="/placeholder.svg"
                                    width="300"
                                    height="200"
                                    alt="Product"
                                    class="rounded-t-lg object-cover w-full h-48"
                                    style="aspect-ratio:300/200;object-fit:cover"
                            />
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">Vintage Camera</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">$50</span>
                                    <span class="text-gray-500">예약중</span>
                                </div>

                                <div class="flex">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="">
                    <div class="flex items-center justify-between mb-6">
                        <h2 class="text-2xl font-bold"><a href="">구매내역</a></h2>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <img
                                    src="/placeholder.svg"
                                    width="300"
                                    height="200"
                                    alt="Product"
                                    class="rounded-t-lg object-cover w-full h-48"
                                    style="aspect-ratio:300/200;object-fit:cover"
                            />
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">Vintage Camera</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">$50</span>
                                    <span class="text-gray-500">예약중</span>
                                </div>

                                <div class="flex">
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                                        예약 취소
                                    </button>
                                    <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black">
                                        거래 완료
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <img
                                    src="/placeholder.svg"
                                    width="300"
                                    height="200"
                                    alt="Product"
                                    class="rounded-t-lg object-cover w-full h-48"
                                    style="aspect-ratio:300/200;object-fit:cover"
                            />
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">Vintage Camera</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">$50</span>
                                    <span class="text-gray-500">예약중</span>
                                </div>

                                <div class="flex">
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 rounded-md px-3 border-1 border-black mr-2 hover:bg-gray-200">
                                        예약 취소
                                    </button>
                                    <button class="button-primary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white h-9 rounded-md px-3 mr-2 bg-black">
                                        거래 완료
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <img
                                    src="/placeholder.svg"
                                    width="300"
                                    height="200"
                                    alt="Product"
                                    class="rounded-t-lg object-cover w-full h-48"
                                    style="aspect-ratio:300/200;object-fit:cover"
                            />
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">Vintage Camera</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">$50</span>
                                    <span class="text-gray-500">예약중</span>
                                </div>

                                <div class="flex">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>
                <div class="grid gap-4">
                    <h2 class="text-2xl font-bold">찜목록</h2>
                    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <div class="p-6">
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center gap-2">
                                        <img
                                                src="/placeholder.svg"
                                                alt="Product Image"
                                                width="48"
                                                height="48"
                                                class="rounded-md"
                                                style="aspect-ratio:48/48;object-fit:cover"
                                        />
                                        <div class="grid gap-1">
                                            <div class="font-medium">Vintage Typewriter</div>
                                            <div class="text-sm text-gray-500 ">$75</div>
                                        </div>
                                    </div>
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                        View
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <div class="p-6">
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center gap-2">
                                        <img
                                                src="/placeholder.svg"
                                                alt="Product Image"
                                                width="48"
                                                height="48"
                                                class="rounded-md"
                                                style="aspect-ratio:48/48;object-fit:cover"
                                        />
                                        <div class="grid gap-1">
                                            <div class="font-medium">Vintage Camera</div>
                                            <div class="text-sm text-gray-500 ">$150</div>
                                        </div>
                                    </div>
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                        View
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                            <div class="p-6">
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center gap-2">
                                        <img
                                                src="/placeholder.svg"
                                                alt="Product Image"
                                                width="48"
                                                height="48"
                                                class="rounded-md"
                                                style="aspect-ratio:48/48;object-fit:cover"
                                        />
                                        <div class="grid gap-1">
                                            <div class="font-medium">Vintage Radio</div>
                                            <div class="text-sm text-gray-500 ">$100</div>
                                        </div>
                                    </div>
                                    <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                        View
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div data-orientation="horizontal" role="none" class="shrink-0 bg-gray-100 h-[1px] w-full"></div>
                <div class="grid gap-4">
                    <h2 class="text-xl font-bold">Reviews</h2>
                    <div class="grid gap-6">
                        <div class="flex items-start gap-4">
              <span class="relative flex shrink-0 overflow-hidden rounded-full w-10 h-10 border">
                <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JD</span>
              </span>
                            <div class="grid gap-2">
                                <div class="flex items-center gap-2 text-sm">
                                    <div class="font-medium">Sarah Johnson</div>
                                    <div class="flex items-center gap-1 text-green-500">
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                    </div>
                                </div>
                                <p class="text-sm text-gray-500 ">
                                    John is a fantastic seller! He was very responsive and the item arrived in perfect condition. I
                                    would definitely buy from him again.
                                </p>
                            </div>
                        </div>
                        <div class="flex items-start gap-4">
              <span class="relative flex shrink-0 overflow-hidden rounded-full w-10 h-10 border">
                <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JD</span>
              </span>
                            <div class="grid gap-2">
                                <div class="flex items-center gap-2 text-sm">
                                    <div class="font-medium">Michael Brown</div>
                                    <div class="flex items-center gap-1 text-green-500">
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="currentColor"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="w-4 h-4"
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
                                                class="w-4 h-4 fill-gray-300 stroke-gray-300"
                                        >
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                        </svg>
                                    </div>
                                </div>
                                <p class="text-sm text-gray-500 ">
                                    John was great to work with, but the item I received had a minor scratch that wasn't mentioned in
                                    the listing. Still, I'm happy with the purchase.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>