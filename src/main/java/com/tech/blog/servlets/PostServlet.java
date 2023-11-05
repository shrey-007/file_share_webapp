package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.Subject;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.FileSaver;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class PostServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
       try{
           //getting post information
           String title=req.getParameter("title");
           String description=req.getParameter("description");
           String subject=req.getParameter("subject");
           Part part=req.getPart("ufile");
           String filename=part.getSubmittedFileName();

           //getting user information
           HttpSession s=req.getSession();
           User user=(User)s.getAttribute("currentuser");
           int uid=user.getId();

           //getting subject information
           Subject sub=new Subject(subject);
           int sid= sub.getSid();

           //creating post object and setting its attributes
           Post post=new Post(sid,uid,title,filename,description);

           //saving details using postdao
           PostDao dao=new PostDao(ConnectionProvider.getConnection());
           if(dao.savePost(post)){
               out.println("posted successfully..");
           }
           else{
               out.println("error posting");
           }

           //saving file in database
           String path=req.getRealPath("/")+"files"+ File.separator+post.getFilename();
           FileSaver.saveFile(part.getInputStream(),path);
           out.println("file saved to server");
           resp.sendRedirect("profile.jsp");

       }
       catch (Exception e){e.printStackTrace();}
    }
}
