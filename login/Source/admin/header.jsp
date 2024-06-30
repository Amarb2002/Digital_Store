<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #4a7ad4;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
        }

        .header nav {
            margin-top: 10px;
        }

        .header nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 18px;
        }

        .profile {
            position: relative;
            display: inline-block;
        }

        .profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: white;
            width: 250px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .dropdown-content img.profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .dropdown-content h3 {
            margin: 0;
            font-size: 20px;
        }

        .dropdown-content p {
            margin: 5px 0;
            color: #555;
        }

        .dropdown-content .profile-stats {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            font-size: 14px;
            color: #333;
        }

        .dropdown-content .profile-stats div {
            text-align: center;
        }

        .dropdown-content .profile-stats div span {
            display: block;
            font-weight: bold;
        }

        .dropdown-content a {
            display: block;
            color: black;
            padding: 10px 0;
            text-decoration: none;
            border-top: 1px solid #eee;
        }

        .dropdown-content a:hover {
            background-color: #f9f9f9;
        }

        .profile:hover .dropdown-content {
            display: block;
        }

        .contenar {
            padding: 20px;
        }

        .btn-logout {
            display: block;
            width: 100%;
            text-align: center;
            padding: 10px;
            margin-top: 10px;
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-logout:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Digital India</h1>
        <nav>
            <a href="#services">Services</a>
            <a href="#about">About</a>
            <a href="#contact">Contact</a>
        </nav>
        <div class="profile">
            <img style="margin-right:30px;" src="assets/img/favicon.png" alt="Profile">
            <div class="dropdown-content">
                <img src="assets/img/apple-touch-icon.png" alt="Profile Picture" class="profile-pic">
                <h3>Super Admin</h3>
                <p>lmsadmin@mindscroll.com</p>
                <p>2025550154</p>
                <div class="profile-stats">
                    <div>
                        <span>34</span>
                        Courses
                    </div>
                    <div>
                        <span>31</span>
                        Users
                    </div>
                </div>
                <a href="#manage-account">Manage Your Account</a>
                <a href="#manage-settings">Manage Settings</a>
                <button class="btn-logout">Logout</button>
            </div>
        </div>
    </header>
</body>
</html>
