package com.tech.blog.dao;

import com.tech.blog.entities.Issue;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class IssueDao {
    Connection con;

    public IssueDao(Connection con){
        this.con=con;
    }

    public boolean insertIssue(int uid,int pid,String issue){
        boolean flag=false;
        try{
            String query="insert into issue(uid,pid,content) value(?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setInt(1,uid);
            ps.setInt(2,pid);
            ps.setString(3,issue);

            ps.executeUpdate();
            flag=true;
        }
        catch (Exception e){
            System.out.println(e);
        }
        return flag;
    }

    public List<Issue> getAllIssueByPostId(int pid){
        List<Issue> list=new ArrayList<>();
        try{
            String query="select * from issue where pid=?";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setInt(1,pid);

            ResultSet rs=ps.executeQuery();

            while (rs.next()){
                int iid=rs.getInt("iid");
                int uid=rs.getInt("uid");
                String content=rs.getString("content");
                Date date=rs.getDate("idate");
                System.out.println(date);
                Issue issue=new Issue(uid,pid,content,date);
                list.add(issue);
            }

        }
        catch (Exception e){
            System.out.println(e);
        }
        return list;
    }

//    this will be used in notification page it gives all issues notifications for a particular user
    public List<Issue> getAllIssuesForUser(int uid){
        List<Issue> list=new ArrayList<>();
        try{
            String query="select issue.* from post inner join issue on post.pid=issue.pid where post.uid=?";
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,uid);
            ResultSet rs=ps.executeQuery();

            while (rs.next()){
                String content=rs.getString("content");
                int iid=rs.getInt("iid");
                int pid=rs.getInt("pid");
                int uid2= rs.getInt("uid");

                Issue issue=new Issue(iid,uid2,pid,content);
                list.add(issue);
            }

        }
        catch (Exception e){
            System.out.println(e);
        }
        return list;

    }


}
