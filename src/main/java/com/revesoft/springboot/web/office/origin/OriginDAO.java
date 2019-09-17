package com.revesoft.springboot.web.office.origin;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by Bony on 11/12/2017.
 */
@Repository
public class OriginDAO {

    public ArrayList<OriginDTO> getOriginsByLayers(int layerId) throws Exception{
        ArrayList<OriginDTO> data =new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs=null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from office_origins where status=1 and office_layer_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,layerId);
            rs = ps.executeQuery();

            while(rs.next()){
                OriginDTO originDTO =new OriginDTO();
                originDTO.setId(rs.getInt("id"));
                originDTO.setOfficeMinistryId(rs.getInt("office_ministry_id"));
                originDTO.setOfficeLayerId(rs.getInt("office_layer_id"));
                originDTO.setOfficeNameEng(rs.getString("office_name_eng"));
                originDTO.setOfficeNameBng(rs.getString("office_name_bng"));
                originDTO.setParentOfficeId(rs.getInt("parent_office_id"));
                originDTO.setOfficeLevel(rs.getInt("office_level"));
                originDTO.setOfficeSequence(rs.getInt("office_sequence"));
                originDTO.setStatus(rs.getByte("status"));
                data.add(originDTO);

            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return data;
    }

    public ArrayList<OriginDTO> getOrigins() throws Exception{
        ArrayList<OriginDTO> data =new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs=null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from office_origins where status=1";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while(rs.next()){
                OriginDTO originDTO =new OriginDTO();
                originDTO.setId(rs.getInt("id"));
                originDTO.setOfficeMinistryId(rs.getInt("office_ministry_id"));
                originDTO.setOfficeLayerId(rs.getInt("office_layer_id"));
                originDTO.setOfficeNameEng(rs.getString("office_name_eng"));
                originDTO.setOfficeNameBng(rs.getString("office_name_bng"));
                originDTO.setParentOfficeId(rs.getInt("parent_office_id"));
                originDTO.setOfficeLevel(rs.getInt("office_level"));
                originDTO.setOfficeSequence(rs.getInt("office_sequence"));
                originDTO.setStatus(rs.getByte("status"));
                data.add(originDTO);

            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return data;
    }

    public ArrayList<OriginDTO> originbyMinistry(int ministryId) throws Exception{
        ArrayList<OriginDTO> data =new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs=null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from office_origins where status=1 and  office_ministry_id =?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,ministryId);
            rs = ps.executeQuery();

            while(rs.next()){
                OriginDTO originDTO =new OriginDTO();
                originDTO.setId(rs.getInt("id"));
                originDTO.setOfficeMinistryId(rs.getInt("office_ministry_id"));
                originDTO.setOfficeLayerId(rs.getInt("office_layer_id"));
                originDTO.setOfficeNameEng(rs.getString("office_name_eng"));
                originDTO.setOfficeNameBng(rs.getString("office_name_bng"));
                originDTO.setParentOfficeId(rs.getInt("parent_office_id"));
                originDTO.setOfficeLevel(rs.getInt("office_level"));
                originDTO.setOfficeSequence(rs.getInt("office_sequence"));
                originDTO.setStatus(rs.getByte("status"));
                data.add(originDTO);

            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return data;
    }

    public void addOrigin(OriginDTO originDTO)  throws Exception{
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        try {
            con= DatabaseManager.getInstance().getConnection();
            long ID = DatabaseManager.getInstance().getNextSequenceId("office_origins");
            int id = (int)ID;
            sqlJsonData.add("id",id);
            sqlJsonData.add("office_ministry_id",originDTO.getOfficeMinistryId());
            sqlJsonData.add("office_layer_id",originDTO.getOfficeLayerId());
            sqlJsonData.add("office_name_eng",originDTO.getOfficeNameEng());
            sqlJsonData.add("office_name_bng",originDTO.getOfficeNameBng());
            sqlJsonData.add("parent_office_id",originDTO.getParentOfficeId());
            sqlJsonData.add("office_level",originDTO.getOfficeLevel());
            sqlJsonData.add("office_sequence",originDTO.getOfficeSequence());
            sqlJsonData.add("created_by",originDTO.getCreatedBy());
            sqlJsonData.add("created",originDTO.getCreated());
            sc.insert(con,"office_origins",sqlJsonData);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
    }

    public void editOrigin(OriginDTO originDTO) throws Exception{
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        try {
            con= DatabaseManager.getInstance().getConnection();
            sqlJsonData.add("office_ministry_id",originDTO.getOfficeMinistryId());
            sqlJsonData.add("office_layer_id",originDTO.getOfficeLayerId());
            sqlJsonData.add("office_name_eng",originDTO.getOfficeNameEng());
            sqlJsonData.add("office_name_bng",originDTO.getOfficeNameBng());
            sqlJsonData.add("parent_office_id",originDTO.getParentOfficeId());
            sqlJsonData.add("office_level",originDTO.getOfficeLevel());
            sqlJsonData.add("office_sequence",originDTO.getOfficeSequence());
            sqlJsonData.add("modified_by",originDTO.getModifiedBy());
            sqlJsonData.add("modified",originDTO.getModified());
            sqlJsonData.addtoConditionANDEquall("id",originDTO.getId());
            sc.update(con,"office_origins",sqlJsonData);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
    }

    public int originDelete(OriginDTO originDTO) throws Exception{
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        Statement statement = null;
        String sql="";
        int success = 0;
        try {
            con= DatabaseManager.getInstance().getConnection();


            statement = con.createStatement();
            sql = "select * from office_origin_units where office_origin_id = "+originDTO.getId()+" limit 0,1";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                success =2;
                return success;
            }
            statement = con.createStatement();


            sqlJsonData.add("status",0);
            sqlJsonData.add("modified_by",originDTO.getModifiedBy());
            sqlJsonData.add("modified",originDTO.getModified());
            sqlJsonData.addtoConditionANDEquall("id",originDTO.getId());
            sc.update(con,"office_origins",sqlJsonData);
            success =1;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return  success;
    }
}
