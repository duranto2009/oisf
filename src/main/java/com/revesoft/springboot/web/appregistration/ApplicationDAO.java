package com.revesoft.springboot.web.appregistration;

import com.revesoft.springboot.web.menumanagement.MenuDAO;
import com.revesoft.springboot.web.menumanagement.MenuDTO;
import com.revesoft.springboot.web.office.officeunitorganogram.OfficeUnitOrganogramDTO;
import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


import org.jose4j.json.internal.json_simple.JSONArray;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.jose4j.json.internal.json_simple.JSONValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



/**
 * Created by Bony on 9/12/2017.
 */
@Repository
public class ApplicationDAO {

    private static final String TABLE_APPLICATION_REGISTRATION = "application_registration";

    @Autowired
    private DTOMapper dtoMapper;

    public long idGen() throws Exception {
        Connection cn = null;
        Long ID = null;
        String sql = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_APPLICATION_REGISTRATION);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (cn != null) cn.close();
        }
        return ID;
    }

    //region service CRUD


    public ArrayList<ServiceDTO> getOwnerListbyApp(int appid,int type) throws Exception {
        ArrayList<ServiceDTO> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT * FROM " + AllTable.TBL_SERVICE_OWNER + " WHERE app_id=? and status=1 AND type=? ORDER BY id ASC ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,appid);
            ps.setInt(2, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceDTO serviceDTO = new ServiceDTO();
                serviceDTO.setId(rs.getInt("id"));
                serviceDTO.setNameBng(rs.getString("name_bng"));
                serviceDTO.setNameEng(rs.getString("name_eng"));
                serviceDTO.setStatus(rs.getInt("status"));
                serviceDTO.setDescription(rs.getString("description"));
                serviceDTO.setLogoUrl(rs.getString("logo_url"));
                serviceDTO.setParentId(appid);
                serviceDTO.setType(type);
                data.add(serviceDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        //data=getServiceList(type);
        return data;

    }
    public ArrayList<ServiceDTO> getOwnerList(int type) throws Exception {
        ArrayList<ServiceDTO> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT * FROM " + AllTable.TBL_SERVICE_OWNER + " WHERE status=1 AND type=? ORDER BY id ASC ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceDTO serviceDTO = new ServiceDTO();
                serviceDTO.setId(rs.getInt("id"));
                serviceDTO.setNameBng(rs.getString("name_bng"));
                serviceDTO.setNameEng(rs.getString("name_eng"));
                serviceDTO.setStatus(rs.getInt("status"));
                serviceDTO.setLogoUrl(rs.getString("logo_url"));
                serviceDTO.setParentId(-1);
                data.add(serviceDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        //data=getServiceList(type);
        return data;

    }
    public ArrayList<ServiceDTO> getServiceListByApp(Integer appId) throws Exception {
        ArrayList<ServiceDTO> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + AllTable.TBL_SERVICE_LIST + " WHERE app_id=? AND  status=1 ORDER BY id ASC";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, appId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceDTO serviceDTO = new ServiceDTO();
                serviceDTO.setId(rs.getInt("id"));
                serviceDTO.setParentId(rs.getInt("service_owner_id"));
                serviceDTO.setNameEng(rs.getString("name_eng"));
                serviceDTO.setNameBng(rs.getString("name_bng"));
                serviceDTO.setStatus(rs.getInt("status"));

                data.add(serviceDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        return data;

    }
    public ArrayList<ServiceDetailsDTO> getServiceList(Integer parentId) throws Exception {
        ArrayList<ServiceDetailsDTO> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + AllTable.TBL_SERVICE_LIST + " WHERE service_owner_id=? AND  status=1 ORDER BY id ASC";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, parentId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceDetailsDTO serviceDTO = new ServiceDetailsDTO();
                serviceDTO.setId(rs.getInt("id"));
                serviceDTO.setServiceOwnerId(rs.getInt("service_owner_id"));
                serviceDTO.setNameEng(rs.getString("name_eng"));
                serviceDTO.setNameBng(rs.getString("name_bng"));
                serviceDTO.setDescription(rs.getString("description"));
                serviceDTO.setMetaDataRef(rs.getString("metadata_referance_number"));
                serviceDTO.setDataStanRef(rs.getString("db_standard_referance_num"));
                serviceDTO.setIntStanRef(rs.getString("integration_standard_referance_num"));
                serviceDTO.setIntStanRef(rs.getString("integration_standard_referance_num"));
                serviceDTO.setOwnerSubSystem(rs.getString("owner_sub_system"));
                serviceDTO.setOutputType(rs.getString("output_type"));
                serviceDTO.setOwnerSubSystem(rs.getString("owner_sub_system"));
                serviceDTO.setRequestUri(rs.getString("request_uri"));
                serviceDTO.setInvokingUri(rs.getString("invoking_uri"));
                serviceDTO.setExampleRequest(rs.getString("example_request"));
                serviceDTO.setExampleResponse(rs.getString("example_response"));

                data.add(serviceDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        return data;

    }
    public ArrayList<Integer> getSelectedService(int appid,int serviceType) throws Exception {
        ArrayList<Integer> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT service_id FROM " + AllTable.TBL_SERVICE_SYSTEM_PERMISSION + " WHERE system_id=? AND service_type=? ORDER BY id ASC ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, appid);
            ps.setInt(2,serviceType);
            rs = ps.executeQuery();
            while (rs.next()) {

                data.add(rs.getInt("service_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        //data=getServiceList(type);
        return data;

    }

    public ArrayList<ServiceFieldsDTO> getServiceFieldsListByService(Integer serviceId) throws Exception {
        ArrayList<ServiceFieldsDTO> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + AllTable.TBL_SERVICE_FIELDS+ " WHERE service_id=? and status=1  ORDER BY id ASC";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, serviceId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceFieldsDTO serviceDTO = new ServiceFieldsDTO();
                serviceDTO.setId(rs.getInt("id"));
                serviceDTO.setServiceId(rs.getInt("service_id"));
                serviceDTO.setNameEng(rs.getString("name_eng"));
                serviceDTO.setNameBng(rs.getString("name_bng"));
                serviceDTO.setFieldType(rs.getString("field_type"));
                serviceDTO.setDescription(rs.getString("description"));
                serviceDTO.setType(rs.getInt("type"));
                serviceDTO.setIsMandatory(rs.getInt("is_mandatory"));

                data.add(serviceDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        return data;

    }


    public boolean  systemMapperWithService(int[] coreServiceId, int[] sharedServiceId,int systemId)
            throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement ps2=null;
        boolean success=false;



        PreparedStatement delStmt = null;
        String sql = " INSERT INTO " + AllTable.TBL_SERVICE_SYSTEM_PERMISSION +
                " ( service_id,system_id,service_type )" +
                " VALUES (?,?,?)";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
//            delStmt=cn.prepareStatement(delSql);

            for (int coreId : coreServiceId) {


                //Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_SERVICE_SYSTEM_PERMISSION);
                int k = 0;

                // ps.setLong(++k, ID);
                ps.setInt(++k, coreId);
                ps.setInt(++k, systemId);
                ps.setInt(++k, 0);
                ps.executeUpdate();
            }
            for (int sharedId : sharedServiceId) {


//                Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_SERVICE_SYSTEM_PERMISSION);
                int k = 0;

//                ps.setLong(++k, ID);
                ps.setInt(++k, sharedId);
                ps.setInt(++k, systemId);
                ps.setInt(++k, 1);
                ps.executeUpdate();
            }
            cn.commit();
            success=true;

        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return success;

    }
    public boolean  ProviderSystemMapperWithService(int[] providerId,int systemId)
            throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        boolean success=false;



        PreparedStatement delStmt = null;
        String sql = " INSERT INTO " + AllTable.TBL_SERVICE_PROVIDER_MAPPING +
                " ( core_service_id,system_id )" +
                " VALUES (?,?)";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
//            delStmt=cn.prepareStatement(delSql);


            for (int providerID : providerId) {


                int k = 0;
                ps.setInt(++k, providerID);
                ps.setInt(++k, systemId);
                ps.executeUpdate();
            }
            cn.commit();
            success=true;

        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return success;

    }
    public boolean  deleteSystemMappingWithService(int[] coreServiceId, int[] sharedServiceId,int systemId) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement ps2=null;
        boolean success=false;



        PreparedStatement delStmt = null;
        String sql = " DELETE  from " + AllTable.TBL_SERVICE_SYSTEM_PERMISSION +
                " where service_id =? and system_id=? and service_type=? ";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
//            delStmt=cn.prepareStatement(delSql);

            for (int coreId : coreServiceId) {


                //Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_SERVICE_SYSTEM_PERMISSION);
                int k = 0;

                // ps.setLong(++k, ID);
                ps.setInt(++k, coreId);
                ps.setInt(++k, systemId);
                ps.setInt(++k, 0);
                ps.executeUpdate();
            }
            for (int sharedId : sharedServiceId) {


//                Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_SERVICE_SYSTEM_PERMISSION);
                int k = 0;

//                ps.setLong(++k, ID);
                ps.setInt(++k, sharedId);
                ps.setInt(++k, systemId);
                ps.setInt(++k, 1);
                ps.executeUpdate();
            }
            cn.commit();
            success=true;

        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return success;

    }


    public void updateOwner(ServiceDTO serviceDTO )throws Exception{
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE " + AllTable.TBL_SERVICE_OWNER + " SET  name_eng=?,name_bng=? ,description=?"
                    + " WHERE id=? ";
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setString(++k, serviceDTO.getNameEng());
            ps.setString(++k, serviceDTO.getNameBng());
            ps.setString(++k, serviceDTO.getDescription());
            ps.setInt(++k, serviceDTO.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }

    }
    public void delete(int id,String tableName )throws Exception{
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE   " +tableName + " set status=0 WHERE id=? ";
            ps = cn.prepareStatement(sql);
            int k = 0;

            ps.setInt(++k, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }

    }
    public void updateService(ServiceDetailsDTO serviceDTO )throws Exception{
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE " + AllTable.TBL_SERVICE_LIST +
                    " SET   name_eng=?,name_bng=? ,description=? , " +
                    "metadata_referance_number=?,integration_standard_referance_num =? , db_standard_referance_num=? , " +
                    " owner_sub_system=? ,invoking_uri=?,request_uri=?,example_request=? ,example_response=?, output_type=? "

                    + " WHERE id= " +serviceDTO.getId();
            ps = cn.prepareStatement(sql);
            ps=serviceDetailsSetter(ps,serviceDTO);
//            int k = 0;
//            ps.setString(++k, serviceDTO.getNameEng());
//            ps.setString(++k, serviceDTO.getNameBng());
//            ps.setString(++k, serviceDTO.getDescription());
//            ps.setString(++k, serviceDTO.getMetaDataRef());
//            ps.setString(++k, serviceDTO.getIntStanRef());
//            ps.setString(++k, serviceDTO.getDataStanRef());
//            ps.setString(++k, serviceDTO.getOwnerSubSystem());
//            ps.setString(++k, serviceDTO.getInvokingUri());
//            ps.setString(++k, serviceDTO.getRequestUri());
//            ps.setString(++k, serviceDTO.getExampleRequest());
//            ps.setString(++k, serviceDTO.getExampleResponse());
//            ps.setString(++k, serviceDTO.getOutputType());
//              ps.setInt(++k, serviceDTO.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }

    }

    public void addService(ServiceDetailsDTO serviceDTO )throws Exception{
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "INSERT into " + AllTable.TBL_SERVICE_LIST +
                    " (name_eng,name_bng ,description , " +
                    " metadata_referance_number,integration_standard_referance_num, db_standard_referance_num , " +
                    " owner_sub_system ,invoking_uri,request_uri,example_request ,example_response, output_type ,service_owner_id ,service_type ) "

                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?," +serviceDTO.getServiceOwnerId()+ " ," +serviceDTO.getServiceType()+ " )";
            ps = cn.prepareStatement(sql);
            ps=serviceDetailsSetter(ps,serviceDTO);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }

    }
    PreparedStatement serviceDetailsSetter(PreparedStatement ps,ServiceDetailsDTO serviceDTO) throws SQLException {
        int k=0;
        ps.setString(++k, serviceDTO.getNameEng());
        ps.setString(++k, serviceDTO.getNameBng());
        ps.setString(++k, serviceDTO.getDescription());
        ps.setString(++k, serviceDTO.getMetaDataRef());
        ps.setString(++k, serviceDTO.getIntStanRef());
        ps.setString(++k, serviceDTO.getDataStanRef());
        ps.setString(++k, serviceDTO.getOwnerSubSystem());
        ps.setString(++k, serviceDTO.getInvokingUri());
        ps.setString(++k, serviceDTO.getRequestUri());
        ps.setString(++k, serviceDTO.getExampleRequest());
        ps.setString(++k, serviceDTO.getExampleResponse());
        ps.setString(++k, serviceDTO.getOutputType());
        return ps;
    }

    public void insertOwner(ServiceDTO serviceDTO )throws Exception{
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "INSERT  into " + AllTable.TBL_SERVICE_OWNER + "(name_eng,name_bng ,description,type,app_id)"
                    + " VALUES (?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setString(++k, serviceDTO.getNameEng());
            ps.setString(++k, serviceDTO.getNameBng());
            ps.setString(++k, serviceDTO.getDescription());
            ps.setInt(++k,serviceDTO.getType());
            ps.setInt(++k, serviceDTO.getAppId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }

    }
    public void updateServiceFileds(ServiceFieldsDTO serviceDTO) {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE " + AllTable.TBL_SERVICE_FIELDS +
                    " SET   name_eng=?,name_bng=? ,description=? , field_type=? , " +
                    " type=? , is_mandatory=? " +

                    " WHERE id= " +serviceDTO.getId();
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setString(++k, serviceDTO.getNameEng());
            ps.setString(++k, serviceDTO.getNameBng());
            ps.setString(++k, serviceDTO.getDescription());
            ps.setString(++k,serviceDTO.getFieldType());
            ps.setInt(++k,serviceDTO.getType());
            ps.setInt(++k,serviceDTO.getIsMandatory());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }
    }


    public void addServiceFileds(ServiceFieldsDTO serviceDTO) {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "INSERT  into " + AllTable.TBL_SERVICE_FIELDS +
                    "(service_id,name_bng,name_eng ,field_type,description,type,is_mandatory)"
                    + " VALUES (?,?,?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            int k = 0;

            ps.setInt(++k, serviceDTO.getServiceId());
            ps.setString(++k, serviceDTO.getNameBng());
            ps.setString(++k, serviceDTO.getNameEng());
            ps.setString(++k, serviceDTO.getFieldType());
            ps.setString(++k, serviceDTO.getDescription());
            ps.setInt(++k,serviceDTO.getType());
            ps.setInt(++k,serviceDTO.getIsMandatory());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }
    }



    //endregion


    //region origin mapping

    public ArrayList<Integer> getSelectedOrigins(int appid,int hasExceptions) throws Exception {
        ArrayList<Integer> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT DISTINCT origin_org_id FROM " + AllTable.TBL_DESIGNATION_MENU_ROLES +
                " WHERE menu_id=? AND type=1 and has_exceptions=? and origin_org_id !=0";

//        String sql = " SELECT DISTINCT origin_org_id FROM " + AllTable.TBL_DESIGNATION_MENU_ROLES +
//                " WHERE menu_id=? AND type=1 and has_exceptions=? ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, appid);
            ps.setInt(2,hasExceptions);
            rs = ps.executeQuery();
            while (rs.next()) {

                data.add(rs.getInt("origin_org_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        //data=getServiceList(type);
        return data;

    }
    public JSONObject getSelectedOriginsDetails(int originId) throws Exception {
        JSONObject data = new JSONObject();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " select o.id as originorgid, u.id as originunitid, u.office_origin_id as originid , u.office_ministry_id as ministryid from "
                +AllTable.TBL_OFFICE_ORIGIN_UNIT_ORG+ " o inner join "  +AllTable.TBL_OFFICE_ORIGIN_UNIT+ " u on u.id=o.office_origin_unit_id where o.id=?";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, originId);
            rs = ps.executeQuery();
            while (rs.next()) {


                data.put("originorgid",originId);
                data.put("originunitid",rs.getInt("originunitid"));
                data.put("originid",rs.getInt("originid"));
                data.put("ministryid",rs.getInt("ministryid"));

//                data.add(rs.getInt("origin_org_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        //data=getServiceList(type);
        return data;

    }

    public ArrayList<Integer> getSelectedOrganograms(int originId) throws Exception {
        ArrayList<Integer> data = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT designation_id FROM " + AllTable.TBL_DESIGNATION_MENU_ROLES +
                " WHERE  type=1 AND  origin_org_id =? ORDER BY id ASC ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, originId);
//            ps.setInt(2,hasExceptions);
            rs = ps.executeQuery();
            while (rs.next()) {

                data.add(rs.getInt("designation_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
        //data=getServiceList(type);
        return data;

    }

    public ArrayList<Integer> officeOrganogrambyOfficeOriginOrganogram(Connection cn, int originId) throws Exception {
        ArrayList<Integer> organograms = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT id FROM " + AllTable.TBL_OFFICE_UNIT_ORG + " WHERE ref_origin_unit_org_id=? ";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, originId);
            rs = ps.executeQuery();
            while (rs.next()) {
                organograms.add(rs.getInt("id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return organograms;

    }


    public boolean appMapperWithOriginOgranogram(int[] originOrgId, int applicationId) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        boolean success=false;

//        String delSql="Delete from " +AllTable.TBL_DESIGNATION_MENU_ROLES+ " where menu_id=? and designation_id=? ";
        String sql = " INSERT INTO " + AllTable.TBL_DESIGNATION_MENU_ROLES +
                " ( id,menu_id,designation_id,type,origin_org_id,has_exceptions)" +
                " VALUES (?,?,?,?,?,?)";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
//            delStmt=cn.prepareStatement(delSql);

            for (int originId : originOrgId) {

                ArrayList<Integer> orgIds = officeOrganogrambyOfficeOriginOrganogram(cn, originId);
                for (Integer orgid : orgIds) {
                    Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_DESIGNATION_MENU_ROLES);
                    int k = 0;

                    ps.setLong(++k, ID);
                    ps.setInt(++k, applicationId);
                    ps.setInt(++k, orgid);
                    ps.setInt(++k, 1);
                    ps.setInt(++k, originId);
                    ps.setInt(++k, 0);
                    ps.executeUpdate();
                }
            }
            cn.commit();
            success=true;
        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return success;
    }

    public boolean deleteAppMappingWithOriginOgranogram(int[] originOrgId, int applicationId) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        boolean success=false;

//        String delSql="Delete from " +AllTable.TBL_DESIGNATION_MENU_ROLES+ " where menu_id=? and designation_id=? ";
        String sql = " DELETE FROM " + AllTable.TBL_DESIGNATION_MENU_ROLES +
                " where designation_id=? and menu_id=? and type=1 and has_exceptions=0 ";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
//            delStmt=cn.prepareStatement(delSql);

            for (int originId : originOrgId) {

                ArrayList<Integer> orgIds = officeOrganogrambyOfficeOriginOrganogram(cn, originId);
                for (Integer orgid : orgIds) {


                    ps.setLong(1, orgid);
                    ps.setInt(2,applicationId);
                    ps.executeUpdate();
                }
            }
            cn.commit();
            success=true;

        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return success;

    }

    public boolean appMapperWithExceptionOriginOgranogram(ArrayList<HashMap> organograms, int applicationId) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;

        boolean success=false;
        String sql = " INSERT INTO " + AllTable.TBL_DESIGNATION_MENU_ROLES +
                " ( id,menu_id,designation_id,type,origin_org_id,has_exceptions)" +
                " VALUES (?,?,?,?,?,?)";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);

            for (HashMap<Integer,Integer> object : organograms) {

                Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_DESIGNATION_MENU_ROLES);
                int k = 0;
                Integer key=(Integer) object.keySet().toArray()[0];

                ps.setLong(++k, ID);
                ps.setInt(++k, applicationId);
                ps.setInt(++k, object.get(key));
                ps.setInt(++k, 1);
                ps.setInt(++k, key);
                ps.setInt(++k, 1);
                ps.executeUpdate();

            }
            cn.commit();
            success=true;
        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return success;

    }

    public boolean deleteappMappingWithExceptionOriginOgranogram(ArrayList<HashMap> organograms, int applicationId) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;

        boolean success=false;
        String sql = " DELETE From " + AllTable.TBL_DESIGNATION_MENU_ROLES +
                " where designation_id=? and menu_id=? and type=1 ";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);

            for (HashMap<Integer,Integer> object : organograms) {

                Integer key=(Integer) object.keySet().toArray()[0];
                ps.setInt(1, object.get(key));
                ps.setInt(2,applicationId);
                ps.executeUpdate();

            }
            cn.commit();
            success=true;
        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return success;

    }


    //endregion



    //region application CRUD

    public ApplicationDTO getApplicationById(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ApplicationDTO applicationDTO = null;

        String sql = "SELECT * FROM " + AllTable.TBL_APPLICATION_REGISTRATION + " WHERE id = ?";

        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.first()) {
                applicationDTO = dtoMapper.mapApplicationDTO(resultSet);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            clearResources(connection, preparedStatement, resultSet);
        }

        return applicationDTO;
    }

    public Object getApplicationInfo(int id, String field) {
        Object object = null;
        if (field != null) {
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet result = null;
            String sql = "SELECT " + field + " FROM " + AllTable.TBL_APPLICATION_REGISTRATION + " WHERE id = ?";
            try {
                connection = DatabaseManager.getInstance().getConnection();
                statement = connection.prepareStatement(sql);
                statement.setInt(1, id);
                result = statement.executeQuery();
                if (result.first()) {
                    object = result.getObject(field);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                clearResources(connection, statement, null);
            }
        }
        return object;
    }

    public Object getApplicationInfo(String name, String field) {
        Object object = null;
        if (field != null) {
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet result = null;
            String sql = "SELECT " + field + " FROM " + AllTable.TBL_APPLICATION_REGISTRATION + " WHERE application_name = ?";
            try {
                connection = DatabaseManager.getInstance().getConnection();
                statement = connection.prepareStatement(sql);
                statement.setString(1, name);
                result = statement.executeQuery();
                if (result.first()) {
                    object = result.getObject(field);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                clearResources(connection, statement, null);
            }
        }
        return object;
    }

    public boolean addApplication(ApplicationDTO applicationDTO, Long userID) throws Exception {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        long ID;
        boolean status = false;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            sql = "INSERT INTO " + AllTable.TBL_APPLICATION_REGISTRATION + " ( id,application_name,application_name_bng,url,status,"
                    + "email_address,mobile_no,notification_mechanism,created_by, redirect_url,logo_url,default_page_url,logout_url) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            ID = DatabaseManager.getInstance().getNextSequenceId(TABLE_APPLICATION_REGISTRATION);
            applicationDTO.setId(ID);
            int k = 0;
            ps.setLong(++k, applicationDTO.getId());
            ps.setString(++k, applicationDTO.getName());
            ps.setString(++k, applicationDTO.getNameBng());
            ps.setString(++k, applicationDTO.getLink());
            ps.setInt(++k, applicationDTO.getStatus());
            ps.setString(++k, applicationDTO.getAppDomainEmail());
            ps.setString(++k, applicationDTO.getMobileNo());
            if( applicationDTO.getNotificationFlag().equals("sms")){
                ps.setInt(++k,0);
            }else{
                ps.setInt(++k,1);
            }

            ps.setLong(++k, applicationDTO.getCreatedBy());
            ps.setString(++k, applicationDTO.getRedirect());
            ps.setString(++k, applicationDTO.getLogoUrl());
            ps.setString(++k, applicationDTO.getDefaultPageURL());
            ps.setString(++k, applicationDTO.getLogoutURL());
            ps.executeUpdate();
            cn.commit();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }
        return status;
    }

    public void updateApplication(ApplicationDTO applicationDTO) throws Exception {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE " + AllTable.TBL_APPLICATION_REGISTRATION + " SET  application_name=?,application_name_bng=? ,url=?,email_address=?,mobile_no=?,notification_mechanism=?, redirect_url=?,logout_url=?, default_page_url=?,logo_url=?"
                    + ",modified=?,modified_by=? WHERE id=? ";
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setString(++k, applicationDTO.getName());
            ps.setString(++k, applicationDTO.getNameBng());
            ps.setString(++k, applicationDTO.getLink());
            ps.setString(++k, applicationDTO.getAppDomainEmail());
            ps.setString(++k, applicationDTO.getMobileNo());
            if( applicationDTO.getNotificationFlag().equals("sms")){
                ps.setInt(++k,0);
            }else{
                ps.setInt(++k,1);
            }


            ps.setString(++k, applicationDTO.getRedirect());
            ps.setString(++k,applicationDTO.getLogoutURL());
            ps.setString(++k, applicationDTO.getDefaultPageURL());
            ps.setString(++k, applicationDTO.getLogoUrl());


            ps.setString(++k, applicationDTO.getUpadateDate());
            ps.setLong(++k, applicationDTO.getUpdatedBy());
            ps.setLong(++k, applicationDTO.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }
    }

    public void approveApplication(int id, String key,String clientId, int userId) throws Exception {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            sql = "UPDATE " + AllTable.TBL_APPLICATION_REGISTRATION + " SET  is_approved=1,status=1,application_secret=? ,client_id=? WHERE id=? ";

            // TODO : autowired
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setString(++k, key);
            ps.setString(++k, clientId);
            ps.setLong(++k, id);
            ps.executeUpdate();
            cn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }
    }

    public void declineApplication(Long id) throws Exception {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE " + AllTable.TBL_APPLICATION_REGISTRATION + " SET  is_rejected=1 , status=0 WHERE id=? ";
            ps = cn.prepareStatement(sql);
            System.out.println(ps.toString());
            int k = 0;
            ps.setLong(++k, id);
            ps.executeUpdate();
            //ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }
    }

    public boolean deleteApplication(Integer id) throws Exception {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        boolean status = false;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE " + AllTable.TBL_APPLICATION_REGISTRATION + " SET status=0 WHERE id=? ";
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setInt(++k, id);
            ps.execute();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
            status =false;
        } finally {
            clearResources(cn, ps, null);
        }
        return status;
    }
    public ApplicationDTO dtoSetter(ResultSet rs) throws Exception {
        ApplicationDTO applicationDTO = new ApplicationDTO();
        applicationDTO.setId(rs.getLong("id"));
        applicationDTO.setName(rs.getString("application_name"));
        applicationDTO.setNameBng(rs.getString("application_name_bng"));
        applicationDTO.setLink(rs.getString("url"));
        applicationDTO.setStatus(rs.getInt("status"));
        applicationDTO.setAllowedIP(rs.getString("ip_address_list"));
        applicationDTO.setAppDomainEmail(rs.getString("email_address"));
        applicationDTO.setRedirect(rs.getString("redirect_url"));
        applicationDTO.setMobileNo(rs.getString("mobile_no"));
        if(rs.getInt("notification_mechanism")==0){
            applicationDTO.setNotificationFlag("sms");
        }else{
            applicationDTO.setNotificationFlag("email");
        }

        applicationDTO.setDefaultPageURL(rs.getString("default_page_url"));
        applicationDTO.setLogoutURL(rs.getString("logout_url"));
        applicationDTO.setIs_framework(rs.getInt("is_framework"));
        applicationDTO.setCreateDate(rs.getString("created"));
        applicationDTO.setUpadateDate(rs.getString("modified"));
        applicationDTO.setCreatedBy(rs.getLong("created_by"));
        applicationDTO.setUpdatedBy(rs.getLong("modified_by"));
        applicationDTO.setLogoUrl(rs.getString("logo_url"));
        applicationDTO.setIsCurrent(rs.getInt("is_current"));
        return applicationDTO;
    }
    public ArrayList<ApplicationDTO> getApproveMenu() throws Exception {
        ArrayList<ApplicationDTO> data = new ArrayList();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + AllTable.TBL_APPLICATION_REGISTRATION + " WHERE is_approved=0 AND is_rejected !=1";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ApplicationDTO applicationDTO = dtoSetter(rs);
                data.add(applicationDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(connection, stmt, rs);
        }
        return data;
    }

    public ApplicationDTO getSingleMenu(int appid) throws Exception {
        ApplicationDTO applicationDTO = new ApplicationDTO();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + AllTable.TBL_APPLICATION_REGISTRATION + " WHERE id =?";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            int k = 0;
            stmt = connection.prepareStatement(sql);
            stmt.setInt(++k, appid);
            rs = stmt.executeQuery();
            while (rs.next()) {
                applicationDTO = dtoSetter(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(connection, stmt, rs);
        }
        return applicationDTO;
    }

    public ArrayList<ApplicationDTO> getAppData() throws Exception {
        ArrayList<ApplicationDTO> data = new ArrayList();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = " SELECT * FROM " + AllTable.TBL_APPLICATION_REGISTRATION + " WHERE status=1 AND is_approved=1 AND is_rejected !=1 ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ApplicationDTO applicationDTO = dtoSetter(rs);
                data.add(applicationDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(connection, stmt, rs);
        }
        return data;
    }
    public int isPublished(int id) {
        int isPublished=-1;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = " SELECT is_published from " + AllTable.TBL_APPLICATION_REGISTRATION + " WHERE id =? and status=1 ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                if(rs.getInt("is_published")==1)
                {
                    isPublished=1;
                }else {
                    isPublished=0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(connection, stmt, rs);
        }
        return isPublished;
    }

    public boolean publishApplication(int id,  int publish) throws Exception {
        String sql = null;
        Connection cn = null;
        boolean success=false;
        PreparedStatement ps = null;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            sql = "UPDATE " + AllTable.TBL_APPLICATION_REGISTRATION + " SET  is_published=? WHERE id=? ";

            // TODO : autowired
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setInt(++k,publish);
            ps.setInt(++k, id);
            ps.executeUpdate();
            cn.commit();
            success=true;
        } catch (Exception e) {
            cn.rollback();
            success=false;
            e.printStackTrace();
        } finally {
            clearResources(cn, ps, null);
        }
        return success;
    }


    //endregion


    //region module CRUD


    public void addModule(ApplicationModuleDTO applicationModuleDTO) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        String sql = " INSERT INTO " + AllTable.TBL_APPLICATION_MODULE + " (id,name_eng,name_bng,url,application_id,created_by) VALUES (?,?,?,?,?,?) ";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_APPLICATION_MODULE);
            int k = 0;
            ps.setLong(++k, ID);
            ps.setString(++k, applicationModuleDTO.getNameEng());
            ps.setString(++k, applicationModuleDTO.getNameBng());
            ps.setString(++k, applicationModuleDTO.getUrl());

            ps.setInt(++k, applicationModuleDTO.getApplicationId());
            ps.setInt(++k, applicationModuleDTO.getCreatedBy());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
    }

    public void editModule(ApplicationModuleDTO applicationModuleDTO) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
