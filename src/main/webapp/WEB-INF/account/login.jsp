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
<body>
<!--
// v0 by Vercel.
// https://v0.dev/t/ygoB4EqIhCg
-->

<div class="w-full max-w-md mx-auto p-6 md:p-8">
    <h1 class="text-2xl font-bold mb-6 text-center">Login</h1>
    <form class="space-y-4">
        <div>
            <label
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    for="email">
                Email
            </label>
            <input
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    type="email"
                    id="email"
                    placeholder="Enter your email"/>
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
        <div class="flex items-center justify-between">
            <div class="flex items-center">
                <input
                        type="checkbox"
                        aria-checked="false"
                        data-state="unchecked"
                        value="on"
                        class="peer h-4 w-4 shrink-0 rounded-sm border border-primary ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground"
                        id="remember-me">
                <input
                        type="checkbox"
                        aria-hidden="true"
                        style="transform:translateX(-100%);position:absolute;pointer-events:none;opacity:0;margin:0"
                        tabindex="-1"
                        value="on"/>
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 ml-2"
                        for="remember-me">
                    Remember me
                </label>
            </div>
            <a class="text-sm text-[#4CAF50] hover:underline" href="#">
                Forgot password?
            </a>
        </div>
        <button
                class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 w-full bg-[#4CAF50] hover:bg-[#43a047] text-white"
                type="submit">
            Login
        </button>
        <div class="text-center text-sm text-gray-500">
            Don't have an account?{" "}
            <a class="text-[#4CAF50] hover:underline" href="#">
                Register
            </a>
        </div>
    </form>
</div>
</body>
</html>