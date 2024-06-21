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
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="font-size: 20px; font-weight: bold;">Membership Cancellation Successful</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Your membership has been successfully canceled.</p>
                <p>We hope to serve you again in the future.</p>
            </div>
            <div class="modal-footer">
                <button id="can" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="subm" type="button" class="btn btn-primary">Understood</button>
            </div>
        </div>
    </div>
</div>

<!--
// v0 by Vercel.
// https://v0.dev/t/3pfncmchJqr
-->
<div class="max-w-md mx-auto px-4 py-8 sm:px-6 lg:px-8 my-[80px]">
    <div class="space-y-6">
        <div class="rounded-lg border bg-card text-card-foreground shadow-sm w-full max-w-md" data-v0-t="card">
    <div class="flex flex-col space-y-1.5 p-6">
        <h3 class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">Cancel your membership</h3>
        <p class="text-sm text-muted-foreground">
            We're sorry to see you go. Before you leave, please let us know why you're cancelling your membership.
        </p>
    </div>
    <div class="p-6">
        <div class="space-y-4">
            <div class="grid gap-2">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="reason"
                >
                    Why are you cancelling?
                </label>
                <button
                        type="button"
                        role="combobox"
                        aria-controls="radix-:r2:"
                        aria-expanded="false"
                        aria-autocomplete="none"
                        dir="ltr"
                        data-state="closed"
                        class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    <span style="pointer-events: none;">Other</span>
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
                            class="lucide lucide-chevron-down h-4 w-4 opacity-50"
                            aria-hidden="true"
                    >
                        <path d="m6 9 6 6 6-6"></path>
                    </svg>
                </button>
            </div>
            <div class="grid gap-2">
                <label
                        class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        for="feedback"
                >
                    Additional feedback
                </label>
                <textarea
                        class="flex w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 min-h-[100px]"
                        id="feedback"
                        placeholder="Please let us know if there's anything we can improve"
                ></textarea>
            </div>
        </div>
    </div>
    <div class="flex items-center p-6">
        <div class="flex justify-end gap-2 w-full">
            <button id="canc" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">
                Cancel
            </button>
            <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-black text-white hover:bg-black/90 h-10 px-4 py-2"
                    data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                Submit
            </button>
        </div>
    </div>
    <div class="text-center text-sm text-gray-500  px-6 py-6">
        Thank you for being part of our community. We appreciate your feedback and wish you all the best.
    </div>
</div>
    </div>
</div>
<script>
    $("#canc").click(function (){
        $.ajax({
            type: "get",
            dataType: "text",
            url: '/member/logout',
            success: function(logoutResponse) {
                window.location.href = '/'; // 로그인 페이지로 리디렉션
            },
            error: function(xhr, status, error) {
                console.log('Logout Error:', error);
            }
        });    })
    $("#can").click(function (){
        window.location.href = "/quit"; ///메인으로 이동
    })
    $("#subm").click(function (){
        $.ajax({
            type: "get",
            dataType: "text",
            url: '/member/logout',
            success: function(logoutResponse) {
                window.location.href = '/'; // 로그인 페이지로 리디렉션
            },
            error: function(xhr, status, error) {
                console.log('Logout Error:', error);
            }
        });
    })

</script>
</body>
</html>