//        sql = "UPDATE " + TABLE_APPLICATION_REGISTRATION + " SET  application_name=?,application_name_bng=? ,url=?,email_address=?,mobile_no=?,notification_mechanism=?, redirect_url=?, default_page_url=?,logo_url=?"
//                + ",modified=?,modified_by=? Where id=? ";
        String sql = " UPDATE " + AllTable.TBL_APPLICATION_MODULE + " SET name_eng = ?,name_bng = ?,url = ? WHERE id=?";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
//            Long ID = DatabaseManager.getInstance().getNextSequenceId(TABLE_APPLICATION_MODULE);
            int k = 0;
//            ps.setLong(++k, ID);
            ps.setString(++k, applicationModuleDTO.getNameEng());
            ps.setString(++k, applicationModuleDTO.getNameBng());
            ps.setString(++k, applicationModuleDTO.getUrl());

            ps.setInt(++k, applicationModuleDTO.getApplicationId());
//            ps.setInt(++k, applicationModuleDTO.getCreatedBy());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
    }

    public boolean deleteModule(Integer id) throws Exception {
        String sql = null;
        Connection cn = null;
        PreparedStatement ps = null;
        boolean status = false;
        try {
            cn = DatabaseManager.getInstance().getConnection();
            sql = "UPDATE " + AllTable.TBL_APPLICATION_MODULE + " SET status=0 WHERE id=? ";
            ps = cn.prepareStatement(sql);
            int k = 0;
            ps.setInt(++k, id);
            ps.execute();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
            status =false;
        } finally {
            clearResources(cn, ps, null);
        }
        return status;
    }

    //    private ArrayList<ApplicationDTO> queryProecesser(Connection cn,PreparedStatement ps)

    public ApplicationModuleDTO moduleDtoSetter(ResultSet rs) throws Exception {
        ApplicationModuleDTO applicationDTO = new ApplicationModuleDTO();
        applicationDTO.setId(rs.getInt("id"));
        applicationDTO.setNameEng(rs.getString("name_eng"));
        applicationDTO.setNameBng(rs.getString("name_bng"));
        applicationDTO.setUrl(rs.getString("url"));
        applicationDTO.setStatus(rs.getInt("status"));


        return applicationDTO;
    }

    public ArrayList<ApplicationModuleDTO> getModuleData(int id) throws Exception {
        ArrayList<ApplicationModuleDTO> data = new ArrayList();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = " SELECT * from " + AllTable.TBL_APPLICATION_MODULE + " WHERE status=1 and application_id = " + id;
        try {
            connection = DatabaseManager.getInstance().getConnection();
            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ApplicationModuleDTO applicationDTO = moduleDtoSetter(rs);
                data.add(applicationDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(connection, stmt, rs);
        }
        return data;
    }
    //endregion


    private void clearResources(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            DatabaseManager.getInstance().freeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }



    //region menu map
    public void appRoleMapperForPolicyGroup(int policygroupid, int[] deleted, int[] inserted) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement delStmt = null;
        String delSql = "Delete from " + AllTable.TBL_POLICY_GROUP_MENU + " where menu_id=? and policy_group_id=? ";
        String sql = " INSERT INTO " + AllTable.TBL_POLICY_GROUP_MENU + " (id,policy_group_id,menu_id,menu_type) VALUES (?,?,?,?)";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            delStmt = cn.prepareStatement(delSql);
            for (int appId : inserted) {

                Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_POLICY_GROUP_MENU);
                int k = 0;

                ps.setLong(++k, ID);
                ps.setInt(++k, policygroupid);
                ps.setInt(++k, appId);
                ps.setInt(++k, 1);

                ps.executeUpdate();

            }

            System.out.println("----------------------------------------------start appRoleMapperForPolicyGroup------------------------------------------------------------------------");
            System.out.println("delSql          :" + delSql);
