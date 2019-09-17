package com.revesoft.springboot.web.geo.municipalityward;

import com.revesoft.springboot.web.model.SQLJsonData;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by reve on 10/31/2017.
 */
@Repository
public class MunicipalityWardDAO {
    public ArrayList<MunicipalityWardDTO> getAllMunicipalityWard() throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<MunicipalityWardDTO> municipalitywardList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipality_wards";
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){
                municipalitywardList.add(new MunicipalityWardDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_municipality_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_bbs_code"),
                        resultSet.getString("ward_name_eng"),
                        resultSet.getString("ward_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return municipalitywardList;
    }

    public MunicipalityWardDTO getOneMunicipalityWard(int id) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;

        String sql = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipality_wards where id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){

                return new MunicipalityWardDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_municipality_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_bbs_code"),
                        resultSet.getString("ward_name_eng"),
                        resultSet.getString("ward_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status"));

            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return  new MunicipalityWardDTO();
    }

    public ArrayList<MunicipalityWardDTO> getMunicipalityWardListbyPage(int page, int pageSize) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<MunicipalityWardDTO> municipalitywardList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipality_wards limit "+(page-1)*pageSize+","+pageSize;
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

//            SQLStatementCreator sc = new SQLStatementCreator();
//            JSONObject js = new JSONObject();
//
//            js.put("geo_division_id",3);
//            js.put("geo_district_id",2);
//            js.put("division_bbs_code","56");
//            js.put("district_bbs_code","45");
//            js.put("upazila_name_eng","bbbbbb");
//            js.put("upazila_name_bng","ahare");
//            js.put("bbs_code","34");
//            js.put("status",0);
//            js.put("modified_by",2);
//            js.put("modified",java.sql.Timestamp.from(java.time.Instant.now()));
//            JSONObject wh = new JSONObject();
//            wh.put("id",700);
//            js.put("where",wh);
//            ps = sc.create(con,"delete","geo_municipality_wards",js);
//            ps.executeUpdate();


            while(resultSet.next()){
                municipalitywardList.add(new MunicipalityWardDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_municipality_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_bbs_code"),
                        resultSet.getString("ward_name_eng"),
                        resultSet.getString("ward_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
        }
        catch (Exception ex){
           ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return municipalitywardList;
    }
    public ArrayList<MunicipalityWardDTO> getMunicipalityWardList() throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<MunicipalityWardDTO> municipalitywardList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipality_wards where status =1";
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

//            SQLStatementCreator sc = new SQLStatementCreator();
//            JSONObject js = new JSONObject();
//
//            js.put("geo_division_id",3);
//            js.put("geo_district_id",2);
//            js.put("division_bbs_code","56");
//            js.put("district_bbs_code","45");
//            js.put("upazila_name_eng","bbbbbb");
//            js.put("upazila_name_bng","ahare");
//            js.put("bbs_code","34");
//            js.put("status",0);
//            js.put("modified_by",2);
//            js.put("modified",java.sql.Timestamp.from(java.time.Instant.now()));
//            JSONObject wh = new JSONObject();
//            wh.put("id",700);
//            js.put("where",wh);
//            ps = sc.create(con,"delete","geo_municipality_wards",js);
//            ps.executeUpdate();


            while(resultSet.next()){
                municipalitywardList.add(new MunicipalityWardDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_municipality_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_bbs_code"),
                        resultSet.getString("ward_name_eng"),
                        resultSet.getString("ward_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return municipalitywardList;
    }
    public void add(MunicipalityWardDTO municipalityward) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con= DatabaseManager.getInstance().getConnection();

            sql = "insert into geo_municipality_wards(id, geo_division_id, geo_district_id, geo_upazila_id, geo_municipality_id, division_bbs_code, district_bbs_code, upazila_bbs_code, municipality_bbs_code, ward_name_eng, ward_name_bng, bbs_code, status, created_by, created) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(sql);

            long ID = DatabaseManager.getInstance().getNextSequenceId("geo_municipality_wards");
            //appMenuDTO.id= ID;


            int k=0;

            ps.setInt(++k,(int)ID);
            ps.setInt(++k,municipalityward.getGeoDivisionId());
            ps.setInt(++k,municipalityward.getGeoDistrictId());
            ps.setInt(++k,municipalityward.getGeoUpazilaId());
            ps.setInt(++k,municipalityward.getGeoMunicipalityId());
            ps.setString(++k,municipalityward.getDivisionBbsCode());
            ps.setString(++k,municipalityward.getDistrictBbsCode());
            ps.setString(++k,municipalityward.getUpazilaBbsCode());
            ps.setString(++k,municipalityward.getMunicipalityBbsCode());
            ps.setString(++k,municipalityward.getWardNameEng());
            ps.setString(++k,municipalityward.getWardNameBng());
            ps.setString(++k,municipalityward.getBbsCode());
            ps.setInt(++k,1);
            ps.setInt(++k,municipalityward.getCreatedBy());
            ps.setTimestamp(++k, municipalityward.getCreated());
            ps.executeUpdate();


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
    }

    //@Razin
    public void edit(MunicipalityWardDTO municipalityward) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_municipality_wards SET geo_division_id=?, geo_district_id=?, geo_upazila_id=?, geo_municipality_id=?, division_bbs_code=?, district_bbs_code=?, upazila_bbs_code=?, municipality_bbs_code=?, ward_name_eng=?, ward_name_bng=?, bbs_code=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,municipalityward.getGeoDivisionId());
            ps.setInt(++k,municipalityward.getGeoDistrictId());
            ps.setInt(++k,municipalityward.getGeoUpazilaId());
            ps.setInt(++k,municipalityward.getGeoMunicipalityId());
            ps.setString(++k,municipalityward.getDivisionBbsCode());
            ps.setString(++k,municipalityward.getDistrictBbsCode());
            ps.setString(++k,municipalityward.getUpazilaBbsCode());
            ps.setString(++k,municipalityward.getMunicipalityBbsCode());
            ps.setString(++k,municipalityward.getWardNameEng());
            ps.setString(++k,municipalityward.getWardNameBng());
            ps.setString(++k,municipalityward.getBbsCode());
            ps.setInt(++k,municipalityward.getModifiedBy());
            ps.setTimestamp(++k, municipalityward.getModified());
            ps.setInt(++k,municipalityward.getId());
            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
    }

    //@Razin
    public int  delete(MunicipalityWardDTO municipalityWardDTO) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        int success= 0;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_municipality_wards SET status=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,0);
            ps.setInt(++k,municipalityWardDTO.getModifiedBy());
            ps.setTimestamp(++k,municipalityWardDTO.getModified());
            ps.setInt(++k,municipalityWardDTO.getId());
            ps.executeUpdate();
            success = 1;

        }catch (Exception e){
            success =0;
            e.printStackTrace();
        }
        finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }

        return  success;
    }

    public ArrayList<MunicipalityWardDTO> getMunicipalityWardListByMunicipalityId(int id) throws Exception{
        ArrayList<MunicipalityWardDTO> municipalitywardList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet resultSet = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipality_wards where geo_municipality_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            resultSet = ps.executeQuery();

            while(resultSet.next()){

                municipalitywardList.add( new MunicipalityWardDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_municipality_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_bbs_code"),
                        resultSet.getString("ward_name_eng"),
                        resultSet.getString("ward_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));

            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps!=null) ps.close();
            if(con != null)con.close();
        }
        return municipalitywardList;
    }

    public int getMunicipalityWardCount(int id) throws Exception{
        int count=0;
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet resultSet = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select count(id) as cnt from geo_municipality_wards where geo_municipality_id = ? and status=1";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            resultSet = ps.executeQuery();

            while(resultSet.next()){


                count=resultSet.getInt("cnt");

            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps!=null) ps.close();
            if(con != null)con.close();
        }
        return count;
    }


}
