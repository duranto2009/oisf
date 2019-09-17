package com.revesoft.springboot.web.office.officeunit;

import com.revesoft.springboot.web.employee.employeeoffice.EmployeeOfficeDAO;
import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by reve on 11/8/2017.
 */
@Repository
public class OfficeUnitDAO {
    int count ;
    @Autowired
    EmployeeOfficeDAO employeeOfficeDAO;
    ArrayList<OfficeUnitDTO> autoFill(ResultSet resultSet){
        ArrayList<OfficeUnitDTO> officeUnitDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                officeUnitDTOList.add(new OfficeUnitDTO(resultSet.getInt("id"),
                        resultSet.getInt("office_ministry_id"),
                        resultSet.getInt("office_layer_id"),
                        resultSet.getInt("office_id"),
                        resultSet.getInt("office_origin_unit_id"),
                        resultSet.getString("unit_name_bng"),
                        resultSet.getString("unit_name_eng"),
                        resultSet.getString("office_unit_category"),
                        resultSet.getInt("parent_unit_id"),
                        resultSet.getInt("parent_origin_unit_id"),
                        resultSet.getString("unit_nothi_code"),
                        resultSet.getInt("unit_level"),
                        resultSet.getInt("sarok_no_start"),
                        resultSet.getByte("status"),
                        resultSet.getInt("created_by"),
                        resultSet.getInt("modified_by"),
                        resultSet.getTimestamp("created"),
                        resultSet.getTimestamp("modified")));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return officeUnitDTOList;
    }
//    ArrayList<OfficeUnitDTO> autoFillJsTree(ResultSet resultSet){
//        ArrayList<OfficeUnitDTO> officeUnitDTOList = new ArrayList<>();
//        try {
//            while(resultSet.next()){
//                officeUnitDTOList.add(new OfficeUnitDTO(resultSet.getInt("id"),
//                        resultSet.getString("unit_name_bng")
//                        ));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//
//        }
//        return officeUnitDTOList;
//    }
//    ArrayList<OfficeUnitDTO> getOfficeUnitListByOfficeId(int id) throws Exception{
//        ArrayList<OfficeUnitDTO> officeUnitDTOS = null;
//        Connection con = null;
//        ResultSet resultSet = null;
//
//
//        try{
//            con= DatabaseManager.getInstance().getConnection();
//            SQLJsonData data = new SQLJsonData();
//            data.add("all","");
//            data.addtoConditionANDEquall("office_id",id);
//            count = sc.tableDatacount("office_units");
//            resultSet = sc.select(con,"office_units", data);
//            officeUnitDTOS = autoFill(resultSet);
//
//
//        }catch (Exception e){
//            e.printStackTrace();
//        } finally {
//            if(con != null)con.close();
//            if(sc.ps!=null)sc.ps.close();
//        }
//        return officeUnitDTOS;
//    }
    ArrayList<OfficeUnitDTO> getAllOfficeUnit() throws Exception{
        ArrayList<OfficeUnitDTO> officeUnitDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("status",1);
            count = sc.tableDatacount("office_units");
            resultSet = sc.select(con,"office_units", data);
            officeUnitDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeUnitDTOS;
    }

//    ArrayList<OfficeUnitDTO> getOfficeUnitListForJsTreeByOfficeId(int id) throws Exception{
//        ArrayList<OfficeUnitDTO> officeUnitDTOS = null;
//        Connection con = null;
//        ResultSet resultSet = null;
//
//
//        try{
//            con= DatabaseManager.getInstance().getConnection();
//            SQLJsonData data = new SQLJsonData();
//            data.add("id","");
//            data.add("unit_name_bng","");
//            data.addtoConditionANDEquall("office_id",id);
//            count = sc.tableDatacount("office_units");
//            resultSet = sc.select(con,"office_units", data);
//            officeUnitDTOS = autoFillJsTree(resultSet);
//
//
//        }catch (Exception e){
//            e.printStackTrace();
//        } finally {
//            if(con != null)con.close();
//            if(sc.ps!=null)sc.ps.close();
//        }
//        return officeUnitDTOS;
//    }

    public ArrayList<OfficeUnitDTO> officeUnitbyOffice(int id) throws Exception{
        ArrayList<OfficeUnitDTO> officeUnitDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_id",id);
            data.addtoConditionANDEquall("status",1);
            resultSet = sc.select(con, AllTable.TBL_OFFICE_UNIT, data);
            officeUnitDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeUnitDTOS;
    }


