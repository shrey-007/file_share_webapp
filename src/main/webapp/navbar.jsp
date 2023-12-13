<html>
    <style>
        /* there are two things items and containers */
        body{
            /* else navbar mai and window mai gap aaega */
            margin:0;
        }
        .navBar{
            display: flex;
            background-color: rgb(3, 3, 10);
            /* navbar ki height */
            height: 50;
            /* vertically beeech mai aa jaaege items kiuki dekho height of navbar is 50 and navbar elements ki height 30 hai toh beech mai laana hoga*/
            align-items: center;
        }
        .navBarElements{
            color: white;
            /* isse sirf horizontally center hoga vertically nhi */
            text-align: center;
            /* height and widh of items */
            height: 30;
            width: 100;
            /* to vertically center text inside  navBarElements */
             padding-top: 5;
            /* to separate items */
            margin-left: 5;
            margin-right: 5;
        }
        .navBarElements:hover{
             background-color:blue;
             /* border */
            border: hidden solid blue;
            border-radius: 10px;
            cursor:pointer;

        }
        a{
        text-decoration:none;
        color:white;}


    </style>
    <body>

    <div class="navBar">
        <div class="navBarElements">
                <a href="index.jsp">Home</a>
        </div>
        <div class="navBarElements">
                <a href="login.jsp">Login</a>
        </div>
        <div class="navBarElements">
                <a href="register.jsp">Sign Up</a>
        </div>
    </div>

    </body>
</html>