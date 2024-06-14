<%--
  Created by IntelliJ IDEA.
  User: qhal5
  Date: 2024-06-13
  Time: 오후 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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
        .max-w-md {
            max-width: 35rem;
        }
        @media (min-width: 768px) {
            .md\:p-8 {
                padding: 2rem;
            }
        }
    </style>
</head>
<body>
<div class="w-full max-w-md mx-auto p-6 md:p-8 container">
    <h1 class="text-2xl font-bold mb-6 text-center">Find Password</h1>
    <div class="flex items-center" style="padding-bottom: 15px;">
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
                    placeholder="Enter your email" style="width: 95%"/>
        </div>
        <button class="emailchecked">
            Check Availability
        </button>
    </div>
    <div class="flex items-center" style="padding-bottom: 15px;">
        <div class="flex-1">
            <%--@declare id="email"--%><label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="email">
                Email Check
            </label>
            <input
                    class="flex h-10 w-full1 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    id="emailcheck"
                    placeholder="email check" style="width: 95%"/>
        </div>
        <button class="emailchecked">
            Check
        </button>
    </div>
    <button
            class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 w-full bg-[#4CAF50] hover:bg-[#43a047] text-white"
            type="button" id="find" style="margin-top: 15px">
        Find
    </button>
</div>
</body>
</html>
