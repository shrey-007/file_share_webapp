package com.tech.blog.dao;


import com.tech.blog.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    //ise database se interact krne ke liye connection chaiye
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to save user details to database
    public boolean saveUser(User user){
        boolean flag=false;
        try{
            if(user.getOrganisation().equals("None")){
                String query="insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1,user.getName());
                ps.setString(2,user.getEmail());
                ps.setString(3,user.getPassword());
                ps.setString(4,user.getGender());
                ps.setString(5,user.getAbout());
                ps.executeUpdate();
                flag=true;
            }
            else{
                String query="insert into user(name,email,password,gender,about,oid) values (?,?,?,?,?,?)";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1,user.getName());
                ps.setString(2,user.getEmail());
                ps.setString(3,user.getPassword());
                ps.setString(4,user.getGender());
                ps.setString(5,user.getAbout());
                ps.setString(6,user.getOrganisation());
                ps.executeUpdate();
                flag=true;
            }



        }
        catch(Exception e){e.printStackTrace();}
        return flag;
    }


    //it is getUserByEmailAndPassword
    public User getUserEmailAndPassword(String email,String password){
        //intial null hai agar koi user hai hi nhi esa database mai toh
        User user=null;
        try{
            String query="select * from user where email=? and password=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet set=ps.executeQuery();
            if(set.next()){
                user=new User();
                //agar database mai esa user hai toh uski details save krlo user object mai aur return krdo
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setAbout(set.getString("about"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("registration_date"));
                user.setProfile(set.getString("profile"));
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }


    public boolean updateProfile(User user){
        boolean flag=false;
        try{
            String query="update user set profile=? where id=?";
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, user.getProfile());
            ps.setInt(2,user.getId());
            ps.executeUpdate();
            flag=true;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    public String getUserNameById(int id){
         String username="";
        try{
            String query="select name from user where id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){username=rs.getString("name");}
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return username;
    }
}
