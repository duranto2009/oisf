package com.revesoft.springboot.web.office.layer;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import databasemanager.DatabaseManager;
import org.jdom.JDOMException;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Bony on 11/5/2017.
 */
@Repository
public class LayerDAO {

    public ArrayList<LayerDTO> getLayersByMinistries(int ministryId) throws Exception{
        ArrayList<LayerDTO> data =new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs=null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from office_layers where status=1 and office_ministry_id=? order by layer_sequence asc";
            ps = con.prepareStatement(sql);
            ps.setInt(1,ministryId);
            rs = ps.executeQuery();

            while(rs.next()){
                LayerDTO officeLayerDTO =new LayerDTO();
                officeLayerDTO.setId(rs.getInt("id"));
                officeLayerDTO.setOfficeMinistryId(rs.getInt("office_ministry_id"));
                officeLayerDTO.setLayerNameEng(rs.getString("layer_name_eng"));
                officeLayerDTO.setLayerNameBng(rs.getString("layer_name_bng"));
                officeLayerDTO.setLayerLevel(rs.getInt("layer_level"));
                officeLayerDTO.setLayerSequence(rs.getInt("layer_sequence"));
                officeLayerDTO.setParentLayerId(rs.getInt("parent_layer_id"));
                officeLayerDTO.setStatus(rs.getByte("status"));
                data.add(officeLayerDTO);

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

    public int  add(LayerDTO layerDTO) throws Exception {
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        int success=0;
        try {
            con= DatabaseManager.getInstance().getConnection();
            long ID = DatabaseManager.getInstance().getNextSequenceId("office_layers");
            int id = (int)ID;
            sqlJsonData.add("id",id);
            sqlJsonData.add("office_ministry_id",layerDTO.getOfficeMinistryId());
            sqlJsonData.add("parent_layer_id",layerDTO.getParentLayerId());
            sqlJsonData.add("layer_name_eng",layerDTO.getLayerNameEng());
            sqlJsonData.add("layer_name_bng",layerDTO.getLayerNameBng());
            sqlJsonData.add("layer_level",layerDTO.getLayerLevel());
            sqlJsonData.add("layer_sequence",layerDTO.getLayerSequence());
            sqlJsonData.add("created_by",layerDTO.getCreatedBy());
            sqlJsonData.add("created",layerDTO.getCreated());
            sc.insert(con,"office_layers",sqlJsonData);
            success =1;
        } catch (Exception e) {
            success =0;
            e.printStackTrace();
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return  success;

    }

    public int edit(LayerDTO layerDTO) throws Exception{
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        int success =0;
        try {
            con= DatabaseManager.getInstance().getConnection();
            sqlJsonData.add("office_ministry_id",layerDTO.getOfficeMinistryId());
            sqlJsonData.add("parent_layer_id",layerDTO.getParentLayerId());
            sqlJsonData.add("layer_name_eng",layerDTO.getLayerNameEng());
            sqlJsonData.add("layer_name_bng",layerDTO.getLayerNameBng());
            sqlJsonData.add("layer_level",layerDTO.getLayerLevel());
            sqlJsonData.add("layer_sequence",layerDTO.getLayerSequence());
            sqlJsonData.add("modified_by",layerDTO.getModifiedBy());
            sqlJsonData.add("modified",layerDTO.getModified());
            sqlJsonData.addtoConditionANDEquall("id",layerDTO.getId());
            sc.update(con,"office_layers",sqlJsonData);
            success =1;
        } catch (Exception e) {
            success =0;
            e.printStackTrace();
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return success;
    }

    public int delete(LayerDTO layerDTO) throws Exception{
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        String sql =null;
        Statement statement = null;
        int success =0;
        try {
            con= DatabaseManager.getInstance().getConnection();

            sql ="select * from office_origins where status =1 and office_layer_id = "+layerDTO.getId()+" limit 0,1";
            System.out.println(sql);
            statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                success =2;
                return success;
            }


            sql ="select * from offices where status =1 and office_layer_id = "+layerDTO.getId()+" limit 0,1";
            System.out.println(sql);
            resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                success =2;
                return success;
            }


            sqlJsonData.add("status",0);
            sqlJsonData.add("modified_by",layerDTO.getModifiedBy());
            sqlJsonData.add("modified",layerDTO.getModified());
            sqlJsonData.addtoConditionANDEquall("id",layerDTO.getId());
            sc.update(con,"office_layers",sqlJsonData);
            success =1;
        } catch (Exception e) {
            success =0;
            e.printStackTrace();
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return success;
    }
}
