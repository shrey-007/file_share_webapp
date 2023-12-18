package com.tech.blog.entities;

public class Organisation {
    String oid;
    String name;
    String country;
    String city;
    String branch;

    public Organisation(String oid, String name, String country, String city, String branch) {
        this.oid = oid;
        this.name = name;
        this.country = country;
        this.city = city;
        this.branch = branch;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    @Override
    public String toString() {
        return "Organisation{" +
                "oid='" + oid + '\'' +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", branch='" + branch + '\'' +
                '}';
    }
}
