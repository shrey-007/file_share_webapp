<%@page errorPage="error.jsp"%>
<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Post,com.tech.blog.dao.PostDao,java.util.List,com.tech.blog.helper.ConnectionProvider,com.tech.blog.dao.LikeDao,com.tech.blog.dao.UserDao" %>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
             i{
                 color:yellow;}
                 .smiley i{
                 font-size: 2em;
                 cursor:pointer;
             }
             .smiley{
                 background-color: black;
                 border-style: 5px solid black;
                 border-radius: 20px;
                 padding: 0;
            }
            .PostContainer{
                 margin:auto;
                 display: flex;
                 width:70%;
                 flex-direction: column;
                 background-color: rgb(6, 6, 78);
                 color: white;
                 border: 2px solid black;
                 border-radius: 10px;
                 padding: 1%;
            }
            hr{
                 display: inline-block;
                 width: 100%;
            }
            .TitleAndType,.File{
                 display: flex;
                 justify-content: space-between;
                 justify-items: baseline;

            }
             .UserAndIcon,.LikesAndIcon{
                 display: flex;

             }
             .User{
                 margin-left: 1%;
             }
             .type{
                text-align: center;
                display: block;
                width: 50px;
                padding:1px;
             }
             #public{
                border: 2px solid #016f01;
                border-radius: 8px;
                color:#016f01
             }
             #private{
                border: 2px solid #de0000;
                border-radius: 8px;
                color: #de0000;
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
<%
 int postId=Integer.parseInt(request.getParameter("postId"));
 int postUserId=Integer.parseInt(request.getParameter("postUserId"));
 int postSubjectId=Integer.parseInt(request.getParameter("postSubjectId"));
 String postTitle=request.getParameter("postTitle");
 String postDescription=request.getParameter("postDescription");
 String postType=request.getParameter("postType");
 String postFile=request.getParameter("postFile");


 UserDao u=new UserDao(ConnectionProvider.getConnection());
 String username=u.getUserNameById(postUserId);

 String filename = "files/" + postFile;
%>



      <div class="PostContainer">
                  <div class="UserAndIcon">
                                  <div class="icon"><i class="fas fa-user"></i></div>
                                  <div class="User"><%=username%></div>
                  </div>

                  <hr>

                  <div class="TitleAndType">
                      <div class="PostTitle"><%=postTitle%></div>
                      <div class="type" id="<%= postType %>"><%= postType %></div>
                  </div>

                  <hr>
                  <div class="PostDescription"><%=postDescription%></div>
                  <hr>

                  <div class="Subject">Subject</div>
                  <br>

                  <div class="File">
                      <div class="showFile"><a href="<%=filename%>">Show File</a></div>
                      <div class="editFile"><a href="editPost.jsp">Edit</a></div>
                  </div>
                  <br>

                  <div class="LikesAndIcon">
                     <div class="Likes"><%=likeDao.countLikeOnPost(postId) %></div>
                     <div class="Like">
                        <form action="like" method="post">
                            <input type="hidden" name="uid" value="<%=user.getId()%>">
                            <input type="hidden" name="pid" value="<%=postId%>">
                            <input type="hidden" name="filename" value="<%= postTitle %>">
                            <input type="hidden" name="kahaSeAaya" value="displayIndividualPost.jsp">
                            <input type="hidden" name="url" value="displayIndividualPost.jsp?postId=<%=postId%>&postUserId=<%=postUserId%>&postSubjectId=<%=postSubjectId%>&postTitle=<%=postTitle%>&postDescription=<%=postDescription%>&postType=<%=postType%>&postFile=<%=postFile%>">
                            <button class="smiley" type="submit" >
                                <i class="fas fa-smile"></i>
                            </button>
                        </form>
                     </div>
                  </div>

                  <div class="issue">
                      <form action="issue" method="post">
                           <input type="hidden" name="uid" value="<%=user.getId()%>">
                           <input type="hidden" name="pid" value="<%=postId%>">
                           <input type="hidden" name="url" value="displayIndividualPost.jsp?postId=<%=postId%>&postUserId=<%=postUserId%>&postSubjectId=<%=postSubjectId%>&postTitle=<%=postTitle%>&postDescription=<%=postDescription%>&postType=<%=postType%>&postFile=<%=postFile%>">
                           <label for="content">Enter Issue</label>
                           <textarea name="content" id="" cols="30" rows="10"></textarea>
                           <button  type="submit" >
                               Submit
                           </button>
                      </form>
                  </div>

                  <br>

                  <div class="AddIssue"></div>
                  <br>

                  <div class="showIssue"></div>

      </div>



<br>
<br>
<br>
<br>
<br><br>
    <br>
    <br>
<%@include file="footer.jsp"%>

    </body>
</html>