package com.revesoft.springboot.web.geo.citycorporationward;

import com.revesoft.springboot.web.geo.citycorporation.CityCorporationDTO;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Bony on 10/31/2017.
 */
@Repository
public class CityCorporationWardDAO {

    public ArrayList<CityCorporationWardDTO> getAll() throws Exception {
        ArrayList<CityCorporationWardDTO> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from geo_city_corporation_wards where status=1";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CityCorporationWardDTO cityCorporationWardDTO = new CityCorporationWardDTO();
                cityCorporationWardDTO.setId(rs.getInt("id"));
                cityCorporationWardDTO.setDivisionId(rs.getInt("geo_division_id"));
                cityCorporationWardDTO.setDistrictId(rs.getInt("geo_district_id"));
                cityCorporationWardDTO.setCityCorporationId(rs.getInt("geo_city_corporation_id"));
                cityCorporationWardDTO.setDivisionBbsCode(rs.getString("division_bbs_code"));
                cityCorporationWardDTO.setDistrictBbsCode(rs.getString("district_bbs_code"));
                cityCorporationWardDTO.setCityCorporationBbsCode(rs.getString("city_corporation_bbs_code"));
                cityCorporationWardDTO.setNameEng(rs.getString("ward_name_eng"));
                cityCorporationWardDTO.setNameBng(rs.getString("ward_name_bng"));
                cityCorporationWardDTO.setBbsCode(rs.getString("bbs_code"));
                cityCorporationWardDTO.setStatus(rs.getInt("status"));
                cityCorporationWardDTO.setCreatedBy(rs.getInt("created_by"));
                cityCorporationWardDTO.setModifiedBy(rs.getInt("modified_by"));
                cityCorporationWardDTO.setCreated(rs.getTimestamp("created"));
                cityCorporationWardDTO.setModified(rs.getTimestamp("modified"));
                data.add(cityCorporationWardDTO);


            }
            rs.close();
            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }

    public ArrayList<CityCorporationWardDTO> getById( int id) throws Exception {
        ArrayList<CityCorporationWardDTO> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from geo_city_corporation_wards where geo_city_corporation_id=?";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {
                CityCorporationWardDTO cityCorporationWardDTO = new CityCorporationWardDTO();
                cityCorporationWardDTO.setId(rs.getInt("id"));
                cityCorporationWardDTO.setDivisionId(rs.getInt("geo_division_id"));
                cityCorporationWardDTO.setDistrictId(rs.getInt("geo_district_id"));
                cityCorporationWardDTO.setCityCorporationId(rs.getInt("geo_city_corporation_id"));
                cityCorporationWardDTO.setDivisionBbsCode(rs.getString("division_bbs_code"));
                cityCorporationWardDTO.setDistrictBbsCode(rs.getString("district_bbs_code"));
                cityCorporationWardDTO.setCityCorporationBbsCode(rs.getString("city_corporation_bbs_code"));
                cityCorporationWardDTO.setNameEng(rs.getString("ward_name_eng"));
                cityCorporationWardDTO.setNameBng(rs.getString("ward_name_bng"));
                cityCorporationWardDTO.setBbsCode(rs.getString("bbs_code"));
                cityCorporationWardDTO.setStatus(rs.getInt("status"));
                cityCorporationWardDTO.setCreatedBy(rs.getInt("created_by"));
                cityCorporationWardDTO.setModifiedBy(rs.getInt("modified_by"));
                cityCorporationWardDTO.setCreated(rs.getTimestamp("created"));
                cityCorporationWardDTO.setModified(rs.getTimestamp("modified"));
                data.add(cityCorporationWardDTO);


            }
            rs.close();
            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(connection != null)connection.close();
        }

        return data;
    }

    public CityCorporationWardDTO getOneById( int id) throws Exception {
        Connection connection = null;
        PreparedStatement ps = null;
        CityCorporationWardDTO cityCorporationWardDTO = new CityCorporationWardDTO();
        ResultSet rs = null;
        String sql = "select * from geo_city_corporation_wards where id=? and status=1";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {

                cityCorporationWardDTO.setId(rs.getInt("id"));
                cityCorporationWardDTO.setDivisionId(rs.getInt("geo_division_id"));
                cityCorporationWardDTO.setDistrictId(rs.getInt("geo_district_id"));
                cityCorporationWardDTO.setCityCorporationId(rs.getInt("geo_city_corporation_id"));
                cityCorporationWardDTO.setDivisionBbsCode(rs.getString("division_bbs_code"));
                cityCorporationWardDTO.setDistrictBbsCode(rs.getString("district_bbs_code"));
                cityCorporationWardDTO.setCityCorporationBbsCode(rs.getString("city_corporation_bbs_code"));
                cityCorporationWardDTO.setNameEng(rs.getString("ward_name_eng"));
                cityCorporationWardDTO.setNameBng(rs.getString("ward_name_bng"));
                cityCorporationWardDTO.setBbsCode(rs.getString("bbs_code"));
                cityCorporationWardDTO.setStatus(rs.getInt("status"));
                cityCorporationWardDTO.setCreatedBy(rs.getInt("created_by"));
                cityCorporationWardDTO.setModifiedBy(rs.getInt("modified_by"));
                cityCorporationWardDTO.setCreated(rs.getTimestamp("created"));
                cityCorporationWardDTO.setModified(rs.getTimestamp("modified"));


            }
            rs.close();
            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(connection != null)connection.close();
        }

        return cityCorporationWardDTO;
    }

    public void add(CityCorporationWardDTO cityCorporationWardDTO) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        // ResultSet rs = null;
        String sql = null;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "insert into geo_city_corporation_wards(geo_division_id,geo_district_id,geo_city_corporation_id,division_bbs_code,district_bbs_code,city_corporation_bbs_code," +
                    "ward_name_eng,ward_name_bng,bbs_code,status,created_by,created)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            int k = 0;

            ps.setInt(++k, cityCorporationWardDTO.getDivisionId());
            ps.setInt(++k, cityCorporationWardDTO.getDistrictId());
            ps.setInt(++k, cityCorporationWardDTO.getCityCorporationId());
            ps.setString(++k, cityCorporationWardDTO.getDivisionBbsCode());
            ps.setString(++k, cityCorporationWardDTO.getDistrictBbsCode());
            ps.setString(++k, cityCorporationWardDTO.getCityCorporationBbsCode());
            ps.setString(++k, cityCorporationWardDTO.getNameEng());
            ps.setString(++k, cityCorporationWardDTO.getNameBng());
            ps.setString(++k, cityCorporationWardDTO.getBbsCode());
            ps.setInt(++k, cityCorporationWardDTO.getStatus());
            ps.setInt(++k, cityCorporationWardDTO.getCreatedBy());
            ps.setTimestamp(++k, cityCorporationWardDTO.getCreated());


            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            ps.close();
            cn.close();
        }

    }

    public void update(CityCorporationWardDTO cityCorporationWardDTO) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        // ResultSet rs = null;
        String sql = null;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "update  geo_city_corporation_wards set geo_division_id=?,geo_district_id=?,geo_city_corporation_id=?,division_bbs_code=?,district_bbs_code=?, " +
                    "city_corporation_bbs_code=?,ward_name_eng=?,ward_name_bng=?,bbs_code=?,modified_by=?,modified=? WHERE id=?";
            ps = cn.prepareStatement(sql);
            int k = 0;

            ps.setInt(++k, cityCorporationWardDTO.getDivisionId());

            ps.setInt(++k, cityCorporationWardDTO.getDistrictId());
            ps.setInt(++k, cityCorporationWardDTO.getCityCorporationId());
            ps.setString(++k, cityCorporationWardDTO.getDivisionBbsCode());
            ps.setString(++k, cityCorporationWardDTO.getDistrictBbsCode());
            ps.setString(++k, cityCorporationWardDTO.getCityCorporationBbsCode());
            ps.setString(++k, cityCorporationWardDTO.getNameEng());
            ps.setString(++k, cityCorporationWardDTO.getNameBng());
            ps.setString(++k, cityCorporationWardDTO.getBbsCode());
            ps.setInt(++k, cityCorporationWardDTO.getModifiedBy());
            ps.setTimestamp(++k, cityCorporationWardDTO.getModified());
            ps.setInt(++k, cityCorporationWardDTO.getId());


            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            ps.close();
            cn.close();
        }

    }

    public int delete(CityCorporationWardDTO cityCorporationWardDTO) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        String sql = null;
        int success =0;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "update  geo_city_corporation_wards set status=?,modified_by=?,modified=? WHERE id=?";
            ps = cn.prepareStatement(sql);
            int k = 0;

            ps.setInt(++k, 0);
            ps.setInt(++k, cityCorporationWardDTO.getModifiedBy());
            ps.setTimestamp(++k, cityCorporationWardDTO.getModified());
            ps.setInt(++k, cityCorporationWardDTO.getId());


            ps.executeUpdate();
            success = 1;
        } catch (Exception ex) {
            success =0;
            ex.printStackTrace();
        } finally {
            cn.close();
        }
        return  success;
    }
}

