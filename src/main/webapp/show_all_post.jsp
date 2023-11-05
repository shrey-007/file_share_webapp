<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Post,com.tech.blog.dao.PostDao,java.util.List,com.tech.blog.helper.ConnectionProvider,com.tech.blog.dao.UserDao" %>
<%
User user=(User)session.getAttribute("currentuser");
if(user==null){
response.sendRedirect("login.jsp");}
String imagename="images/"+user.getProfile();
int uid=user.getId();
%>
<html>

    <head>
        <style>
               .posts{
                        display: flex;
                        justify-content: space-between;
                 }
                  .post{
                                 background-color: aqua;
                                 border: 1px solid black;
                     }

        </style>
    </head>


    <body>
        <%@include file="profile_navbar.jsp"%>

        <%
         PostDao postdao=new PostDao(ConnectionProvider.getConnection());
         List<Post> list=postdao.getAllPosts();
         for(Post p:list){
         String filename="files/"+p.getFilename();
         int id=p.getUid();
         UserDao u=new UserDao(ConnectionProvider.getConnection());
         String username=u.getUserNameById(id);
       %>
           <div class="posts">
                      <div class="post">
                        <h2><%=p.getTitle()%></h2>
                        <h4><%=username%></h4>
                        <p><%=p.getDescription()%></p>
                        <a href="<%=filename%>">Show file</a>
                      </div>
           </div>
       <%
                        }
       %>

    </body>
</html>