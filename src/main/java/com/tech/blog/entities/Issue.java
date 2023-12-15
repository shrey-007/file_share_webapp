package com.tech.blog.entities;

public class Issue {
    private int iid;
    private int uid;
    private int pid;
    private String content;

    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Issue(int uid, int pid, String content) {
        this.uid = uid;
        this.pid = pid;
        this.content = content;
    }

    public Issue(){

    }

    @Override
    public String toString() {
        return "Issue{" +
                "iid=" + iid +
                ", uid=" + uid +
                ", pid=" + pid +
                ", content='" + content + '\'' +
                '}';
    }

}
