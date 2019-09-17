package com.revesoft.springboot.web.menumanagement;

import com.revesoft.springboot.web.appregistration.ApplicationDAO;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.BatchStatementAdder;
import databasemanager.DatabaseManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sun.rmi.runtime.Log;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Logger;

/**
 * Created by Bony on 11/30/2017.
 */
@Repository
public class MenuDAO {

    @Autowired
    ApplicationDAO applicationDAO;

    private static final String TABLE_APPLICATION_MODULE = "application_module";
    private static final String TABLE_APPLICATION_REGISTRATION = "application_registration";
    private static final String TABLE_MENU = "menu";
    private static final String TABLE_DESIGNATION_MENU_ROLES = "designation_menu_roles";

    public ArrayList<EmployeeOrgDTO> orgOfEmployee(long employeeId) throws Exception {
        ArrayList<EmployeeOrgDTO> data = new ArrayList<>();

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        PreparedStatement ps2 = null;
        ResultSet rs2 = null;

        String sql = " SELECT office_unit_organogram_id FROM " + AllTable.TBL_EMPLOYEE_OFFICES +
                " WHERE employee_record_id=? and ( last_office_date is null or last_office_date ='0000-00-00') and status=1 " ;
//                + "and is_default_role!=1  ";
        String sql2 =" SELECT id,office_id,designation_eng,designation_bng FROM " +AllTable.TBL_OFFICE_UNIT_ORG +" WHERE id=? ";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, employeeId);
            rs = ps.executeQuery();
            while (rs.next()) {

                ps2=cn.prepareStatement(sql2);
                ps2.setInt(1,rs.getInt("office_unit_organogram_id"));
                rs2=ps2.executeQuery();
                while(rs2.next()){
                    EmployeeOrgDTO employeeOrgDTO=new EmployeeOrgDTO();
                    employeeOrgDTO.setId(rs2.getInt("id"));
                    employeeOrgDTO.setOfficeId(rs2.getInt("office_id"));
                    employeeOrgDTO.setNameEng(rs2.getString("designation_eng"));
                    employeeOrgDTO.setNameBng(rs2.getString("designation_bng"));
                    data.add(employeeOrgDTO);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (cn != null) cn.close();
            if (ps != null) ps.close();
            if (ps2 != null) ps2.close();
        }

        return data;
    }


    public ArrayList<Integer> orgIdsAgainstOrigin(int originOrgId)throws Exception {
        ArrayList<Integer> orgIds = new ArrayList<>();

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = " SELECT id FROM " + AllTable.TBL_OFFICE_UNIT_ORG + " WHERE ref_origin_unit_org_id=?";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, originOrgId);
            rs = ps.executeQuery();
            while (rs.next()) {
                orgIds.add(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (cn != null) cn.close();
            if (ps != null) ps.close();

        }

        return orgIds;
    }

