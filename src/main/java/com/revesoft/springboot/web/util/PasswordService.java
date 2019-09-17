package com.revesoft.springboot.web.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.mindrot.jbcrypt.BCrypt;

import sun.misc.BASE64Encoder;

public final class PasswordService
{
  private static PasswordService instance;



  public synchronized String encrypt(String plaintext) throws Exception
  {
    MessageDigest md = null;
    try
    {
      md = MessageDigest.getInstance("SHA"); //step 2
    }
    catch(NoSuchAlgorithmException e)
    {
      throw new Exception(e.getMessage());
    }
    try
    {
      md.update(plaintext.getBytes("UTF-8")); //step 3
    }
    catch(UnsupportedEncodingException e)
    {
      throw new Exception(e.getMessage());
    }

    byte raw[] = md.digest(); //step 4
    String hash = (new BASE64Encoder()).encode(raw); //step 5
    return hash; //step 6
   }


	/**
	 * This method can be used to generate a string representing an account password
	 * suitable for storing in a database. It will be an OpenBSD-style crypt(3) formatted
	 * hash string of length=60
	 * The bcrypt workload is specified in the above static variable, a value from 10 to 31.
	 * A workload of 12 is a very reasonable safe default as of 2013.
	 * This automatically handles secure 128-bit salt generation and storage within the hash.
	 * @param password_plaintext The account's plaintext password as provided during account creation,
	 *			     or when changing an account's password.
	 * @return String - a string of length 60 that is the bcrypt hashed password in crypt(3) format.
	 */
	public String hashPassword(String password_plaintext) {
		String salt = BCrypt.gensalt();
		String hashed_password = BCrypt.hashpw(password_plaintext, salt);
		StringBuilder hashed_password_builder = new StringBuilder(hashed_password);
		if(hashed_password.startsWith("$2a$")){
			hashed_password_builder.setCharAt(2, 'y');
		}
		return(hashed_password_builder.toString());
	}

	/**
	 * This method can be used to verify a computed hash from a plaintext (e.g. during a login
	 * request) with that of a stored hash from a database. The password hash from the database
	 * must be passed as the second variable.
	 * @param password_plaintext The account's plaintext password, as provided during a login request
	 * @param stored_hash The account's stored password hash, retrieved from the authorization database
	 * @return boolean - true if the password matches the password of the stored hash, false otherwise
	 */
	public static boolean checkPassword(String password_plaintext, String stored_hash) {
		boolean password_verified = false;

		if(null == stored_hash||!stored_hash.startsWith("$2y$"))
			throw new IllegalArgumentException("Invalid hash provided for comparison");
		StringBuilder hashed_password_builder = new StringBuilder(stored_hash);
		if(stored_hash.startsWith("$2y$")){
			hashed_password_builder.setCharAt(2, 'a');
		}
		password_verified = BCrypt.checkpw(password_plaintext, hashed_password_builder.toString());

		return(password_verified);
	}

  public static synchronized PasswordService getInstance() //step 1
  {
    if(instance == null)
    {
       instance = new PasswordService(); 
    } 
    return instance;
  }
  
  
}
