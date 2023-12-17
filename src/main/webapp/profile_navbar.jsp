<html>
<%@page import="com.tech.blog.entities.User" %>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            /* there are two things items and containers */
            body{
                /* else navbar mai and window mai gap aaega */
                margin:0;
            }
            .navBar{
                display: flex;
                background-color: rgb(6, 6, 78);
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
            .navBarElements2{
                /* now navBarElements is itself a flexbox */
                display: flex;
                margin-left: 1200;

            }
            .navBarElements:hover{
                 background-color:blue;
                 /* border */
                border: hidden solid blue;
                border-radius: 10px;
                /* to customise cursor */
                cursor:pointer;
            }
            .navBarsubElements2{
                color:white;
                margin: 5;
            }
            #e1{
                color:rgb(214, 15, 145);
                margin-right: 20;
            }
            a{
            text-decoration:none;}


        </style>
        </head>

<body>



<div class="navBar">
       <a href="index.jsp" class="navBarElements">Home</a>
       <div class="navBarElements2">
          <a href="notification.jsp" class="navBarsubElements2" id="e1"><i class="fas fa-bell"></i></i></a>
          <a href="profile.jsp" class="prf" style="display:flex;">
          <div class="navBarsubElements2" id="e2"><i class="fas fa-user"></i></div>
          <div class="navBarsubElements2" id="e3"><%=user.getName()%></div>
          </a>
       </div>
       <a href="logout" class="navBarElements">Logout</a>
</div>

</body>

</html>
