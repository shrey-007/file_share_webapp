package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
    Connection con;
    public LikeDao(Connection con){
        this.con=con;
    }

    public boolean insertLike(int uid,int pid){
        boolean flag=false;
         try{
             String query="insert into likes(pid,uid) value(?,?)";
             PreparedStatement p=this.con.prepareStatement(query);
             p.setInt(1,pid);
             p.setInt(2,uid);
             p.executeUpdate();
             flag=true;
         }
         catch (Exception e){
             System.out.println(e);
         }
         return flag;
    }

    public int countLikeOnPost(int pid){
        int count=0;
        try{
            String query="select count(*) from likes where pid=?";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setInt(1,pid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                count=rs.getInt("count(*)");
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return count;
    }

    public boolean isPostLikedByUser(int pid,int uid){
        boolean flag=false;
        try{
            String query="select * from likes where uid=? and pid=?";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setInt(1,uid);
            ps.setInt(2,pid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                flag=true;
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return flag;
    }

    public boolean deleteLike(int pid,int uid){
        boolean flag=false;
        try {
          String query="delete from likes where pid=? and uid=?";
          PreparedStatement ps=this.con.prepareStatement(query);
          ps.setInt(1,pid);
          ps.setInt(2,uid);
          ps.executeUpdate();
          flag=true;
        }
        catch (Exception e){
            System.out.println(e);
        }
        return flag;
    }



}
