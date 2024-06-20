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

        .container {
            width: 500px;
            margin: 0 auto;
            padding: 25px
        }

        .container h1 {
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 20px;
        }

        .chating {
            height: 400px;
            width: 400px;
            overflow: auto;
            padding: 10px;
        }

        .chating::-webkit-scrollbar {
            display: none;
        }


        input {
            width: 330px;
            height: 25px;
        }

        #yourMsg {
            display: none;
        }
    </style>
</head>

<script type="text/javascript">

    var ws;
    window.onload = function () {
        wsOpen();
    }

    function wsOpen() {
        //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
        ws = new WebSocket("ws://" + location.host + "/chatroom/" + ${roomDto.chatroomnum});
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function (data) {
            //소켓이 열리면 동작
            fetch(`/chat/repository?chatroomnum=${roomDto.chatroomnum}`)
                .then(response => response.json())
                .then(data => {
                    // 가져온 채팅 내역 데이터를 화면에 표시하는 로직 구현
                    displayChatting(data)
                    var chatDiv = $("#chating");
                    chatDiv.scrollTop(chatDiv.prop("scrollHeight"));
                })
                .catch(error => {
                    console.error('Error fetching chat log:', error);
                    alert("접속 실패")
                    window.location.reload()
                });
        }

        ws.onmessage = function (data) {
            //메시지를 받으면 동작
            var msg = data.data;
            if (msg != null && msg.trim() != '') {
                var d = JSON.parse(msg);
                if (d.type == "getId") {
                    var si = d.sessionId != null ? d.sessionId : "";
                    if (si != '') {
                        $("#sessionId").val(si);
                    }
                } else if (d.type == "message") {
                    if (d.usernum == ${sessionScope.usernum}) {
                        $("#chating").append(
                            `
                            <%--                   내 채팅 --%>
                                    <div class="flex items-start gap-3 justify-end">
                                        <div class="bg-gray-200 text-gray-900 px-4 py-2 rounded-lg max-w-[75%]">
                                            <p class="font-medium">\${d.userNickName}</p>
                                            <p>\${d.msg}</p>
                                        </div>
                                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                                                <img class="aspect-square h-full w-full" alt="Seller"
                                                   src="https://kr.object.ncloudstorage.com/semi/panda/\${d.userProfile}"/>
                                            </span>
                                        </span>
                                    </div>
                            `
                        );
                        var chatDiv = $("#chating");
                        chatDiv.scrollTop(chatDiv.prop("scrollHeight"));
                    } else {
                        $("#chating").append(`
                        <%--                상대 채팅--%>
                                    <div class="flex items-start gap-3">
                                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                                          <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                                              <img class="aspect-square h-full w-full" alt="Seller"
                                                   src="https://kr.object.ncloudstorage.com/semi/panda/\${d.userProfile}"/>
                                          </span>
                                        </span>
                                        <div class="bg-[#4CAF50] text-white px-4 py-2 rounded-lg max-w-[75%] relative">
                                            <p class="font-medium">\${d.userNickName}</p>
                                            <p>\${d.msg}</p>
                                        </div>
                                    </div>
                        `);
                        var chatDiv = $("#chating");
                        chatDiv.scrollTop(chatDiv.prop("scrollHeight"));
                    }

                } else {
                    console.warn("unknown type!")
                }
            }
        }

        document.addEventListener("keypress", function (e) {
            if (e.keyCode == 13) { //enter press
                send();
            }
        });

        function displayChatting(chattingData) {
            const chatLogContainer = document.getElementById('chating');
            chattingData.forEach(chat => {
                if (chat.sendusernum == "${sessionScope.usernum}") {
                    chatLogContainer.innerHTML +=
                        `
                <%--                    내 채팅--%>
                    <div class="flex items-start gap-3 justify-end">
                        <div class="bg-gray-200 text-gray-900 px-4 py-2 rounded-lg max-w-[75%]">
                            <p class="font-medium">\${chat.usernickname}</p>
                            <p>\${chat.chattingmessage}</p>
                        </div>
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                            <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                                <img class="aspect-square h-full w-full" alt="Seller"
                                   src="https://kr.object.ncloudstorage.com/semi/panda/\${chat.userprofileimage}"/>
                            </span>
                        </span>
                    </div>
                `;
                } else {

                    chatLogContainer.innerHTML +=
                        `
                <%--                    구매자 채팅 시작--%>
                    <div class="flex items-start gap-3">
                        <span class="relative shrink-0 overflow-hidden w-10 h-10 rounded-full bg-[#4CAF50] text-white flex items-center justify-center border-2 border-[#4CAF50]">
                          <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">
                              <img class="aspect-square h-full w-full" alt="Seller"
                                   src="https://kr.object.ncloudstorage.com/semi/panda/\${chat.userprofileimage}"/>
                          </span>
                        </span>
                        <div class="bg-[#4CAF50] text-white px-4 py-2 rounded-lg max-w-[75%] relative">
                            <p class="font-medium">\${chat.usernickname}</p>
                            <p>\${chat.chattingmessage}</p>

                        </div>
                    </div>
            `;
                }


            });

        }
    }


    function send() {
        if ($("#chatting").val().length > 0) {
            var option = {
                type: "message",
                roomNumber: ${roomDto.chatroomnum},
                usernum: ${sessionScope.usernum},
                userProfile: "${sessionScope.userprofileimage}",
                userNickName: "${sessionScope.usernickname}",
                msg: $("#chatting").val()
            }
            ws.send(JSON.stringify(option))
            $('#chatting').val("");
        }
    }
</script>
<body>
<div id="container" class="container">
    <h1>${roomDto.chatroomname}</h1>
    <input type="hidden" id="sessionId" value="">

    <%--    <div class="chating">--%>
    <%--    </div>--%>

    <!--
// v0 by Vercel.
// https://v0.dev/t/5ItBx9Nadon
-->

    <div class="flex flex-col bg-white">
        <div class="flex-1  p-4">
            <div class="space-y-4 w-full chating" id="chating">


            </div>
        </div>
        <div class="bg-white border-t border-gray-200 p-4 flex items-center">
            <input
                    class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 flex-1 bg-gray-100 border-none focus:ring-0 focus:outline-none"
                    id="chatting"
                    placeholder="Type your message..."
            />
            <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 bg-[#4CAF50] hover:bg-green-600 text-white ml-2"
                    onclick="send()" id="sendBtn"
            >
                Send
            </button>
        </div>
    </div>
</div>
</body>
</html>