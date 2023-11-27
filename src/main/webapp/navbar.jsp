<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Navbar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin:0;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
            margin-bottom:77px;
        }

        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>

<body>


 <div class="navbar">
        <a class="active" href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Sign up</a>
    </div>


</body>

</html>
