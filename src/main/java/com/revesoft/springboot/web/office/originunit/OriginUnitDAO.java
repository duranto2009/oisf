package com.revesoft.springboot.web.office.originunit;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by reve on 11/8/2017.
 */
@Repository
public class OriginUnitDAO {
    int count ;
    ArrayList<OriginUnitDTO> autoFill(ResultSet resultSet){
        ArrayList<OriginUnitDTO> originUnitDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                originUnitDTOList.add(new OriginUnitDTO(resultSet.getInt("id"),
                        resultSet.getInt("office_ministry_id"),
                        resultSet.getInt("office_layer_id"),
                        resultSet.getInt("office_origin_id"),
                        resultSet.getString("unit_name_bng"),
                        resultSet.getString("unit_name_eng"),
                        resultSet.getString("office_unit_category"),
                        resultSet.getInt("parent_unit_id"),
                        resultSet.getInt("unit_level"),
                        resultSet.getByte("status"),
                        resultSet.getInt("created_by"),
                        resultSet.getInt("modified_by"),
                        resultSet.getTimestamp("created"),
                        resultSet.getTimestamp("modified")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return originUnitDTOList;
    }

    ArrayList<OriginUnitDTO> autoFill2(ResultSet resultSet){
        ArrayList<OriginUnitDTO> originUnitDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                originUnitDTOList.add(new OriginUnitDTO(resultSet.getInt("id"),
                        resultSet.getString("unit_name_bng")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return originUnitDTOList;
    }

    public ArrayList<OriginUnitDTO> getOfficeOriginUnitListByOfficeOriginId(int id) throws Exception{
        ArrayList<OriginUnitDTO> originUnitDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_origin_id",id);
            count = sc.tableDatacount("office_origin_units");
            resultSet = sc.select(con,"office_origin_units", data);
            originUnitDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();

        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return originUnitDTOS;
    }

    public ArrayList<OriginUnitDTO> getOfficeOriginUnitListForJsTreeByOfficeOriginId(int id) throws Exception{
        ArrayList<OriginUnitDTO> originUnitDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("id","");
            data.add("unit_name_bng","");
            data.addtoConditionANDEquall("office_origin_id",id);
            count = sc.tableDatacount("office_origin_units");
            resultSet = sc.select(con,"office_origin_units", data);
            originUnitDTOS = autoFill2(resultSet);


        }catch (Exception e){
            e.printStackTrace();

        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return originUnitDTOS;
    }

    public ArrayList<OriginUnitDTO> originUnitsbyOrigin(int id) throws Exception{
        ArrayList<OriginUnitDTO> originUnitDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_origin_id",id);
            data.addtoConditionANDEquall("status",1);
            resultSet = sc.select(con,"office_origin_units", data);
            originUnitDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();

        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return originUnitDTOS;
    }

    public int add(OriginUnitDTO originUnitDTO) throws Exception{
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;

        try {
            con= DatabaseManager.getInstance().getConnection();
            long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICE_ORIGIN_UNIT);
            int id = (int)ID;
            sqlJsonData.add("id",id);
            sqlJsonData.add("office_ministry_id",originUnitDTO.getOfficeMinistryId());
            sqlJsonData.add("office_layer_id",originUnitDTO.getOfficeLayerId());
            sqlJsonData.add("office_origin_id",originUnitDTO.getOfficeOriginId());
            sqlJsonData.add("unit_name_bng",originUnitDTO.getUnitNameBng());
            sqlJsonData.add("unit_name_eng",originUnitDTO.getUnitNameEng());
            sqlJsonData.add("office_unit_category",originUnitDTO.getOfficeUnitCategory());
            sqlJsonData.add("parent_unit_id",originUnitDTO.getParentUnitId());
            sqlJsonData.add("unit_level",originUnitDTO.getUnitLevel());
            sqlJsonData.add("created_by",originUnitDTO.getCreatedBy());
            sqlJsonData.add("created",originUnitDTO.getCreated());
            sc.insert(con,"office_origin_units",sqlJsonData);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();

        }
        return 1;
    }

    public int edit(OriginUnitDTO originUnitDTO) throws Exception{
        Connection con = null;
        Statement statement = null;
        String logsql ="";
        try {
            con= DatabaseManager.getInstance().getConnection();

            statement = con.createStatement();
            con.setAutoCommit(false);

            int parentId = (originUnitDTO.getId() == originUnitDTO.getParentUnitId())?0:originUnitDTO.getParentUnitId();
            //update basic in originUnit table
            logsql = "update office_origin_units set " +
                    "unit_name_bng = '"+originUnitDTO.getUnitNameBng()+"'," +
                    "unit_name_eng = '"+originUnitDTO.getUnitNameEng()+"', " +
                    "office_unit_category = '"+originUnitDTO.getOfficeUnitCategory()+"', " +
                    "parent_unit_id = "+parentId+", " +
                    "unit_level = "+originUnitDTO.getUnitLevel()+", " +
                    "modified_by = "+originUnitDTO.getModifiedBy()+", " +
                    "modified = '"+originUnitDTO.getModified()+"' where "+
                    " id = "+originUnitDTO.getId();

            System.out.println(logsql);
            statement.addBatch(logsql);

            //trying to update the parent of origin in office_units table as it was refer in this table;
            logsql = "update office_units set"+
                    " parent_origin_unit_id = "+parentId+","+
                    "modified_by = "+originUnitDTO.getModifiedBy()+", " +
                    "modified = '"+originUnitDTO.getModified()+"' where office_origin_unit_id = "+originUnitDTO.getId();

            System.out.println(logsql);
            statement.addBatch(logsql);

            //as parent origin has been changed so all parent unit will also be changed corresponding to each office who refer those origin unit
            if(originUnitDTO.getParentUnitId() !=0) {
                //feching all office and unit  corresponding to the parent origin because that unit will be the new parent unit
                logsql = "select id,office_id from office_units where office_origin_unit_id = " + originUnitDTO.getParentUnitId();
                System.out.println(logsql);

                ResultSet resultSet = statement.executeQuery(logsql);
                int parentUnitId = 0, officeId = 0;
                while (resultSet.next()) {
                    parentUnitId = resultSet.getInt("id");
                    officeId = resultSet.getInt("office_id");

                    System.out.println(officeId + " --->  " + parentUnitId);

                    //updating real unit's parent unit
                    logsql = "update office_units set" +
                            " parent_unit_id = " + parentUnitId +","+
                            "modified_by = "+originUnitDTO.getModifiedBy()+", " +
                            "modified = '"+originUnitDTO.getModified()+"' where office_origin_unit_id = " + originUnitDTO.getId() + " and office_id = " + officeId;

                    System.out.println(logsql);
                    statement.addBatch(logsql);


//                    logsql = "select id from office_units where office_origin_unit_id = " + originUnitDTO.getId() + " and office_id = " + officeId;
//                    System.out.println(logsql);
//                    resultSet = statement.executeQuery(logsql);
//                    int id = 0;
//                    while (resultSet.next()) {
//                        id = resultSet.getInt("id");
//                    }
//                    System.out.println(id);
//
//                    logsql = "update office_unit_organograms set superior_unit_id = " + parentUnitId + ",ref_sup_origin_unit_id = " + originUnitDTO.getParentUnitId() + " where office_unit_id = " + id + " and office_id = " + officeId;
//
//
//                    System.out.println(logsql);
//                    statement.addBatch(logsql);

                }
            }
            else{
                //setting none
                logsql = "update " +AllTable.TBL_OFFICE_UNIT+ " set parent_unit_id = " + 0 +  " where office_origin_unit_id = " + originUnitDTO.getId();
                System.out.println(logsql);
                statement.addBatch(logsql);

//                logsql = "select id from office_units  where office_origin_unit_id = " + originUnitDTO.getId();
//                ResultSet resultSet = statement.executeQuery(logsql);
//                while (resultSet.next()){
//                    int unitid = resultSet.getInt("id");
//                    logsql = "update office_unit_organograms set superior_unit_id = 0 where office_unit_id = "+unitid;
//                    System.out.println(logsql);
//                    statement.addBatch(logsql);
//                }

            }


            //update other things
            logsql = "update office_units set " +
                    "unit_name_bng = '"+originUnitDTO.getUnitNameBng()+"'," +
                    "unit_name_eng = '"+originUnitDTO.getUnitNameEng()+"', " +
                    "office_unit_category = '"+originUnitDTO.getOfficeUnitCategory()+"', " +
                    "unit_level = "+originUnitDTO.getUnitLevel()+", " +
                    "modified_by = "+originUnitDTO.getModifiedBy()+", " +
                    "modified = '"+originUnitDTO.getModified()+"' where "+
                    " office_origin_unit_id = "+originUnitDTO.getId();


            System.out.println(logsql);
            statement.addBatch(logsql);

            statement.executeBatch();
            con.commit();


        } catch (Exception e) {
            con.rollback();
            e.printStackTrace();
            return 0;
        }finally {
//            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
            if(statement !=null)statement.close();
        }
        return 1;



    }
    public int delete(OriginUnitDTO originUnitDTO) throws Exception{
        int success = 0;
        Connection con = null;
        Statement statement = null;

        String sql ="";
        try{
            con = DatabaseManager.getInstance().getConnection();
            statement = con.createStatement();
            sql = "select count(id) as usedcount from office_units where status = 1 and office_origin_unit_id = "+originUnitDTO.getId();
            System.out.println(sql);
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                int usedcount = resultSet.getInt("usedcount");
                if(usedcount !=0)success = 2;
            }
            if(success !=2){
                sql = "update office_origin_units set status = 0" + ",modified_by = "+originUnitDTO.getModifiedBy()+",modified = '"+originUnitDTO.getModified()+"' where id = "+originUnitDTO.getId();
                System.out.println(sql);
                statement.executeUpdate(sql);
                success =1;
            }
        } catch (Exception e){
            success = 0;
            e.printStackTrace();
        }finally {
            if(con!=null)con.close();
            if(statement !=null)statement.close();
        }
        System.out.println(success);
        return success;
    }
}
