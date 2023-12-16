package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //fetch username and password from request
        String email=req.getParameter("email");
        String password=req.getParameter("password");

        UserDao userDao=new UserDao(ConnectionProvider.getConnection());
        User user=userDao.getUserEmailAndPassword(email,password);

        if(user==null){
            PrintWriter out=resp.getWriter();
            HttpSession session=req.getSession();
            session.setAttribute("message","notRegistered");
            resp.sendRedirect("login.jsp");
        }
        else{
            //session banao to store current user
            HttpSession s=req.getSession();
            s.setAttribute("currentuser",user);
            //redirect to profile page after login
            resp.sendRedirect("profile.jsp");
        }

    }
}