//            System.out.println("menu_id          :" +delSql);
//            System.out.println("delSql          :" +delSql);


            for (int appId : deleted) {
                System.out.println("menu_id          :" + appId);
                System.out.println("delSql          :" + policygroupid);
                delStmt.setInt(1, appId);
                delStmt.setInt(2, policygroupid);
                delStmt.executeUpdate();

            }
            System.out.println("-----------------------------------------------end appRoleMapperForPolicyGroup-----------------------------------------------------------------------");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        }

    }
    public void appRoleMapper(int designationId, int[] deleted, int[] inserted) throws Exception {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement delStmt = null;
        String delSql = "DELETE FROM " + AllTable.TBL_DESIGNATION_MENU_ROLES + " WHERE menu_id=? AND designation_id=? ";
        String sql = " INSERT INTO " + AllTable.TBL_DESIGNATION_MENU_ROLES + " (id,menu_id,designation_id,type) VALUES (?,?,?,?)";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            delStmt = cn.prepareStatement(delSql);
            for (int appId : inserted) {

                Long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_DESIGNATION_MENU_ROLES);
                int k = 0;

                ps.setLong(++k, ID);
                ps.setInt(++k, appId);
                ps.setInt(++k, designationId);
                ps.setInt(++k, 1);

                ps.executeUpdate();

            }
            for (int appId : deleted) {
                delStmt.setInt(1, appId);
                delStmt.setInt(2, designationId);
                delStmt.executeUpdate();

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
        }

    }



    //endregion




}
