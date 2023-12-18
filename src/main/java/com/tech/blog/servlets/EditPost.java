package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class EditPost extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String toChange=req.getParameter("toChange");

        PostDao postDao=new PostDao(ConnectionProvider.getConnection());

        if(toChange.equals("title")){
            int pid=Integer.parseInt(req.getParameter("pid"));
            String title=req.getParameter("title");
            postDao.updateTitle(pid,title);
        }
        else if(toChange.equals("description")){
            int pid=Integer.parseInt(req.getParameter("pid"));
            String description=req.getParameter("description");
            postDao.updateDescription(pid,description);
        }
        else{

        }
        resp.sendRedirect(req.getParameter("url"));
    }
}
