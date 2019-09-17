package com.revesoft.springboot.web.configurabledashboard;

import com.revesoft.springboot.web.util.BatchStatementAdder;
import databasemanager.DatabaseManager;
import org.jdom.JDOMException;
import org.jose4j.json.internal.json_simple.JSONArray;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Acer on 9/26/2017.
 */
@Repository
public class ConfigurableDashboardDAO {

    private static final String TABLE_APPLICATION_REGISTRATION = "application_registration";
    private static final String TABLE_USER_DASH_ITEM = "user_dashboard_items";
    private static final String TABLE_APPLICATION_MODULE = "application_module";
    private static final String TABLE_USER_SELECTED_MODULE = "user_selected_module";

    //    @Autowired


    public ArrayList<DashboardMenuDTO> dashboardItem(long desigId) throws SQLException, JDOMException,
            ClassNotFoundException, InstantiationException, IllegalAccessException {
//        ArrayList<MenuDTO>parent=new ArrayList<>();


        ArrayList<DashboardMenuDTO> dashItem=new ArrayList<>();
//        List<List<MenuDTO>> allApp=new ArrayList<List<MenuDTO>>();
        Connection cn=null;
        PreparedStatement ps= null;
        ResultSet rs= null;


        String sql=" SELECT m.application_name,m.id,m.application_name_bng,m.url, m.logo_url,m.default_page_url,d.row,d.column FROM " +TABLE_APPLICATION_REGISTRATION+" m  " +
                "inner join " +TABLE_USER_DASH_ITEM+ " d on m.id=d.app_id " +
                " WHERE  m.status=1 and m.is_published=1 and d.designation_id=? order by d.row asc";
        try{
            cn= DatabaseManager.getInstance().getConnection();
            ps=cn.prepareStatement(sql);
            ps.setLong(1,desigId);
            rs=ps.executeQuery();
            int i=0;
            while (rs.next())
            {
                DashboardMenuDTO dashboardMenuDTO=new DashboardMenuDTO();
                dashboardMenuDTO.setNameEng(rs.getString("application_name"));
                dashboardMenuDTO.setId(rs.getInt("id"));
                dashboardMenuDTO.setNameBng(rs.getString("application_name_bng"));
                dashboardMenuDTO.setUrl(rs.getString("url"));
                dashboardMenuDTO.setLogoUrl(rs.getString("logo_url"));
                dashboardMenuDTO.setDefaultPage(rs.getString("default_page_url"));
                dashboardMenuDTO.setRowId(rs.getInt("row"));
                dashboardMenuDTO.setColumnId(rs.getInt("column"));
                PreparedStatement pschild=null;
                ResultSet rschild=null;
                String childs="";


                try {
                    childs = " Select * from "  +TABLE_APPLICATION_MODULE +" where application_id =  " + rs.getInt("id");
                    pschild = cn.prepareStatement(childs);
                    rschild = pschild.executeQuery();
                    ArrayList<DashboardMenuDTO> child=new ArrayList<>();

                    while (rschild.next()) {
                        DashboardMenuDTO menuDTO1 = new DashboardMenuDTO();
                        menuDTO1.setId(rschild.getInt("id"));
                        menuDTO1.setParentId(rschild.getInt("application_id"));
                        menuDTO1.setNameEng(rschild.getString("name_eng"));
                        menuDTO1.setNameBng(rschild.getString("name_bng"));
                        menuDTO1.setUrl(rschild.getString("url"));
                        child.add(menuDTO1);

                    }

                    dashboardMenuDTO.setChild(child);


                }catch (Exception e){
                    e.printStackTrace();
                }
                dashItem.add(dashboardMenuDTO);

            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(cn != null) DatabaseManager.getInstance().freeConnection(cn);
        }
        return dashItem;
    }

    //dashboard modal items
        public ArrayList<DashboardMenuDTO> dashboardModalItem(String desigId) throws SQLException, JDOMException,
            ClassNotFoundException, InstantiationException, IllegalAccessException {
//        ArrayList<MenuDTO>parent=new ArrayList<>();


        ArrayList<DashboardMenuDTO> dashItem=new ArrayList<>();
//        List<List<MenuDTO>> allApp=new ArrayList<List<MenuDTO>>();
        Connection cn=null;
        PreparedStatement ps= null;
        ResultSet rs= null;


        String sql=" SELECT * FROM " +TABLE_APPLICATION_MODULE+ " WHERE application_id =?";

        try{
            cn= DatabaseManager.getInstance().getConnection();
            ps=cn.prepareStatement(sql);
            ps.setString(1,desigId);
            rs=ps.executeQuery();
            int i=0;
            while (rs.next()) {
                DashboardMenuDTO dashboardMenuDTO = new DashboardMenuDTO();

                dashboardMenuDTO.setNameEng(rs.getString("name_eng"));
                dashboardMenuDTO.setId(rs.getInt("id"));
                dashboardMenuDTO.setNameBng(rs.getString("name_bng"));
                dashboardMenuDTO.setUrl(rs.getString("url"));
                dashItem.add(dashboardMenuDTO);
            }
//                dashboardMenuDTO.setLogoUrl(rs.getString("logo_url"));
//                dashboardMenuDTO.setDefaultPage(rs.getString("default_page"));
//                dashboardMenuDTO.setRowId(rs.getInt("row"));
//                dashboardMenuDTO.setColumnId(rs.getInt("column"));
//                PreparedStatement pschild=null;
//                ResultSet rschild=null;
//                String childs="";
//
//
//                try {
//                    childs = " Select * from "  +TABLE_APPLICATION_MODULE +" where application_id =  " + rs.getInt("id");
//                    pschild = cn.prepareStatement(childs);
//                    rschild = pschild.executeQuery();
//                    ArrayList<DashboardMenuDTO> child=new ArrayList<>();
//
//                    while (rschild.next()) {
//                        DashboardMenuDTO menuDTO1 = new DashboardMenuDTO();
//                        menuDTO1.setId(rschild.getInt("id"));
//                        menuDTO1.setParentId(rschild.getInt("application_id"));
//                        menuDTO1.setNameEng(rschild.getString("name_eng"));
//                        menuDTO1.setNameBng(rschild.getString("name_bng"));
//                        menuDTO1.setUrl(rschild.getString("url"));
//                        child.add(menuDTO1);
//
//                    }
//
//                    dashboardMenuDTO.setChild(child);

//

                }
                catch (Exception e){
                    e.printStackTrace();
                }

                finally {
                    if(ps != null)ps.close();
                    if(cn != null) DatabaseManager.getInstance().freeConnection(cn);
                }
        return dashItem;
    }






    public void addDashMap(JSONObject obj)throws Exception{
        JSONArray created= (JSONArray) obj.get("created");
        JSONArray updated=(JSONArray)obj.get("updated") ;
        JSONArray deleted=(JSONArray)obj.get("deleted");
        String desiId= (String) obj.get("desid");
        Long desigId=Long.parseLong(desiId);

        String createq="";
        String updateq="";
        String deleteq="";
        Connection cn=null;
        Statement stmt= null;
        try{
            cn= DatabaseManager.getInstance().getConnection();
           stmt=cn.createStatement();
            for (Object jsonObject :created) {
                if ( jsonObject instanceof JSONObject ) {
                    JSONObject jsonObject1 = (JSONObject)jsonObject;
                    Long ID=DatabaseManager.getInstance().getNextSequenceId("user_dashboard_items");
                    createq=" Insert into "+TABLE_USER_DASH_ITEM+ " (id,designation_id,app_id,row,user_dashboard_items.column) VALUES ( "
                            +ID+ " ," +desigId+ ", "+jsonObject1.get("id")+ ", "+jsonObject1.get("row")+", "+ jsonObject1.get("column")+ " )";
                    stmt.addBatch(createq);

                }

            }
            for (Object jsonObject  :updated) {

                if ( jsonObject instanceof JSONObject ) {
                    JSONObject jsonObject1 = (JSONObject)jsonObject;
                    updateq=" UPDATE "+TABLE_USER_DASH_ITEM+ "  u set row = "+jsonObject1.get("row")+ ", u.column= " +jsonObject1.get("column") +
                            " where app_id = "+jsonObject1.get("id") + " and designation_id=" +desigId;
                    stmt.addBatch(updateq);

                }


            }

            for (Object jsonObject  :deleted) {
                if ( jsonObject instanceof Long ) {
                    Long jsonObject1 = (Long) jsonObject;
                    deleteq=" delete from "+TABLE_USER_DASH_ITEM+ " where app_id = "+jsonObject1 + " and designation_id=" +desigId;
                    stmt.addBatch(deleteq);
                }
            }

            stmt.executeBatch();

            }
            catch (Exception e){
                e.printStackTrace();
            }
    }


    public boolean saveDashboardModalMenuItem(int[] result, Long orgId,int modalId) throws SQLException {
        Connection cn = null;
        Statement stmt=null;

        BatchStatementAdder batchStatementAdder = new BatchStatementAdder();
        try{
            cn = DatabaseManager.getInstance().getConnection();
            stmt=cn.createStatement();
            cn.setAutoCommit(false);
            stmt=batchStatementAdder.moduleStatementAdd(stmt,orgId,result,modalId);
            stmt.executeBatch();
            cn.commit();


        }catch (Exception e){
            cn.rollback();
            e.printStackTrace();
        }finally {
            if(stmt != null)stmt.close();
            if(cn != null)cn.close();
        }

        return true;
    }

    public ArrayList<Integer> dashboardModalItemByOrgId(long id,int modalId) throws SQLException, JDOMException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ArrayList<Integer> arrayList = new ArrayList<Integer>();
        Connection cn=null;
        PreparedStatement ps= null;
        ResultSet rs= null;


        String sql=" SELECT * FROM " +TABLE_USER_SELECTED_MODULE + " WHERE org_id = ? and modal_id = ?";


        try{
            cn= DatabaseManager.getInstance().getConnection();
            ps=cn.prepareStatement(sql);
            ps.setLong(1,id);
            ps.setInt(2,modalId);
            rs=ps.executeQuery();
            int i=0;
            while (rs.next()) {
                arrayList.add(rs.getInt("module_id"));
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }

        finally {
            if(ps != null)ps.close();
            if(cn != null) DatabaseManager.getInstance().freeConnection(cn);
        }



        return arrayList;

    }
}
