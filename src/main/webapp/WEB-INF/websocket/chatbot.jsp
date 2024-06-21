<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hello WebSocket</title>
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/main.css" rel="stylesheet">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>

    <script src="/app.js" charset="UTF-8"></script>
    <style>
        body {
            background-color: #f5f5f5;
        }

        #main-content {
            max-width: 940px;
            padding: 2em 3em;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            border-radius: 5px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }

        #conversation {
            max-height: 400px;
            overflow-y: auto;
            margin-bottom: 1em;
            padding: 1em;
            border: 1px solid #e5e5e5;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .message {
            padding: 10px 15px;
            margin-bottom: 10px;
            border-radius: 20px;
            display: inline-block;
            max-width: 80%;
        }
        #send{
            background-color: #4CAF50;
        }

        .message-sent {
            background-color: #d9edf7;
            text-align: right;
            margin-left: auto;
        }

        .message-received {
            background-color: #f2f2f2;
            text-align: left;
            margin-right: auto;
        }

        .form-inline {
            display: flex;
            justify-content: space-between;
        }

        .form-group {
            flex: 1;
            margin-right: 10px;
        }

        .form-control {
            width: 100%;
        }

        .btn {
            white-space: nowrap;
            padding: 10px 20px;
            border-radius: 20px;
        }

        .received-message-content {
            display: flex;
            align-items: center;
        }

        .message-image {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .message-text {
            max-width: 70%;
        }

        .sent {
            display: flex;
            justify-content: flex-end;
        }

        .received {
            display: flex;
            justify-content: flex-start;
        }
    </style>
</head>
<body>
<noscript><h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
<div id="main-content" class="container">
    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group" style="margin-bottom: 20px;">
                    <label for="connect">판다와 대화하기</label>
                    <button id="connect" class="btn btn-default" type="submit" style="background-color: #4CAF50">연결</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled" style="background-color: palevioletred">해제</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div id="conversation">
                <table class="table">
                    <tbody id="communicate"></tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="msg">Chat : </label>
                    <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요....">
                </div>
                <button id="send" class="btn btn-default" disabled type="submit">보내기</button>
            </form>
        </div>
    </div>
</div>

<%--<!-- 챗봇 버튼 -->
<button onclick="location.href='./chatbot'" style="border: none; background: none; padding: 0; margin: 0; float: right;">
    <img src="../image/pand.png" style="width: 200px; height: 150px; display: block;">
</button>--%>

<script>
    var stompClient = null;

    function setConnected(connected) {
        $("#connect").prop("disabled", connected);
        $("#disconnect").prop("disabled", !connected);
        $("#send").prop("disabled", !connected);
        if (connected) {
            $("#conversation").show();
        }
        else {
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
            stompClient.subscribe('/topic/public', function (message) {
                showMessage(message.body, "message-received"); // 서버에 메시지 전달 후 리턴받는 메시지
                // 채팅 내용이 갱신될 때 스크롤을 가장 아래로 이동
                var conversation = $("#conversation");
                conversation.scrollTop(conversation[0].scrollHeight);
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
        showMessage(message, "message-sent");
        $("#msg").val(""); // 메시지를 보낸 후 입력 필드 비우기

        stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); // 서버에 보낼 메시지

        // 채팅 내용이 갱신될 때 스크롤을 가장 아래로 이동
        var conversation = $("#conversation");
        conversation.scrollTop(conversation[0].scrollHeight);
    }

    function showMessage(message, messageClass) {
        if (messageClass === "message-received") {
            $("#communicate").append(
                "<tr class='received'><td class='message " + messageClass + "'>" +
                "<div class='received-message-content'>" +
                "<img src='../image/panda.png' class='message-image' />" +
                "<div class='message-text'>" + message + "</div>" +
                "</div></td></tr>");
        } else {
            $("#communicate").append(
                "<tr class='sent'><td class='message " + messageClass + "'>" + message + "</td></tr>");
        }
    }

    $(function () {
        $("form").on('submit', function (e) {
            e.preventDefault();
        });
        $("#connect").click(function() { connect(); });
        $("#disconnect").click(function() { disconnect(); });
        $("#send").click(function() { sendMessage(); });
    });

</script>
</body>
</html>

