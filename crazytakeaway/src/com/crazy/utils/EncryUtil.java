package com.crazy.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;


/**
 * 加密解密工具类
 */
public class EncryUtil {
	
	/**
	 * 使用默认密钥进行DES加密
	 */
	public static String encrypt(String plainText) {
		try {
			return new DES().encrypt(plainText);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 使用默认密钥进行MD5加密
	 * @param source
	 * @param salts
	 * @return
	 */
	public static String encryptByMD5(String source,String salts) {
		String algorithmName="MD5";
		Object salt=ByteSource.Util.bytes(salts);
		int hashIterations=1024;
		Object obj=new SimpleHash(algorithmName, source, salt, hashIterations);
		String result=String.valueOf(obj);
		return result;
	}
	
	

	
	/**
	 * 使用指定密钥进行DES解密
	 */
	public static String encrypt(String plainText, String key) {
		try {
			return new DES(key).encrypt(plainText);
		} catch (Exception e) {
			return null;
		}
	}
	

	/**
	 * 使用默认密钥进行DES解密
	 */
	public static String decrypt(String plainText) {
		try {
			return new DES().decrypt(plainText);
		} catch (Exception e) {
			return null;
		}
	}

	
	/**
	 * 使用指定密钥进行DES解密
	 */
	public static String decrypt(String plainText, String key) {
		try {
			return new DES(key).decrypt(plainText);
		} catch (Exception e) {
			return null;
		}
	}

}