<%@include file="navbar.jsp"%>
<html>
<head>
</head>
<body>

   <form action="update" method="post" enctype="multipart/form-data">
      <label for="profilepic">Update Profile Picture</label>
      <input type="file" name="profilepic"/>
         <div class="form-group">
                      <button type="submit">Upload image</button>
         </div>
   </form>



</body>
</html>