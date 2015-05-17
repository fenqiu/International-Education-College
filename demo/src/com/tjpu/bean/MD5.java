package com.tjpu.bean;

import java.security.MessageDigest;
import sun.misc.BASE64Encoder;

public class MD5
{
  public static String generate(String source)
  {
    try
    {
      MessageDigest md5 = MessageDigest.getInstance("MD5");
      BASE64Encoder base64en = new BASE64Encoder();
      return base64en.encode(md5.digest(source.getBytes())); } catch (Exception e) {
    }
    return null;
  }
}