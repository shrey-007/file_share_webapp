package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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


}