    public int deleteUnit(int[] id,int userid) throws Exception {
        //if(employeeOfficeDAO.doesOrganogramHasEmployeeCheckedByUnits(id))return 2;
        Connection con = null;
        Statement sc = null;
        int success =1;
        try{
            con= DatabaseManager.getInstance().getConnection();
            con.setAutoCommit(false);
            sc = con.createStatement();
            String s = "(";
            for(int i=0;i<id.length-1;i++){
                s += id[i]+",";
            }
            s+=id[id.length-1]+")";


              //  sc.addBatch("delete from "+AllTable.TBL_OFFICE_UNIT+" where id = "+id[i]+" ");
            sc.addBatch("update "+AllTable.TBL_OFFICE_UNIT+" set status=0" + ",modified_by = "+userid+",modified = '"+java.sql.Timestamp.from(java.time.Instant.now())+"'  where id in "+s);
            sc.addBatch("update "+AllTable.TBL_OFFICE_UNIT_ORG+" set status=0" + ",modified_by = "+userid+",modified = '"+java.sql.Timestamp.from(java.time.Instant.now())+"'  where office_unit_id in "+s);

            sc.executeBatch();
            con.commit();



        }catch (Exception e){
            con.rollback();
            e.printStackTrace();
            success =0;

        } finally {
            if(con != null)con.close();
            if(sc!=null)sc.close();
        }

        return success;
    }

