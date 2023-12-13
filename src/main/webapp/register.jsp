
<html>

<head>

    <title>Signup Page</title>
    <style>

        body {
            font-family: Arial, sans-serif;

            justify-content: center;
            align-items: center;

            margin: 0;

        }

        .signup-container {
            background-color: rgb(3, 3, 24);;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin:auto;
            color:white;
        }

        .signup-container h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {

        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group button {
           background-color: #e39c0ede;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            padding: 10px 20px;
        }

        .form-group button:hover {
          background-color: #f9c01fde;
        }
    </style>
</head>

<body>

<%@include file="navbar.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>




    <div class="signup-container">
        <h2>Signup</h2>
        <form action="register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="about">About Youself</label>
                <textarea id="about" name="about" rows="4"></textarea>
            </div>
            <div >
                <label for="subscribe"> Accept  conditions</label>
                <input type="checkbox" name="subscribe">
            </div>
            <div class="form-group">
                <button type="submit">Sign Up</button>
            </div>
        </form>
    </div>


     <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>


    <%@include file="footer.jsp"%>

</body>

</html>
