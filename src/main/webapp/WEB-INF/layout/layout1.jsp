<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        html, body, .mainlayout {
            height: 100%;
            background-color: black;
        }
        .mainlayout{
            background-color: white;
        }
        #bot{
            position: fixed;
            bottom: 120px;
            left: 30px;
            width: 70px;
            height: 50px;
            background-color: rgba(0, 0, 0, 0.84);
            border-radius: 20px;
        }
        #pay{
            position: fixed;
            bottom: 180px;
            left: 30px;
            width: 70px;
            height: 50px;
            background-color: #4CAF50;
            color: white;
            border-radius: 20px;
        }
        /* 위로 가는 버튼 */
        .scroll-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: none;
            width: 50px;
            height: 50px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 50%;
            text-align: center;
            font-size: 24px;
            line-height: 50px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            transition: all 0.3s ease;
        }
        .scroll-to-top:hover {
            background-color: #45a049;
        }
    </style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>" scope="application"/>
<c:set var="filepath" value="https://kr.object.ncloudstorage.com/semi/panda/"/>
<body>
<div class="mainlayout">
    <div class="header-tile">
        <tiles:insertAttribute name="header"/>
    </div>
    <div class="main-tile">
        <tiles:insertAttribute name="main"/>
    </div>
    <!-- 챗봇버튼 -->
    <button onclick="location.href='./chatbot'" id="bot">
        <img src="https://kr.object.ncloudstorage.com/semi/panda/logo.png">
    </button>

    <!-- 결제버튼 -->
    <c:if test="${sessionScope.usernum != null}">
    <button onclick="location.href='./pay'" id="pay">
        <p>PAY</p>
    </button>
    </c:if>
    <!-- 위로 가는 버튼 -->
    <button onclick="scrollToTop()" class="scroll-to-top" id="scrollToTopBtn">
        <i class="bi bi-caret-up-fill"></i>
    </button>
    <div class="footer-tile">
        <tiles:insertAttribute name="footer"/>
    </div>
</div>

<script>
    let headerTile = document.getElementsByClassName("header-tile")[0];
    let footerTile = document.getElementsByClassName("footer-tile")[0];
    let mainTile = document.getElementsByClassName("main-tile")[0];

    let height = headerTile.offsetHeight + footerTile.offsetHeight;
    mainTile.style.minHeight = `calc(100% - \${height}px)`;

    // 위로 가는 버튼 보임 여부
    window.onscroll = function() {
        var scrollToTopBtn = document.getElementById("scrollToTopBtn");
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            scrollToTopBtn.style.display = "block";
        } else {
            scrollToTopBtn.style.display = "none";
        }
    };
    // 위로 가는 버튼 동작
    function scrollToTop() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
</script>


<%--채팅방 띄우기--%>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>


<style>
    .chat-area {
        z-index: 999;
        position: fixed;
        left: 30px;
        bottom: 30px;
    <c:if test="${sessionScope.usernum == null}"> display: none;
    </c:if>
    }

    .chat-symbol {
        position: absolute;
        top: 0;
        left: 0;
        width: 70px;
        height: 70px;
        color: white;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #45a049;
        border-radius: 20%;
        cursor: pointer;

        transform: translateY(-100%);
        transition: 0.3s ease-in-out;
    }

    .chat-content {
        position: absolute;
        top: 0;
        left: 0;
        width: 300px;
        height: 400px;
        background-color: #ececec;
        border-radius: 5%;
        transform: scale(0) translateY(-100%);
        transition: 0.3s ease-in-out;
        transform-origin: 0 100%;
        overflow-x: hidden;
    }


    .chat-close {
        cursor: pointer;
    }

    .chat-list {
        overflow: auto;
        overflow-x: hidden;
    }

    .chat-content::-webkit-scrollbar {
        display: none;
    }


</style>
<div class="chat-area">
    <div class="chat-symbol">
        <span class="material-symbols-outlined" style="font-size: 45px">
        chat_bubble
        </span>
    </div>
    <div class="chat-content shadow-2xl">
        <div class="absolute right-3 top-3 chat-close" id="chat-close">
            <span class="material-symbols-outlined">
            close
            </span>
        </div>
        <h1 class="text-xl font-bold text-[black] p-3">채팅방</h1>
        <div class="chat-list">

            <!--
