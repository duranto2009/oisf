package com.revesoft.springboot.web.office.officeunitorganogram;

import com.revesoft.springboot.web.employee.employeeoffice.EmployeeOfficeDAO;
import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;

import org.jose4j.json.internal.json_simple.JSONObject;
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
public class OfficeUnitOrganogramDAO {

    int count ;
    @Autowired
    EmployeeOfficeDAO employeeOfficeDAO;
    ArrayList<OfficeUnitOrganogramDTO> autoFill(ResultSet resultSet){
        ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogramDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                officeUnitOrganogramDTOList.add(new OfficeUnitOrganogramDTO(resultSet.getInt("id"),
                        resultSet.getInt("office_id"),
                        resultSet.getInt("office_unit_id"),
                        resultSet.getInt("superior_unit_id"),
                        resultSet.getInt("superior_designation_id"),
                        resultSet.getInt("ref_origin_unit_org_id"),
                        resultSet.getInt("ref_sup_origin_unit_desig_id"),
                        resultSet.getInt("ref_sup_origin_unit_id"),
                        resultSet.getString("designation_eng"),
                        resultSet.getString("designation_bng"),
                        resultSet.getString("short_name_eng"),
                        resultSet.getString("short_name_bng"),
                        resultSet.getInt("designation_level"),
                        resultSet.getInt("designation_sequence"),
                        resultSet.getString("designation_description"),
                        resultSet.getByte("status"),
                        resultSet.getInt("created_by"),
                        resultSet.getInt("modified_by"),
                        resultSet.getTimestamp("created"),
                        resultSet.getTimestamp("modified")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return officeUnitOrganogramDTOList;
    }

    ArrayList<OfficeUnitOrganogramDTO> autoFill2(ResultSet resultSet){
        ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogramDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                OfficeUnitOrganogramDTO of= new OfficeUnitOrganogramDTO();
                of.setId(resultSet.getInt("id"));
                of.setRefOriginUnitOrgId( resultSet.getInt("ref_origin_unit_org_id"));
                of.setRefSupOriginUnitDesigId( resultSet.getInt("ref_sup_origin_unit_desig_id"));
                of.setRefSupOriginUnitId( resultSet.getInt("ref_sup_origin_unit_id"));
                of.setStatus(resultSet.getByte("status"));
                officeUnitOrganogramDTOList.add(of);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return officeUnitOrganogramDTOList;
    }


    public ArrayList<OfficeUnitOrganogramDTO> getOfficeUnitOrganogramListByOfficeUnitId(int id)throws Exception{
        ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogramDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc= new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_unit_id",id);
            data.addtoConditionANDEquall("status",1);
            count = sc.tableDatacount("office_unit_organograms");
            resultSet = sc.select(con,"office_unit_organograms", data);
            officeUnitOrganogramDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeUnitOrganogramDTOS;
    }

    public int getOfficeIdByOrganogramId(long id)throws Exception{
        int officeId=-100;
        Connection con = null;
        ResultSet resultSet = null;
        PreparedStatement ps=null;
        SQLStatementCreator sc= new SQLStatementCreator();
        String sql= " Select office_id from "+AllTable.TBL_OFFICE_UNIT_ORG+ " where id=? ";

        try{
            con= DatabaseManager.getInstance().getConnection();
            ps=con.prepareStatement(sql);
            ps.setLong(1,id);
            resultSet=ps.executeQuery();
            while (resultSet.next()){
                officeId=resultSet.getInt("office_id");
            }




        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeId;
    }

    public ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogrambyOffice(int id) throws Exception{
        ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogramDTOS = null;
        Connection con = null;
        ResultSet resultSet = null;

        SQLStatementCreator sc = new SQLStatementCreator();
        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_id",id);
            data.addtoConditionANDEquall("status",1);
            resultSet = sc.select(con, AllTable.TBL_OFFICE_UNIT_ORG, data);
            officeUnitOrganogramDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeUnitOrganogramDTOS;
    }

    int deleteOrganogram(int[] id) throws Exception{
        Connection con = null;
        PreparedStatement sc = null;
        int success =1;
        try{
            con= DatabaseManager.getInstance().getConnection();

            String s = "(";
            for(int i=0;i<id.length-1;i++){
                s += id[i]+",";
            }
            s+=id[id.length-1]+")";


            con.setAutoCommit(false);

            String sql = "update "+AllTable.TBL_OFFICE_UNIT_ORG+" set status=0 where id in "+s;
            sc = con.prepareStatement(sql);
            sc.executeUpdate();
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

    public int deleteOrganogramList(int[] id, int userId) throws Exception{
       // if(employeeOfficeDAO.doesOrganogramHasEmployeeCheckedByOrganograms(id))return 2;
        Connection con = null;
        Statement sc = null;
        int success =1;
        String sql ;
        try{
            con= DatabaseManager.getInstance().getConnection();
            con.setAutoCommit(false);
            sc = con.createStatement();


            String s = "(";
            for(int i=0;i<id.length-1;i++){
                s += id[i]+",";
            }
            s+=id[id.length-1]+")";

            sql = "update "+AllTable.TBL_OFFICE_UNIT_ORG+" set status=0" + ",modified_by = "+userId+",modified = '"+java.sql.Timestamp.from(java.time.Instant.now())+"' where id in "+s;
            //  sc.addBatch("delete from "+AllTable.TBL_OFFICE_UNIT+" where id = "+id[i]+" ");
            System.out.println(sql);
            sc.addBatch(sql);

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

    public void refreshSuperiorUnitId(HashMap<Integer, JSONObject> updatelist, HashMap<Integer, JSONObject> insertlist){
        HashMap<Integer, JSONObject> mergedList = new HashMap<>();
        for(int key:updatelist.keySet()){
            if(mergedList.get(key)!=null){
                System.out.println("if this line print then i have to understand that there id s existing element in this list but it should not be ocurred");
            }
            else{
                mergedList.put(key,updatelist.get(key));
            }
        }
        for(int key:insertlist.keySet()){
            if(mergedList.get(key)!=null){
                System.out.println("if this line print then i have to understand that there id s existing element in this list but it should not be ocurred");
            }
            else{
                mergedList.put(key,insertlist.get(key));
            }
        }

        for(int key:mergedList.keySet()){

            JSONObject js = mergedList.get(key);
            OfficeUnitOrganogramDTO officeUnitOrganogramDTO  = (OfficeUnitOrganogramDTO)(js.get("object"));
            int superiorTemplateId = officeUnitOrganogramDTO.getRefSupOriginUnitDesigId();
            JSONObject jsonObject = mergedList.get(superiorTemplateId);
            if(jsonObject!=null) {
                OfficeUnitOrganogramDTO officeUnitOrganogramDTO1 =(OfficeUnitOrganogramDTO)jsonObject.get("object");
                officeUnitOrganogramDTO.setSuperiorDesignationId(officeUnitOrganogramDTO1.getId());
            }
        }



    }

    public int transferOrganogram(String[] id, int officeId) throws Exception{

        HashMap<Integer,JSONObject> idListWithInfo = new HashMap<>();

        for(int i=0;i<id.length;i++){
            String s = id[i];
            String[] splited = s.split(":");
            JSONObject js = new JSONObject();
            js.put("originorgid",Integer.parseInt(splited[0]));
            js.put("originsuporgid",Integer.parseInt(splited[1]));
            js.put("originunitid",Integer.parseInt(splited[2]));
            js.put("originsupunitid",Integer.parseInt(splited[3]));
            js.put("unitid",Integer.parseInt(splited[6]));
            js.put("supunitid",Integer.parseInt(splited[7]));

            idListWithInfo.put((int)js.get("originorgid"),js);
        }

        HashMap<Integer,JSONObject> updateRealOrganogramListMappedByTemplatedId = new HashMap<>();
        HashMap<Integer,JSONObject> insertRealOrganogramListMappedByTemplatedId = new HashMap<>();


        ArrayList<Integer> templateOrganogramApplyForInsert = new ArrayList<>();


        Connection con = null;
        Statement sc = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int success =1;



        if(id.length<=0)return  0;

        try{

            con= DatabaseManager.getInstance().getConnection();

            String s = "(";
            for(int key:idListWithInfo.keySet()){
                s += idListWithInfo.get(key).get("unitid")+",";
            }
            s=s.substring(0,s.length()-1)+")";

            //fetch realorganonogram by template organogram
            String sql = "select id,ref_origin_unit_org_id,ref_sup_origin_unit_desig_id,status from "+ AllTable.TBL_OFFICE_UNIT_ORG+" where office_id = "+officeId+" and office_unit_id in "+s;

            System.out.println(sql);

            ps = con.prepareStatement(sql);
            res = ps.executeQuery();

            ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogramDTOS = autoFill2(res);
            for(int i=0;i<officeUnitOrganogramDTOS.size();i++){
                OfficeUnitOrganogramDTO ot = officeUnitOrganogramDTOS.get(i);
                JSONObject js = new JSONObject();
                boolean used = false;
                if(ot.getSuperiorDesignationId() ==0 ){
                    js.put("parent",0);
                    used = true;
                }
                if(ot.getStatus() == 0 && idListWithInfo.get(ot.getRefOriginUnitOrgId())!=null){
                    js.put("status",0);
                    used = true;
                }
                if(used){
                    js.put("object",ot);
                    updateRealOrganogramListMappedByTemplatedId.put(ot.getRefOriginUnitOrgId(),js);
                }
            }
            //setting the parent among the update list mainly for the inactive org
            for(int key:updateRealOrganogramListMappedByTemplatedId.keySet()){
                JSONObject wrapDTO = updateRealOrganogramListMappedByTemplatedId.get(key);
                OfficeUnitOrganogramDTO ot = (OfficeUnitOrganogramDTO) wrapDTO.get("object");
                JSONObject jsonObject = idListWithInfo.get(ot.getRefOriginUnitOrgId());
                if(jsonObject!=null) {
                    int superiorUnitOrgId = (int) jsonObject.get("originsuporgid");
                    JSONObject jsonObject1 = (JSONObject) updateRealOrganogramListMappedByTemplatedId.get(superiorUnitOrgId);
                    if(jsonObject1!=null){
                        OfficeUnitOrganogramDTO officeUnitOrganogramDTO = (OfficeUnitOrganogramDTO) jsonObject1.get("object");
                        ot.setSuperiorDesignationId(officeUnitOrganogramDTO.getId());
                    }

                }
            }



            for ( int key : idListWithInfo.keySet() ) {
                if(updateRealOrganogramListMappedByTemplatedId.get(key)==null){
                    templateOrganogramApplyForInsert.add(key);
                }
            }




            int insertSize = templateOrganogramApplyForInsert.size();
            if(insertSize >0) {
                s = "(";
                for (int i = 0; i < insertSize - 1; i++) {
                    s += templateOrganogramApplyForInsert.get(i) + ",";
                }
                s+=templateOrganogramApplyForInsert.get(insertSize - 1)+")";
                sql = "select * from " + AllTable.TBL_OFFICE_ORIGIN_UNIT_ORG + " where id in " + s;

                System.out.println(sql);

                ps = con.prepareStatement(sql);
                res = ps.executeQuery();
                while (res.next()) {

                    OfficeUnitOrganogramDTO officeUnitOrganogramDTO = new OfficeUnitOrganogramDTO();
                    officeUnitOrganogramDTO.setRefOriginUnitOrgId(res.getInt("id"));
                    officeUnitOrganogramDTO.setRefSupOriginUnitDesigId(res.getInt("superior_designation_id"));
                    officeUnitOrganogramDTO.setRefSupOriginUnitId(res.getInt("superior_unit_id"));
                    officeUnitOrganogramDTO.setDesignationEng(res.getString("designation_eng"));
                    officeUnitOrganogramDTO.setDesignationBng(res.getString("designation_bng"));
                    officeUnitOrganogramDTO.setShortNameEng(res.getString("short_name_eng"));
                    officeUnitOrganogramDTO.setShortNameBng(res.getString("short_name_bng"));
                    officeUnitOrganogramDTO.setDesignationLevel(res.getInt("designation_level"));
                    officeUnitOrganogramDTO.setDesignationSequence(res.getInt("designation_sequence"));
                    officeUnitOrganogramDTO.setOfficeId(officeId);
                    officeUnitOrganogramDTO.setOfficeUnitId((int)idListWithInfo.get(res.getInt("id")).get("unitid"));
                    officeUnitOrganogramDTO.setSuperiorUnitId((int)idListWithInfo.get(res.getInt("id")).get("supunitid"));
                    officeUnitOrganogramDTO.setId((int) DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICE_UNIT_ORG));
                    JSONObject js = new JSONObject();
                    js.put("object",officeUnitOrganogramDTO);
                    insertRealOrganogramListMappedByTemplatedId.put(res.getInt("id"), js);

                }

            }


            //setting parent among the whole list
             refreshSuperiorUnitId(updateRealOrganogramListMappedByTemplatedId, insertRealOrganogramListMappedByTemplatedId);



            con.setAutoCommit(false);
            sc = con.createStatement();
            //update
            for(int key:updateRealOrganogramListMappedByTemplatedId.keySet()){
                String logsql;
                JSONObject js = updateRealOrganogramListMappedByTemplatedId.get(key);
                if(js.get("parent")!=null && js.get("status")!=null){
                    OfficeUnitOrganogramDTO officeUnitOrganogramDTO = (OfficeUnitOrganogramDTO) js.get("object");
                    logsql = "update "+ AllTable.TBL_OFFICE_UNIT_ORG+" set superior_designation_id = "+officeUnitOrganogramDTO.getSuperiorDesignationId() +", status = 1 where id = "+officeUnitOrganogramDTO.getId();
                    System.out.println(logsql);
                    sc.addBatch(logsql);
                }else if(js.get("parent")!=null){
                    OfficeUnitOrganogramDTO officeUnitOrganogramDTO = (OfficeUnitOrganogramDTO) js.get("object");
                    logsql = "update "+ AllTable.TBL_OFFICE_UNIT_ORG+" set superior_designation_id = "+officeUnitOrganogramDTO.getSuperiorDesignationId() +" where id = "+officeUnitOrganogramDTO.getId();
                    System.out.println(logsql);
                    sc.addBatch(logsql);

                }else if(js.get("status")!=null){
                    OfficeUnitOrganogramDTO officeUnitOrganogramDTO = (OfficeUnitOrganogramDTO) js.get("object");
                    logsql = "update "+ AllTable.TBL_OFFICE_UNIT_ORG+" set  status = 1 where id = "+officeUnitOrganogramDTO.getId();
                    System.out.println(logsql);
                    sc.addBatch(logsql);

                }
            }
//            //insert
            for(int key:insertRealOrganogramListMappedByTemplatedId.keySet()){
                JSONObject js = insertRealOrganogramListMappedByTemplatedId.get(key);
                OfficeUnitOrganogramDTO ot = (OfficeUnitOrganogramDTO) js.get("object");

                String logsql = "insert into "+AllTable.TBL_OFFICE_UNIT_ORG+" (id, office_id, office_unit_id, superior_unit_id, superior_designation_id, ref_origin_unit_org_id, ref_sup_origin_unit_desig_id, ref_sup_origin_unit_id," +
                        "designation_eng, designation_bng, short_name_eng, short_name_bng,designation_level,designation_sequence,created_by) VALUES ("+ot.getId()+"," +
                        ""+ot.getOfficeId()+","+ot.getOfficeUnitId()+","+ot.getSuperiorUnitId()+","+ot.getSuperiorDesignationId()+","+ot.getRefOriginUnitOrgId()+","+ot.getRefSupOriginUnitDesigId()+","+ot.getRefSupOriginUnitId()+",'"+ot.getDesignationEng()+"','" +
                        ""+ot.getDesignationBng()+"','"+ot.getShortNameEng()+"','"+ot.getShortNameBng()+"',"+ot.getDesignationLevel()+","+ot.getDesignationSequence()+","+ot.getCreatedBy()+")";
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

    public int transferOrganogram2(String[] id, int officeId) throws Exception{

        //problem specification in this case: child(organogram) may have been  added before parent(superior organogram) but at last this problem will be solvd in a incremental (upadate and insert)
        HashMap<Integer,JSONObject> idListWithInfo = new HashMap<>();
        Set<Integer> allPossibleOrgId = new HashSet<>();

        for(int i=0;i<id.length;i++){
            String s = id[i];
            String[] splited = s.split(":");
            JSONObject js = new JSONObject();
            js.put("originorgid",Integer.parseInt(splited[0]));
            js.put("originsuporgid",Integer.parseInt(splited[1]));
            js.put("originunitid",Integer.parseInt(splited[2]));
            js.put("originsupunitid",Integer.parseInt(splited[3]));
            js.put("unitid",Integer.parseInt(splited[6]));
            js.put("supunitid",Integer.parseInt(splited[7]));
            if((int)js.get("originorgid")!=0)allPossibleOrgId.add((int)js.get("originorgid"));
            if((int)js.get("originsuporgid")!=0)allPossibleOrgId.add((int)js.get("originsuporgid"));
            idListWithInfo.put((int)js.get("originorgid"),js);

        }

        System.out.println(allPossibleOrgId);

        HashMap<Integer,OfficeUnitOrganogramDTO> updateRealOrganogramListMappedByTemplatedId = new HashMap<>();
        HashMap<Integer,OfficeUnitOrganogramDTO> insertRealOrganogramListMappedByTemplatedId = new HashMap<>();


        ArrayList<Integer> templateOrganogramApplyForInsert = new ArrayList<>();




        Connection con = null;
        Statement sc = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int success =1;



        if(id.length<=0)return  0;

        try{

            con= DatabaseManager.getInstance().getConnection();

            String s = "(";
            for(int key:allPossibleOrgId){
                s += key+",";
            }
            s=s.substring(0,s.length()-1)+")";

            System.out.println(s);
            //fetch realorganonogram by template organogram
            String sql = "select id,ref_origin_unit_org_id,ref_sup_origin_unit_desig_id,ref_sup_origin_unit_id,status from "+ AllTable.TBL_OFFICE_UNIT_ORG+" where office_id = "+officeId+" and ref_origin_unit_org_id in "+s +" or ref_sup_origin_unit_desig_id in s";

            System.out.println(sql);

            ps = con.prepareStatement(sql);
            res = ps.executeQuery();

            ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogramDTOS = autoFill2(res);
            for(int i=0;i<officeUnitOrganogramDTOS.size();i++){
                OfficeUnitOrganogramDTO ot = officeUnitOrganogramDTOS.get(i);
                updateRealOrganogramListMappedByTemplatedId.put(ot.getRefOriginUnitOrgId(),ot);
            }




            for ( int key : idListWithInfo.keySet() ) {
                if(updateRealOrganogramListMappedByTemplatedId.get(key)==null){
                    templateOrganogramApplyForInsert.add(key);
                }
            }




            int insertSize = templateOrganogramApplyForInsert.size();
            if(insertSize >0) {
                s = "(";
                for (int i = 0; i < insertSize - 1; i++) {
                    s += templateOrganogramApplyForInsert.get(i) + ",";
                }
                s+=templateOrganogramApplyForInsert.get(insertSize - 1)+")";
                sql = "select * from " + AllTable.TBL_OFFICE_ORIGIN_UNIT_ORG + " where id in " + s;

                System.out.println(sql);

                ps = con.prepareStatement(sql);
                res = ps.executeQuery();
                while (res.next()) {

                    OfficeUnitOrganogramDTO officeUnitOrganogramDTO = new OfficeUnitOrganogramDTO();
                    officeUnitOrganogramDTO.setRefOriginUnitOrgId(res.getInt("id"));
                    officeUnitOrganogramDTO.setRefSupOriginUnitDesigId(res.getInt("superior_designation_id"));
                    officeUnitOrganogramDTO.setRefSupOriginUnitId(res.getInt("superior_unit_id"));
                    officeUnitOrganogramDTO.setDesignationEng(res.getString("designation_eng"));
                    officeUnitOrganogramDTO.setDesignationBng(res.getString("designation_bng"));
                    officeUnitOrganogramDTO.setShortNameEng(res.getString("short_name_eng"));
                    officeUnitOrganogramDTO.setShortNameBng(res.getString("short_name_bng"));
                    officeUnitOrganogramDTO.setDesignationLevel(res.getInt("designation_level"));
                    officeUnitOrganogramDTO.setDesignationSequence(res.getInt("designation_sequence"));
                    officeUnitOrganogramDTO.setOfficeId(officeId);
                    officeUnitOrganogramDTO.setOfficeUnitId((int)idListWithInfo.get(res.getInt("id")).get("unitid"));
                    officeUnitOrganogramDTO.setSuperiorUnitId((int)idListWithInfo.get(res.getInt("id")).get("supunitid"));
                    officeUnitOrganogramDTO.setId((int) DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICE_UNIT_ORG));

                    insertRealOrganogramListMappedByTemplatedId.put(res.getInt("id"), officeUnitOrganogramDTO);

                }

            }


            HashMap<Integer, OfficeUnitOrganogramDTO> mergedList = new HashMap<>();
            for(int key:updateRealOrganogramListMappedByTemplatedId.keySet()){
                if(mergedList.get(key)!=null){
                    System.out.println("if this line print then i have to understand that there id s existing element in this list but it should not be ocurred");
                }
                else{
                    mergedList.put(key,updateRealOrganogramListMappedByTemplatedId.get(key));
                }
            }
            for(int key:insertRealOrganogramListMappedByTemplatedId.keySet()){
                if(mergedList.get(key)!=null){
                    System.out.println("if this line print then i have to understand that there id s existing element in this list but it should not be ocurred");
                }
                else{
                    mergedList.put(key,insertRealOrganogramListMappedByTemplatedId.get(key));
                }
            }

            for(int key:mergedList.keySet()){

                OfficeUnitOrganogramDTO officeUnitOrganogramDTO  = mergedList.get(key);
                int superiorTemplateId = officeUnitOrganogramDTO.getRefSupOriginUnitDesigId();

                OfficeUnitOrganogramDTO officeUnitOrganogramDTO1 =mergedList.get(superiorTemplateId);
                if(officeUnitOrganogramDTO1!=null)officeUnitOrganogramDTO.setSuperiorDesignationId(officeUnitOrganogramDTO1.getId());

            }




            con.setAutoCommit(false);
            sc = con.createStatement();
            //update
            for(int key:updateRealOrganogramListMappedByTemplatedId.keySet()){
                String logsql;
                OfficeUnitOrganogramDTO officeUnitOrganogramDTO = updateRealOrganogramListMappedByTemplatedId.get(key);
                if(officeUnitOrganogramDTO.getStatus() == 0 && idListWithInfo.get(officeUnitOrganogramDTO.getRefOriginUnitOrgId())!=null){
                    logsql = "update "+ AllTable.TBL_OFFICE_UNIT_ORG+" set superior_designation_id = "+officeUnitOrganogramDTO.getSuperiorDesignationId()+",office_unit_id = "+(int)idListWithInfo.get(officeUnitOrganogramDTO.getRefOriginUnitOrgId()).get("unitid")+",superior_unit_id = "+(int)idListWithInfo.get(officeUnitOrganogramDTO.getRefOriginUnitOrgId()).get("supunitid") +", status = 1 where id = "+officeUnitOrganogramDTO.getId();
                    System.out.println(logsql);
                    sc.addBatch(logsql);
                }


            }
//            //insert
            for(int key:insertRealOrganogramListMappedByTemplatedId.keySet()){

                OfficeUnitOrganogramDTO ot = insertRealOrganogramListMappedByTemplatedId.get(key);

                String logsql = "insert into "+AllTable.TBL_OFFICE_UNIT_ORG+" (id, office_id, office_unit_id, superior_unit_id, superior_designation_id, ref_origin_unit_org_id, ref_sup_origin_unit_desig_id, ref_sup_origin_unit_id," +
                        "designation_eng, designation_bng, short_name_eng, short_name_bng,designation_level,designation_sequence,created_by) VALUES ("+ot.getId()+"," +
                        ""+ot.getOfficeId()+","+ot.getOfficeUnitId()+","+ot.getSuperiorUnitId()+","+ot.getSuperiorDesignationId()+","+ot.getRefOriginUnitOrgId()+","+ot.getRefSupOriginUnitDesigId()+","+ot.getRefSupOriginUnitId()+",'"+ot.getDesignationEng()+"','" +
                        ""+ot.getDesignationBng()+"','"+ot.getShortNameEng()+"','"+ot.getShortNameBng()+"',"+ot.getDesignationLevel()+","+ot.getDesignationSequence()+","+ot.getCreatedBy()+")";
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


    public int transferOrganogram3(String[] id, int officeId, int userId) throws Exception{

        //superior is reporting boss not the parent child relation
        HashMap<Integer,JSONObject> idListWithInfo = new HashMap<>();
        Set<Integer> allPossibleOrgId = new HashSet<>();

        //formatting input
        for(int i=0;i<id.length;i++){
            String s = id[i];
            String[] splited = s.split(":");
            JSONObject js = new JSONObject();
            js.put("originorgid",Integer.parseInt(splited[0]));
            js.put("originsuporgid",Integer.parseInt(splited[1]));
            js.put("originunitid",Integer.parseInt(splited[2]));
            js.put("originparentunitid",Integer.parseInt(splited[3]));
            js.put("unitid",Integer.parseInt(splited[6]));
            js.put("parentunitid",Integer.parseInt(splited[7]));
            if((int)js.get("originorgid")!=0)allPossibleOrgId.add((int)js.get("originorgid"));
            if((int)js.get("originsuporgid")!=0)allPossibleOrgId.add((int)js.get("originsuporgid"));
            idListWithInfo.put((int)js.get("originorgid"),js);

        }

        System.out.println(allPossibleOrgId);

        HashMap<Integer,OfficeUnitOrganogramDTO> updateRealOrganogramListMappedByTemplatedId = new HashMap<>();
        HashMap<Integer,OfficeUnitOrganogramDTO> insertRealOrganogramListMappedByTemplatedId = new HashMap<>();


        ArrayList<Integer> templateOrganogramApplyForInsert = new ArrayList<>();

        HashMap<Integer,Integer> originorg_realorg =new HashMap<>();
        HashMap<Integer, Integer> originunit_realunit = new HashMap<>();




        Connection con = null;
        Statement sc = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int success =1;
        String logsql = "";



        if(id.length<=0)return  0;

        try{

            con= DatabaseManager.getInstance().getConnection();

            //Mapping origin unit to real unit based on superior_origin_unit_id in orgnaogram
            logsql = "select id, office_origin_unit_id from office_units where office_origin_unit_id in (select ref_sup_origin_unit_id from office_unit_organograms where office_id ="+officeId+")";
            sc = con.createStatement();

            res = sc.executeQuery(logsql);
            while(res.next()){
                originunit_realunit.put(res.getInt("office_origin_unit_id"),res.getInt("id"));
            }

            res.close();
            String s = "(";
            for(int key:allPossibleOrgId){
                s += key+",";
            }
            s=s.substring(0,s.length()-1)+")";

            System.out.println(s);
            //fetch realorganonogram related to anything with origin_org_id and superior_origin_id
            //it will justufy which one is being update or being inserted
            //it will just keep the list for update
            String sql = "select id,ref_origin_unit_org_id,ref_sup_origin_unit_desig_id,ref_sup_origin_unit_id,status from "+ AllTable.TBL_OFFICE_UNIT_ORG+" where office_id = "+officeId+" and ref_origin_unit_org_id in "+s +" or ref_sup_origin_unit_desig_id in "+s;

            System.out.println(sql);

            ps = con.prepareStatement(sql);
            res = ps.executeQuery();

            ArrayList<OfficeUnitOrganogramDTO> officeUnitOrganogramDTOS = autoFill2(res);
            for(int i=0;i<officeUnitOrganogramDTOS.size();i++){
                OfficeUnitOrganogramDTO ot = officeUnitOrganogramDTOS.get(i);
                updateRealOrganogramListMappedByTemplatedId.put(ot.getRefOriginUnitOrgId(),ot);
                originorg_realorg.put(ot.getRefOriginUnitOrgId(),ot.getId());
            }


            //isolating the id for insert

            for ( int key : idListWithInfo.keySet() ) {
                if(updateRealOrganogramListMappedByTemplatedId.get(key)==null){
                    templateOrganogramApplyForInsert.add(key);
                }
            }




            int insertSize = templateOrganogramApplyForInsert.size();
            if(insertSize >0) {
                s = "(";
                for (int i = 0; i < insertSize - 1; i++) {
                    s += templateOrganogramApplyForInsert.get(i) + ",";
                }
                s+=templateOrganogramApplyForInsert.get(insertSize - 1)+")";

                //getting detail for brand new organogram
                sql = "select * from " + AllTable.TBL_OFFICE_ORIGIN_UNIT_ORG + " where id in " + s;

                System.out.println(sql);

                ps = con.prepareStatement(sql);
                res = ps.executeQuery();
                while (res.next()) {

                    OfficeUnitOrganogramDTO officeUnitOrganogramDTO = new OfficeUnitOrganogramDTO();
                    officeUnitOrganogramDTO.setRefOriginUnitOrgId(res.getInt("id"));
                    officeUnitOrganogramDTO.setRefSupOriginUnitDesigId(res.getInt("superior_designation_id"));
                    officeUnitOrganogramDTO.setRefSupOriginUnitId(res.getInt("superior_unit_id"));
                    officeUnitOrganogramDTO.setDesignationEng(res.getString("designation_eng"));
                    officeUnitOrganogramDTO.setDesignationBng(res.getString("designation_bng"));
                    officeUnitOrganogramDTO.setShortNameEng(res.getString("short_name_eng"));
                    officeUnitOrganogramDTO.setShortNameBng(res.getString("short_name_bng"));
                    officeUnitOrganogramDTO.setDesignationLevel(res.getInt("designation_level"));
                    officeUnitOrganogramDTO.setDesignationSequence(res.getInt("designation_sequence"));
                    officeUnitOrganogramDTO.setOfficeId(officeId);
                    officeUnitOrganogramDTO.setOfficeUnitId((int)idListWithInfo.get(res.getInt("id")).get("unitid"));
//                    officeUnitOrganogramDTO.setSuperiorUnitId((int)idListWithInfo.get(res.getInt("id")).get("supunitid"));
                    officeUnitOrganogramDTO.setId((int) DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICE_UNIT_ORG));

                    insertRealOrganogramListMappedByTemplatedId.put(res.getInt("id"), officeUnitOrganogramDTO);

                    originorg_realorg.put(officeUnitOrganogramDTO.getRefOriginUnitOrgId(),officeUnitOrganogramDTO.getId());

                }

            }


            //merging update list
            HashMap<Integer, OfficeUnitOrganogramDTO> mergedList = new HashMap<>();
            for(int key:updateRealOrganogramListMappedByTemplatedId.keySet()){
                if(mergedList.get(key)!=null){
                    System.out.println("if this line print then i have to understand that there is a duplicate id  existing element in this list but it should not be ocurred");
                }
                else{
                    mergedList.put(key,updateRealOrganogramListMappedByTemplatedId.get(key));
                }
            }
            //merging insert list
            for(int key:insertRealOrganogramListMappedByTemplatedId.keySet()){
                if(mergedList.get(key)!=null){
                    System.out.println("if this line print then i have to understand that  id is existing element in this list but it should not be ocurred");
                }
                else{
                    mergedList.put(key,insertRealOrganogramListMappedByTemplatedId.get(key));
                }
            }
            //resolving the superiority of organogram
            for(int key:mergedList.keySet()){

                OfficeUnitOrganogramDTO officeUnitOrganogramDTO  = mergedList.get(key);
                if(originorg_realorg.get(officeUnitOrganogramDTO.getRefSupOriginUnitDesigId())!=null)
                officeUnitOrganogramDTO.setSuperiorDesignationId(originorg_realorg.get(officeUnitOrganogramDTO.getRefSupOriginUnitDesigId()));
                if(originunit_realunit.get(officeUnitOrganogramDTO.getRefSupOriginUnitId())!=null)
                    officeUnitOrganogramDTO.setSuperiorUnitId(originunit_realunit.get(officeUnitOrganogramDTO.getRefSupOriginUnitId()));

            }




            con.setAutoCommit(false);
            sc = con.createStatement();
            //update
            for(int key:updateRealOrganogramListMappedByTemplatedId.keySet()){

                OfficeUnitOrganogramDTO officeUnitOrganogramDTO = updateRealOrganogramListMappedByTemplatedId.get(key);
                if(officeUnitOrganogramDTO.getStatus() == 0 && idListWithInfo.get(officeUnitOrganogramDTO.getRefOriginUnitOrgId())!=null){
                    logsql = "update "+ AllTable.TBL_OFFICE_UNIT_ORG+" set superior_designation_id = "+officeUnitOrganogramDTO.getSuperiorDesignationId()+",superior_unit_id = "+officeUnitOrganogramDTO.getSuperiorUnitId() +", status = 1 " + ",modified_by = "+userId+",modified = '"+java.sql.Timestamp.from(java.time.Instant.now())+"'  where id = "+officeUnitOrganogramDTO.getId();
                    System.out.println(logsql);
                    sc.addBatch(logsql);
                }
                else if(idListWithInfo.get(officeUnitOrganogramDTO.getRefOriginUnitOrgId())==null){
                    logsql = "update "+ AllTable.TBL_OFFICE_UNIT_ORG+" set superior_designation_id = "+officeUnitOrganogramDTO.getSuperiorDesignationId()+",superior_unit_id = "+officeUnitOrganogramDTO.getSuperiorUnitId() +" " + ",modified_by = "+userId+",modified = '"+java.sql.Timestamp.from(java.time.Instant.now())+"'   where id = "+officeUnitOrganogramDTO.getId();
                    System.out.println(logsql);
                    sc.addBatch(logsql);
                }


            }
           //insert
            for(int key:insertRealOrganogramListMappedByTemplatedId.keySet()){

                OfficeUnitOrganogramDTO ot = insertRealOrganogramListMappedByTemplatedId.get(key);

            logsql = "insert into "+AllTable.TBL_OFFICE_UNIT_ORG+" (id, office_id, office_unit_id, superior_unit_id, superior_designation_id, ref_origin_unit_org_id, ref_sup_origin_unit_desig_id, ref_sup_origin_unit_id," +
                        "designation_eng, designation_bng, short_name_eng, short_name_bng,designation_level,designation_sequence,created_by,created) VALUES ("+ot.getId()+"," +
                        ""+ot.getOfficeId()+","+ot.getOfficeUnitId()+","+ot.getSuperiorUnitId()+","+ot.getSuperiorDesignationId()+","+ot.getRefOriginUnitOrgId()+","+ot.getRefSupOriginUnitDesigId()+","+ot.getRefSupOriginUnitId()+",'"+ot.getDesignationEng()+"','" +
                        ""+ot.getDesignationBng()+"','"+ot.getShortNameEng()+"','"+ot.getShortNameBng()+"',"+ot.getDesignationLevel()+","+ot.getDesignationSequence()+","+userId+",'"+java.sql.Timestamp.from(java.time.Instant.now())+"')";
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

    public ArrayList<JSONObject> orgbyOriginOrg(int id) throws  Exception{
        ArrayList<JSONObject> officeUnitOrganogramDTOS = new ArrayList<>();
        Connection con = null;
        ResultSet resultSet = null;
        Statement statement = null;
        String sql = "";

        try{
            con= DatabaseManager.getInstance().getConnection();
            sql = "select org.id,org.ref_origin_unit_org_id,org.designation_bng,  off.office_name_bng from office_unit_organograms org left join offices off on org.office_id = off.id where org.ref_origin_unit_org_id = "+id;
            System.out.println(sql);
            statement = con.createStatement();
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id",resultSet.getString("id"));
                jsonObject.put("originid",resultSet.getString("ref_origin_unit_org_id"));
                jsonObject.put("organogram",resultSet.getString("designation_bng"));
                jsonObject.put("office",resultSet.getString("office_name_bng"));
                officeUnitOrganogramDTOS.add(jsonObject);
            }


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(statement!=null)statement.close();
        }
        return officeUnitOrganogramDTOS;
    }
}
