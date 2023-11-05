package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
//            agar connection nhi bana tabhi banaega else already bana hua vala return kr dega
//            baar baar connection vala code likhne se achha ye class banali ye apne aap connection banakr return kr dega jitni baar need hogi

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{

            if(con==null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","saxena.home");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }

}
