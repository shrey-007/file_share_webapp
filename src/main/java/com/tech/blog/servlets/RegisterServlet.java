package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        String check=req.getParameter("subscribe");
        if(check==null){
            out.println("please accept terms and conditions");
        }
        else{
            //getting user details
            String name=req.getParameter("username");
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            String gender=req.getParameter("gender");
            String about=req.getParameter("about");
            String organisation=req.getParameter("organisation");
            System.out.println(organisation);


            //create user object and set data to its attribute
            User user=new User(name,email,password,gender,about,organisation);
            System.out.println(user);
            //create userdao object to save these details
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            if(dao.saveUser(user)){
                out.println("you have been registered successfully");
            }
            else{
                out.println("error registering");
            }
        }


    }
}
