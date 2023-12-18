<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Issue,com.tech.blog.entities.Post,com.tech.blog.dao.PostDao,java.util.List,com.tech.blog.helper.ConnectionProvider,com.tech.blog.dao.LikeDao,com.tech.blog.dao.IssueDao,com.tech.blog.dao.UserDao" %>
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
   </style>
  </head>
  <body>
  <%@include file="profile_navbar.jsp"%>



           <%
                      out.println("<table><tr><th>Notifications</th></tr>");

                      IssueDao issueDao = new IssueDao(ConnectionProvider.getConnection());
                      UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                      List<Issue> list = issueDao.getAllIssuesForUser(uid);

                      for (Issue issue : list) {
                         String issueUser=userDao.getUserNameById(issue.getUid());

                  %>
                          <tr>
                                       <td><%=issueUser%> added a new Issue in your Post  &nbsp <span style="font-style: italic;"><%=issue.getContent()%></span></td>
                          </tr>
                  <%
                      }

                      out.println("</table>");
                  %>





<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

     <%@include file="footer.jsp"%>
  </body>
</html>