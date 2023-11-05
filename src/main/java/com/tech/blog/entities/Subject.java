package com.tech.blog.entities;

public class Subject {
    private int sid;
    private String sname;

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }



    public  Subject(String sname){
        if(sname.equals("Data Structure and Algorithms")){
            this.sid=1;
        }
        else if(sname.equals("DataBase Management System")){
            this.sid=2;
        }
        else if(sname.equals("Data Science")){
            this.sid=3;
        }
        else if(sname.equals("Computer Architecture")){
            this.sid=4;
        }
        else if(sname.equals("Java Programming")){
            this.sid=5;
        }
        this.sname = sname;
    }
}
