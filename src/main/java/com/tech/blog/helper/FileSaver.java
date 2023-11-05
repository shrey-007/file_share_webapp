package com.tech.blog.helper;

import java.io.FileOutputStream;
import java.io.InputStream;

public class FileSaver {
    public static boolean saveFile(InputStream is,String path){
        boolean flag=false;
        try{
            byte b[]=new byte[is.available()];
            is.read(b);
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            flag=true;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