    public ArrayList<PolicyGroupsDTO> getGroupByDesignation(long designationId, Connection cn) throws SQLException {
        ArrayList<PolicyGroupsDTO> data = new ArrayList<>();

        PreparedStatement ps = null;
        ResultSet rs = null;


        String s2 = " SELECT m.id,m.name_eng,m.name_bng FROM " + AllTable.TBL_POLICY_GROUPS +
                " m INNER JOIN " + AllTable.TBL_POLICY_GROUP_ORGANOGRAM + "  d ON d.policy_group_id=m.id WHERE d.organogram_id= ?";

        try {


            ps = cn.prepareStatement(s2);
            ps.setLong(1, designationId);
            rs = ps.executeQuery();
            while (rs.next()) {

                try {

                    PolicyGroupsDTO policyGroupsDTO = new PolicyGroupsDTO();
                    policyGroupsDTO.setId(rs.getInt("id"));
                    policyGroupsDTO.setNameEng(rs.getString("name_eng"));
                    policyGroupsDTO.setNameBng(rs.getString("name_bng"));
                    data.add(policyGroupsDTO);


                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
        }
        return data;
    }

    public ArrayList<MenuDTO> getAppByDesignation(long designationId) throws Exception {
        ArrayList<MenuDTO> data = new ArrayList<>();

        ArrayList<MenuDTO> childData = new ArrayList<>();

        HashMap<Integer, MenuDTO> hashed = new HashMap<>();


        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        PreparedStatement psgrp = null;
        ResultSet rsgrp = null;



        String s2 = " SELECT m.id,application_name,application_name_bng,url,logo_url FROM " + AllTable.TBL_APPLICATION_REGISTRATION +
                " m INNER JOIN " +AllTable.TBL_DESIGNATION_MENU_ROLES+ " d ON d.menu_id=m.id WHERE d.designation_id= ? AND m.status=1 and m.is_current=0 and m.is_published=1 ";

        String sqlgroup = " SELECT m.id,m.application_name,m.application_name_bng,m.url,m.logo_url FROM " + AllTable.TBL_APPLICATION_REGISTRATION  + "  m " +
                "INNER JOIN " + AllTable.TBL_POLICY_GROUP_MENU + " d ON d.menu_id=m.id WHERE d.policy_group_id=? AND m.status=1 and m.is_current=0 and m.is_published=1 ";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            ArrayList<PolicyGroupsDTO> policyGroupsDTOS = getGroupByDesignation(designationId, cn);
            psgrp = cn.prepareStatement(sqlgroup);
            for (PolicyGroupsDTO policyGroupsDTO : policyGroupsDTOS) {
                try {

                    psgrp.setInt(1, policyGroupsDTO.getId());
                    rsgrp = psgrp.executeQuery();
                    while (rsgrp.next()) {
                        MenuDTO menuDTO = new MenuDTO();
                        menuDTO.setId(rsgrp.getInt("id"));
                        menuDTO.setNameEng(rsgrp.getString("application_name"));
                        menuDTO.setNameBng(rsgrp.getString("application_name_bng"));
                        menuDTO.setMenuType(1);
                        menuDTO.setIconUrl(rsgrp.getString("logo_url"));
                        menuDTO.setUrl(rsgrp.getString("url"));
                        hashed.put(menuDTO.getId(), menuDTO);

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }


            }
            ps = cn.prepareStatement(s2);
            ps.setLong(1, designationId);
            rs = ps.executeQuery();
            while (rs.next()) {
                MenuDTO menuDTO = new MenuDTO();
                menuDTO.setId(rs.getInt("id"));
                menuDTO.setNameEng(rs.getString("application_name"));
                menuDTO.setNameBng(rs.getString("application_name_bng"));
                menuDTO.setMenuType(1);
                menuDTO.setIconUrl(rs.getString("logo_url"));
                menuDTO.setUrl(rs.getString("url"));
                hashed.put(menuDTO.getId(), menuDTO);
                //data.add(menuDTO);
            }

            for (Integer id : hashed.keySet()) {

                //MenuDTO menuDTO=hashed.getV
                data.add(hashed.get(id));
            }


            PreparedStatement pschild = null;
            ResultSet rschild = null;
            String childs =  " Select * from " + TABLE_APPLICATION_MODULE + " where application_id =? ";
            for (MenuDTO menuDTO : data) {
                try {

                    pschild = cn.prepareStatement(childs);
                    pschild.setInt(1,menuDTO.getId());
                    rschild = pschild.executeQuery();

                    while (rschild.next()) {
                        MenuDTO menuDTO1 = new MenuDTO();
                        menuDTO1.setId(rschild.getInt("id"));
                        menuDTO1.setParentId(rschild.getInt("application_id"));
                        menuDTO1.setNameEng(rschild.getString("name_eng"));
                        menuDTO1.setNameBng(rschild.getString("name_bng"));
                        menuDTO1.setUrl(rschild.getString("url"));
                        menuDTO1.setMenuType(1);
                        childData.add(menuDTO1);

                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }finally {
                    if(pschild!=null)pschild.close();
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if(psgrp!=null)psgrp.close();
            if (cn != null) cn.close();
        }

        data.addAll(childData);
        return data;
    }



    //-------start--Bishwajit Code------------------------------------------------------------------------------------------------------------------------------------

    public ArrayList<MenuDTO> getGroupPolicyData() throws Exception{
        ArrayList<MenuDTO> data=new ArrayList<>();
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from " + AllTable.TBL_POLICY_GROUPS + " WHERE status=1";
        try {
            connection= DatabaseManager.getInstance().getConnection();
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                MenuDTO menuDTO =new MenuDTO();
                menuDTO.setId(rs.getInt("id"));
                menuDTO.setNameEng(rs.getString("name_eng"));
                menuDTO.setNameBng(rs.getString("name_bng"));


                data.add(menuDTO);

            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(connection != null)connection.close();
        }
        return data;

    }


    public ArrayList<Integer> getSelectedAppForPolicyGroup(long policygroupid) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ArrayList<Integer> leaf = new ArrayList<>();
        ResultSet rs = null;
        String sql = " SELECT menu_id FROM " +AllTable.TBL_POLICY_GROUP_MENU+ " d  " +
                "WHERE d.policy_group_id=? AND d.menu_type=1";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, policygroupid);
            rs = ps.executeQuery();


            while (rs.next()) {
                leaf.add(rs.getInt("menu_id"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return leaf;
    }


    public ArrayList<Integer> getSelectedMenuForPolicyGroup(long policygroupid) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ArrayList<Integer> leaf = new ArrayList<>();
        ResultSet rs = null;
        String sql = " SELECT d.menu_id from  " +AllTable.TBL_POLICY_GROUP_MENU+ " d  " +
                "WHERE d.policy_group_id=? and menu_type=0 ";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, policygroupid);
            rs = ps.executeQuery();

//            System.out.println(".................................................start print ...............................................................................................");
            while (rs.next()) {
//                System.out.println(rs.getInt("menu_id"));
                leaf.add(rs.getInt("menu_id"));

            }
//            System.out.println("..................................................end print..............................................................................................");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return leaf;
    }


    public void roleMapperForPolicyGroup(int policygroupid, int[] deleted, int[] inserted) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement delStmt = null;

//        String sql = " INSERT INTO " + TABLE_DESIGNATION_MENU_ROLES + " (id,menu_id,designation_id,type) VALUES (?,?,?,?)";
//        String delSql = "DELETE FROM " + TABLE_DESIGNATION_MENU_ROLES + " WHERE menu_id=? AND designation_id=? ";

        String delSql="Delete from " +AllTable.TBL_POLICY_GROUP_MENU+ "" + " where menu_id=? and policy_group_id=? ";
        String sql = " insert into " +AllTable.TBL_POLICY_GROUP_MENU+ ""  + " (id,policy_group_id,menu_id,menu_type) VALUES (?,?,?,?)";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            delStmt = cn.prepareStatement(delSql);
            for (int menuId : inserted) {

                Long ID = DatabaseManager.getInstance().getNextSequenceId("designation_menu_roles");
                int k = 0;

                ps.setLong(++k, ID);

                ps.setInt(++k, policygroupid);
                ps.setInt(++k, menuId);
                ps.setInt(++k, 0);

                ps.executeUpdate();

            }
            for (int menuId : deleted) {
                delStmt.setInt(1, menuId);
                delStmt.setInt(2, policygroupid);
                delStmt.executeUpdate();

            }
            cn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }

    }

    //-------end--Bishwajit Code-----------------------------------------------------------------------------------------------------------------------------------------

    public ArrayList<MenuDTO> getByDesignation(long designationId) throws SQLException {
        ArrayList<MenuDTO> data = new ArrayList<>();
        HashMap<Integer, MenuDTO> hashed = new HashMap<>();


        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement psgrp = null;
        ResultSet rs = null;
        ResultSet rsgrp = null;

        String sqlgroup = " SELECT m.id,m.name_eng,m.name_bng,m.url,m.menu_type,m.parent_menu_id FROM " + AllTable.TBL_MENU + "  m " +
                "INNER JOIN " + AllTable.TBL_POLICY_GROUP_MENU + " d ON d.menu_id=m.id WHERE d.policy_group_id=? AND m.status=1 AND m.menu_type=0 ";

        String sql = " SELECT m.id,m.name_eng,m.name_bng,m.url,m.menu_type,m.parent_menu_id FROM " + AllTable.TBL_MENU + "  m " +
                "INNER JOIN " + AllTable.TBL_DESIGNATION_MENU_ROLES + " d ON d.menu_id=m.id WHERE d.designation_id=? AND m.status=1 AND m.menu_type=0 ";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ArrayList<PolicyGroupsDTO> policyGroupsDTOS = getGroupByDesignation(designationId, cn);
            psgrp = cn.prepareStatement(sqlgroup);

            for (PolicyGroupsDTO policyGroupsDTO : policyGroupsDTOS) {

                try {

                    psgrp.setInt(1, policyGroupsDTO.getId());
                    rsgrp = psgrp.executeQuery();
                    while (rsgrp.next()) {
                        MenuDTO menuDTO = menuSetter(rsgrp);
                        menuDTO.setParentId(rsgrp.getInt("parent_menu_id"));
                        menuDTO.setUrl(rsgrp.getString("url"));
                        //data.add(menuDTO);
                        hashed.put(menuDTO.id, menuDTO);

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }


            }

            ps = cn.prepareStatement(sql);
            ps.setLong(1, designationId);
            rs = ps.executeQuery();
            while (rs.next()) {
                MenuDTO menuDTO = menuSetter(rs);
                menuDTO.setParentId(rs.getInt("parent_menu_id"));
                menuDTO.setUrl(rs.getString("url"));

                //data.add(menuDTO);
                hashed.put(menuDTO.id, menuDTO);

            }

        } catch (Exception e) {

        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        for (Integer id : hashed.keySet()) {

            //MenuDTO menuDTO=hashed.getV
            data.add(hashed.get(id));
        }

        return data;
    }
    public ArrayList<MenuDTO> getAllMenuByDesignation(long designationId) throws SQLException {
        ArrayList<MenuDTO> data = new ArrayList<>();
        HashMap<Integer, MenuDTO> hashed = new HashMap<>();


        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement psgrp = null;
        ResultSet rs = null;
        ResultSet rsgrp = null;

        String sqlgroup = " SELECT m.id,m.name_eng,m.name_bng,m.url,m.menu_type,m.parent_menu_id FROM " + AllTable.TBL_MENU + "  m " +
                "INNER JOIN " + AllTable.TBL_POLICY_GROUP_MENU + " d ON d.menu_id=m.id WHERE d.policy_group_id=? AND m.status=1 AND m.menu_type not in(1) ";

        String sql = " SELECT m.id,m.name_eng,m.name_bng,m.url,m.menu_type,m.parent_menu_id FROM " + AllTable.TBL_MENU + "  m " +
                "INNER JOIN " + AllTable.TBL_DESIGNATION_MENU_ROLES + " d ON d.menu_id=m.id WHERE d.designation_id=? AND m.status=1 AND m.menu_type not in(1) ";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ArrayList<PolicyGroupsDTO> policyGroupsDTOS = getGroupByDesignation(designationId, cn);
            psgrp = cn.prepareStatement(sqlgroup);

            for (PolicyGroupsDTO policyGroupsDTO : policyGroupsDTOS) {

                try {

                    psgrp.setInt(1, policyGroupsDTO.getId());
                    rsgrp = psgrp.executeQuery();
                    while (rsgrp.next()) {
                        MenuDTO menuDTO = menuSetter(rsgrp);
                        menuDTO.setParentId(rsgrp.getInt("parent_menu_id"));
                        menuDTO.setUrl(rsgrp.getString("url"));
                        //data.add(menuDTO);
                        hashed.put(menuDTO.id, menuDTO);

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }


            }

            ps = cn.prepareStatement(sql);
            ps.setLong(1, designationId);
            rs = ps.executeQuery();
            while (rs.next()) {
                MenuDTO menuDTO = menuSetter(rs);
                menuDTO.setParentId(rs.getInt("parent_menu_id"));
                menuDTO.setUrl(rs.getString("url"));

                //data.add(menuDTO);
                hashed.put(menuDTO.id, menuDTO);

            }

        } catch (Exception e) {

        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        for (Integer id : hashed.keySet()) {

            //MenuDTO menuDTO=hashed.getV
            data.add(hashed.get(id));
        }

        return data;
    }
    public ArrayList<MenuDTO> getButtonByDesignation(long designationId, long menuId) throws SQLException {
        ArrayList<MenuDTO> data = new ArrayList<>();


        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;


        String sql = " SELECT m.id,name_eng,name_bng,url,m.menu_type,parent_menu_id FROM " + TABLE_MENU + "  m " +
                "INNER JOIN " + TABLE_DESIGNATION_MENU_ROLES + " d ON d.menu_id=m.id WHERE d.designation_id=? AND m.parent_menu_id=? AND m.status=1 AND m.menu_type!=0 ";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, designationId);
            ps.setLong(2, menuId);
            rs = ps.executeQuery();
            while (rs.next()) {
                MenuDTO menuDTO = menuSetter(rs);
                // menuDTO.setParentId(rs.getInt("parent_menu_id"));
                menuDTO.setUrl(rs.getString("url"));
                data.add(menuDTO);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }

        return data;
    }

    public ArrayList<MenuDTO> getAll(long designationId) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement psst = null;
        ResultSet rsst = null;
        ArrayList<MenuDTO> data = new ArrayList<>();
        String sql = " SELECT m.id,name_eng,name_bng,url,parent_menu_id,menu_type,m.status FROM " + TABLE_MENU + " m  " +
                "INNER JOIN designation_menu_roles d ON m.id=d.menu_id " +
                " WHERE status=1 AND d.designation_id=?  ";

        String sql2 = " SELECT m.id,name_eng,name_bng,url,parent_menu_id,menu_type,m.status FROM " + TABLE_MENU + " m WHERE m.id " +
                " NOT IN (SELECT menu_id FROM " + TABLE_DESIGNATION_MENU_ROLES + " WHERE designation_id=? ) AND status=1 ";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, designationId);
            rs = ps.executeQuery();

            psst = cn.prepareStatement(sql2);
            psst.setLong(1, designationId);
            rsst = psst.executeQuery();
            while (rs.next()) {
                MenuDTO menuDTO = menuSetter(rs);
                menuDTO.setIsAssigned(1);
                data.add(menuDTO);

            }
            while (rsst.next()) {
                MenuDTO menuDTO = menuSetter(rsst);
                data.add(menuDTO);

            }
            //data=getByDesignation(designationId,data);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return data;
    }


    public ArrayList<Integer> getSelectedApp(long designationId) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ArrayList<Integer> leaf = new ArrayList<>();
        ResultSet rs = null;
        String sql = " SELECT menu_id FROM designation_menu_roles d  " +
                "WHERE d.designation_id=? AND d.type=1";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, designationId);
            rs = ps.executeQuery();


