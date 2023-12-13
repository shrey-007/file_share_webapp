<%@page errorPage="error.jsp"%>
<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Post,com.tech.blog.dao.PostDao,java.util.List,com.tech.blog.helper.ConnectionProvider,com.tech.blog.dao.LikeDao" %>


<%
User user=(User)session.getAttribute("currentuser");
if(user==null){
response.sendRedirect("login.jsp");}
String imagename="images/"+user.getProfile();
int uid=user.getId();
LikeDao likeDao=new LikeDao(ConnectionProvider.getConnection());
%>



<html>


<head>

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

<%@include file="profile_navbar.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>




    <div class="signup-container">
        <h2>Create Post</h2>
        <form action="post" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" id="description" name="description" required>
            </div>
            <div class="form-group">
                <label for="subject">Subject</label>
                <select id="subject" name="subject">
                    <option value="Data Structure and Algorithms">Data Structure and Algorithms</option>
                    <option value="Data Science">Data Science</option>
                    <option value="Computer Architecture">Computer Architecture</option>
                    <option value="Java Programming">Java Programming</option>
                    <option value="DataBase Management System">DataBase Management System</option>
                </select>
            </div>
            <div class="form-group">
                           <label for="ufile">Upload File</label>
                           <input type="file" id="ufile" name="ufile" required>
                       </div>
            <div class="form-group">
                <button type="submit">Post</button>
            </div>
        </form>
    </div>




    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <%@include file="footer.jsp"%>

</body>

</html>
