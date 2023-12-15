package com.tech.blog.servlets;

import com.tech.blog.dao.IssueDao;
import com.tech.blog.entities.Issue;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

public class IssueServlet extends HttpServlet {

    protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int uid=Integer.parseInt(req.getParameter("uid"));
        int pid=Integer.parseInt(req.getParameter("pid"));
        String content=req.getParameter("content");
        String url=req.getParameter("url");
//        System.out.println(content);
        IssueDao issueDao=new IssueDao(ConnectionProvider.getConnection());
        boolean flag=issueDao.insertIssue(uid,pid,content);

        PrintWriter out=resp.getWriter();

        if(flag){
            out.println("issue saved successfully");
            resp.sendRedirect(url);
        }
        else{
            out.println("error saving issue");
        }
    }

}
