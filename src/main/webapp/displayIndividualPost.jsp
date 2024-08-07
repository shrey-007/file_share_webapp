<%@page errorPage="error.jsp"%>
<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Issue,com.tech.blog.entities.Post,com.tech.blog.dao.PostDao,java.util.List,com.tech.blog.helper.ConnectionProvider,com.tech.blog.dao.LikeDao,com.tech.blog.dao.UserDao,com.tech.blog.dao.IssueDao" %>

<%
User user=(User)session.getAttribute("currentuser");
if(user==null){
response.sendRedirect("login.jsp");}
String imagename="images/"+user.getProfile();
int uid=user.getId();
LikeDao likeDao=new LikeDao(ConnectionProvider.getConnection());
PostDao postDao=new PostDao(ConnectionProvider.getConnection());
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



              table {
                    width: 100%;
                    border:2px solid black;
                    margin-bottom: 20px;
                    /*it is very imp otherwise sab row, column ke border alag dikhege toh collapse krdo*/
                    border-collapse:collapse;
                    background-color: rgb(183 140 0);
                    color: white;
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
                button{
                  background-color: rgb(183 140 0);
                  color: white;
                  border:2px solid black;
                  height:25px;
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
 Post post=postDao.getPostById(postId);
 int postUserId=Integer.parseInt(request.getParameter("postUserId"));
 int postSubjectId=Integer.parseInt(request.getParameter("postSubjectId"));
 String postTitle=post.getTitle();
 String postDescription=post.getDescription();
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
                      <div class="PostTitle"><%=postTitle%>
                      <button class="fa fa-edit" onclick="changeTitle()"></button>
                      </div>
                      <div class="type" id="<%= postType %>"><%= postType %></div>
                  </div>

                  <form action="postEdit" method="post" style="display:none;" id="f1">
                    <label for="title">Enter Title</label>
                    <input type="text" name="title"></input>
                    <input type="hidden" name="toChange" value="title"></input>
                    <input type="hidden" name="pid" value="<%=postId%>"></input>
                    <input type="hidden" name="url" value="displayIndividualPost.jsp?postId=<%=postId%>&postUserId=<%=postUserId%>&postSubjectId=<%=postSubjectId%>&postTitle=<%=postTitle%>&postDescription=<%=postDescription%>&postType=<%=postType%>&postFile=<%=postFile%>">
                    <button type="submit">Submit</button>
                  </form>

                  <hr>
                  <div class="PostDescription"><%=postDescription%>
                  <button class="fa fa-edit" onclick="changeDescription()"></button>
                  </div>

                  <form action="postEdit" method="post" style="display: none;" id="f2">
                    <label for="description">Enter Description</label>
                    <input type="text" name="description"></input>
                    <input type="hidden" name="toChange" value="description"></input>
                    <input type="hidden" name="pid" value="<%=postId%>"></input>
                    <input type="hidden" name="url" value="displayIndividualPost.jsp?postId=<%=postId%>&postUserId=<%=postUserId%>&postSubjectId=<%=postSubjectId%>&postTitle=<%=postTitle%>&postDescription=<%=postDescription%>&postType=<%=postType%>&postFile=<%=postFile%>">
                    <button type="submit">Submit</button>
                  </form>

                  <hr>

                  <div class="Subject">Subject</div>
                  <br>


                  <div class="showFile" >
                  <a href="<%=filename%>" style="color:yellow;">Show File</a>
                  <button class="fa fa-edit" onclick="changeFile()"></button>
                  </div>

                  <form action="postEdit" method="post" style="display: none;" id="f3" enctype="multipart/form-data">
                    <input type="file" id="ufile" name="ufile" required>
                    <input type="hidden" name="toChange" value="file"></input>
                    <input type="hidden" name="pid" value="<%=postId%>"></input>
                    <input type="hidden" name="url" value="displayIndividualPost.jsp?postId=<%=postId%>&postUserId=<%=postUserId%>&postSubjectId=<%=postSubjectId%>&postTitle=<%=postTitle%>&postDescription=<%=postDescription%>&postType=<%=postType%>&postFile=<%=postFile%>">
                    <button type="submit">Submit</button>
                  </form>

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
                           <input name="content"></input>
                           <button  type="submit" >
                               Issue
                           </button>
                      </form>
                  </div>

                  <br>


                  <br>

                  <div class="showIssue">
                           <%
                               out.println("<table><tr><th>Person</th><th>Issue</th><th>Date</th></tr>");

                               IssueDao issueDao = new IssueDao(ConnectionProvider.getConnection());
                               List<Issue> list = issueDao.getAllIssueByPostId(postId);
                               UserDao userDao = new UserDao(ConnectionProvider.getConnection());

                               for (Issue issue : list) {


                           %>
                                   <tr>
                                                   <td><%=userDao.getUserNameById(issue.getUid())%></td>
                                                   <td><%= issue.getContent() %></td>
                                                   <td><%=issue.getDate()%></td>
                                   </tr>
                           <%
                               }

                               out.println("</table>");
                           %>
                  </div>

      </div>



<br>
<br>
<br>
<br>
<br><br>
    <br>
    <br>
<%@include file="footer.jsp"%>




    <script>
      function changeTitle(){
              var form = document.getElementById("f1");


              if(form.style.display=="none"){
                form.style.display="block";
               }
               else{
                form.style.display="none";
               }
             }

        function changeDescription(){
                var form = document.getElementById("f2");

                if(form.style.display=="none"){
                  form.style.display="block";
                 }
                 else{
                  form.style.display="none";
                 }
               }
          function changeFile(){
                  var form = document.getElementById("f3");

                  if(form.style.display=="none"){
                    form.style.display="block";
                   }
                   else{
                    form.style.display="none";
                   }
                 }
    </script>
    </body>
</html>