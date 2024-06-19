<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .chat-container {
            width: 400px;
            margin: 50px auto;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
        }
        .messages {
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }
        .messages div {
            margin-bottom: 10px;
        }
        .message-input {
            display: flex;
        }
        .message-input input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
        }
        .message-input button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="chat-container">
    <div class="messages" id="messages"></div>
    <div class="message-input">
        <input type="text" id="userInput" placeholder="Type a message...">
        <button onclick="sendMessage()">Send</button>
    </div>
</div>

<script>
    function sendMessage() {
        const userInput = document.getElementById('userInput').value;
        if (userInput.trim() === '') return;

        addMessage('User', userInput);
        document.getElementById('userInput').value = '';

        fetch('/bot/chat?prompt=' + encodeURIComponent(userInput))
            .then(response => response.json())
            .then(data => {
                addMessage('Bot', data);
            })
            .catch(error => console.error('Error:', error));
    }

    function addMessage(sender, text) {
        const messagesDiv = document.getElementById('messages');
        const messageDiv = document.createElement('div');
        messageDiv.innerHTML = `<strong>${sender}:</strong> ${text}`;
        messagesDiv.appendChild(messageDiv);
        messagesDiv.scrollTop = messagesDiv.scrollHeight;
    }
</script>
</body>
</html>
