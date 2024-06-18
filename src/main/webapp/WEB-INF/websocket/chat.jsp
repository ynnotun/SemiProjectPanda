<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 17.
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <meta charset="UTF-8">
    <title>Chating</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #container.container {
            width: 500px;
            margin: 0 auto;
            padding: 25px
        }

        #container .container h1 {
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 20px;
        }

        #container .chating {
            background-color: #000;
            width: 500px;
            height: 500px;
            overflow: auto;
        }

        #container .chating p {
            color: #fff;
            text-align: left;
        }

        #container input {
            width: 330px;
            height: 25px;
        }

        #container #yourMsg {
            display: none;
        }
    </style>
</head>

<script type="text/javascript">
    var ws;

    function wsOpen() {
        const room = prompt("채팅방 이름");
        ws = new WebSocket("ws://" + location.host + "/chating/" + room);
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function (data) {
            //소켓이 열리면 초기화 세팅하기
            alert("open socket")
        }

        ws.onmessage = function (data) {
            var msg = data.data;
            if (msg != null && msg.trim() != '') {
                $("#chating").append("<p>" + msg + "</p>");
            }
        }

        document.addEventListener("keypress", function (e) {
            if (e.keyCode == 13) { //enter press
                send();
            }
        });
    }

    function chatName() {
        var userName = $("#userName").val();
        if (userName == null || userName.trim() == "") {
            alert("사용자 이름을 입력해주세요.");
            $("#userName").focus();
        } else {
            wsOpen();
            $("#yourName").hide();
            $("#yourMsg").show();
        }
    }

    function send() {
        var uN = $("#userName").val();
        var msg = $("#chatting").val();
        ws.send(uN + " : " + msg);
        $('#chatting').val("");
    }
</script>
<body>
<div id="container" class="container">
    <h1>채팅</h1>
    <div id="chating" class="chating">
    </div>

    <div id="yourName">
        <table class="inputTable">
            <tr>
                <th>사용자명</th>
                <th><input type="text" name="userName" id="userName"></th>
                <th>
                    <button onclick="chatName()" id="startBtn">이름 등록</button>
                </th>
            </tr>
        </table>
    </div>
    <div id="yourMsg">
        <table class="inputTable">
            <tr>
                <th>메시지</th>
                <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
                <th>
                    <button onclick="send()" id="sendBtn">보내기</button>
                </th>
            </tr>
        </table>
    </div>
</div>
</body>
</html>