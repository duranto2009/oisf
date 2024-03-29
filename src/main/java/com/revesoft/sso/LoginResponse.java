package com.revesoft.sso;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

public class LoginResponse {
    private SSOPropertyReader ssoPropertyReader;

    public LoginResponse()throws Exception{
        ssoPropertyReader = SSOPropertyReader.getInstance();
    }

    private String getSharedSecret()throws Exception{
        return ssoPropertyReader.getSecret();
    }

    private void validateResponse(String response)throws Exception{
        if(response == null || response.equals("")){
            throw new Exception("Response null or empty");
        }
    }

    private void validateSecret(String secret) throws Exception{
        if(secret == null || secret.equals("")){
            throw new Exception("Secret null or empty");
        }
    }

    private Claims parseResponse(String response, String secret)throws Exception{
        validateResponse(response);

        validateSecret(secret);

        return Jwts.parser()
                .setSigningKey(secret.getBytes("UTF-8"))
                .parseClaimsJws(response)
                .getBody();
    }

    private void claimToGenericDTO(SSOResponseDTO ssoResponseDTO, Claims claims){
        ssoResponseDTO.setUsername(claims.get(JwtSSOClaims.USERNAME).toString());
        ssoResponseDTO.setEmployeeRecordId(Integer.parseInt(claims.get(JwtSSOClaims.EMPLOYEE_RECORD_ID).toString()));
        ssoResponseDTO.setOfficeId(Integer.parseInt(claims.get(JwtSSOClaims.OFFICE_ID).toString()));
        ssoResponseDTO.setDesignation(claims.get(JwtSSOClaims.DESIGNATION).toString());
        ssoResponseDTO.setOfficeUnitId(Integer.parseInt(claims.get(JwtSSOClaims.OFFICE_UNIT_ID).toString()));
        ssoResponseDTO.setInchargeLabel(claims.get(JwtSSOClaims.INCHARGE_LABEL).toString());
        ssoResponseDTO.setOfficeUnitOrgId(Integer.parseInt(claims.get(JwtSSOClaims.OFFICE_UNIT_ORGANOGRAM_ID).toString()));
        ssoResponseDTO.setOfficeNameEng(claims.get(JwtSSOClaims.OFFICE_NAME_ENG).toString());
        ssoResponseDTO.setOfficeNameBng(claims.get(JwtSSOClaims.OFFICE_NAME_BNG).toString());
        ssoResponseDTO.setOfficeMinistryId(Integer.parseInt(claims.get(JwtSSOClaims.OFFICE_MINISTRY_ID).toString()));
        ssoResponseDTO.setOfficeMinistryNameEng(claims.get(JwtSSOClaims.OFFICE_MINISTRY_NAME_ENG).toString());
        ssoResponseDTO.setOfficeMinistryNameBng(claims.get(JwtSSOClaims.OFFICE_MINISTRY_NAME_BNG).toString());
        ssoResponseDTO.setUnitNameEng(claims.get(JwtSSOClaims.UNIT_NAME_ENG).toString());
        ssoResponseDTO.setUnitNameBng(claims.get(JwtSSOClaims.UNIT_NAME_BNG).toString());
        ssoResponseDTO.setLandingPageUrl(claims.get(JwtSSOClaims.LANDING_PAGE_URL).toString());
        ssoResponseDTO.setExpirationTime(Long.parseLong(claims.get(JwtSSOClaims.EXPIRATION_TIME).toString()));
    }

    private void validateExpirationTime(long expectedEt)throws Exception{
        long curUtc = System.currentTimeMillis();

        if(curUtc  > expectedEt){
            throw new Exception("Token expiered");
        }
    }

    public void claimToSpecificDTO(SSOResponseDTO ssoResponseDTO, Claims claims){

    }

    public final SSOResponseDTO parseResponse(String response)throws Exception{
        String secret = this.getSharedSecret();

        Claims claims = parseResponse(response,secret);

        SSOResponseDTO ssoResponseDTO = new SSOResponseDTO();

        claimToGenericDTO(ssoResponseDTO,claims);

        validateExpirationTime(ssoResponseDTO.getExpirationTime());

        claimToSpecificDTO(ssoResponseDTO,claims);

        return ssoResponseDTO;
    }
}
