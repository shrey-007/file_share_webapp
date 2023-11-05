package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
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
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try{
            //fetch image inserted by form
            Part part=req.getPart("profilepic");
            //fetch imgae name
            String imagename=part.getSubmittedFileName();

            //ye toh abhi edit profile photo vali details fetch kri hai, ab jis user ka session chal rha h voh fetch kro
            HttpSession s=req.getSession();
            User user=(User)s.getAttribute("currentuser");


            //update user object attribute
            user.setProfile(imagename);


            //update to database
            UserDao userDao=new UserDao(ConnectionProvider.getConnection());
            boolean flag=userDao.updateProfile(user);
            PrintWriter out=resp.getWriter();
            if(flag==true){
                out.println("profile pic updated..");
            }
            else{
                out.println("error uploading image");
            }


            //abhi only name of image save hua hai db mai.ab save image to server
            String path=req.getRealPath("/")+"images"+ File.separator+user.getProfile();
            FileSaver.saveFile(part.getInputStream(),path);
            out.println("file saved to server");


            //redirect to profile page
            resp.sendRedirect("profile.jsp");

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
