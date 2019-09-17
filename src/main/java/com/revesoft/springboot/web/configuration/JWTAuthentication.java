package com.revesoft.springboot.web.configuration;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import com.revesoft.sso.SSOResponseDTO;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.util.Date;

/**
 * Created by Adil on 8/31/2017.
 */
public class JWTAuthentication {

    static final long EXPIRATIONTIME = 864_000_00; // 1 days
    static final String SECRET = "ThisIsASecret";
    static final String TOKEN_PREFIX = "Bearer";
    static final String HEADER_STRING = "Authorization";

    public String createJWT(  String username, long ttlMillis, SSOResponseDTO ssoResponseDTO) {
        //username = "200000002986"; // Hasan Bhai username
        //The JWT signature algorithm we will be using to sign the token
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

        long nowMillis = System.currentTimeMillis();
        //nowMillis -= 1200000;
        Date now = new Date(nowMillis);

        long expirationTime = nowMillis + 1200000*2;
        Date expirationDate = new Date(expirationTime);

        //We will sign our JWT with our ApiKey secret
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary("mysecretkey");
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());

        //Let's set the JWT Claims
        JwtBuilder builder = null;
        try {
            builder = Jwts.builder()//.setExpiration(expirationDate)
                    .claim("username",username)
                    .claim("employee_record_id",ssoResponseDTO.getEmployeeRecordId())
                    .claim("office_id",ssoResponseDTO.getOfficeId())
                    .claim("designation",ssoResponseDTO.getDesignation())
                    .claim("office_unit_id",ssoResponseDTO.getOfficeUnitId())
                    .claim("incharge_label",ssoResponseDTO.getInchargeLabel())
                    .claim("office_unit_organogram_id",ssoResponseDTO.getOfficeUnitOrgId())
                    .claim("office_name_eng",ssoResponseDTO.getOfficeNameEng())
                    .claim("office_name_bng",ssoResponseDTO.getOfficeNameBng())
                    .claim("office_ministry_id",ssoResponseDTO.getOfficeMinistryId())
                    .claim("office_ministry_name_eng",ssoResponseDTO.getOfficeMinistryNameEng())
                    .claim("office_ministry_name_bng",ssoResponseDTO.getOfficeMinistryNameBng())
                    .claim("unit_name_eng",ssoResponseDTO.getUnitNameEng())
                    .claim("unit_name_bng",ssoResponseDTO.getUnitNameBng())
                    //.signWith(signatureAlgorithm, "PBO7JRhXYvpRmoMokAnA4G6BG6alJJrc".getBytes("UTF-8"));
                    .signWith(signatureAlgorithm, "testWithOisfSecret".getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //if it has been specified, let's add the expiration
        if (ttlMillis >= 0) {
            long expMillis = nowMillis + ttlMillis;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp);
        }

        //Builds the JWT and serializes it to a compact, URL-safe string
        return builder.compact();
    }
}
