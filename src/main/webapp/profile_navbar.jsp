<!DOCTYPE html>
<html lang="en">
<%@page import="com.tech.blog.entities.User" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Navbar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
            display: flex;

            align-items: center;
            padding: 0 20px;
        }

        .navbar a {
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover,.navbar .user-info a:hover  {
            background-color: #ddd;
            color: black;
        }

        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }

        .navbar .user-info {
            display: flex;
            align-items: center;
        }

        .navbar .user-info .username {
            color: #f2f2f2;
            padding: 14px 16px;
            margin: 0;
        }

        .navbar .user-info .logout {
            color: #f2f2f2;
            text-decoration: none;
            padding: 14px 16px;
            margin: 0;
        }
        .user-info{
            margin-left:1100;
        }
    </style>
</head>

<body>

<div class="navbar">
    <a class="active" href="index.jsp">Home</a>
    <a href="about.jsp">About</a>
    <div class="user-info">
        <p class="username"><%=user.getName()%></p>
        <a class="logout" href="logout">Logout</a>
    </div>
</div>

</body>

</html>
