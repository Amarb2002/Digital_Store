<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Interface</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            /* background: linear-gradient(to right, #89f7fe, #66a6ff); */
        }

        .chat-container {
            height: 80vh;
            /* background: rgba(255, 255, 255, 0.5); */
            background: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }

        .contacts {
            height: 100%;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.5);
        }

        .contact {
            display: flex;
            align-items: center;
            padding: 10px;
            cursor: pointer;
        }

        .contact img {
            width: 40px;
            height: 40px;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
        }

        .name {
            font-weight: bold;
        }

        .status {
            color: gray;
        }

        .chat-box {
            height: 100%;
            display: flex;
            flex-direction: column;
            background: rgba(255, 255, 255, 0.5);
        }

        .chat-header {
            border-bottom: 1px solid #ddd;
        }

        .chat-messages {
            flex: 1;
            overflow-y: auto;
        }

        .message {
            margin-bottom: 10px;
        }

        .message p {
            display: inline-block;
            max-width: 70%;
        }

        .message.received p {
            background: #f1f1f1;
        }

        .message.sent p {
            background: #daf8e3;
        }

        .time {
            font-size: 0.8em;
            color: gray;
        }

        .chat-input {
            border-top: 1px solid #ddd;
        }
    </style>
</head>

<body>
    <div class="container p-3"> 
        <div class="row chat-container">
            <div class="col-md-4 contacts">
                <input type="text" placeholder="Search..." class="form-control search-bar my-3">
                <div class="contact" data-name="Khalid" data-avatar="avatar1.png" data-status="Khalid is online">
                    <img src="./assets/img/favicon.png" alt="Khalid" class="rounded-circle">
                    <div class="contact-info ml-2">
                        <span class="name">Khalid</span>
                        <span class="status">Khalid is online</span>
                    </div>
                </div>
                <div class="contact" data-name="Taherah Big" data-avatar="avatar2.png" data-status="Taherah left 7 mins ago">
                    <img src="./assets/img/favicon.png" alt="Taherah" class="rounded-circle">
                    <div class="contact-info ml-2">
                        <span class="name">Taherah Big</span>
                        <span class="status">Taherah left 7 mins ago</span>
                    </div>
                </div>
                <!-- Add more contacts as needed -->
            </div>
            <div class="col-md-8 chat-box">
                <div class="chat-header d-flex align-items-center p-3 border-bottom">
                    <img src="./assets/img/favicon.png" alt="Avatar" class="rounded-circle chat-avatar">
                    <span class="chat-name ml-2">Select a contact to start chatting</span>
                </div>
                <div class="chat-messages p-3">
                    <!-- Chat messages will appear here -->
                </div>
                <div class="chat-input d-flex p-3 border-top">
                    <input type="text" placeholder="Type your message..." class="form-control">
                    <button class="btn btn-primary ml-2">Send</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="Desine/script.js">
 
    </script>
</body>

</html>
