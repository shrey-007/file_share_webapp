<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Post,com.tech.blog.dao.PostDao,java.util.List,com.tech.blog.helper.ConnectionProvider,com.tech.blog.dao.UserDao,com.tech.blog.dao.LikeDao" %>
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
        table {
                            width: 100%;
                            border-collapse: collapse;
                            margin-bottom: 20px;
                        }

                        th, td {
                            padding: 10px;
                            text-align: left;
                            border: 1px solid #ddd;
                        }

                        th {
                            background-color: #333;
                            color: #fff;
                        }
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
        out.println("<table><tr><th>Title</th><th>Name</th><th>Description</th><th>File</th><th>Likes</th></tr>");
         PostDao postdao=new PostDao(ConnectionProvider.getConnection());
         List<Post> list=postdao.getAllPosts();
         for(Post p:list){
         String filename="files/"+p.getFilename();
         int id=p.getUid();
         UserDao u=new UserDao(ConnectionProvider.getConnection());
         String username=u.getUserNameById(id);
       %>
           <tr>
                        <td><%=p.getTitle()%></td>
                        <td><%=username%></td>
                        <td><%=p.getDescription()%></td>
                        <td><a href="<%=filename%>">Show file</a></td>
                        <td><%= likeDao.countLikeOnPost(p.getPid()) %>
                                                          <form action="like" method="post">
                                                          <input type="hidden" name="uid" value="<%=user.getId()%>">
                                                          <input type="hidden" name="pid" value="<%=p.getPid()%>">
                                                          <input type="hidden" name="kahaSeAaya" value="show_all_post.jsp">
                                                          <input type="submit" value="Submit">
                                                          </form>
                        </td>
          </tr>

       <%
                        }
                        out.println("</table>");
       %>


    </body>
</html>


