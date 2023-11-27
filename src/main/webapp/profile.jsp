<%@page errorPage="error.jsp"%>
<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Post,com.tech.blog.dao.PostDao,java.util.List,com.tech.blog.helper.ConnectionProvider" %>


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
            .parent{
                display: flex;
                height: 200;
            }
            .child1{
                width: 200px;
            }
            .child2{
                width: 1280px;
                text-align: center;
                background-color:rgb(106 108 78);

                color: #e2ded8;

            }




        .button-container {
            text-align: center;
        }

        .button-container button {
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007BFF;
            color: #ffffff;
            border: none;
            border-radius: 5px;
        }

        .button-container button:hover {
            background-color: #0056b3;
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


        <div class="parent">
            <div class="child1">
               <img src="<%=imagename%>" width="200" height="200">
            </div>
            <div class="child2">
              <h2>Username :<%=user.getName()%></h2>
              <br>
              Gender :<%=user.getGender()%>
              <br>
              Email :<%=user.getEmail()%>
              <br>
              About:<%=user.getAbout()%>
            </div>
        </div>


       <div class="button-container">
                   <form action="update.jsp" method="post">
                       <button >Change Profile Photo</button>

                   </form>
       </div>
       <div class="button-container">
                   <form action="post.jsp" method="post">
                              <button >Post</button>
                   </form>
       </div>
       <div class="button-container">
                          <form action="show_all_post.jsp" method="post">
                                     <button >Show All Posts</button>
                          </form>
       </div>



       <h1>Your Posts</h1>
       <hr>


       <%
           out.println("<table><tr><th>Title</th><th>Description</th><th>Files</th></tr>");

           PostDao postdao = new PostDao(ConnectionProvider.getConnection());
           List<Post> list = postdao.getAllPostsByUser(uid);

           for (Post p : list) {
               String filename = "files/" + p.getFilename();
       %>
               <tr>
                   <td><%= p.getTitle() %></td>
                               <td><%= p.getDescription() %></td>
                               <td><a href="<%= filename %>">Show file</a></td>


               </tr>
       <%
           }

           out.println("</table>");
       %>



</body>
</html>