    public int transferUnit(int[] id, int officeId) throws  Exception{
        ArrayList<OfficeUnitDTO> officeUnitDTOS = new ArrayList<>();
        ArrayList<Integer> originUnitIdListForUpdate = new ArrayList<>();
        ArrayList<Integer> originUnitIdListForInsert = new ArrayList<>();
        ArrayList<Integer> parentOriginUnitIdForInsert = new ArrayList<>();
        HashMap<Integer, Integer> originToIdmapping = new HashMap<>();
        HashMap<Integer, OfficeUnitDTO> unitStorage = new HashMap<>();
        ArrayList<Integer> unitIdListForInsert = new ArrayList<>();
        Connection con = null;
        Statement sc = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int success =1;

        if(id.length<=0)return  0;
        try{
            con= DatabaseManager.getInstance().getConnection();
            String s = "(";
            for(int i=0;i<id.length-1;i++){
                s += id[i]+",";
            }
            s+=id[id.length-1]+")";
            String sql = "select id,office_origin_unit_id from "+ AllTable.TBL_OFFICE_UNIT+" where office_origin_unit_id in "+s;
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            while (res.next()){
                int originid = res.getInt("office_origin_unit_id");
                int unitid = res.getInt("id");
                for(int i=0;i<id.length;i++){
                    if(id[i]==originid){
                        originUnitIdListForUpdate.add(originid);
                        originToIdmapping.put(originid,unitid);
                        break;
                    }
                }
            }

            for(int i=0;i<id.length;i++){
                if(!originUnitIdListForUpdate.contains(id[i])){
                    originUnitIdListForInsert.add(id[i]);
                }
            }


            int insertSize = originUnitIdListForInsert.size();
            if(insertSize >0) {
                s = "(";
                for (int i = 0; i < insertSize - 1; i++) {
                    s += originUnitIdListForInsert.get(i) + ",";
                }
                s+=originUnitIdListForInsert.get(insertSize - 1)+")";
                sql = "select * from " + AllTable.TBL_OFFICE_ORIGIN_UNIT + " where id in " + s;
                ps = con.prepareStatement(sql);
                res = ps.executeQuery();
                while (res.next()) {
                    OfficeUnitDTO officeUnitDTO = new OfficeUnitDTO();
                    officeUnitDTO.setOfficeMinistryId(res.getInt("office_ministry_id"));
                    officeUnitDTO.setOfficeLayerId(res.getInt("office_layer_id"));
                    officeUnitDTO.setOfficeId(officeId);
                    officeUnitDTO.setUnitNameBng(res.getString("unit_name_bng"));
                    officeUnitDTO.setUnitNameEng(res.getString("unit_name_eng"));
                    officeUnitDTO.setParentOriginUnitId(res.getInt("parent_unit_id"));
                    officeUnitDTO.setOfficeUnitCategory(res.getString("office_unit_category"));
                    officeUnitDTO.setUnitLevel(res.getInt("unit_level"));
                    officeUnitDTO.setOfficeOriginUnitId(res.getInt("id"));
                    officeUnitDTO.setCreatedBy(1);
                    unitStorage.put(res.getInt("id"), officeUnitDTO);
                    parentOriginUnitIdForInsert.add(res.getInt("parent_unit_id"));
                    officeUnitDTOS.add(officeUnitDTO);

                }

                int parentSize = parentOriginUnitIdForInsert.size();
                if(parentSize>0){
                    s = "(";
                    for (int i = 0; i < parentSize - 1; i++) {
                        s += parentOriginUnitIdForInsert.get(i) + ",";
                    }
                    s+=originUnitIdListForInsert.get(parentSize - 1)+")";
                    sql = "select id,office_origin_unit_id from " + AllTable.TBL_OFFICE_UNIT + " where office_origin_unit_id in " + s;
                    ps = con.prepareStatement(sql);
                    res = ps.executeQuery();
                    while (res.next()) {
                        originToIdmapping.put(res.getInt("office_origin_unit_id"),res.getInt("id"));

                    }
                }


                for (int i = 0; i < originUnitIdListForInsert.size(); i++) {
                    unitIdListForInsert.add((int) DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICE_UNIT));
                }

                for (int i = 0; i < originUnitIdListForInsert.size(); i++) {
                    OfficeUnitDTO oud = unitStorage.get(originUnitIdListForInsert.get(i));
                   Integer parentunitid = originToIdmapping.get(oud.getParentOriginUnitId());
                   if(parentunitid !=null){
                       oud.setParentUnitId(parentunitid);
                       oud.setId(unitIdListForInsert.get(i));
                       originToIdmapping.put(oud.getOfficeOriginUnitId(),unitIdListForInsert.get(i));
                   }
                   else{
                       oud.setParentUnitId(0);
                       oud.setId(unitIdListForInsert.get(i));
                       originToIdmapping.put(oud.getOfficeOriginUnitId(),unitIdListForInsert.get(i));
                   }


                }
            }







            con.setAutoCommit(false);
            sc = con.createStatement();
            //update
            for(int i=0;i<originUnitIdListForUpdate.size();i++){
                String logsql  ="update "+AllTable.TBL_OFFICE_UNIT+" set status = 1 where office_origin_unit_id = "+originUnitIdListForUpdate.get(i);
                System.out.println(logsql);
                sc.addBatch(logsql);
                logsql  ="update "+AllTable.TBL_OFFICE_UNIT_ORG+" set status = 1 where office_unit_id = "+originToIdmapping.get(originUnitIdListForUpdate.get(i));
                System.out.println(logsql);
                sc.addBatch(logsql);
            }
            //insert
            for(int i=0;i<officeUnitDTOS.size();i++){
                OfficeUnitDTO odu = officeUnitDTOS.get(i);
                String logsql = "insert into "+AllTable.TBL_OFFICE_UNIT+" (id, office_ministry_id, office_layer_id, office_id, office_origin_unit_id, unit_name_bng, unit_name_eng, office_unit_category," +
                        "parent_unit_id, parent_origin_unit_id, unit_level, created_by) VALUES ("+odu.getId()+","+odu.getOfficeMinistryId()+","+odu.getOfficeLayerId()+","+odu.getOfficeId()+","+odu.getOfficeOriginUnitId()+",'"+odu.getUnitNameBng()+"','"+odu.getUnitNameEng()+"','"+odu.getOfficeUnitCategory()+"',"+odu.getParentUnitId()+","+odu.getParentOriginUnitId()+","+odu.getUnitLevel()+","+odu.getCreatedBy()+")";
                System.out.println(logsql);
                sc.addBatch(logsql);
            }


            sc.executeBatch();
            con.commit();



        }catch (Exception e){
            con.rollback();
            e.printStackTrace();
            success =0;

        } finally {
            if(con != null)con.close();
            if(sc!=null)sc.close();
        }

