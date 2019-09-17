package com.revesoft.springboot.web.geo.citycorporation;

import com.revesoft.springboot.web.geo.municipalityward.MunicipalityWardDAO;
import com.revesoft.springboot.web.geo.municipalityward.MunicipalityWardDTO;
import com.revesoft.springboot.web.office.offices.OfficeDAO;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.Policy;
import databasemanager.DatabaseManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Bony on 10/30/2017.
 */
@Repository
public class CityCorporationDAO {

    @Autowired
    OfficeDAO officeDAO;

    private static final String UPA_ID_COlUMN="geo_upazila_id";
    private static final String UNI_ID_COlUMN="geo_union_id";
    private static final String MUNI_ID_COlUMN="geo_municipality_id";
    private static final String CITY_ID_COlUMN="geo_city_corporation_id";

    private CityCorporationDTO dtoSetter(ResultSet rs,CityCorporationDTO cityCorporationDTO )throws Exception{

        cityCorporationDTO.setId(rs.getInt("id"));
        cityCorporationDTO.setDivisionId(rs.getInt("geo_division_id"));
        cityCorporationDTO.setDistrictId(rs.getInt("geo_district_id"));
        cityCorporationDTO.setDivisionBbsCode(rs.getString("division_bbs_code"));
        cityCorporationDTO.setDistrictBbsCode(rs.getString("district_bbs_code"));
        cityCorporationDTO.setNameEng(rs.getString("city_corporation_name_eng"));
        cityCorporationDTO.setNameBng(rs.getString("city_corporation_name_bng"));
        cityCorporationDTO.setBbsCode(rs.getString("bbs_code"));
        cityCorporationDTO.setStatus(rs.getInt("status"));
        cityCorporationDTO.setCreatedBy(rs.getInt("created_by"));
        cityCorporationDTO.setModifiedBy(rs.getInt("modified_by"));
        cityCorporationDTO.setCreated(rs.getTimestamp("created"));
        cityCorporationDTO.setModified(rs.getTimestamp("modified"));
        return cityCorporationDTO;
    }

    public ArrayList<CityCorporationDTO> getAllCitycorporation()throws Exception{
        ArrayList<CityCorporationDTO> data=new ArrayList<>();
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from "  + AllTable.TBL_GEO_CITY_CORP+ " where status=1";
        try {
            connection= DatabaseManager.getInstance().getConnection();
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                CityCorporationDTO cityCorporationDTO=new CityCorporationDTO();
                cityCorporationDTO=dtoSetter(rs,cityCorporationDTO);

                data.add(cityCorporationDTO);



            }
            rs.close();
            ps.close();


        }catch (Exception e) {
            e.printStackTrace();
        }
        finally {

            if(ps != null)ps.close();
            if(connection != null)connection.close();

        }

