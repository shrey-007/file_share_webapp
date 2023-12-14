package com.tech.blog.servlets;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LikeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //fetch all details of like
        int pid=Integer.parseInt(req.getParameter("pid"));
        int uid=Integer.parseInt(req.getParameter("uid"));
        String title=req.getParameter("filename");
        String url=req.getParameter("url");

        //create likedao object
        LikeDao likeDao=new LikeDao(ConnectionProvider.getConnection());

        //check if user has already liked the post or not
        boolean isLiked=likeDao.isPostLikedByUser(pid,uid);
        if(isLiked){
            likeDao.deleteLike(pid,uid);
        }
        else{
            likeDao.insertLike(uid,pid);
        }
        System.out.println("hi");

        String kahaSeAaya=req.getParameter("kahaSeAaya");
        if(kahaSeAaya.equals("profile.jsp")){resp.sendRedirect("profile.jsp");}
        else if(kahaSeAaya.equals("displayIndividualPost.jsp")){resp.sendRedirect(url);}
        else{resp.sendRedirect("show_all_post.jsp");}


    }
}
