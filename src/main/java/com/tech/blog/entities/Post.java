package com.tech.blog.entities;

public class Post {
    private int pid;
    private int sid;
    private int uid;
    private String title;
    private String filename;
    private String description;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Post( int sid, int uid, String title, String filename,String description){
        this.sid = sid;
        this.uid = uid;
        this.title = title;
        this.filename = filename;
        this.description=description;
    }
    public Post( int sid, int uid, String title, String filename,String description,String type){
        this.sid = sid;
        this.uid = uid;
        this.title = title;
        this.filename = filename;
        this.description=description;
        this.type=type;
    }
    public Post(int pid,int sid, int uid, String title, String filename,String description){
        this.sid = sid;
        this.uid = uid;
        this.title = title;
        this.filename = filename;
        this.description=description;
        this.pid=pid;
    }
    public Post(int pid,int sid, int uid, String title, String filename,String description,String type){
        this.sid = sid;
        this.uid = uid;
        this.title = title;
        this.filename = filename;
        this.description=description;
        this.pid=pid;
        this.type=type;
    }

    @Override
    public String toString() {
        return "Post{" +
                "pid=" + pid +
                ", sid=" + sid +
                ", uid=" + uid +
                ", title='" + title + '\'' +
                ", filename='" + filename + '\'' +
                ", description='" + description + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
