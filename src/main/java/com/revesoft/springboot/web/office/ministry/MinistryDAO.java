package com.revesoft.springboot.web.office.ministry;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import databasemanager.DatabaseManager;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.Min;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Bony on 11/5/2017.
 */
@Repository
public class MinistryDAO {

    private int  count=0;

    ArrayList<MinistryDTO> autoFill(ResultSet resultSet){
        ArrayList<MinistryDTO> unionDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                unionDTOList.add(new MinistryDTO(resultSet.getInt("id"),
                        resultSet.getByte("office_type"),
                        resultSet.getString("name_eng"),
                        resultSet.getString("name_bng"),
                        resultSet.getString("name_eng_short"),
                        resultSet.getString("reference_code"),
                        resultSet.getByte("status"),
                        resultSet.getInt("created_by"),
                        resultSet.getInt("modified_by"),
                        resultSet.getTimestamp("created"),
                        resultSet.getTimestamp("modified")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return unionDTOList;
    }

//    public ArrayList<MinistryDTO> getOfficeMinistryListbyPage(int page, int pageSize) throws Exception{
//        ArrayList<MinistryDTO> officeministryList = null;
//        Connection con = null;
//        ResultSet resultSet = null;
//
//
//        try{
//            con= DatabaseManager.getInstance().getConnection();
//            SQLJsonData data = new SQLJsonData();
//            data.add("all","");
//            data.addPage("page",(page-1)*pageSize,pageSize);
//            count = sc.tableDatacount("office_ministries");
//            resultSet = sc.select(con,"office_ministries", data);
//            officeministryList = autoFill(resultSet);
//
//
//        }catch (Exception e){
//            e.printStackTrace();
//            System.out.println("excep: Problem in A getUnionListByUpazillaId method insert block Line");
//        } finally {
//            if(con != null)con.close();
//            if(sc.ps!=null)sc.ps.close();
//        }
//        return officeministryList;
//    }
//    public ArrayList<MinistryDTO> getOfficeMinistryListbyPage(int page, int pageSize, String searchMsg)  throws Exception{
//        ArrayList<MinistryDTO> officeministryList = null;
//        Connection con = null;
//        ResultSet resultSet = null;
//        try{
//            con= DatabaseManager.getInstance().getConnection();
//            SQLJsonData data = new SQLJsonData();
//            data.add("all","");
//            data.addPage("page",(page-1)*pageSize,pageSize);
//            JSONObject orclause = new JSONObject();
//                orclause.put("name_eng","%"+searchMsg+"%");
//                orclause.put("name_bng","%"+searchMsg+"%");
//                orclause.put("name_eng_short","%"+searchMsg+"%");
//                orclause.put("reference_code","%"+searchMsg+"%");
//            data.addtoConditionORLike("or1",orclause);
//            count = sc.searchCount(con,"office_ministries", data);
//            resultSet = sc.select(con,"office_ministries", data);
//            officeministryList = autoFill(resultSet);
//
//
//        }catch (Exception e){
//            e.printStackTrace();
//            System.out.println("excep: Problem in A getUnionListByUpazillaId method insert block Line");
//        } finally {
//            if(con != null)con.close();
//            if(sc.ps!=null)sc.ps.close();
//        }
//
//        return officeministryList;
//    }
//    public ArrayList<MinistryDTO> getOfficeMinistryListbyPage(int page, int pageSize, String[] searchParam) throws SQLException {
//        ArrayList<MinistryDTO> officeministryList = null;
//        Connection con = null;
//        ResultSet resultSet = null;
//        SQLJsonData js = new SQLJsonData();
//        try{
//            int searchParamSize = searchParam.length;
//            for(int i=0;i<searchParamSize;i++) {
//                String s = searchParam[i];
//                if (!s.equals("null") && !s.equals("-1") && !s.equals("")) {
//
//                    switch (i) {
//                        case 0:
//                            JSONObject or1 = new JSONObject();
//                            or1.put("name_eng", "%" + searchParam[0] + "%");
//                            or1.put("name_bng", "%" + searchParam[0] + "%");
//                            or1.put("name_eng_short", "%" + searchParam[0] + "%");
//                            js.addtoConditionORLike("or1", or1);
//                            break;
//                        case 1:
//                            js.addtoConditionANDLike("reference_code", "%" + searchParam[1] + "%");
//                            break;
//
//                    }
//                }
//            }
//            con = DatabaseManager.getInstance().getConnection();
//            js.addPage("page",(page-1)*pageSize,pageSize);
//            count = sc.searchCount(con,"office_ministries",js);
//            resultSet =sc.search(con,"office_ministries",js);
//            officeministryList = autoFill(resultSet);
//        }
//        catch (Exception ex){
//            System.out.println("Exception " + ex);
//            System.out.println("excep: Problem in UnionDAO- getUnionListbyPage method select block Line");
//        } finally {
//            if(con != null)con.close();
//            if(sc.ps!=null)sc.ps.close();
//        }
//
//        return officeministryList;
//    }
//    public int getCount() {
//        return count;
//    }

    public ArrayList<MinistryDTO> getAllministry() throws Exception{
        ArrayList<MinistryDTO> officeministryList = null;
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try{
            con = DatabaseManager.getInstance().getConnection();
            SQLJsonData js = new SQLJsonData();
            js.add("all","");
            js.addtoConditionANDEquall("status",1);
            resultSet =sc.select(con,"office_ministries",js);
            officeministryList = autoFill(resultSet);
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeministryList;
    }

    public void add( MinistryDTO ministryDTO) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try{
            con = DatabaseManager.getInstance().getConnection();
            long ID = DatabaseManager.getInstance().getNextSequenceId("office_ministries");
            SQLJsonData js = new SQLJsonData();
            js.add("name_eng", ministryDTO.getNameEng());
            js.add("name_bng", ministryDTO.getNameBng());
            js.add("name_eng_short", ministryDTO.getNameEngShort());
            js.add("office_type", ministryDTO.getOfficeType());
            js.add("reference_code", ministryDTO.getReferenceCode());
//            js.add("status", ministryDTO.getStatus());
            js.add("id",(int)ID);
            js.add("created_by", ministryDTO.getCreatedBy());
            js.add("created",ministryDTO.getCreated());
//            js.add("modified",java.sql.Timestamp.from(java.time.Instant.now()));
            sc.insert(con,"office_ministries",js);
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
    }

    public void edit( MinistryDTO ministryDTO) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try{
            con = DatabaseManager.getInstance().getConnection();
            SQLJsonData js = new SQLJsonData();
            js.add("name_eng", ministryDTO.getNameEng());
            js.add("name_bng", ministryDTO.getNameBng());
            js.add("name_eng_short", ministryDTO.getNameEngShort());
            js.add("office_type", ministryDTO.getOfficeType());
            js.add("reference_code", ministryDTO.getReferenceCode());
            js.add("modified_by", ministryDTO.getModifiedBy());
            js.add("modified",ministryDTO.getModified());
//            js.add("status", ministryDTO.getStatus());
            js.addtoConditionANDEquall("id", ministryDTO.getId());
            sc.update(con,"office_ministries",js);
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
    }
    public int delete(MinistryDTO ministryDTO) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        Statement statement = null;
        String sql = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        int success = 0;
        try{
            con = DatabaseManager.getInstance().getConnection();

             sql ="select * from office_origins where status =1 and office_ministry_id = "+ministryDTO.getId()+" limit 0,1";
             System.out.println(sql);
             statement = con.createStatement();
             ResultSet resultSet = statement.executeQuery(sql);
             if(resultSet.next()){
                 success =2;
                 return success;
             }


            sql ="select * from offices where status =1 and office_ministry_id = "+ministryDTO.getId()+" limit 0,1";
            System.out.println(sql);
            resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                success =2;
                return success;
            }


            SQLJsonData js = new SQLJsonData();
            js.add("status",0);
            js.add("modified_by", ministryDTO.getModifiedBy());
            js.add("modified",ministryDTO.getModified());
            js.addtoConditionANDEquall("id",ministryDTO.getId());
            sc.update(con,"office_ministries",js);
            success =1;
        }
        catch (Exception ex){
            success =0;
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return success;
    }
}
