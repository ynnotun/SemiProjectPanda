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
<style>
    .emailchecked{
        background-color: #e6e6e6;
        border: 1px solid #e6e6e6;
        border-radius: 5px;
        position: relative;
        width: 150px;
        height: 40px;
        top: 12px;
    }
    .container {
        position: relative;
        width: 200%;
        height: 100vh;
        overflow: hidden;
    }

    .page {
        position: absolute;
        width: 100%;
        height: 100%;
        transition: transform 0.2s ease-in-out;
    }

    #page2 {
        transform: translateX(300%);
    }

    .w-full1{
        width: 95%;
    }
    @media (min-width: 768px) {
        .md\:p-8 {
            padding: 0rem;
        }
    }
</style>
<body>
<!--
// v0 by Vercel.
// https://v0.dev/t/ouRbB40Wl7q
-->

<div class="w-full max-w-md mx-auto p-6 md:p-8 container">
    <h1 class="text-2xl font-bold mb-6 text-center">Register</h1>
    <form class="space-y-4">
        <div class="page" id="page1" style="width: 100%">
        <div>
           <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="name">
                Name
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="text"
                    id="name"
                    placeholder="Enter your full name"/>
        </div>
        <div>
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="phone">
                Phone Number
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="tel"
                    id="phone"
                    placeholder="Enter your phone number"/>
        </div>
        <div>
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="address">
                Address
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="text"
                    id="address"
                    placeholder="Enter your address"/>
        </div>
        <div class="flex items-center">
            <div class="flex-1">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="email">
                    Email
                </label>
                <input
                        class="flex h-10 w-full1 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                        type="email"
                        id="email"
                        placeholder="Enter your email"/>
            </div>
            <button class="emailchecked">
                Check Availability
            </button>
        </div>
        <div>
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="password">
                Password
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="password"
                    id="password"
                    placeholder="Enter your password"/>
        </div>
        <div>
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="confirm-password">
                Confirm Password
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="password"
                    id="confirm-password"
                    placeholder="Confirm your password"/>
        </div>
        <div>
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="dob">
                Date of Birth
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="date"
                    id="dob" style="margin-bottom: 15px"/>
        </div>
        <button
                class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 w-full bg-[#4CAF50] hover:bg-[#43a047] text-white"
                type="button" id="next">
            Next
        </button>
        </div>
        <div class="page" id="page2" style="width: 100%">
            <!--
            // v0 by Vercel.
            // https://v0.dev/t/d59eRWti5iV
            -->

            <div class="max-w-md mx-auto px-4 py-8 sm:px-6 lg:px-8">
                <div class="space-y-6">
                    <div>
                        <button
                                class="inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 dark:bg-green-700 dark:hover:bg-green-800"
                                type="button" id="back" style="margin-bottom: 10px;">
                            back
                        </button>
                        <label for="nickname" class="block text-sm font-medium text-gray-700 dark:text-gray-300">
                            Nickname
                        </label>
                        <div class="mt-1 flex items-center">
                            <input
                                    id="nickname"
                                    type="text"
                                    class="block w-full rounded-md border-gray-300 shadow-sm focus:border-green-500 focus:ring-green-500 sm:text-sm dark:bg-gray-800 dark:border-gray-700 dark:text-gray-300"
                                    placeholder="Enter your nickname" style="height: 30px"/>
                            <button
                                    type="button"
                                    class="ml-3 inline-flex items-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 dark:bg-green-700 dark:hover:bg-green-800">
                                Check Availability
                            </button>
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Default Profile Options</label>
                        <div class="mt-1 grid grid-cols-3 gap-3">
                            <div class="relative">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-full">
                                    <img src="/placeholder.svg" alt="Profile 1" class="h-full w-full object-cover" />
                                </div>
                                <div class="absolute inset-0 flex items-center justify-center bg-green-500 bg-opacity-75 opacity-0 transition-opacity hover:opacity-100">
                                    <button
                                            type="button"
                                            class="inline-flex items-center rounded-full bg-white px-2 py-1 text-xs font-medium text-green-600 shadow-sm hover:bg-green-100 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
                                        Select
                                    </button>
                                </div>
                            </div>
                            <div class="relative">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-full">
                                    <img src="/placeholder.svg" alt="Profile 2" class="h-full w-full object-cover" />
                                </div>
                                <div class="absolute inset-0 flex items-center justify-center bg-green-500 bg-opacity-75 opacity-0 transition-opacity hover:opacity-100">
                                    <button
                                            type="button"
                                            class="inline-flex items-center rounded-full bg-white px-2 py-1 text-xs font-medium text-green-600 shadow-sm hover:bg-green-100 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
                                        Select
                                    </button>
                                </div>
                            </div>
                            <div class="relative">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-full">
                                    <img src="/placeholder.svg" alt="Profile 3" class="h-full w-full object-cover" />
                                </div>
                                <div class="absolute inset-0 flex items-center justify-center bg-green-500 bg-opacity-75 opacity-0 transition-opacity hover:opacity-100">
                                    <button
                                            type="button"
                                            class="inline-flex items-center rounded-full bg-white px-2 py-1 text-xs font-medium text-green-600 shadow-sm hover:bg-green-100 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
                                        Select
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <button
                                    type="button"
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
                                Upload Photo
                            </button>
                        </div>
                    </div>
                    <div>
                        <button
                                type="button"
                                class="w-full inline-flex items-center justify-center rounded-md border border-transparent bg-green-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 dark:bg-green-700 dark:hover:bg-green-800">
                            Complete Registration
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>



<script>
    $("#next").click(function (){
        $("#page1").css("transform", "translateX(-100%)");
        $("#page2").css("transform", "translateX(0)");
    })
    $("#back").click(function (){
        $("#page1").css("transform", "translateX(0)");
        $("#page2").css("transform", "translateX(100%)");
    })
</script>
</body>
</html>