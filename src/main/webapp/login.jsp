
<html>
<head>
<style>
       body{

            }



        .login-container {
            background-color: rgb(3, 3, 24);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin:auto;
            color:white;
        }

        .login-container h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {

        }

        .form-group input {
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
        .invalid{
          height:30px;
          background-color: grey;
          color:#1f0909;
          margin-bottom:10px;
          text-align:center;
          border:2px hidden black;
          border-radius:4px;
          padding-top:3px;
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
<br>
<br>


<div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
                <%
                    String message=(String)session.getAttribute("message");

                    if(message!=null){
                %>
                <div class="invalid">
                          You are not a registerd user!!
                </div>
                <%
                    session.removeAttribute("message");
                      }
                %>


            <div class="form-group">
                <button type="submit">Login</button>
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




</body>

</html>
