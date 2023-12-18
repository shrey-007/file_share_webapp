package com.tech.blog.dao;

import com.tech.blog.entities.Issue;

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


}
