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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
        table {
                            width: 100%;
                            border:2px solid black;
                            margin-bottom: 20px;
                            /*it is very imp otherwise sab row, column ke border alag dikhege toh collapse krdo*/
                            border-collapse:collapse;
                        }

                        th, td {
                            padding: 10px;
                            text-align: left;
                            border: 1px solid black;
                        }

                        th {
                            background-color: rgb(6, 6, 78);
                            color: white;
                        }
               .posts{
                        display: flex;
                        justify-content: space-between;
                 }
                  .post{
                                 background-color: aqua;
                                 border: 1px solid black;
                     }
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

        </style>
    </head>


    <body>
        <%@include file="profile_navbar.jsp"%>

        <h2>Our Top Posts</h2>
        <%
        out.println("<table><tr><th>Title</th><th>Name</th><th>Description</th><th>File</th><th>Likes</th></tr>");
         PostDao postdao=new PostDao(ConnectionProvider.getConnection());
         List<Post> list=postdao.getPublicPosts(user.getId(),user.getOrganisation());
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
                                                         <input type="hidden" name="filename" value="<%= p.getTitle() %>">
                                                         <input type="hidden" name="kahaSeAaya" value="profile.jsp">
                                                         <button class="smiley" type="submit" >
                                                             <i class="fas fa-smile"></i>
                                                           </button>
                                                         </form>
                        </td>
          </tr>

       <%
                        }
                        out.println("</table>");
       %>
<br>
<br>
<br><br><br><br><br>

<%@include file="footer.jsp"%>
    </body>
</html>


