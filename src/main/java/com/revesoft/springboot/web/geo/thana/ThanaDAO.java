package com.revesoft.springboot.web.geo.thana;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import databasemanager.DatabaseManager;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by Bony on 10/31/2017.
 */
@Repository
public class ThanaDAO {


    public ArrayList<ThanaDTO> getAllThana() throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<ThanaDTO> List = new ArrayList<>();
        try {
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_thanas where status=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,1);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                List.add(new ThanaDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("thana_name_eng"),
                        resultSet.getString("thana_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
        } catch (Exception ex) {
           ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return List;
    }

    public ThanaDTO getOneThana(int id) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;

        String sql = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_thanas where id = ? and status= ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ps.setInt(2,1);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){

                return new ThanaDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("thana_name_eng"),
                        resultSet.getString("thana_name_bng"),
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
        return  new ThanaDTO();
    }

    public ArrayList<ThanaDTO> getThanaListbyDistrictId(int districtId) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        ArrayList<ThanaDTO> List = new ArrayList<>();
        String sql = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_thanas where geo_district_id = ? and status = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,districtId);
            ps.setInt(2,1);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){

                List.add(new ThanaDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("thana_name_eng"),
                        resultSet.getString("thana_name_bng"),
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
        return  List;
    }

    public JSONObject getThanaListbyPage(int page, int pageSize) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc =new SQLStatementCreator();
        ArrayList<ThanaDTO> thanaList = new ArrayList<>();
        JSONObject jsonObject = new JSONObject();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_thanas where status =1 limit "+(page-1)*pageSize+","+pageSize;
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

            resultSet = ps.executeQuery();
            while(resultSet.next()){
                thanaList.add(new ThanaDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("thana_name_eng"),
                        resultSet.getString("thana_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
            int count = sc.tableDatacount("geo_thanas");
            jsonObject.put("d",thanaList);
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

    public JSONObject getThanaListbyPage(Integer pageNumber, int displayLength, String searchparameter) throws Exception{
        Connection con = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        ArrayList<ThanaDTO> thanaList = new ArrayList<>();
        JSONObject jsonObject = new JSONObject();
        try{

            con = DatabaseManager.getInstance().getConnection();
            SQLJsonData js = new SQLJsonData();
            JSONObject or1 = new JSONObject();
            or1.put("thana_name_eng","%"+searchparameter+"%");
            or1.put("thana_name_bng","%"+searchparameter+"%");
            or1.put("bbs_code","%"+searchparameter+"%");
            js.addtoConditionORLike(
                    "or1",or1);
            js.addtoConditionANDEquall("status",1);
            js.addPage("page",(pageNumber-1)*displayLength,displayLength);
            int count = sc.searchCount(con,"geo_thanas",js);
            ResultSet resultSet = sc.search(con,"geo_thanas", js);

            while(resultSet.next()){
                thanaList.add(new ThanaDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("thana_name_eng"),
                        resultSet.getString("thana_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }

            jsonObject.put("d",thanaList);
            jsonObject.put("c",count);


        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return jsonObject;

    }

    public JSONObject getThanaListbyPage(Integer pageNumber, int displayLength, String[] searchparameter) throws Exception {
        Connection con = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        ArrayList<ThanaDTO> thanaList = new ArrayList<>();
        String condition ="";
        SQLJsonData js = new SQLJsonData();
        JSONObject jsonObject =new JSONObject();
        try{

            int searchParamSize = searchparameter.length;
            for(int i=0;i<searchParamSize;i++){
                String s = searchparameter[i];
                if(!s.equals("null") && !s.equals("-1") && !s.equals("")){

                    switch (i){
                        case 0:
                            js.addtoConditionANDEquall("geo_division_id",Integer.parseInt(searchparameter[0]));
                            break;
                        case 1:
                            js.addtoConditionANDEquall("geo_district_id",Integer.parseInt(searchparameter[1]));
                            break;
                    }
                }
            }
            js.addtoConditionANDEquall("status",1);
            con = DatabaseManager.getInstance().getConnection();
            js.addPage("page",(pageNumber-1)*displayLength,displayLength);
            int count = sc.searchCount(con,"geo_thanas",js);
            ResultSet resultSet =sc.search(con,"geo_thanas",js);
            while(resultSet.next()){
                thanaList.add(new ThanaDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("thana_name_eng"),
                        resultSet.getString("thana_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }

            jsonObject.put("d",thanaList);
            jsonObject.put("c",count);
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return jsonObject;
    }
    //@Razin
    public void add(ThanaDTO thanaDTO) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con= DatabaseManager.getInstance().getConnection();

            sql = "insert into geo_thanas(id, geo_division_id, geo_district_id, division_bbs_code, district_bbs_code, thana_name_eng, thana_name_bng, bbs_code, status, created_by, created) values(?,?,?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(sql);

            long ID = DatabaseManager.getInstance().getNextSequenceId("geo_thanas");
            //appMenuDTO.id= ID;


            int k=0;

            ps.setInt(++k,(int)ID);
            ps.setInt(++k,thanaDTO.getGeoDivisionId());
            ps.setInt(++k,thanaDTO.getGeoDistrictId());
            ps.setString(++k,thanaDTO.getDivisionBbsCode());
            ps.setString(++k,thanaDTO.getDistrictBbsCode());
            ps.setString(++k,thanaDTO.getThanaNameEng());
            ps.setString(++k,thanaDTO.getThanaNameBng());
            ps.setString(++k,thanaDTO.getBbsCode());
            ps.setInt(++k,1);
            ps.setInt(++k,thanaDTO.getCreatedBy());
            ps.setTimestamp(++k, thanaDTO.getCreated());
            ps.executeUpdate();


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
    }

    //@Razin
    public void edit(ThanaDTO thana) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_thanas SET geo_division_id=?, geo_district_id=?, division_bbs_code=?, district_bbs_code=?, thana_name_eng=?, thana_name_bng=?, bbs_code=?,  modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,thana.getGeoDivisionId());
            ps.setInt(++k,thana.getGeoDistrictId());
            ps.setString(++k,thana.getDivisionBbsCode());
            ps.setString(++k,thana.getDistrictBbsCode());
            ps.setString(++k,thana.getThanaNameEng());
            ps.setString(++k,thana.getThanaNameBng());
            ps.setString(++k,thana.getBbsCode());
            ps.setInt(++k,thana.getModifiedBy());
            ps.setTimestamp(++k, thana.getModified());
            ps.setInt(++k,thana.getId());
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
    public int delete(ThanaDTO thanaDTO) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        int success =0;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_thanas SET status=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,0);
            ps.setInt(++k,thanaDTO.getCreatedBy());
            ps.setTimestamp(++k, thanaDTO.getCreated());
            ps.setInt(++k,thanaDTO.getId());
            ps.executeUpdate();
            success = 1;

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return  success;
    }

    public ArrayList<ThanaDTO> getThanaListbyDistrictIds(int[] ids) throws Exception{

        ArrayList<ThanaDTO> thanaDTOS = new ArrayList<>();
        ResultSet resultSet=null;
        String condition = null;
        Connection con=null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try {
            con = DatabaseManager.getInstance().getConnection();
            condition = ""; //geo_upazila_id =? or geo_upazila_id=? or geo_upazila_id=?";

            for(int i=0;i<ids.length;i++){
                if(i<ids.length-1)condition += " i:geo_district_id =  "+ids[i]+" or";
                else condition += " i:geo_district_id = "+ids[i];
            }
            condition += " and i:status = 1";
            SQLJsonData data =new SQLJsonData();
            data.add("all","");
            resultSet =  sc.select(con,"geo_thanas", data, condition);
            while(resultSet.next()){
                thanaDTOS.add(new ThanaDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("thana_name_eng"),
                        resultSet.getString("thana_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(sc.ps!=null)sc.ps.close();
            if(con!=null)con.close();
        }
        return thanaDTOS;
    }



}
