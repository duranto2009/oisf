package com.revesoft.springboot.web.auth;

import java.util.Random;
import org.mindrot.jbcrypt.BCrypt;

/**
 * Provides various security utility functionalities
 *
 * @author Maruf
 * Hamidi
 */
public class SecurityUtil {

    private static final String RANDOM_STRING_CHAR_SET = "A9aB1bC7cD3dE5eFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuV4vW6wX2xY8yZ0z";
    private static final int RANDOM_STRING_LENGTH = 256;

    /**
     * Generates a mixed case alpha-neumaric random string of pre-defined length
     *
     * @return a random alphaneumeric string of pre-defined length
     *
     */
    public static String generateRandomString() {
        StringBuilder stringBuilder = new StringBuilder(RANDOM_STRING_LENGTH);
        Random random = new Random();
        for (int i = 0; i < RANDOM_STRING_LENGTH; i++) {
            stringBuilder.append(RANDOM_STRING_CHAR_SET.charAt(random.nextInt(RANDOM_STRING_CHAR_SET.length())));
        }
        return stringBuilder.toString();
    }

    public static String generateRandomLengthedString(int length) {
        StringBuilder stringBuilder = new StringBuilder(length);
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            stringBuilder.append(RANDOM_STRING_CHAR_SET.charAt(random.nextInt(RANDOM_STRING_CHAR_SET.length())));
        }
        return stringBuilder.toString();
    }

    /**
     * Generates a mixed case alpha-neumaric random string of given length
     *
     * @param length length of the random string
     * @return a random alphaneumeric string of given length
     *
     */
    public static String generateRandomString(int length) {
        StringBuilder stringBuilder = new StringBuilder(length);
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            stringBuilder.append(RANDOM_STRING_CHAR_SET.charAt(random.nextInt(RANDOM_STRING_CHAR_SET.length())));
        }
        return stringBuilder.toString();
    }

    /**
     * Encrypts plain password using BCrypt algorithm
     *
     * @param plainPasswd password in plain text
     * @return encrypted password
     *
     */
    public static String hashPassword(String plainPasswd) {
        try {
            return BCrypt.hashpw(plainPasswd, BCrypt.gensalt());
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    /**
     * Match the plain passwords with the hashed password string
     *
     * @param plain password in plain text
     * @param hashed password in hashed text format
     * @return true if they match else false
     *
     */
    public static boolean checkPassword(String plain, String hashed) {
        try {
            return BCrypt.checkpw(plain, hashed);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
