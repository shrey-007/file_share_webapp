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
            String toChange=req.getParameter("toChange");
            System.out.println(toChange);

            // jis user ka session chal rha h voh fetch kro
            HttpSession s=req.getSession();
            User user=(User)s.getAttribute("currentuser");

            UserDao userDao=new UserDao(ConnectionProvider.getConnection());
            PrintWriter out=resp.getWriter();

            if(toChange.equals("name")){
                //fetch new name
                String name=req.getParameter("name");
                user.setName(name);
                boolean flag=userDao.updateName(user);
                if(flag){out.println("name updated..");}
                else{out.println("error");}

            }
            else if(toChange.equals("about")){
                //fetch new about
                String about=req.getParameter("about");
                user.setAbout(about);
                boolean flag=userDao.updateAbout(user);
                if(flag){out.println("about updated..");}
                else{out.println("error");}
            }
            else{
                //fetch image inserted by form
            Part part=req.getPart("profilepic");
            //fetch imgae name
            String imagename=part.getSubmittedFileName();



            //update user object attribute
            user.setProfile(imagename);


            //update to database

            boolean flag=userDao.updateProfile(user);

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
            }



            //redirect to profile page
            resp.sendRedirect("profile.jsp");

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
