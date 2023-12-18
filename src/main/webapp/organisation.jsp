
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
        <h2>Register Your Oraganisation</h2>
        <form action="organisation" method="post">
            <div class="form-group">
                <label for="oid">Oraganisation ID</label>
                <input type="text" id="oid" name="oid" required>
            </div>
            <div class="form-group">
                <label for="oname">Oraganisation Name</label>
                <input type="text" id="oname" name="oname" required>
            </div>
            <div class="form-group">
                <label for="country">Country</label>
                <input type="text" id="country" name="country" required>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city" required>
            </div>
            <div class="form-group">
                <label for="branch">Branch</label>
                <input type="text" id="branch" name="branch" required>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
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
