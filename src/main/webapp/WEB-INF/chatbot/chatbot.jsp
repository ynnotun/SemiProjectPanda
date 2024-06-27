<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hello WebSocket</title>
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>

    </style>
</head>
<body>
<div class="" style="">
    <div class="">
        <div id="chat-scroll">
            <div class="flex-1  p-4" id="conversation">
                <div class="space-y-4 w-full" id="communicate">


                </div>
            </div>
        </div>
        <div class="rounded-b-2xl bg-white border-t border-gray-200 p-4 flex items-center" id="">
            <form class="form-inline" id="chat-input">
                <input
                        class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 flex-1 bg-gray-100 border-none focus:ring-0 focus:outline-none"
                        id="msg"
                        placeholder="Type your message..."
                />
                <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 bg-[#4CAF50] hover:bg-green-600 text-white ml-2"
                        onclick="send()" id="send" disabled type="submit">
                    Send
                </button>
            </form>
        </div>
    </div>

</div>

<script>
    var stompClient = null;

    function setConnected(connected) {
        $("#connect").prop("disabled", connected);
        $("#disconnect").prop("disabled", !connected);
        $("#send").prop("disabled", !connected);
        if (connected) {
            $("#conversation").show();
        } else {
            $("#conversation").hide();
        }
        $("#msg").val("");
    }

    function connect() {
        var socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            setConnected(true);
            console.log('Connected: ' + frame);
            // 기본 안내멘트 추가
            showMessage("판다챗봇에 오신 것을 환영합니다!<br>" +
                "무엇을 도와드릴까요?<br><br>" +
                "<button class='btn btn-info quick-btn' style='background-color: #4CAF50; border: 0; margin-right: 10px;' data-question='거래'>거래방법</button>" +
                "<button class='btn btn-info quick-btn' style='background-color: #4CAF50; border: 0; margin-right: 10px;' data-question='배송'>배송관련</button>" +
                "<button class='btn btn-info quick-btn' style='background-color: #4CAF50; border: 0; margin-right: 10px;' data-question='사기'>사기문의</button>", "message-received");

            stompClient.subscribe('/topic/public', function (message) {
                showMessage(message.body, "message-received"); // 서버에 메시지 전달 후 리턴받는 메시지
                // 채팅 내용이 갱신될 때 스크롤을 가장 아래로 이동
                scrollToBottom();
            });
        });
    }

    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
        setConnected(false);
        console.log("Disconnected");
    }

    function sendMessage() {
        let message = $("#msg").val()
        if (message.length === 0) {
            return;
        }
        showMessage(message, "message-sent");
        $("#msg").val(""); // 메시지를 보낸 후 입력 필드를 비우기

        stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); // 서버에 보낼 메시지

        //스크롤을 가장 아래로 이동
        scrollToBottom();
    }

    function sendQuickMessage(question) {
        showMessage(question, "message-sent");
        stompClient.send("/app/sendMessage", {}, JSON.stringify(question));
        //스크롤을 가장 아래로 이동
        scrollToBottom();
    }

    function showMessage(message, messageClass) {
        if (messageClass === "message-received") {
            $("#communicate").append(
                // "<img src='../image/panda.png' style='width: 40px; height: auto'>" +
                `
                <div class="flex items-start gap-3">
                    <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                      <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                          <img class="aspect-square h-full w-full" alt="Seller"
                               src='../image/panda.png'/>
                      </span>
                    </span>
                    <div class="bg-[#4CAF50] text-white px-3 py-2 rounded-lg max-w-[75%] relative">
                        <p>\${message}</p>
                    </div>
                </div>
                `
                // +
                // "<tr class='received'><td class='message " + messageClass + "'>" +
                // "<div class='received-message-content'>" +
                // "<div class='message-text'>" + message + "</div>" +
                // "</div></td></tr>"
            );
        } else {
            $("#communicate").append(
                `
                <div class="flex items-start gap-3 justify-end">
                    <div class="bg-gray-200 text-gray-900 px-3 py-2 rounded-lg max-w-[75%]">
                        <p>\${message}</p>
                    </div>
                </div>
                `
                // "<tr class='sent'><td class='message " + messageClass + "'>" + message + "</td></tr>"
            );
        }
        //스크롤을 가장 아래로 이동
        scrollToBottom();
    }

    function scrollToBottom() {
        var conversation = $("#conversation");
        conversation.scrollTop(conversation.prop("scrollHeight"));
    }

    $(function () {
        connect();
        $("form").on('submit', function (e) {
            e.preventDefault();
        });
        $("#connect").click(function () {
            connect();
        });
        $("#disconnect").click(function () {
            disconnect();
        });
        $("#send").click(function () {
            sendMessage();
        });

        $(document).on('click', '.quick-btn', function () {
            let question = $(this).data('question');
            sendQuickMessage(question);
        });
    });

</script>
</body>
</html>
