package com.tech.blog.dao;

import com.tech.blog.entities.Organisation;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class OrganisationDao {
    Connection con;

    public OrganisationDao(Connection con){
        this.con=con;
    }
     public boolean saveOrganisation(Organisation organisation){
        boolean flag=false;
        try{
            String query="insert into organisation value(?,?,?,?,?)";
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,organisation.getOid());
            ps.setString(2,organisation.getName());
            ps.setString(3,organisation.getCountry());
            ps.setString(4,organisation.getCity());
            ps.setString(5,organisation.getBranch());

            ps.executeUpdate();
            flag=true;
        }
        catch (Exception e){
            System.out.println(e);
        }
        return flag;
     }
}
