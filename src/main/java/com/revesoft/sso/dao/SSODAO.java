package com.revesoft.sso.dao;

import databasemanager.DatabaseManager;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SSODAO {
    Logger logger = Logger.getLogger(SSODAO.class);
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public com.revesoft.sso.SSOResponseDTO getSSOResponse(String userName){

        com.revesoft.sso.SSOResponseDTO ssoResponseDTO = new com.revesoft.sso.SSOResponseDTO();

        long employee_record_id = 0;
        String sql = "select * from users where username = '" + userName + "'";

        try{
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                employee_record_id = rs.getLong("employee_record_id");
                System.out.println(" Employee record id : " + employee_record_id);
            }

            long office_id = 0;
            String designation = "";
            long office_unit_id = 0;
            String incharge_label = "";
            long office_unit_organogram_id = 0;

            if(0 != employee_record_id){
                sql = "select * from employee_offices where employee_record_id = " + employee_record_id;
                ps = connection.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    office_id = rs.getLong("office_id");
                    designation = rs.getString("designation");
                    office_unit_id = rs.getLong("office_unit_id");
                    incharge_label = rs.getString("incharge_label");
                    office_unit_organogram_id = rs.getLong("office_unit_organogram_id");

                    ssoResponseDTO.setOfficeId(office_id);
                    ssoResponseDTO.setDesignation(designation);
                    ssoResponseDTO.setOfficeUnitId(office_unit_id);
                    ssoResponseDTO.setInchargeLabel(incharge_label);
                    ssoResponseDTO.setOfficeUnitOrgId(office_unit_organogram_id);
                }
            }

            String office_name_eng = "";
            String office_name_bng = "";
            long office_ministry_id = 0;
            if(0 != office_id){
                sql = "select * from offices where id = " + office_id;
                ps = connection.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    office_name_eng = rs.getString("office_name_eng");
                    office_name_bng = rs.getString("office_name_bng");
                    office_ministry_id = rs.getLong("office_ministry_id");

                    ssoResponseDTO.setOfficeNameEng(office_name_eng);
                    ssoResponseDTO.setOfficeNameBng(office_name_bng);
                    ssoResponseDTO.setOfficeMinistryId(office_ministry_id);
                }
            }


            String office_ministry_name_eng = "";
            String office_ministry_name_bng = "";
            if(0 != office_ministry_id){
                sql = "select * from office_ministries where id = " + office_ministry_id;
                ps = connection.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    office_ministry_name_eng = rs.getString("name_eng");
                    office_ministry_name_bng = rs.getString("name_bng");

                    ssoResponseDTO.setOfficeMinistryNameEng(office_ministry_name_eng);
                    ssoResponseDTO.setOfficeMinistryNameBng(office_ministry_name_bng);
                }
            }


            String unit_name_eng = "";
            String unit_name_bng = "";
            if(0 != office_unit_id){
                sql = "select * from office_units where id = " + office_unit_id;
                ps = connection.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    unit_name_eng = rs.getString("unit_name_eng");
                    unit_name_bng = rs.getString("unit_name_bng");

                    ssoResponseDTO.setUnitNameEng(unit_name_eng);
                    ssoResponseDTO.setUnitNameBng(unit_name_bng);
                }
            }
        }
        catch (Exception e) {
            logger.fatal(" SSODAO: Exception in getting stiIDs. In method getIDs ",e);
          //  this.freeDBConnection();
        }
        finally
        {
          //  this.freeDBConnection();
        }
        return ssoResponseDTO;
    }
}

