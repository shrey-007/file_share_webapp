package com.tech.blog.helper;

import java.io.FileOutputStream;
import java.io.InputStream;

public class FileSaver {
    public static boolean saveFile(InputStream is,String path){
        boolean flag=false;
        try{
            //create a byte array
            byte b[]=new byte[is.available()];
            // Read the content of the InputStream into the byte array
            is.read(b);
            //create a new file with given path
            FileOutputStream fos=new FileOutputStream(path);
            //write content of byte array into file
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