            while (rs.next()) {
                leaf.add(rs.getInt("menu_id"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return leaf;
    }

    public ArrayList<Integer> getLeaf(long designationId) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ArrayList<Integer> leaf = new ArrayList<>();
        ResultSet rs = null;
        String sql = " SELECT m.id FROM menu m INNER JOIN designation_menu_roles d ON d.menu_id=m.id " +
                "WHERE d.designation_id=?  AND m.id NOT IN(SELECT parent_menu_id FROM menu);";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, designationId);
            rs = ps.executeQuery();


//            System.out.println(".................................................start print ...............................................................................................");
//            System.out.println("Designastion id: " + designationId);

            while (rs.next()) {
//                System.out.println(rs.getInt("id"));
                leaf.add(rs.getInt("id"));

            }
//            System.out.println("..................................................end print..............................................................................................");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return leaf;
    }

    public void roleMapper(int designationId, int[] deleted, int[] inserted) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement delStmt = null;
        String sql = " INSERT INTO " + TABLE_DESIGNATION_MENU_ROLES + " (id,menu_id,designation_id,type) VALUES (?,?,?,?)";
        String delSql = "DELETE FROM " + TABLE_DESIGNATION_MENU_ROLES + " WHERE menu_id=? AND designation_id=? ";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            delStmt = cn.prepareStatement(delSql);
            for (int menuId : inserted) {

                Long ID = DatabaseManager.getInstance().getNextSequenceId("designation_menu_roles");
                int k = 0;

                ps.setLong(++k, ID);
                ps.setInt(++k, menuId);
                ps.setInt(++k, designationId);
                ps.setInt(++k, 0);

                ps.executeUpdate();

            }
            for (int menuId : deleted) {
                delStmt.setInt(1, menuId);
                delStmt.setInt(2, designationId);
                delStmt.executeUpdate();

            }
            cn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }

    }

    public void groupMapper(int originOrgId, int[] deleted, int[] inserted) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement delStmt = null;
        ArrayList<Integer> orgIds = orgIdsAgainstOrigin(originOrgId);

        String delSql = "DELETE FROM " + AllTable.TBL_POLICY_GROUP_ORGANOGRAM + " WHERE policy_group_id=? AND organogram_id=? ";
        String sql = " INSERT INTO " + AllTable.TBL_POLICY_GROUP_ORGANOGRAM + " (id,policy_group_id,organogram_id,origin_organogram_id) VALUES (?,?,?,?)";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            delStmt = cn.prepareStatement(delSql);
            for (int desigId : orgIds) {
                for (int groupId : inserted) {

                    Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_POLICY_GROUP_ORGANOGRAM);
                    int k = 0;

                    ps.setLong(++k, ID);
                    ps.setInt(++k, groupId);
                    ps.setInt(++k, desigId);
                    ps.setInt(++k, originOrgId);

                    ps.executeUpdate();

                }
                for (int groupId : deleted) {
                    delStmt.setInt(1, groupId);
                    delStmt.setInt(2, desigId);
                    delStmt.executeUpdate();

                }

            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
            if (delStmt != null) {
                delStmt.close();
            }
        }

    }

    public void groupRoleMapper(int originOrgId, int[] deleted, int[] inserted) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement delStmt = null;
        ArrayList<Integer> orgIds = orgIdsAgainstOrigin(originOrgId);
        String sql = " INSERT INTO " + TABLE_DESIGNATION_MENU_ROLES + " (id,menu_id,designation_id,type,origin_org_id) VALUES (?,?,?,?,?)";
        String delSql = "DELETE FROM " + TABLE_DESIGNATION_MENU_ROLES + " WHERE menu_id=? AND designation_id=? ";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            delStmt = cn.prepareStatement(delSql);
            for (int desigId : orgIds) {
                for (int menuId : inserted) {

                    Long ID = DatabaseManager.getInstance().getNextSequenceId("designation_menu_roles");
                    int k = 0;

                    ps.setLong(++k, ID);
                    ps.setInt(++k, menuId);
                    ps.setInt(++k, desigId);
                    ps.setInt(++k, 0);

                    ps.setInt(++k, originOrgId);

                    ps.executeUpdate();

                }
                for (int menuId : deleted) {
                    delStmt.setInt(1, menuId);
                    delStmt.setInt(2, desigId);
                    delStmt.executeUpdate();

                }
            }
            cn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }

    }

    private MenuDTO menuSetter(ResultSet rs) throws Exception {
        MenuDTO menuDTO = new MenuDTO();
        menuDTO.setId(rs.getInt("id"));
        menuDTO.setNameEng(rs.getString("name_eng"));
        menuDTO.setNameBng(rs.getString("name_bng"));
        menuDTO.setMenuType(rs.getInt("menu_type"));
        menuDTO.setParentId(rs.getInt("parent_menu_id"));
        return menuDTO;
    }

    private PreparedStatement psSetter(PreparedStatement ps, MenuDTO menuDTO) throws Exception {

        int k = 0;

        long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_MENU);

        ps.setLong(++k, ID);
        ps.setString(++k, menuDTO.getNameEng());
        ps.setString(++k, menuDTO.getNameBng());
        ps.setString(++k, menuDTO.getUrl());
        ps.setInt(++k, menuDTO.getMenuType());
        ps.setInt(++k, menuDTO.getParentId());
        ps.setInt(++k, menuDTO.getCreatedBy());

        return ps;

    }

    public void addMenu(MenuDTO menuDTO) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;


        String sql = " INSERT INTO " + TABLE_MENU + "(id,name_eng,name_bng,url,menu_type,parent_menu_id,created_by) VALUES (?,?,?,?,?,?,?) ";

        String sq2 = "  UPDATE " + TABLE_MENU + " SET url=? WHERE id =?";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps = psSetter(ps, menuDTO);

            System.out.println(ps.toString());
            if (menuDTO.getMenuType() == 10) {

                par = cn.prepareStatement(sq2);
                par.setString(1, menuDTO.getUrl());
                par.setInt(2, menuDTO.getParentId());
                System.out.println(par.toString());
                par.executeUpdate();
            }
            ps.executeUpdate();
            cn.commit();


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
            if (cn != null) cn.close();
        }
    }

    //code added by forhad
    public static ArrayList<MenuDTO> getMenuListData() throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<MenuDTO> data = new ArrayList<>();
        String sql = " SELECT * FROM " + TABLE_MENU + " WHERE status=1";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                MenuDTO menuDTO = new MenuDTO();
                menuDTO.setNameBng(rs.getString("name_bng"));
                menuDTO.setNameEng(rs.getString("name_eng"));
                menuDTO.setUrl(rs.getString("url"));
                menuDTO.setId(rs.getInt("id"));

                data.add(menuDTO);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return data;
    }

    public static boolean update(MenuDTO dto) throws SQLException {
//        System.out.println("========= INSIDE MENU DAO UPDATE...=========================");
//        System.out.println(dto.toString());
//        System.out.println("=============END OF MENU DAO UPDATE... =====================");
        boolean success;
        Connection cn = null;
        PreparedStatement ps = null;
        //Statement history=null;
        // Statement check=null;
        // ResultSet rs = null;
        String sql = null;
        long ID;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            //          String q1 =  ;
//                cn.setAutoCommit(false);
//                history=cn.createStatement();
//                check=cn.createStatement();
//                String select=" Select * from";
//
//                String q1 = " insert into geo_history (source_id,name_eng,name_bng,bbs_code,status,created_by,modified_by,created,modified,expired_by )" +
//                        "select id,division_name_eng,division_name_bng,bbs_code,status,created_by,modified_by,created,modified," +
//                        userId+" from geo_divisions where geo_divisions.id = " +divisionDTO.getId() ;
////            statement=cn.prepareStatement(q1);
//                history.addBatch(q1);
//
////            String q2 = " ";
//
//
//
//
//                history.executeBatch();
//

            sql = "UPDATE  " + TABLE_MENU + " SET name_eng=?,name_bng=?,url=? WHERE id=?";
            ps = cn.prepareStatement(sql);

            int k = 0;

            ps.setString(++k, dto.getNameEng());
            ps.setString(++k, dto.getNameBng());
            ps.setString(++k, dto.getUrl());
            // ps.setInt(++k,1);
//                ps.setInt(++k,divisionDTO.getModifiedBy());
//                ps.setString(++k,divisionDTO.getModified());
            ps.setInt(++k, dto.getId());

            //rs.close();


//                System.out.println("==============sQL==========================");
//                System.out.println(ps.toString());
//                System.out.println("+==================================");


            ps.executeUpdate();
//                cn.commit();
            success = true;


        } catch (Exception ex) {
            ex.printStackTrace();
            success = false;
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return success;
    }

    public static boolean groupPolicyAdd(String menunameeng, String menunamebng, int[] insertedMenu, int[] insertedApp) {
        boolean success = false;
        Connection cn = null;
        PreparedStatement ps = null;
        Statement stmt = null;
        //Statement history=null;
        // Statement check=null;
        // ResultSet rs = null;
        String sql = null;
        long ID;
        try {
//             cn = DatabaseManager.getInstance().getConnection();
            ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_POLICY_GROUPS);
            cn = DatabaseManager.getInstance().getConnection();
            stmt = cn.createStatement();
            cn.setAutoCommit(false);
//            stmt=batchStatementAdder.moduleStatementAdd(stmt,orgId,result,modalId);
            stmt = new BatchStatementAdder().policyGroupAddStatementAdd(stmt, ID, menunameeng, menunamebng, insertedMenu, insertedApp);

            stmt.executeBatch();
            cn.commit();


            success = true;
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }


        return success;
    }
}
