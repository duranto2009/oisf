package com.revesoft.springboot.web.geo.union;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import databasemanager.DatabaseManager;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.json.Json;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by reve on 10/30/2017.
 */
@Repository
public class UnionDAO {

    ArrayList<UnionDTO> autoFill(ResultSet resultSet){
        ArrayList<UnionDTO> unionDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                unionDTOList.add(new UnionDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("union_name_eng"),
                        resultSet.getString("union_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return unionDTOList;
    }
    public ArrayList<UnionDTO> getAllUnion() throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<UnionDTO> unionList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_unions";
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){
                unionList.add(new UnionDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("union_name_eng"),
                        resultSet.getString("union_name_bng"),
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
        return unionList;
    }

    //@Razin
    public UnionDTO getOneUnion(int id) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        UnionDTO unionDTO = null;
        String sql = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_unions where id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){

                unionDTO= new UnionDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("union_name_eng"),
                        resultSet.getString("union_name_bng"),
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
        return  unionDTO;
    }

    public JSONObject getUnionListbyPage(int page, int pageSize) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        ArrayList<UnionDTO> unionList = new ArrayList<>();
        JSONObject jsonObject = new JSONObject();
        try{
            con = DatabaseManager.getInstance().getConnection();
            int count = sc.tempTableDatacount(con, "select count(id) as size from geo_unions");
            sql = "select * from geo_unions limit "+(page-1)*pageSize+","+pageSize;
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();


            while(resultSet.next()){
                unionList.add(new UnionDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("union_name_eng"),
                        resultSet.getString("union_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }

            jsonObject.put("d",unionList);
            jsonObject.put("c",count);
        }
        catch (Exception ex){
           ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return jsonObject;
    }
    public JSONObject getUnionListbyPage(int page, int pageSize, String searchMsg) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        ArrayList<UnionDTO> unionList = null;
        JSONObject jsonObject = new JSONObject();
        try{

//            "SELECT  * FROM (" +
//                    "SELECT * FROM geo_unions WHERE union_name_eng LIKE '%"+searchMsg+"%' OR union_name_bng LIKE '%"+searchMsg+"%' OR bbs_code LIKE '%"+searchMsg+"%')" +
//                    "limit" +(page-1)*pageSize+","+pageSize


            con = DatabaseManager.getInstance().getConnection();
//            count = sc.tempTableDatacount( con,"SELECT  count(s.id) as size FROM (" +
//                            "SELECT id FROM geo_unions WHERE union_name_eng LIKE '%"+searchMsg+"%' OR union_name_bng LIKE '%"+searchMsg+"%' OR bbs_code LIKE '%"+searchMsg+"%')" +
//                            " As s");

            SQLJsonData js = new SQLJsonData();
            JSONObject or1 = new JSONObject();
            or1.put("union_name_eng","%"+searchMsg+"%");
            or1.put("union_name_bng","%"+searchMsg+"%");
            or1.put("bbs_code","%"+searchMsg+"%");
            js.addtoConditionORLike("or1",or1);
            js.addtoConditionANDEquall("status",1);
            js.addPage("page",(page-1)*pageSize,pageSize);
            int count = sc.searchCount(con,"geo_unions",js);
            ResultSet resultSet = sc.search(con,"geo_unions", js);

            unionList = autoFill(resultSet);

            jsonObject.put("d",unionList);
            jsonObject.put("c",count);


        }
        catch (Exception ex){
           ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return jsonObject;
    }
    public JSONObject getUnionListbyPage(int page, int pageSize, String[] searchParam) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        ArrayList<UnionDTO> unionList = null;
        String condition ="";
        SQLJsonData js = new SQLJsonData();
        JSONObject jsonObject = new JSONObject();
        try{

            int searchParamSize = searchParam.length;
            js.addtoConditionANDEquall("status",1);
            for(int i=0;i<searchParamSize;i++){
                String s = searchParam[i];
                if(!s.equals("null") && !s.equals("-1") && !s.equals("")){

                    switch (i){

                        case 0:
                            js.addtoConditionANDEquall("geo_division_id",Integer.parseInt(searchParam[0]));
                            break;
                        case 1:
                            js.addtoConditionANDEquall("geo_district_id",Integer.parseInt(searchParam[1]));
                            break;
                        case 2:
                            js.addtoConditionANDEquall("geo_upazila_id",Integer.parseInt(searchParam[2]));
                            break;
                    }
                }
            }
            con = DatabaseManager.getInstance().getConnection();

            js.addPage("page",(page-1)*pageSize,pageSize);
            int count = sc.searchCount(con,"geo_unions",js);
            ResultSet resultSet =sc.search(con,"geo_unions",js);
            unionList = autoFill(resultSet);

            jsonObject.put("d",unionList);
            jsonObject.put("c",count);

        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return jsonObject;
    }
    //@Razin
    public void add(UnionDTO union) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con= DatabaseManager.getInstance().getConnection();

            sql = "insert into geo_unions(id, geo_division_id, geo_district_id, geo_upazila_id, division_bbs_code, district_bbs_code, upazila_bbs_code, union_name_eng, union_name_bng, bbs_code, status, created_by, created) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(sql);

            long ID = DatabaseManager.getInstance().getNextSequenceId("geo_unions");
            //appMenuDTO.id= ID;
           int id = (int)ID;

            int k=0;

            ps.setInt(++k,id);
            ps.setInt(++k,union.getGeoDivisionId());
            ps.setInt(++k,union.getGeoDistrictId());
            ps.setInt(++k,union.getGeoUpazilaId());
            ps.setString(++k,union.getDivisionBbsCode());
            ps.setString(++k,union.getDistrictBbsCode());
            ps.setString(++k,union.getUpazilaBbsCode());
            ps.setString(++k,union.getUnionNameEng());
            ps.setString(++k,union.getUnionNameBng());
            ps.setString(++k,union.getBbsCode());
            ps.setInt(++k,1);
            ps.setInt(++k,union.getCreatedBy());
            ps.setTimestamp(++k, union.getCreated());
            ps.executeUpdate();


        }catch (Exception e){
          e.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
    }

    //@Razin
    public void edit(UnionDTO union) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_unions SET geo_division_id=?, geo_district_id=?, geo_upazila_id=?, division_bbs_code=?, district_bbs_code=?, upazila_bbs_code=?, union_name_eng=?, union_name_bng=?, bbs_code=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,union.getGeoDivisionId());
            ps.setInt(++k,union.getGeoDistrictId());
            ps.setInt(++k,union.getGeoUpazilaId());
            ps.setString(++k,union.getDivisionBbsCode());
            ps.setString(++k,union.getDistrictBbsCode());
            ps.setString(++k,union.getUpazilaBbsCode());
            ps.setString(++k,union.getUnionNameEng());
            ps.setString(++k,union.getUnionNameBng());
            ps.setString(++k,union.getBbsCode());
            ps.setInt(++k,union.getModifiedBy());
            ps.setTimestamp(++k, union.getModified());
            ps.setInt(++k,union.getId());
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
    public int delete(UnionDTO unionDTO) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        int success =0;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_unions SET status=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,0);
            ps.setInt(++k,unionDTO.getModifiedBy());
            ps.setTimestamp(++k, unionDTO.getModified());
            ps.setInt(++k,unionDTO.getId());
            ps.executeUpdate();
            success =1;

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



    public ArrayList<UnionDTO> getUnionListByUpazillaId(int id) throws SQLException {
        ArrayList<UnionDTO> unionList = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("geo_upazila_id",id);
            data.addtoConditionANDEquall("status",1);
            rs = sc.select(con,"geo_unions", data);
            unionList = autoFill(rs);


        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return  unionList;

    }



    ArrayList<UnionDTO> getUnionListByUpazillaIds(int[] id) throws Exception{
        ArrayList<UnionDTO> unionList = null;
        String condition = null;
        Connection con = null;
        ResultSet resultSet=null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try{
            con = DatabaseManager.getInstance().getConnection();
            condition = ""; //geo_upazila_id =? or geo_upazila_id=? or geo_upazila_id=?";
            condition += " i:status = "+1 +" and ( ";

            for(int i=0;i<id.length;i++){
                if(i<id.length-1)
                {
                    condition += " i:geo_upazila_id =  "+id[i]+ " or";
//                    condition += " and  i:status = "+1;

                }
                else {
                    condition += " i:geo_upazila_id = "+id[i];
//                    condition += " and i:status = "+1;
                }

            }
            condition += " ) ";
            SQLJsonData data =new SQLJsonData();
            //data.addtoConditionANDEquall("status",1);
            data.add("all","");
            resultSet =  sc.select(con,"geo_unions", data, condition);

            unionList =autoFill(resultSet);
        }
        catch (Exception ex){
            System.out.println("Exception " + ex);
        } finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return unionList;

    }


}