        return data;
    }

    public ArrayList<CityCorporationDTO> get(int districtId) throws Exception{
        ArrayList<CityCorporationDTO> data=new ArrayList<>();
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from " +AllTable.TBL_GEO_CITY_CORP+   " where geo_district_id=?";
        try {
            connection= DatabaseManager.getInstance().getConnection();
            ps=connection.prepareStatement(sql);
            ps.setInt(1,districtId);
            rs=ps.executeQuery();
            while(rs.next()){
                CityCorporationDTO cityCorporationDTO=new CityCorporationDTO();
                cityCorporationDTO=dtoSetter(rs,cityCorporationDTO);

                data.add(cityCorporationDTO);

            }
            rs.close();
            ps.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(connection != null)connection.close();
        }
        return data;

    }


    public CityCorporationDTO getCity(int id)throws Exception {
        CityCorporationDTO cityCorporationDTO = new CityCorporationDTO();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from "+AllTable.TBL_GEO_CITY_CORP+ " where id=? and status=1 ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                cityCorporationDTO = new CityCorporationDTO();
                cityCorporationDTO=dtoSetter(rs,cityCorporationDTO);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(ps != null)ps.close();
            if(connection != null)connection.close();
        }
        return cityCorporationDTO;
    }

    public void add(CityCorporationDTO cityCorporationDTO) throws Exception{
        Connection cn = null;
        PreparedStatement ps = null;
        // ResultSet rs = null;
        String sql=null;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_CITY_CORP);
            sql = "insert into " +AllTable.TBL_GEO_CITY_CORP+ "(id,geo_division_id,geo_district_id,division_bbs_code,district_bbs_code," +
                    "city_corporation_name_eng,city_corporation_name_bng,bbs_code,status,created_by,created)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setLong(++k,ID);
            ps.setInt(++k,cityCorporationDTO.getDivisionId());
            ps.setInt(++k,cityCorporationDTO.getDistrictId());
            ps.setString(++k,cityCorporationDTO.getDivisionBbsCode());
            ps.setString(++k,cityCorporationDTO.getDistrictBbsCode());
            ps.setString(++k,cityCorporationDTO.getNameEng());
            ps.setString(++k,cityCorporationDTO.getNameBng());
            ps.setString(++k,cityCorporationDTO.getBbsCode());
            ps.setInt(++k,cityCorporationDTO.getStatus());
            ps.setInt(++k,cityCorporationDTO.getCreatedBy());
            ps.setTimestamp(++k,cityCorporationDTO.getCreated());


            ps.executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(cn != null)cn.close();
        }

    }
    public void update(CityCorporationDTO cityCorporationDTO) throws Exception{
        Connection cn = null;
        PreparedStatement ps = null;
        // ResultSet rs = null;
        String sql=null;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "update " +AllTable.TBL_GEO_CITY_CORP+ " set geo_division_id=?,geo_district_id=?,division_bbs_code=?,district_bbs_code=?, " +
                    "city_corporation_name_eng=?,city_corporation_name_bng=?,bbs_code=?,modified_by=?,modified=? WHERE id=?";
            ps = cn.prepareStatement(sql);
            int k = 0;

            ps.setInt(++k,cityCorporationDTO.getDivisionId());
            ps.setInt(++k,cityCorporationDTO.getDistrictId());
            ps.setString(++k,cityCorporationDTO.getDivisionBbsCode());
            ps.setString(++k,cityCorporationDTO.getDistrictBbsCode());
            ps.setString(++k,cityCorporationDTO.getNameEng());
            ps.setString(++k,cityCorporationDTO.getNameBng());
            ps.setString(++k,cityCorporationDTO.getBbsCode());
            ps.setInt(++k,cityCorporationDTO.getModifiedBy());
            ps.setTimestamp(++k,cityCorporationDTO.getModified());
            ps.setInt(++k,cityCorporationDTO.getId());


            ps.executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(cn != null)cn.close();
        }

    }
    public int delete(CityCorporationDTO cityCorporationDTO) throws Exception{
        Connection cn = null;
        PreparedStatement ps = null;
        String sql=null;
        int success =0;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "update  geo_city_corporations set status=?,modified_by=?,modified=? WHERE id=?";
            ps = cn.prepareStatement(sql);
            int k = 0;

            ps.setInt(++k,0);
            ps.setInt(++k,cityCorporationDTO.getModifiedBy());
            ps.setTimestamp(++k,cityCorporationDTO.getModified());
            ps.setInt(++k,cityCorporationDTO.getId());


            ps.executeUpdate();
            success =1;
        }catch (Exception ex){
            success = 0;
            ex.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(cn != null)cn.close();
        }
        return success;

    }

    public void changeTotalGeoMuni
            (int currentId, long userId, ArrayList<Integer> muniListId) throws Exception {


        Connection cn = null;

        Statement stmt = null;

        try {
            cn = DatabaseManager.getInstance().getConnection();
            stmt = cn.createStatement();
            cn.setAutoCommit(false);
            for(int muniId:muniListId){
                Long ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);
                String q19= "insert into " +AllTable.TBL_GEO_HISTORY+   " ( id, parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by" +
                        " , modified_by,created,modified,expired_by)"+
                        "select " +ID+  " , geo_upazila_id,id,municipality_name_eng,municipality_name_bng,bbs_code,status,created_by,modified_by,created,modified, " +userId+
                        " from " + AllTable.TBL_GEO_MUNICIPALITY+ " where id =  " +muniId ;
                stmt.addBatch(q19);

                String q20 = " insert into "  +AllTable.TBL_GEO_MAPPING+ "( geo_history_id,geo_current_id,geo_current_type,geo_source_type)" +
                        " select "+ ID+ " ,m.id, "+ Policy.CITY_TYPE+ " , " + Policy.MUNICIPALITY_TYPE+ " from "+AllTable.TBL_GEO_CITY_CORP +
                        " m where m.id = " + currentId ;
                stmt.addBatch(q20);

                String q21= "update " +AllTable.TBL_GEO_MUNICIPALITY+  " set status= 0 "+
                        " where id = "+ muniId;
                stmt.addBatch(q21);

                int count=new MunicipalityWardDAO().getMunicipalityWardCount(muniId);
                ArrayList<Long> wardIds=new ArrayList<>();
                ArrayList<MunicipalityWardDTO> wordLists = new MunicipalityWardDAO().getMunicipalityWardListByMunicipalityId(muniId);
                for(int i=1;i<=count;i++){
                    long IDs=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);
                    wardIds.add(IDs);
                }
                int i=0;

                for (Long wardId:wardIds) {


                    String q22 = " insert into" +AllTable.TBL_GEO_HISTORY+ "( id ,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by," +
                            "modified_by,created,modified,expired_by)" +
                            " select " +wardId+ " , geo_municipality_id,id ,ward_name_eng,ward_name_bng,bbs_code,status,created_by,modified_by,created,modified," + userId +
                            " from " +AllTable.TBL_GEO_MUNICIPALITY_WARD+ " where id = " + wordLists.get(i).getId();
                    stmt.addBatch(q22);
                    String q23 = " insert into " +AllTable.TBL_GEO_MAPPING+  " (geo_history_id,geo_current_id,geo_current_type,geo_source_type)" +
                            " select "+wardId+ " ,w.id,  " + Policy.MUNI_WARD_TYPE+ " , " + Policy.MUNI_WARD_TYPE+ " from "+
                            AllTable.TBL_GEO_MUNICIPALITY_WARD+ " w where w.id  = " +  wordLists.get(i).getId();
                    stmt.addBatch(q23);
                    String q24 = " update " +AllTable.TBL_GEO_MUNICIPALITY_WARD+ " set status=0   " +
                            " where id  = " +  wordLists.get(i).getId() ;
                    stmt.addBatch(q24);
                    i++;

                }
            }

            stmt.executeBatch();
            for (int muniID:muniListId
                    ) {
                officeDAO.updateOfficeGeo(cn,CITY_ID_COlUMN,currentId,MUNI_ID_COlUMN,muniID);

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


    public void changeTotalGeoUni
            (int currentId, long userId, ArrayList<Integer> uniListId,ArrayList<Integer>upazilaIds) throws Exception {


        Connection cn = null;
        //PreparedStatement ps = null;

        Statement stmt = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            stmt = cn.createStatement();
            cn.setAutoCommit(false);

            for(int uniid:uniListId){

                long ID=DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_GEO_HISTORY);

                String q16= "insert into " +AllTable.TBL_GEO_HISTORY+ "( id ,parent_id,source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by," +
                        "created,modified,expired_by )"+
                        "select " +ID+ " , geo_upazila_id,id,union_name_eng,union_name_bng,bbs_code,status,created_by,modified_by,created,modified,"+ userId+
                        " from " +AllTable.TBL_GEO_UNION+ " where id = " + uniid;
                stmt.addBatch(q16);

                String q17 =" insert into " +AllTable.TBL_GEO_MAPPING+ " (geo_history_id,geo_current_id,geo_current_type,geo_source_type) " +
                        " select " +ID+ ", u.id , " + Policy.CITY_TYPE+" , "+ Policy.UNION_TYPE+ " from "+ AllTable.TBL_GEO_CITY_CORP+
                        " u where u.id = " + currentId ;
                stmt.addBatch(q17);

                String q18="  update " +AllTable.TBL_GEO_UNION+ " set status= 0 "+
                        " where id =" +uniid;
                stmt.addBatch(q18);

            }
            stmt.executeBatch();

            for (int uniID:uniListId
                    ) {
                officeDAO.updateOfficeGeo(cn,CITY_ID_COlUMN,currentId,UNI_ID_COlUMN,uniID);

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
