<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fafafa;
        }

        .profile-header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: white;
            border-bottom: 1px solid #dbdbdb;
        }

        .profile-picture {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            margin-right: 20px;
            border: 2px solid #dbdbdb;
        }

        .profile-info {
            flex: 1;
        }

        .profile-info h2 {
            margin: 0;
            font-size: 28px;
            font-weight: normal;
        }

        .profile-info p {
            margin: 10px 0;
            color: #888;
        }

        .profile-stats {
            display: flex;
            gap: 20px;
        }

        .profile-stats div {
            text-align: center;
        }

        .profile-stats div span {
            display: block;
            font-weight: bold;
        }

        .profile-bio {
            margin: 20px 0;
        }

        .posts {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            padding: 20px;
            background-color: white;
        }

        .post {
            width: 30%;
            aspect-ratio: 1/1;
            overflow: hidden;
            position: relative;
            border: 1px solid #dbdbdb;
        }

        .post img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        @media (max-width: 600px) {
            .profile-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .profile-picture {
                margin-right: 0;
                margin-bottom: 20px;
            }

            .profile-info {
                text-align: center;
            }

            .posts {
                padding: 10px;
            }

            .post {
                width: 45%;
            }
        }

        @media (min-width: 601px) and (max-width: 1024px) {
            .post {
                width: 45%;
            }
        }
    </style>
</head>
<body>
    <div class="profile-header">
        <img src="assets/img/profile-pic.jpg" alt="Profile Picture" class="profile-picture">
        <div class="profile-info">
            <h2>John Doe</h2>
            <p>@johndoe</p>
            <div class="profile-stats">
                <div>
                    <span>150</span>
                    Posts
                </div>
                <div>
                    <span>2.5k</span>
                    Followers
                </div>
                <div>
                    <span>300</span>
                    Following
                </div>
            </div>
            <div class="profile-bio">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.</p>
            </div>
        </div>
    </div>
    <div class="posts">
        <%
            int postCount = 9; // Number of posts to display
            for (int i = 0; i < postCount; i++) {
        %>
        <div class="post">
            <img src="assets/img/post-<%= i %>.jpg" alt="Post <%= i + 1 %>">
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
