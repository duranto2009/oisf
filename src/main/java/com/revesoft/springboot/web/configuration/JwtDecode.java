package com.revesoft.springboot.web.configuration;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.jose4j.jwk.JsonWebKey;
import org.jose4j.jwk.JsonWebKeySet;
import org.jose4j.jwk.RsaJwkGenerator;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.consumer.InvalidJwtException;
import org.jose4j.jwt.consumer.JwtConsumer;
import org.jose4j.jwt.consumer.JwtConsumerBuilder;
import org.jose4j.lang.JoseException;

import javax.xml.bind.DatatypeConverter;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Adil on 9/6/2017.
 */
public class JwtDecode {

    static List<JsonWebKey> jwkList = null;
    static {
//        JWT_LOGGER.info("Inside static initializer...");
        jwkList = new LinkedList<>();
        for (int kid = 1; kid <= 3; kid++) {
            JsonWebKey jwk = null;
            try {
                jwk = RsaJwkGenerator.generateJwk(2048);
//                JWT_LOGGER.debug("PUBLIC KEY (" + kid + "): " + jwk.toJson(JsonWebKey.OutputControlLevel.INCLUDE_PRIVATE));
            } catch (JoseException e) {
                //JWT_LOGGER.error(e.getMessage());
                e.printStackTrace();
            }
            jwk.setKeyId(String.valueOf(kid));
            jwkList.add(jwk);
        }

    }

    public String[] authenticateToken(String token) {

        String[] tokenInformation = new String[3];

        if (token == null) {
            tokenInformation[0] = null;
            tokenInformation[1] = null;
            tokenInformation[2] = null;
            return tokenInformation;
        }
        JsonWebKeySet jwks = new JsonWebKeySet(jwkList);
        JsonWebKey jwk = jwks.findJsonWebKey("1", null, null, null);

        JwtConsumer jwtConsumer = new JwtConsumerBuilder()
                .setRequireExpirationTime() // the JWT must have an expiration time
                .setAllowedClockSkewInSeconds(30) // allow some leeway in validating time based claims to account for clock skew
                //.setRequireSubject() // the JWT must have a subject claim
                .setExpectedIssuer("revesoft.com") // whom the JWT needs to have been issued by
                .setVerificationKey(jwk.getKey()) //verify the signature with the public key
                .build();
        JwtClaims jwtClaims = null;
        String username = null;

        try {
            jwtClaims = jwtConsumer.processToClaims(token);
        } catch (InvalidJwtException e) {

            tokenInformation[0] = null;
            tokenInformation[1] = null;
            tokenInformation[2] = null;
            return tokenInformation;

        }

        //username = jwtClaims.getSubject();
        username =(String)jwtClaims.getClaimValue("username");

        tokenInformation[0] = username;
        tokenInformation[1] = null;
        tokenInformation[2] = null;

        return tokenInformation;
    }

    public String parseJWT(String jwt) {

        String username="";

        //This line will throw an exception if it is not a signed JWS (as expected)
        Claims claims = Jwts.parser()
                .setSigningKey(DatatypeConverter.parseBase64Binary("mysecretkey"))
                .parseClaimsJws(jwt).getBody();
            username=claims.get("username").toString();
//        System.out.println("ID: " + claims.getId());
//        System.out.println("Subject: " + claims.getSubject());
//        System.out.println("Issuer: " + claims.getIssuer());
//        System.out.println("Expiration: " + claims.getExpiration());
        return username;
    }
}
