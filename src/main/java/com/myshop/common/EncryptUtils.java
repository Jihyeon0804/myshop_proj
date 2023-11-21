package com.myshop.common;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class EncryptUtils {

	

	public static String encrypt(String message) throws Exception {
		
		String alg = "AES/CBC/PKCS5Padding";
		String key = "01234567890123456789012345678901";
		String iv = key.substring(0, 16);
		
		Cipher cipher = Cipher.getInstance(alg);
		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
		IvParameterSpec ivParamSpec = new IvParameterSpec(iv.getBytes());
		cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParamSpec);

		byte[] encrypted = cipher.doFinal(message.getBytes("UTF-8"));
		return Base64.getEncoder().encodeToString(encrypted);
	}

	public static String decrypt(String ciphermessage) throws Exception {
		
		String alg = "AES/CBC/PKCS5Padding";
		String key = "01234567890123456789012345678901";
		String iv = key.substring(0, 16);
		
		Cipher cipher = Cipher.getInstance(alg);
		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
		IvParameterSpec ivParamSpec = new IvParameterSpec(iv.getBytes());
		cipher.init(Cipher.DECRYPT_MODE, keySpec, ivParamSpec);

		byte[] decodedBytes = Base64.getDecoder().decode(ciphermessage);
		byte[] decrypted = cipher.doFinal(decodedBytes);
		return new String(decrypted, "UTF-8");
	}
}