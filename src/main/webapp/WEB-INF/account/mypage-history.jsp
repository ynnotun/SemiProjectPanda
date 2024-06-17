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

    <title>나의 내역</title>

    <style>
        .round-button, .round-button-secondary {
            border-radius: 20px;
        }
        .active {
            background-color: black;
            color: white !important;
        }
    </style>
</head>
<body>

<div class="bg-white text-gray-950 min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="flex flex-col min-h-screen">
            <section class="py-8 px-6 md:px-8">
                <div class="search-result-message items-center justify-between mb-6">
                    <h2 class="text-2xl font-bold"><a href="">나의 내역</a></h2>
                </div>
                <div class="flex items-center justify-between">
                    <a class="text-sm underline" href="./mypage/history?usernum=${usernum}&listname=sell"> </a>
                    <div class="flex w-full justify-start mb-4">
                        <button id="sell" class="tab-button round-button inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                            판매내역
                        </button>
                        <button id="buy" class="tab-button round-button inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                            구매내역
                        </button>
                        <button id="wish" class="tab-button round-button inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-black h-9 px-3 mr-2 bg-gray-200">
                            찜목록
                        </button>
                    </div>
                </div>
                <div class="page active-page grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6" id="page1">
                </div>
            </section>
        </div>
    </div>
</div>

<script>
    $(function(){
        $(${listname}).addClass("active");
        if(${listname.equals("sell")}){
            getSell();
        }else if (${listname.equals("buy")}){
            getBuy();
        }else if(${listname.equals("wish")}){
            getWish();
        }

        $(".tab-button").click(function (){
            $(this).addClass("active");
            $(this).siblings().removeClass("active");
        })

        $("#sell").click(function (){
            getSell();
        })
        $("#buy").click(function (){
            getBuy();
        })
        $("#wish").click(function (){
            getWish();
        })
    })


    function getSell(){
        $.ajax({
            type:"get",
            url:"${root}/getsell?usernum=${usernum}",
            dataType:"json",
            success:function (data){
                let s="";
                $.each(data,function (idx,ele){
                    s+=
                        `

                           <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                            <img src="" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48" style="aspect-ratio:300/200;object-fit:cover"/>
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">\${ele.producttitle}</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">\${ele.productprice}원</span>
                                    <span class="text-gray-500">\${ele.productstatus}</span>
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
                         `;
                })
                $("#page1").html(s);
            }
        })
    }

    function getBuy(){
        $.ajax({
            type:"get",
            url:"${root}/getbuy?customernum=${usernum}",
            dataType:"json",
            success:function (data){
                let s="";
                $.each(data,function (idx,ele){
                    s+=
                        `

                           <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                            <img src="" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48" style="aspect-ratio:300/200;object-fit:cover"/>
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">\${ele.producttitle}</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">\${ele.productprice}원</span>
                                    <span class="text-gray-500">\${ele.productstatus}</span>
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
                         `;
                })
                $("#page1").html(s);
            }
        })
    }

    function getWish(){
        $.ajax({
            type:"get",
            url:"${root}/getwish?usernum=${usernum}",
            dataType:"json",
            success:function (data){
                let s="";
                $.each(data,function (idx,ele){
                    s+=
                        `

                           <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                            <img src="" width="300" height="200" alt="Product" class="rounded-t-lg object-cover w-full h-48" style="aspect-ratio:300/200;object-fit:cover"/>
                            <div class="p-4">
                                <h3 class="text-lg font-medium mb-2">\${ele.producttitle}</h3>
                                <div class="mb-2">
                                    <span class="text-gray-500 mr-1">\${ele.productprice}원</span>
                                    <span class="text-gray-500">\${ele.productstatus}</span>
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
                         `;
                })
                $("#page1").html(s);
            }
        })
    }
</script>
</body>
</html>