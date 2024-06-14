<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification Form</title>
    <link href="https://cdn.tailwindcss.com" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f3f4f6;
        }
    </style>
</head>
<body>
<div class="max-w-md mx-auto px-4 py-8 sm:px-6 lg:px-8">
    <h2 class="text-2xl font-bold mb-4">Send Verification Code</h2>
    <form id="verificationForm">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required class="w-full px-3 py-2 border rounded">
        </div>
        <div class="form-group mt-4">
            <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded">Send Verification Code</button>
        </div>
    </form>

    <h2 class="text-2xl font-bold mt-8 mb-4">Verify Code</h2>
    <form id="verificationCodeForm">
        <div class="form-group">
            <label for="verificationEmail">Email:</label>
            <input type="email" id="verificationEmail" name="verificationEmail" required class="w-full px-3 py-2 border rounded">
        </div>
        <div class="form-group mt-4">
            <label for="verificationCode">Verification Code:</label>
            <input type="text" id="verificationCode" name="verificationCode" required class="w-full px-3 py-2 border rounded">
        </div>
        <div class="form-group mt-4">
            <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded">Verify Code</button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#verificationForm').on('submit', function (e) {
            e.preventDefault();
            const emailData = {
                email: $('#email').val()
            };
            $.ajax({
                url: '/mail/send',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(emailData),
                success: function (response) {
                    alert('Verification code sent successfully!');
                },
                error: function (error) {
                    alert('Failed to send verification code.');
                }
            });
        });

        $('#verificationCodeForm').on('submit', function (e) {
            e.preventDefault();
            const verifyData = {
                email: $('#verificationEmail').val(),
                code: $('#verificationCode').val()
            };
            $.ajax({
                url: '/verify',
                type: 'POST',
                data: verifyData,
                success: function (response) {
                    alert('인증되었습니다');
                },
                error: function (error) {
                    alert('인증번호가 잘못되었습니다.');
                }
            });
        });
    });
</script>

</body>
</html>
