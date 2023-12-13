package com.tech.blog.dao;

import com.tech.blog.entities.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
     Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public boolean savePost(Post post){
        boolean flag=false;
        try{
            String query="insert into post(uid,sid,title,filename,description,type) value(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,post.getUid());
            System.out.println(post.getUid());
            ps.setInt(2,post.getSid());
            System.out.println(post.getSid());
            ps.setString(3,post.getTitle());
            System.out.println(post.getTitle());
            ps.setString(4,post.getFilename());
            System.out.println(post.getFilename());
            ps.setString(5,post.getDescription());
            System.out.println(post.getDescription());
            ps.setString(6,post.getType());
            System.out.println(post.getDescription());
            ps.executeUpdate();
            flag=true;
        }
        catch (Exception e){e.printStackTrace();}
        return flag;
    }


    //post table ke under time ka bhi column daal skte hai, and fir query mai order by time krke karege toh recent posts uper aaegi.
    public List<Post> getAllPosts(){
        List<Post> list=new ArrayList<>();
        try{
            String query="select * from post";
            PreparedStatement ps= con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();

            //rs mai saari rows aa gyi

            while(rs.next()){
               int pid=rs.getInt("pid");
               int uid=rs.getInt("uid");
               int sid=rs.getInt("sid");
               String title=rs.getString("title");
               String filename=rs.getString("filename");
               String description=rs.getString("description");
               String type=rs.getString("type");
               //ek (row)post ki details nikali, ab use post ke object mai rakh do
               Post post=new Post(pid,sid,uid,title,filename,description,type);
               //ab us object ko list mai daal do
               list.add(post);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getAllPostsBySubject(int sid){
        List<Post> list=new ArrayList<>();
        try{
            String query="select * from post where sid=?";
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,sid);
            ResultSet rs=ps.executeQuery();

            //rs mai saari rows aa gyi

            while(rs.next()){
                int pid=rs.getInt("pid");
                int uid=rs.getInt("uid");

                String title=rs.getString("title");
                String filename=rs.getString("filename");
                String description=rs.getString("description");
                String type=rs.getString("type");
                //ek (row)post ki details nikali, ab use post ke object mai rakh do
                Post post=new Post(pid,sid,uid,title,filename,description,type);
                //ab us object ko list mai daal do
                list.add(post);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }


    public List<Post> getAllPostsByUser(int uid){
        List<Post> list=new ArrayList<>();
        try{
            String query="select * from post where uid=?";
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,uid);
            ResultSet rs=ps.executeQuery();

            //rs mai saari rows aa gyi

            while(rs.next()){
                int pid=rs.getInt("pid");

                int sid=rs.getInt("sid");
                String title=rs.getString("title");
                String filename=rs.getString("filename");
                String description=rs.getString("description");
                String type=rs.getString("type");
                //ek (row)post ki details nikali, ab use post ke object mai rakh do
                Post post=new Post(pid,sid,uid,title,filename,description,type);
                //ab us object ko list mai daal do
                list.add(post);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }







}
