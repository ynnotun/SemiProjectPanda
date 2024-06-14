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
        .round-button{
            border-radius: 20px;
        }
        .round-button-secondary{
            border-radius: 20px;
        }
        .round-button-secondary:hover{
            background-color: black;
            color: white !important;
        }
    </style>
</head>
<body>

<div class="bg-white  text-gray-950  min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="flex flex-col min-h-screen">
            <section class="py-8 px-6 md:px-8">
                <div class="search-result-message items-center justify-between mb-6">
                    <h2 class="text-2xl font-bold"><a href="">"oo" 검색 결과</a></h2>
                </div>
                <div class="flex items-center justify-between">
                    <a class="text-sm underline" href="#"> </a>
                    <div class="flex w-full justify-start mb-4">
                        <button id="sell" class="round-button items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-white  h-9 px-3 border-1 mr-2 bg-black hover:bg-gray-200">
                            판매내역
                        </button>
                        <button id="buy" class="round-button-secondary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                            구매내역
                        </button>
                        <button id="wish" class="round-button-secondary inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                            찜목록
                        </button>
                    </div>
                </div>
                <div class="page" id="page1" style="width: 100%">
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
                            <h3 class="text-lg font-medium mb-2">Vintage Camera1</h3>
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
                            <h3 class="text-lg font-medium mb-2">Vintage Camera2</h3>
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
                            <h3 class="text-lg font-medium mb-2">Vintage Camera3</h3>
                            <div class="mb-2">
                                <span class="text-gray-500 mr-1">$50</span>
                                <span class="text-gray-500">예약중</span>
                            </div>

                            <div class="flex">
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera4</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera5</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera6</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera7</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera8</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera9</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera10</h3>
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
                    </div>
                </div>
                <div class="page" id="page2" style="width: 100%">
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera1</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera2</h3>
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
                                <h3 class="text-lg font-medium mb-2">Vintage Camera3</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">$50</span>
                                    <span class="text-gray-500">예약중</span>
                                </div>

                                <div class="flex">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="page" id="page3" style="width: 100%">
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
                </div>
            </section>
        </div>
    </div>
</div>

<script>
    $("#sell").click(function (){
        $("#page1").css("transform", "translateX(-200%)");
        $("#page2").css("transform", "translateX(-100%)");
        $("#page3").css("transform", "translateX(0)");
    })
    $("#buy").click(function (){
        $("#page1").css("transform", "translateX(-100%)");
        $("#page2").css("transform", "translateX(0)");
        $("#page3").css("transform", "translateX(100%)");
    })
    $("#wish").click(function (){
        $("#page1").css("transform", "translateX(0)");
        $("#page2").css("transform", "translateX(100%)");
        $("#page3").css("transform", "translateX(200%)");
    })
</script>
</body>
</html>