// v0 by Vercel.
// https://v0.dev/t/MWsK0IcOVFw
-->

            <div class="flex flex-col w-full max-w-md mx-auto rounded-lg">
                <div class="flex-1" id="chatroom-list">

                    <%--                    <a class="my-2 flex items-center gap-2 transition-colors hover:bg-muted" href="#">--%>
                    <%--                      <span class="relative flex shrink-0 overflow-hidden rounded-full border w-12 h-12">--%>
                    <%--                        <img class="aspect-square h-full w-full" alt="Chatroom Image"--%>
                    <%--                             src="https://generated.vusercontent.net/placeholder-user.jpg"/>--%>
                    <%--                      </span>--%>
                    <%--                        <div class="flex-1 grid gap-1">--%>
                    <%--                            <div class="flex items-center justify-between">--%>
                    <%--                                <h3 class="text-base font-medium">민석잉</h3>--%>
                    <%--                                <span class="text-xs text-muted-foreground">--%>
                    <%--                                    서울 강남구 가로수길 5--%>
                    <%--                                </span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="text-sm text-muted-foreground truncate">--%>
                    <%--                                글 제목 임시글 어쩌고 글 제목 임시글 어쩌고 글 제목 임시글 어쩌고--%>
                    <%--                            </p>--%>
                    <%--                        </div>--%>
                    <%--                    </a>--%>


                </div>
            </div>

        </div>
    </div>

</div>


<script>
    document.getElementsByClassName("chat-symbol")[0].addEventListener("click", function () {
        document.getElementsByClassName("chat-content")[0].style.transform = "scale(1) translateY(-100%)";
        fetch('/chat/room', {
            method: 'GET',
            credentials: 'include'
        })
            .then(response => response.json())
            .then(data => {
                let listArea = document.getElementById("chatroom-list");
                let s = "";
                // 서버에서 반환된 ChatroomPrintDto 목록 처리
                data.forEach(chatroom => {
                    s += `
                    <a href="/chatting/\${chatroom.chatroomnum}" class="hover:bg-gray-100 p-2 flex items-center gap-2 transition-colors hover:bg-muted">
                      <span class="relative flex shrink-0 overflow-hidden rounded-full border w-12 h-12">
                        <img class="aspect-square h-full w-full" alt="Chatroom Image"
                             src="https://kr.object.ncloudstorage.com/semi/panda/\${chatroom.applyprofile}"/>
                      </span>
                        <div class="flex-1 grid gap-1">
                            <div class="flex items-center justify-between">
                                <h3 class="text-base font-medium">\${chatroom.applyusernickname}</h3>
                                <span class="text-xs text-muted-foreground truncate">
                                    \${chatroom.productaddress}
                                </span>
                            </div>
                            <p class="text-sm text-muted-foreground truncate">
                                \${chatroom.chatroomname}
                            </p>
                        </div>
                    </a>
                    `;
                    console.log(`채팅방 번호: \${chatroom.chatroomnum}`);
                    console.log(`채팅방 이름: \${chatroom.chatroomname}`);
                    console.log(`상품 주소: \${chatroom.productaddress}`);
                    console.log(`신청자 닉네임: \${chatroom.applyusernickname}`);
                    console.log(`신청자 프로필: \${chatroom.applyprofile}`);
                });
                listArea.innerHTML = s;
                document.getElementsByClassName("chat-symbol")[0].style.transform = "scale(0) translateY(-100%)";
            })
            .catch(error => {
                console.error('Error:', error);
            });


    })

    document.getElementsByClassName("chat-close")[0].addEventListener("click", function () {
        document.getElementsByClassName("chat-content")[0].style.transform = "scale(0) translateY(-100%)";
        document.getElementsByClassName("chat-symbol")[0].style.transform = "scale(1) translateY(-100%)";
    })


</script>


</body>
</html>















