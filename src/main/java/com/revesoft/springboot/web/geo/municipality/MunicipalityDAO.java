package com.revesoft.springboot.web.geo.municipality;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.office.offices.OfficeDAO;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.Policy;
import databasemanager.DatabaseManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by reve on 10/31/2017.
 */
@Repository
public class MunicipalityDAO {

    @Autowired
    OfficeDAO officeDAO;

    private static final String UPA_ID_COlUMN="geo_upazila_id";
    private static final String UNI_ID_COlUMN="geo_union_id";
    private static final String MUNI_ID_COlUMN="geo_municipality_id";




    public ArrayList<MunicipalityDTO> getAllMunicipality() throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<MunicipalityDTO> municipalityList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from " + AllTable.TBL_GEO_MUNICIPALITY+ "  where status=1";
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){
                municipalityList.add(new MunicipalityDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_name_eng"),
                        resultSet.getString("municipality_name_bng"),
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
        return municipalityList;
    }

    public ArrayList<MunicipalityDTO> getMunicipalityListbyUpazillaId(int id) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<MunicipalityDTO> municipalityList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipalities  where geo_upazila_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){
                municipalityList.add(new MunicipalityDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_name_eng"),
                        resultSet.getString("municipality_name_bng"),
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
        return municipalityList;
    }

    //@Razin
    public MunicipalityDTO getOneMunicipality(int id) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;

        String sql = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipalities where id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){

                return new MunicipalityDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_name_eng"),
                        resultSet.getString("municipality_name_bng"),
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
        return  new MunicipalityDTO();
    }

    public ArrayList<MunicipalityDTO> getMunicipalityListbyPage(int page, int pageSize) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<MunicipalityDTO> municipalityList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipalities limit "+(page-1)*pageSize+","+pageSize;
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
//            ps = sc.create(con,"delete","geo_municipalities",js);
//            ps.executeUpdate();


            while(resultSet.next()){
                municipalityList.add(new MunicipalityDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_name_eng"),
                        resultSet.getString("municipality_name_bng"),
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
        return municipalityList;
    }

    public ArrayList<MunicipalityDTO> getMunicipalityList() throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<MunicipalityDTO> municipalityList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_municipalities where status = 1 ";
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
//            ps = sc.create(con,"delete","geo_municipalities",js);
//            ps.executeUpdate();


            while(resultSet.next()){
                municipalityList.add(new MunicipalityDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("municipality_name_eng"),
                        resultSet.getString("municipality_name_bng"),
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
        return municipalityList;
    }
    //@Razin
    public void add(MunicipalityDTO municipality) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con= DatabaseManager.getInstance().getConnection();

            sql = "insert into geo_municipalities(id, geo_division_id, geo_district_id, geo_upazila_id, division_bbs_code, district_bbs_code, upazila_bbs_code, municipality_name_eng, municipality_name_bng, bbs_code, status, created_by, created) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(sql);

            long ID = DatabaseManager.getInstance().getNextSequenceId("geo_municipalities");
            //appMenuDTO.id= ID;


            int k=0;

            ps.setInt(++k,(int)ID);
            ps.setInt(++k,municipality.getGeoDivisionId());
            ps.setInt(++k,municipality.getGeoDistrictId());
            ps.setInt(++k,municipality.getGeoUpazilaId());
            ps.setString(++k,municipality.getDivisionBbsCode());
            ps.setString(++k,municipality.getDistrictBbsCode());
            ps.setString(++k,municipality.getUpazilaBbsCode());
            ps.setString(++k,municipality.getMunicipalityNameEng());
            ps.setString(++k,municipality.getMunicipalityNameBng());
            ps.setString(++k,municipality.getBbsCode());
            ps.setInt(++k,1);
            ps.setInt(++k,municipality.getCreatedBy());
            ps.setTimestamp(++k, municipality.getCreated());
            ps.executeUpdate();


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
    }

    //@Razin
    public void edit(MunicipalityDTO municipality) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_municipalities SET geo_division_id=?, geo_district_id=?, geo_upazila_id=?, division_bbs_code=?, district_bbs_code=?, upazila_bbs_code=?, municipality_name_eng=?, municipality_name_bng=?, bbs_code=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,municipality.getGeoDivisionId());
            ps.setInt(++k,municipality.getGeoDistrictId());
            ps.setInt(++k,municipality.getGeoUpazilaId());
            ps.setString(++k,municipality.getDivisionBbsCode());
            ps.setString(++k,municipality.getDistrictBbsCode());
            ps.setString(++k,municipality.getUpazilaBbsCode());
            ps.setString(++k,municipality.getMunicipalityNameEng());
            ps.setString(++k,municipality.getMunicipalityNameBng());
            ps.setString(++k,municipality.getBbsCode());
            ps.setInt(++k,municipality.getModifiedBy());
            ps.setTimestamp(++k, municipality.getModified());
            ps.setInt(++k,municipality.getId());
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
    public int delete(MunicipalityDTO municipalityDTO) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        int success =0;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_municipalities SET status=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,0);
            ps.setInt(++k,municipalityDTO.getModifiedBy());
            ps.setTimestamp(++k, municipalityDTO.getModified());
            ps.setInt(++k,municipalityDTO.getId());
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
        return success;

    }

    ArrayList<MunicipalityDTO> getMuniListByUpazillaId(int id){
        ArrayList<MunicipalityDTO> muniList = null;

        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("geo_upazila_id",id);
            rs = sc.select(con,"geo_municipalities", data);
            while(rs.next()){
                muniList.add(new MunicipalityDTO(rs.getInt("id"),
                        rs.getInt("geo_division_id"),
                        rs.getInt("geo_district_id"),
                        rs.getInt("geo_upazila_id"),
                        rs.getString("division_bbs_code"),
                        rs.getString("district_bbs_code"),
                        rs.getString("upazila_bbs_code"),
                        rs.getString("municipality_name_eng"),
                        rs.getString("municipality_name_bng"),
                        rs.getString("bbs_code"),
                        rs.getInt("status")));
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return  muniList;

    }

    public ArrayList<MunicipalityDTO> getMuniListByUpazillaIds(int[] ids) {
        ArrayList<MunicipalityDTO> municipalityDTOS = new ArrayList<>();
        String condition = null;
        Connection con = null;
        ResultSet rs = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try {
            con = DatabaseManager.getInstance().getConnection();
            condition = ""; //geo_upazila_id =? or geo_upazila_id=? or geo_upazila_id=?";
            condition += " i:status = "+1 +" and ( ";

            for (int i = 0; i < ids.length; i++) {
                if (i < ids.length - 1) condition += " i:geo_upazila_id =  " + ids[i] + " or";
                else condition += " i:geo_upazila_id = " + ids[i];
            }
            condition += " ) ";

            SQLJsonData data = new SQLJsonData();
            data.add("all", "");
            rs = sc.select(con, "geo_municipalities", data, condition);
            while (rs.next()) {
                municipalityDTOS.add(new MunicipalityDTO(rs.getInt("id"),
                        rs.getInt("geo_division_id"),
                        rs.getInt("geo_district_id"),
                        rs.getInt("geo_upazila_id"),
                        rs.getString("division_bbs_code"),
                        rs.getString("district_bbs_code"),
                        rs.getString("upazila_bbs_code"),
                        rs.getString("municipality_name_eng"),
                        rs.getString("municipality_name_bng"),
                        rs.getString("bbs_code"),
                        rs.getInt("status")));
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return municipalityDTOS;
    }

    public void assignUniToMuni
            (int parentId, int userId, ArrayList<Integer> sourceListId, int currentId) throws Exception {


        Connection cn = null;
        Statement stmt = null;

        try {
            cn = DatabaseManager.getInstance().getConnection();
            stmt = cn.createStatement();
            cn.setAutoCommit(false);

            for(int uniid:sourceListId){

                long ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);

                String q16= "insert into " +AllTable.TBL_GEO_HISTORY+ "( id ,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                        "created,modified,expired_by )"+
                        "select " +ID+ " , geo_upazila_id,id,union_name_eng,union_name_bng,bbs_code,status,created_by,modified_by,created,modified,"+ userId+
                        " from " +AllTable.TBL_GEO_UNION+ " where id = " + uniid;
                stmt.addBatch(q16);

                String q17 =" insert into " +AllTable.TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                        " select " +ID+ ", u.id , " + Policy.MUNICIPALITY_TYPE+" , "+ Policy.UNION_TYPE+ " from "+ AllTable.TBL_GEO_MUNICIPALITY+
                        " u where u.id = " + currentId ;
                stmt.addBatch(q17);

                String q18="  update " +AllTable.TBL_GEO_UNION+ " set status= 0 "+
                        " where id =" +uniid;
                stmt.addBatch(q18);

            }
            stmt.executeBatch();
            for (int uniID:sourceListId
                    ) {
                officeDAO.updateOfficeGeo(cn,MUNI_ID_COlUMN,parentId,UNI_ID_COlUMN,uniID);

            }
            cn.commit();


        } catch (Exception e) {
            cn.rollback();
            e.printStackTrace();
        } finally {
            if (stmt != null) stmt.close();
            if (cn != null) cn.close();
        }

    }


}
