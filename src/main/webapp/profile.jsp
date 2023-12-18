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
            .parent {
                        display: flex;
                        height: 200;
                        justify-content: space-between;
                        border-style: solid;
                        border-top: #0056b3;
                        border-width: 1px;
                    }
            .child1{
                width: 200px;
            }
            .child2 {
                        /* image ki width daal di hai remaining width ise dena hai to flex=1 krdo  */
                        flex: 1;
                        text-align: center;
                        background-image: linear-gradient(rgb(6, 6, 78), rgb(204 152 5));
                        color: white;
                    }




                    .button {
                        text-align: center;
                    }

                    .button button {
                        padding: 10px 20px;
                        margin: 5px;
                        font-size: 16px;
                        cursor: pointer;
                        background-color: #e39c0ede;
                        color: white;
                        border: none;
                        border-radius: 5px;
                    }

                    .button button:hover {
                        background-color: #f9c01fde;
                    }
           .posts{
                        display: flex;
                        justify-content: space-between;
                 }
                  .post{
                                 background-color: aqua;
                                 border: 1px solid black;
                             }
                              #photoButton{
                                         display: flex;
                                         background-color: rgb(6, 6, 78);

                                     }
                 .parent2{
                  display:flex;
                  align-items: baseline;
                 }
                 #el2,#el1{
                   margin-left:460;
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


        <div class="parent">
            <div class="child1">
               <img src="<%=imagename%>" width="200" height="200">
            </div>
            <div class="child2">
              <div>
              <button class="fa fa-edit" onclick="changeName()" id="c11"></button>
              Username :<%=user.getName()%>
              <form action="update" method="post" id="c12" style="display:none;">
              <label for="name">Enter Name</label>
              <input type="text" name="name">
              <input type="hidden" name="toChange" value="name">
              <button type="submit">Submit</button>
              </form>
              </div>
              <br>
              <div>
              Gender :<%=user.getGender()%>
              </div>
              <br>
              <div>
              Email :<%=user.getEmail()%>
              </div>
              <br>
              <div>
              <button class="fa fa-edit" onclick="changeAbout()" id="c21"></button>
              About:<%=user.getAbout()%>
              <form action="update" method="post" id="c22" style="display:none;">
              <label for="about">Enter About</label>
              <input type="text" name="about">
              <input type="hidden" name="toChange" value="about">
              <button type="submit">Submit</button>
              </form>
              </div>
            </div>
        </div>


       <div  id="photoButton">


             <form id="c2" action="update" method="post" enctype="multipart/form-data" style="display: none;color:white;width:250px">
                   <input type="hidden" name="toChange" value="pic">
                   <input type="file" name="profilepic"/>
                      <div class="button" style="margin-right:1000px;">
                                   <button type="submit">Upload image</button>
                      </div>
             </form>
             <div class="button">
             <button id="c1" onclick="changePhoto()">Change Profile Photo</button>
             </div>
       </div>

       <div class="parent2">

                  <h1>Your Posts</h1>


                   <div class="button" id="el1">
                      <form action="post.jsp" method="post">
                              <button>Add Post</button>
                      </form>
                   </div>

                   <div class="button"  id="el2">
                          <form action="show_all_post.jsp" method="post">
                                     <button >Show All Posts</button>
                          </form>
                   </div>
       </div>

       <hr>


       <%
           out.println("<table><tr><th>Title</th><th>Description</th><th>Files</th><th>Type</th><th>Likes</th><th>Show Post</th></tr>");

           PostDao postdao = new PostDao(ConnectionProvider.getConnection());
           List<Post> list = postdao.getAllPostsByUser(uid);

           for (Post p : list) {
               String filename = "files/" + p.getFilename();

       %>
               <tr>
                               <td><%= p.getTitle() %></td>
                               <td><%= p.getDescription() %></td>
                               <td><a href="<%= filename %>">Show file</a></td>
                               <td><div class="type" id="<%= p.getType() %>"><%= p.getType() %></div></td>
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
                               <td><a href="displayIndividualPost.jsp?postId=<%=p.getPid()%>&postUserId=<%=p.getUid()%>&postSubjectId=<%=p.getSid()%>&postTitle=<%=p.getTitle()%>&postDescription=<%=p.getDescription()%>&postType=<%=p.getType()%>&postFile=<%=p.getFilename()%>">Show</a></td>


               </tr>
       <%
           }

           out.println("</table>");
       %>


<%@include file="footer.jsp"%>


<script>
 function changePhoto(){
                var form = document.getElementById("c2");
                var btn=document.getElementById("c1");

                if(form.style.display=="none"){
                  form.style.display="block";
                  btn.innerHTML="Back";

                 }
                 else{
                  form.style.display="none";
                  btn.innerHTML="Change Profile Photo";

                 }
             }

  function changeAbout(){
          var form = document.getElementById("c22");
          var btn=document.getElementById("c21");

          if(form.style.display=="none"){
            form.style.display="block";


           }
           else{
            form.style.display="none";


           }
         }

  function changeName(){
          var form = document.getElementById("c12");
          var btn=document.getElementById("c11");

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