        return success;
    }

    public int transferUnit2(int[] id, int officeId, int userid) throws  Exception{
        ArrayList<OfficeUnitDTO> officeUnitDTOS = new ArrayList<>();
        ArrayList<Integer> originUnitIdListForUpdate = new ArrayList<>();
        ArrayList<Integer> originUnitIdListForInsert = new ArrayList<>();
        ArrayList<Integer> parentOriginUnitIdForInsert = new ArrayList<>();
        HashMap<Integer, Integer> originToIdmapping = new HashMap<>();
        HashMap<Integer, OfficeUnitDTO> unitStorage = new HashMap<>();
        ArrayList<Integer> unitIdListForInsert = new ArrayList<>();
        Connection con = null;
        Statement sc = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int success =1;


        Set<Integer> originIdForRealId = new HashSet<>();
        if(id.length<=0)return  0;
        try{
            con= DatabaseManager.getInstance().getConnection();
            String s = "(";
            for(int i=0;i<id.length-1;i++){
                s += id[i]+",";
            }
            s+=id[id.length-1]+")";
            //Checking whether these ids contain in real unit table or nor
            String sql = "select office_origin_unit_id,parent_origin_unit_id  from "+ AllTable.TBL_OFFICE_UNIT+" where office_origin_unit_id in "+s+" and office_id = "+officeId;
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            while (res.next()){
                int originUnitId = res.getInt("office_origin_unit_id");
                int parentOriginUnitId = res.getInt("parent_origin_unit_id");
                for(int i=0;i<id.length;i++){
                    if(id[i]==originUnitId){
                        //listing the contained id list
                        originUnitIdListForUpdate.add(originUnitId);
                        //listing template id list for featching coresponding real id
                        originIdForRealId.add(originUnitId);
                        originIdForRealId.add(parentOriginUnitId);
                        break;
                    }
                }

            }

            //isolating the list that is not in real table but try to be inserted this real unit table
            for(int i=0;i<id.length;i++){
                if(!originUnitIdListForUpdate.contains(id[i])){
                    originUnitIdListForInsert.add(id[i]);
                }
            }


            int insertSize = originUnitIdListForInsert.size();
            if(insertSize >0) {
                s = "(";
                for (int i = 0; i < insertSize - 1; i++) {
                    s += originUnitIdListForInsert.get(i) + ",";
                }
                s+=originUnitIdListForInsert.get(insertSize - 1)+")";
                //selecting the  id detail of insert list from origin unit table as these information will go to the real unit table
                sql = "select * from " + AllTable.TBL_OFFICE_ORIGIN_UNIT + " where id in " + s;
                ps = con.prepareStatement(sql);
                res = ps.executeQuery();
                while (res.next()) {
                    OfficeUnitDTO officeUnitDTO = new OfficeUnitDTO();
                    officeUnitDTO.setOfficeMinistryId(res.getInt("office_ministry_id"));
                    officeUnitDTO.setOfficeLayerId(res.getInt("office_layer_id"));
                    officeUnitDTO.setOfficeId(officeId);
                    officeUnitDTO.setUnitNameBng(res.getString("unit_name_bng"));
                    officeUnitDTO.setUnitNameEng(res.getString("unit_name_eng"));
                    officeUnitDTO.setParentOriginUnitId(res.getInt("parent_unit_id"));
                    officeUnitDTO.setOfficeUnitCategory(res.getString("office_unit_category"));
                    officeUnitDTO.setUnitLevel(res.getInt("unit_level"));
                    officeUnitDTO.setOfficeOriginUnitId(res.getInt("id"));
                    officeUnitDTO.setCreatedBy(userid);
                    officeUnitDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
                    officeUnitDTO.setId((int) DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICE_UNIT));
                    //advance adding becaouse we know it
                    originToIdmapping.put(officeUnitDTO.getOfficeOriginUnitId(),officeUnitDTO.getId());
                    //listing its parent origin id
                    originIdForRealId.add(officeUnitDTO.getParentOriginUnitId());
                    unitStorage.put(res.getInt("id"), officeUnitDTO);
                    officeUnitDTOS.add(officeUnitDTO);

                }


            }





            int parentSize = originIdForRealId.size();
            if(parentSize>0){
                s = "(";
                for (int value : originIdForRealId) {
                    s += value + ",";
                }
                s = s.substring(0,s.length()-1)+")";
                sql = "select id,office_origin_unit_id from " + AllTable.TBL_OFFICE_UNIT + " where office_origin_unit_id in " + s+" and office_id ="+officeId;
                ps = con.prepareStatement(sql);
                res = ps.executeQuery();
                while (res.next()) {
                    originToIdmapping.put(res.getInt("office_origin_unit_id"),res.getInt("id"));
                }
            }


            for (int i = 0; i < originUnitIdListForInsert.size(); i++) {
                OfficeUnitDTO oud = unitStorage.get(originUnitIdListForInsert.get(i));
                Integer parentunitid = originToIdmapping.get(oud.getParentOriginUnitId());
                if(parentunitid !=null){
                    oud.setParentUnitId(parentunitid);
                }
                else{
                    oud.setParentUnitId(0);
                }


            }

            con.setAutoCommit(false);
            sc = con.createStatement();
            //update
            for(int i=0;i<originUnitIdListForUpdate.size();i++){
                String logsql  ="update "+AllTable.TBL_OFFICE_UNIT+" set status = 1 " + ",modified_by = "+userid+",modified = '"+java.sql.Timestamp.from(java.time.Instant.now())+"'  where office_origin_unit_id = "+originUnitIdListForUpdate.get(i) +" and office_id = "+officeId;
                System.out.println(logsql);
                sc.addBatch(logsql);
                logsql  ="update "+AllTable.TBL_OFFICE_UNIT_ORG+" set status = 1 " + ",modified_by = "+userid+",modified = '"+java.sql.Timestamp.from(java.time.Instant.now())+"'  where office_unit_id = "+originToIdmapping.get(originUnitIdListForUpdate.get(i))+" and office_id = "+officeId;
                System.out.println(logsql);
                sc.addBatch(logsql);
            }
            //insert
            for(int i=0;i<officeUnitDTOS.size();i++){
                OfficeUnitDTO odu = officeUnitDTOS.get(i);
                odu.setCreatedBy(userid);
                odu.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));
                String logsql = "insert into "+AllTable.TBL_OFFICE_UNIT+" (id, office_ministry_id, office_layer_id, office_id, office_origin_unit_id, unit_name_bng, unit_name_eng, office_unit_category," +
                        "parent_unit_id, parent_origin_unit_id, unit_level, created_by,created) VALUES ("+odu.getId()+","+odu.getOfficeMinistryId()+","+odu.getOfficeLayerId()+","+odu.getOfficeId()+","+odu.getOfficeOriginUnitId()+",'"+odu.getUnitNameBng()+"','"+odu.getUnitNameEng()+"','"+odu.getOfficeUnitCategory()+"',"+odu.getParentUnitId()+","+odu.getParentOriginUnitId()+","+odu.getUnitLevel()+","+odu.getCreatedBy()+",'"+odu.getCreated()+"')";
                System.out.println(logsql);
                sc.addBatch(logsql);
            }


            sc.executeBatch();
            con.commit();



        }catch (Exception e){
            con.rollback();
            e.printStackTrace();
            success =0;

        } finally {
            if(con != null)con.close();
            if(sc!=null)sc.close();
        }

        return success;
    }

    public int originIdByofficeId(int officeId) throws Exception{
        int originId = 0;
        Connection con = null;
        ResultSet resultSet = null;
        PreparedStatement ps = null;
        String sql = "select office_origin_id from " + AllTable.TBL_OFFICES + " where id = ? ";

        try{
            con= DatabaseManager.getInstance().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1,officeId);
            resultSet = ps.executeQuery();
            if(resultSet.next()){
                originId = resultSet.getInt("office_origin_id");
            }

        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(ps!=null)ps.close();
        }


        return originId;
    }

    public void edit(OfficeUnitDTO officeUnitDTO) throws SQLException {
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        try {
            con= DatabaseManager.getInstance().getConnection();
            sqlJsonData.add("unit_name_bng",officeUnitDTO.getUnitNameBng());
            sqlJsonData.add("unit_name_eng",officeUnitDTO.getUnitNameEng());
            sqlJsonData.add("office_unit_category",officeUnitDTO.getOfficeUnitCategory());
            sqlJsonData.add("parent_unit_id",officeUnitDTO.getParentUnitId());
            sqlJsonData.add("unit_level",officeUnitDTO.getUnitLevel());
            sqlJsonData.add("modified_by",officeUnitDTO.getModifiedBy());
            sqlJsonData.add("modified",officeUnitDTO.getModified());
            sqlJsonData.addtoConditionANDEquall("id",officeUnitDTO.getId());
            sc.update(con,AllTable.TBL_OFFICE_UNIT,sqlJsonData);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
    }


//    public ArrayList<OfficeUnitDTO> getOfficeUnitListByOfficeId(int id) {
//        return null;
//    }

    ArrayList<OfficeUnitDTO> getOfficeUnitListByOfficeId(int id) throws Exception{
        ArrayList<OfficeUnitDTO> officeUnitDTOS = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        Connection con = null;
        ResultSet resultSet = null;


        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_id",id);
            count = sc.tableDatacount("office_units");
            resultSet = sc.select(con,"office_units", data);
            officeUnitDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeUnitDTOS;
    }
}
