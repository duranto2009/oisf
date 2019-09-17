package com.revesoft.springboot.web.office.originunitorganogram;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by reve on 11/8/2017.
 */
@Repository
public class OriginUnitOrganogramDAO {

    int count ;

    ArrayList<OriginUnitOrganogramDTO> autoFill(ResultSet resultSet){
        ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                originUnitOrganogramDTOList.add(new OriginUnitOrganogramDTO(resultSet.getInt("id"),
                        resultSet.getInt("office_origin_unit_id"),
                        resultSet.getInt("superior_unit_id"),
                        resultSet.getInt("superior_designation_id"),
                        resultSet.getString("designation_eng"),
                        resultSet.getString("designation_bng"),
                        resultSet.getString("short_name_eng"),
                        resultSet.getString("short_name_bng"),
                        resultSet.getInt("designation_level"),
                        resultSet.getInt("designation_sequence"),
                        resultSet.getByte("status"),
                        resultSet.getInt("created_by"),
                        resultSet.getInt("modified_by"),
                        resultSet.getTimestamp("created"),
                        resultSet.getTimestamp("modified")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return originUnitOrganogramDTOList;
    }

    ArrayList<OriginUnitOrganogramDTO> autoFill2(ResultSet resultSet){
        ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                originUnitOrganogramDTOList.add(new OriginUnitOrganogramDTO(resultSet.getInt("id"),
                        resultSet.getString("designation_bng")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return originUnitOrganogramDTOList;
    }


    public ArrayList<OriginUnitOrganogramDTO> getOfficeOriginUnitOrganogramListByOfficeOriginUnitId(int id)throws Exception{
        ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_origin_unit_id",id);
            count = sc.tableDatacount("office_origin_unit_organograms");
            resultSet = sc.select(con,"office_origin_unit_organograms", data);
            originUnitOrganogramDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return originUnitOrganogramDTOS;
    }

    public ArrayList<OriginUnitOrganogramDTO> jOriginOrgbyOriginUnit(int id) throws Exception{
        ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("id","");
            data.add("designation_bng","");
            data.addtoConditionANDEquall("office_origin_unit_id",id);
            resultSet = sc.select(con,"office_origin_unit_organograms", data);
            originUnitOrganogramDTOS = autoFill2(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return originUnitOrganogramDTOS;
    }

    public ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramsbyOriginUnits(int[] ids) throws Exception{
        ArrayList<OriginUnitOrganogramDTO> originUnitOrganogramDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        PreparedStatement ps=null;
        String sql ="";

        try{
            con= DatabaseManager.getInstance().getConnection();
            sql +="select * from office_origin_unit_organograms where office_origin_unit_id in ";
            sql +="( ";
            for (int i=0;i<ids.length-1;i++){
                sql +=""+ids[i]+",";
            }
            sql +=""+ids[ids.length-1];
            sql +=" ) and status =1";

            ps=con.prepareStatement(sql);
            resultSet=ps.executeQuery();
            originUnitOrganogramDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(ps!=null)ps.close();
        }
        return originUnitOrganogramDTOS;
    }

    public int add(OriginUnitOrganogramDTO originUnitOrganogramDTO) throws Exception{
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData sqlJsonData = new SQLJsonData();
        Connection con = null;
        try {
            con= DatabaseManager.getInstance().getConnection();
            long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICE_ORIGIN_UNIT_ORG);
            //int id = (int)ID;
            sqlJsonData.add("id", (int) ID);
            sqlJsonData.add("office_origin_unit_id",originUnitOrganogramDTO.getOfficeOriginUnitId());
            sqlJsonData.add("superior_unit_id",originUnitOrganogramDTO.getSuperiorUnitId());
            sqlJsonData.add("superior_designation_id",originUnitOrganogramDTO.getSuperiorDesignationId());
            sqlJsonData.add("designation_eng",originUnitOrganogramDTO.getDesignationEng());
            sqlJsonData.add("designation_bng",originUnitOrganogramDTO.getDesignationBng());
            sqlJsonData.add("short_name_eng",originUnitOrganogramDTO.getShortNameEng());
            sqlJsonData.add("short_name_bng",originUnitOrganogramDTO.getShortNameBng());
            sqlJsonData.add("designation_level",originUnitOrganogramDTO.getDesignationLevel());
            sqlJsonData.add("designation_sequence",originUnitOrganogramDTO.getDesignationSequence());
            sqlJsonData.add("created_by",originUnitOrganogramDTO.getCreatedBy());
            sqlJsonData.add("created",originUnitOrganogramDTO.getCreated());
            sc.insert(con,"office_origin_unit_organograms",sqlJsonData);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return  1;
    }

    public int edit(OriginUnitOrganogramDTO originUnitOrganogramDTO) throws Exception{

        Connection con = null;
        Statement statement = null;
        Statement statementForFetching = null;

        String logsql ="";
        try {
            con= DatabaseManager.getInstance().getConnection();

            statement = con.createStatement();
            con.setAutoCommit(false);
            //basic update origin organogram
            logsql = "update office_origin_unit_organograms set " +
                    "superior_unit_id = "+((originUnitOrganogramDTO.getOfficeOriginUnitId() == originUnitOrganogramDTO.getSuperiorUnitId())?0:originUnitOrganogramDTO.getSuperiorUnitId())+"," +
                    "superior_designation_id = "+originUnitOrganogramDTO.getSuperiorDesignationId()+", " +
                    "designation_eng = '"+originUnitOrganogramDTO.getDesignationEng()+"', " +
                    "designation_bng = '"+originUnitOrganogramDTO.getDesignationBng()+"', " +
                    "short_name_eng = '"+originUnitOrganogramDTO.getShortNameEng()+"', " +
                    "short_name_bng = '"+originUnitOrganogramDTO.getShortNameBng()+"', " +
                    "designation_level = "+originUnitOrganogramDTO.getDesignationLevel()+", " +
                    "designation_sequence = "+originUnitOrganogramDTO.getDesignationSequence()+", " +
                    "modified_by = "+originUnitOrganogramDTO.getModifiedBy()+", " +
                    "modified = '"+originUnitOrganogramDTO.getModified()+"' where "+
                    " id = "+originUnitOrganogramDTO.getId();

            System.out.println(logsql);
            statement.addBatch(logsql);



            statementForFetching = con.createStatement();
            logsql = "select office_id from office_unit_organograms where ref_origin_unit_org_id = "+originUnitOrganogramDTO.getId();

            ResultSet resultSet =   statementForFetching.executeQuery(logsql);
            while (resultSet.next()){
                int officeId = resultSet.getInt("office_id");
                logsql = "select id , office_unit_id from office_unit_organograms where ref_origin_unit_org_id = "+originUnitOrganogramDTO.getSuperiorDesignationId()+" and office_id = "+officeId;
                ResultSet resultSet1 = statement.executeQuery(logsql);
                int superiorOrgId =0;
                int superiorUnitId =0;
                while (resultSet1.next()){
                    superiorOrgId = resultSet1.getInt("id");
                    superiorUnitId = resultSet1.getInt("office_unit_id");
                }

                logsql = "update office_unit_organograms set superior_designation_id = " + superiorOrgId +
                        ",superior_unit_id = "+superiorUnitId+
                        ",ref_sup_origin_unit_desig_id = "+originUnitOrganogramDTO.getSuperiorDesignationId()+
                        ",ref_sup_origin_unit_id = "+originUnitOrganogramDTO.getSuperiorUnitId()+
                        ",modified_by = "+originUnitOrganogramDTO.getModifiedBy()+
                        ",modified = '"+originUnitOrganogramDTO.getModified()+
                        "' where ref_origin_unit_org_id = " + originUnitOrganogramDTO.getId() + " and office_id = " + officeId;

                System.out.println(logsql);
                statement.addBatch(logsql);
            }

            logsql = "update office_unit_organograms set " +
                    "designation_eng = '"+originUnitOrganogramDTO.getDesignationEng()+"', " +
                    "designation_bng = '"+originUnitOrganogramDTO.getDesignationBng()+"', " +
                    "short_name_eng = '"+originUnitOrganogramDTO.getShortNameEng()+"', " +
                    "short_name_bng = '"+originUnitOrganogramDTO.getShortNameBng()+"', " +
                    "designation_level = "+originUnitOrganogramDTO.getDesignationLevel()+", " +
                    "designation_sequence = "+originUnitOrganogramDTO.getDesignationSequence()+", " +
                    "modified_by = "+originUnitOrganogramDTO.getModifiedBy()+", " +
                    "modified = '"+originUnitOrganogramDTO.getModified()+"' where "+
                    " ref_origin_unit_org_id = "+originUnitOrganogramDTO.getId();
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
            if(statementForFetching !=null)statementForFetching.close();
        }
        return 1;
    }

    public int delete(OriginUnitOrganogramDTO originUnitOrganogramDTO) throws Exception{
        int success = 0;
        Connection con = null;
        Statement statement = null;
        String sql ="";
        try{
            con = DatabaseManager.getInstance().getConnection();
            statement = con.createStatement();
            sql = "select count(id) as usedcount from office_unit_organograms where status =1 and ref_origin_unit_org_id = "+originUnitOrganogramDTO.getId();
            System.out.println(sql);
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                int usedcount = resultSet.getInt("usedcount");
                if(usedcount !=0) success = 2;
            }
            if(success !=2){
                sql = "update office_origin_unit_organograms set status = 0 " + ",modified_by = "+originUnitOrganogramDTO.getModifiedBy()+",modified = '"+originUnitOrganogramDTO.getModified()+"' where id = "+originUnitOrganogramDTO.getId();
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
