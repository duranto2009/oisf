package com.revesoft.springboot.web.geo.postoffice;

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
 * Created by reve on 10/31/2017.
 */
@Repository
public class PostOfficeDAO {

//    private int count =-1;
    public ArrayList<PostOfficeDTO> getAllPostOffice() throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;

        ArrayList<PostOfficeDTO> postofficeList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_post_offices where status =1";
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){
                postofficeList.add(new PostOfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("thana_bbs_code"),
                        resultSet.getString("postoffice_name_eng"),
                        resultSet.getString("postoffice_name_bng"),
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
        return postofficeList;
    }

    //@Razin
    public PostOfficeDTO getOnePostOffice(int id) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;

        String sql = null;
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_post_offices where id = ? and status = 1";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){

                return new PostOfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("thana_bbs_code"),
                        resultSet.getString("postoffice_name_eng"),
                        resultSet.getString("postoffice_name_bng"),
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
        return  new PostOfficeDTO();
    }

    public JSONObject getPostOfficeListbyPage(int page, int pageSize) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc =new SQLStatementCreator();
        ArrayList<PostOfficeDTO> postofficeList = new ArrayList<>();
        JSONObject js = new JSONObject();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_post_offices where status =1 limit "+(page-1)*pageSize+","+pageSize;
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

            while(resultSet.next()){
                postofficeList.add(new PostOfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("thana_bbs_code"),
                        resultSet.getString("postoffice_name_eng"),
                        resultSet.getString("postoffice_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
           int  count = sc.tableDatacount("geo_post_offices");
            js.put("d",postofficeList);
            js.put("c",count);
        }
        catch (Exception ex){
           ex.printStackTrace();
        } finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return js;
    }
    public JSONObject getPostOfficeListbyPage(Integer pageNumber, int displayLength, String searchparameter) throws Exception {
        Connection con = null;
        SQLStatementCreator sc =new SQLStatementCreator();
        ArrayList<PostOfficeDTO> postofficeList = new ArrayList<>();
        JSONObject jsonObject = new JSONObject();
        try{

//            "SELECT  * FROM (" +
//                    "SELECT * FROM geo_unions WHERE upazila_name_eng LIKE '%"+searchparameter+"%' OR upazila_name_bng LIKE '%"+searchparameter+"%' OR bbs_code LIKE '%"+searchparameter+"%')" +
//                    "limit" +(page-1)*pageSize+","+pageSize

//            count = sc.tempTableDatacount( con,"SELECT  count(s.id) as size FROM (" +
//                            "SELECT id FROM geo_unions WHERE upazila_name_eng LIKE '%"+searchparameter+"%' OR upazila_name_bng LIKE '%"+searchparameter+"%' OR bbs_code LIKE '%"+searchparameter+"%')" +
//                            " As s");

            con = DatabaseManager.getInstance().getConnection();
            SQLJsonData js = new SQLJsonData();
            JSONObject or1 = new JSONObject();
            or1.put("postoffice_name_eng","%"+searchparameter+"%");
            or1.put("postoffice_name_bng","%"+searchparameter+"%");
            or1.put("bbs_code","%"+searchparameter+"%");
            js.addtoConditionORLike(
                    "or1",or1);
            js.addtoConditionANDEquall("status",1);
            js.addPage("page",(pageNumber-1)*displayLength,displayLength);
            int count = sc.searchCount(con,"geo_post_offices",js);
            ResultSet resultSet = sc.search(con,"geo_post_offices", js);

            while(resultSet.next()){
                postofficeList.add(new PostOfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("thana_bbs_code"),
                        resultSet.getString("postoffice_name_eng"),
                        resultSet.getString("postoffice_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }

            jsonObject.put("d",postofficeList);
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



    public JSONObject getPostOfficeListbyPage(Integer pageNumber, int displayLength, String[] searchparameter) throws Exception{
        Connection con = null;
        SQLStatementCreator sc =new SQLStatementCreator();
        ArrayList<PostOfficeDTO> postofficeList = new ArrayList<>();
        String condition ="";
        SQLJsonData js = new SQLJsonData();
        JSONObject jsonObject = new JSONObject();
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
                        case 2:
                            js.addtoConditionANDEquall("geo_upazila_id",Integer.parseInt(searchparameter[2]));
                            break;
                        case 3:
                            js.addtoConditionANDEquall("geo_thana_id",Integer.parseInt(searchparameter[3]));
                            break;
                    }
                }
            }
            con = DatabaseManager.getInstance().getConnection();
            js.addtoConditionANDEquall("status",1);
            js.addPage("page",(pageNumber-1)*displayLength,displayLength);
            int count = sc.searchCount(con,"geo_post_offices",js);
            ResultSet resultSet =sc.search(con,"geo_post_offices",js);
            while(resultSet.next()){
                postofficeList.add(new PostOfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("thana_bbs_code"),
                        resultSet.getString("postoffice_name_eng"),
                        resultSet.getString("postoffice_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
            jsonObject.put("d",postofficeList);
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
    public void add(PostOfficeDTO postoffice) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con= DatabaseManager.getInstance().getConnection();

            sql = "insert into geo_post_offices(id, geo_division_id, geo_district_id, geo_upazila_id, geo_thana_id, division_bbs_code, district_bbs_code, upazila_bbs_code, thana_bbs_code, postoffice_name_eng, postoffice_name_bng, bbs_code, status, created_by, created) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(sql);

            long ID = DatabaseManager.getInstance().getNextSequenceId("geo_post_offices");
            //appMenuDTO.id= ID;


            int k=0;

            ps.setInt(++k,(int)ID);
            ps.setInt(++k,postoffice.getGeoDivisionId());
            ps.setInt(++k,postoffice.getGeoDistrictId());
            ps.setInt(++k,postoffice.getGeoUpazilaId());
            ps.setInt(++k,postoffice.getGeoThanaId());
            ps.setString(++k,postoffice.getDivisionBbsCode());
            ps.setString(++k,postoffice.getDistrictBbsCode());
            ps.setString(++k,postoffice.getUpazilaBbsCode());
            ps.setString(++k,postoffice.getThanaBbsCode());
            ps.setString(++k,postoffice.getPostOfficeNameEng());
            ps.setString(++k,postoffice.getPostOfficeNameBng());
            ps.setString(++k,postoffice.getBbsCode());
            ps.setInt(++k,1);
            ps.setInt(++k,postoffice.getCreatedBy());
            ps.setTimestamp(++k, postoffice.getCreated());
            ps.executeUpdate();


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
    }

    //@Razin
    public void edit(PostOfficeDTO postoffice) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_post_offices SET geo_division_id=?, geo_district_id=?, geo_upazila_id=?, geo_thana_id=?, division_bbs_code=?, district_bbs_code=?, upazila_bbs_code=?, thana_bbs_code=?, postoffice_name_eng=?, postoffice_name_bng=?, bbs_code=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,postoffice.getGeoDivisionId());
            ps.setInt(++k,postoffice.getGeoDistrictId());
            ps.setInt(++k,postoffice.getGeoUpazilaId());
            ps.setInt(++k,postoffice.getGeoThanaId());
            ps.setString(++k,postoffice.getDivisionBbsCode());
            ps.setString(++k,postoffice.getDistrictBbsCode());
            ps.setString(++k,postoffice.getUpazilaBbsCode());
            ps.setString(++k,postoffice.getThanaBbsCode());
            ps.setString(++k,postoffice.getPostOfficeNameEng());
            ps.setString(++k,postoffice.getPostOfficeNameBng());
            ps.setString(++k,postoffice.getBbsCode());
            ps.setInt(++k,postoffice.getModifiedBy());
            ps.setTimestamp(++k, postoffice.getModified());
            ps.setInt(++k,postoffice.getId());
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
    public int delete(PostOfficeDTO postOfficeDTO) throws Exception{
        String sql = null;
        Connection con = null;
        PreparedStatement ps = null;
        int success =0;
        try {

            con = DatabaseManager.getInstance().getConnection();
            sql = "Update geo_post_offices SET status=?, modified_by=?, modified=? WHERE id = ?";
            ps = con.prepareStatement(sql);

            int k=0;
            ps.setInt(++k,0);
            ps.setInt(++k,postOfficeDTO.getModifiedBy());
            ps.setTimestamp(++k, postOfficeDTO.getModified());
            ps.setInt(++k,postOfficeDTO.getId());
            ps.executeUpdate();
            success = 1;

        }catch (Exception e){
            success =0;
            e.printStackTrace();
        }
        finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return success;
    }


    public  ArrayList<PostOfficeDTO> postofficebyDis(int id) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc =new SQLStatementCreator();
        ArrayList<PostOfficeDTO> postofficeList = new ArrayList<>();
        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from geo_post_offices where status =1  and geo_district_id = "+id;
            ps = con.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();



            while(resultSet.next()){
                postofficeList.add(new PostOfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getString("division_bbs_code"),
                        resultSet.getString("district_bbs_code"),
                        resultSet.getString("upazila_bbs_code"),
                        resultSet.getString("thana_bbs_code"),
                        resultSet.getString("postoffice_name_eng"),
                        resultSet.getString("postoffice_name_bng"),
                        resultSet.getString("bbs_code"),
                        resultSet.getInt("status")));
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(sc.ps != null)sc.ps.close();
            if(con != null)con.close();
        }
        return postofficeList;

    }
}
