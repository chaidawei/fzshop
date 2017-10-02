package com.fz.Util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Lxy on 2017/7/15.
 */
public class ShopUtil {

    public static String md5(String password){
        StringBuilder ps = new StringBuilder();
        try {
            MessageDigest md2 = MessageDigest.getInstance("MD5");
            md2.update(password.getBytes());
            for (byte b : md2.digest()) ps.append(String.format("%x", b));
            /*System.out.println(ps.toString());
            System.out.println(ps.toString().length());*/
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
       return ps.toString();

    }
}
