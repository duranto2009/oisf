package com.revesoft.springboot.web.office.offices;

import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;
import org.jose4j.json.internal.json_simple.JSONObject;
//import org.opensaml.ws.wspolicy.All;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by reve on 11/12/2017.
 */
@Repository
public class OfficeDAO {
    int count =0;



    public void updateOfficeGeo(Connection con,String updateField,int fieldId,String sourceField,int oldFieldId)throws Exception{
//
        PreparedStatement ps=null;
        String sql = " UPDATE "  + AllTable.TBL_OFFICES+ " set " +updateField +" = " +fieldId+ " where "+sourceField+ " = " +oldFieldId;
        try {
//            con=DatabaseManager.getInstance().getConnection()
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {

            if(ps!=null)ps.close();

        }
    }

    ArrayList<OfficeDTO> autoFill(ResultSet resultSet){
        ArrayList<OfficeDTO> officeDTOList = new ArrayList<>();
        try {
            while(resultSet.next()){
                officeDTOList.add(new OfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("office_ministry_id"),
                        resultSet.getInt("office_layer_id"),
                        resultSet.getInt("office_origin_id"),
                        resultSet.getString("office_name_eng"),
                        resultSet.getString("office_name_bng"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_city_corporation_id"),
                        resultSet.getInt("geo_city_corporation_ward_id"),
                        resultSet.getInt("geo_municipality_id"),
                        resultSet.getInt("geo_municipality_ward_id"),
                        resultSet.getInt("geo_union_id"),
                        resultSet.getString("office_address"),
                        resultSet.getString("digital_nothi_code"),
                        resultSet.getString("reference_code"),
                        resultSet.getString("office_code"),
                        resultSet.getString("office_phone"),
                        resultSet.getString("office_mobile"),
                        resultSet.getString("office_fax"),
                        resultSet.getString("office_email"),
                        resultSet.getString("office_web"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getInt("geo_postoffice_id"),
                        resultSet.getInt("geo_country_id"),
                        resultSet.getInt("parent_office_id"),
                        resultSet.getByte("status"),
                        resultSet.getInt("created_by"),
                        resultSet.getInt("modified_by"),
                        resultSet.getTimestamp("created"),
                        resultSet.getTimestamp("modified")));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return officeDTOList;
    }
    OfficeDTO dtoSetter(ResultSet resultSet) throws Exception{
        OfficeDTO officeDTO =new OfficeDTO(resultSet.getInt("id"),
                        resultSet.getInt("office_ministry_id"),
                        resultSet.getInt("office_layer_id"),
                        resultSet.getInt("office_origin_id"),
                        resultSet.getString("office_name_eng"),
                        resultSet.getString("office_name_bng"),
                        resultSet.getInt("geo_division_id"),
                        resultSet.getInt("geo_district_id"),
                        resultSet.getInt("geo_upazila_id"),
                        resultSet.getInt("geo_city_corporation_id"),
                        resultSet.getInt("geo_city_corporation_ward_id"),
                        resultSet.getInt("geo_municipality_id"),
                        resultSet.getInt("geo_municipality_ward_id"),
                        resultSet.getInt("geo_union_id"),
                        resultSet.getString("office_address"),
                        resultSet.getString("digital_nothi_code"),
                        resultSet.getString("reference_code"),
                        resultSet.getString("office_code"),
                        resultSet.getString("office_phone"),
                        resultSet.getString("office_mobile"),
                        resultSet.getString("office_fax"),
                        resultSet.getString("office_email"),
                        resultSet.getString("office_web"),
                        resultSet.getInt("geo_thana_id"),
                        resultSet.getInt("geo_postoffice_id"),
                        resultSet.getInt("geo_country_id"),
                        resultSet.getInt("parent_office_id"),
                        resultSet.getByte("status"),
                        resultSet.getInt("created_by"),
                        resultSet.getInt("modified_by"),
                        resultSet.getTimestamp("created"),
                        resultSet.getTimestamp("modified"));


        return officeDTO;
    }

    public ArrayList<OfficeDTO> getOfficeList() throws Exception{
        ArrayList<OfficeDTO> officeDTOS =  null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("status",1);
            count = sc.tableDatacount("offices");
            resultSet = sc.select(con,"offices", data);
            officeDTOS = autoFill(resultSet);


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }
    public OfficeDTO getSingleOffice(int id) throws Exception{
        OfficeDTO officeDTO =  new OfficeDTO();
        Connection con = null;
        ResultSet resultSet = null;
        PreparedStatement  ps=null;
        SQLStatementCreator sc = new SQLStatementCreator();
        String sql="Select * from " + AllTable.TBL_OFFICES +" where id=? ";

        try{
            con= DatabaseManager.getInstance().getConnection();
            ps=con.prepareStatement(sql);
            ps.setInt(1,id);


            resultSet = ps.executeQuery();
            while (resultSet.next()){

                officeDTO=dtoSetter(resultSet);

            }


        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTO;
    }

    public ArrayList<OfficeDTO> getOfficeList(int id) throws Exception{
        ArrayList<OfficeDTO> officeDTOS =  null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_layer_id",id);
            data.addtoConditionANDEquall("status",1);
            count = sc.tableDatacount("offices");
            resultSet = sc.select(con,"offices", data);
            officeDTOS = autoFill(resultSet);

        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }

    public ArrayList<OfficeDTO> officebyMinistry(int id) throws Exception{
        ArrayList<OfficeDTO> officeDTOS =  null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("status",1);
            data.addtoConditionANDEquall("office_ministry_id",id);
            count = sc.tableDatacount("offices");
            resultSet = sc.select(con,"offices", data);
            officeDTOS = autoFill(resultSet);

        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }

    public ArrayList<OfficeDTO> getOfficeListbyPage(int page, int pageSize) throws Exception{
        Connection con = null;
        ResultSet resultSet = null;
        SQLJsonData js = new SQLJsonData();
        ArrayList<OfficeDTO> officeDTOS = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try {
            con = DatabaseManager.getInstance().getConnection();
            count = sc.tableDatacount("offices");
            js.add("all", "");
            js.addtoConditionANDEquall("status",1);
            js.addPage("page", (page - 1) * pageSize, pageSize);
            resultSet = sc.select(con, "offices", js);
            officeDTOS = autoFill(resultSet);
        }catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }
    public ArrayList<OfficeDTO> getOfficeListbyPage(int page, int pageSize, String searchMsg) throws Exception{
        Connection con = null;
        ResultSet resultSet = null;
        SQLJsonData js = new SQLJsonData();
        ArrayList<OfficeDTO> officeDTOS = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        try{

            con = DatabaseManager.getInstance().getConnection();
            JSONObject or1 = new JSONObject();
            or1.put("office_name_eng","%"+searchMsg+"%");
            or1.put("office_name_bng","%"+searchMsg+"%");
            js.addtoConditionORLike(
                    "or1",or1);
            js.addtoConditionANDEquall("status",1);
            js.addPage("page",(page-1)*pageSize,pageSize);
            count = sc.searchCount(con,"offices",js);
            resultSet = sc.search(con,"offices", js);
            officeDTOS = autoFill(resultSet);
        }
        catch (Exception ex){
         ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }
    public ArrayList<OfficeDTO> getOfficeListbyPage(int page, int pageSize, String[] searchParam) throws Exception{
        Connection con = null;
        ResultSet resultSet = null;
        ArrayList<OfficeDTO> officeDTOS = null;
        SQLJsonData js = new SQLJsonData();
        SQLStatementCreator sc = new SQLStatementCreator();
        try{

            int searchParamSize = searchParam.length;
            for(int i=0;i<searchParamSize;i++){
                String s = searchParam[i];
                if(!s.equals("null") && !s.equals("-1") && !s.equals("")){

                    switch (i){
                        case 0:
                            JSONObject or1 = new JSONObject();
                            or1.put("office_name_eng","%"+searchParam[0]+"%");
                            or1.put("office_name_bng","%"+searchParam[0]+"%");
                            js.addtoConditionORLike("or1",or1);
                            break;
                        case 1:
                            js.addtoConditionANDLike("bbs_code","%"+searchParam[1]+"%");
                            break;
                        case 2:
                            js.addtoConditionANDEquall("geo_division_id",Integer.parseInt(searchParam[2]));
                            break;
                        case 3:
                            js.addtoConditionANDEquall("geo_district_id",Integer.parseInt(searchParam[3]));
                            break;
                        case 4:
                            js.addtoConditionANDEquall("geo_upazila_id",Integer.parseInt(searchParam[4]));
                            break;
                    }
                }
            }
            con = DatabaseManager.getInstance().getConnection();
            js.addtoConditionANDEquall("status",1);
            js.addPage("page",(page-1)*pageSize,pageSize);

            count = sc.searchCount(con,"offices",js);
            resultSet =sc.search(con,"offices",js);
            officeDTOS = autoFill(resultSet);
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }

    public int getCount() {
        return count;
    }

    public int addOffice(OfficeDTO officeDTO) throws  Exception
    {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        int success =0;
        try{
            con = DatabaseManager.getInstance().getConnection();
            long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_OFFICES);
            sql = "insert into "+AllTable.TBL_OFFICES+" ( "+
                    "id,"+
                    "office_ministry_id,"+
                    "office_layer_id,"+
                    "office_origin_id,"+
                    "office_name_eng,"+
                    "office_name_bng,"+
                    "geo_division_id,"+
                    "geo_district_id,"+
                    "geo_thana_id,"+
                    "geo_postoffice_id,"+
                    "geo_upazila_id,"+
                    "geo_city_corporation_id,"+
                    "geo_union_id,"+
                    "geo_municipality_id,"+
                    "geo_country_id,"+
                    "geo_city_corporation_ward_id,"+
                    "geo_municipality_ward_id,"+
                    "office_address,"+
                    "digital_nothi_code,"+
                    "office_code,"+
                    "office_phone,"+
                    "office_mobile,"+
                    "office_fax,"+
                    "office_email,"+
                    "office_web,"+
                    "reference_code,"+
                    "parent_office_id,"+
                    "created_by,"+
                    "created"+
                    " ) "+
                    " values ( "+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?,"+
                    "?"+
                    " ) ";

            ps = con.prepareStatement(sql);
            int k=0;
            ps.setInt(++k,(int)ID);
            ps.setInt(++k,officeDTO.getOfficeMinistryId());
            ps.setInt(++k,officeDTO.getOfficeLayerId());
            ps.setInt(++k,officeDTO.getOfficeOriginId());
            ps.setString(++k,officeDTO.getOfficeNameEng());
            ps.setString(++k,officeDTO.getOfficeNameBng());
            ps.setInt(++k,(officeDTO.getGeoDivisionId()<=0)?0:officeDTO.getGeoDivisionId());
            ps.setInt(++k,(officeDTO.getGeoDistrictId()<=0)?0:officeDTO.getGeoDistrictId());
            ps.setInt(++k,(officeDTO.getGeoThanaId()<=0)?0:officeDTO.getGeoThanaId());
            ps.setInt(++k,(officeDTO.getGeoPostofficeId()<=0)?0:officeDTO.getGeoPostofficeId());
            ps.setInt(++k,(officeDTO.getGeoUpazilaId()<=0)?0:officeDTO.getGeoUpazilaId());
            ps.setInt(++k,(officeDTO.getGeoCityCorporationId()<=0)?0:officeDTO.getGeoCityCorporationId());
            ps.setInt(++k,(officeDTO.getGeoUnionId()<=0)?0:officeDTO.getGeoUnionId());
            ps.setInt(++k,(officeDTO.getGeoMunicipalityId()<=0)?0:officeDTO.getGeoMunicipalityId());
            ps.setInt(++k,(officeDTO.getCountryId()<=0)?0:officeDTO.getCountryId());
            ps.setInt(++k,(officeDTO.getGeoCityCorporationWardId()<=0)?0:officeDTO.getGeoCityCorporationWardId());
            ps.setInt(++k,(officeDTO.getGeoMunicipalityWardId()<=0)?0:officeDTO.getGeoMunicipalityWardId());
            ps.setString(++k,officeDTO.getOfficeAddress());
            ps.setString(++k,officeDTO.getDigitalNothiCode());
            ps.setString(++k,officeDTO.getOfficeCode());
            ps.setString(++k,officeDTO.getOfficePhone());
            ps.setString(++k,officeDTO.getOfficeMobile());
            ps.setString(++k,officeDTO.getOfficeFax());
            ps.setString(++k,officeDTO.getOfficeEmail());
            ps.setString(++k,officeDTO.getOfficeWeb());
            ps.setString(++k,officeDTO.getReferenceCode());
            ps.setInt(++k,officeDTO.getParentOfficeId());
            ps.setInt(++k,officeDTO.getCreatedBy());
            ps.setTimestamp(++k,officeDTO.getCreated());


            System.out.println(ps);

            ps.executeUpdate();


            success =1;

        }
        catch (Exception ex){
            success = 0;
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(ps!=null)ps.close();
        }
        return success;
    }

    public ArrayList<OfficeDTO> getOfficeList(int id, int divisionId, int districtId) throws Exception {

        ArrayList<OfficeDTO> officeDTOS =  null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("office_layer_id",id);
            data.addtoConditionANDEquall("geo_division_id",divisionId);
            data.addtoConditionANDEquall("geo_district_id",districtId);
            count = sc.tableDatacount("offices");
            resultSet = sc.select(con,"offices", data);
            officeDTOS = autoFill(resultSet);

        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }

    public int  editOffice(OfficeDTO officeDTO) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        int success =0;

        try{
            con = DatabaseManager.getInstance().getConnection();

            sql = "UPDATE " +AllTable.TBL_OFFICES+" "+
                    "SET "+
                    "office_name_eng = ?," +
                    "office_name_bng = ?," +
                    "geo_division_id = ?," +
                    "geo_district_id = ?," +
                    "geo_thana_id = ?," +
                    "geo_postoffice_id = ?," +
                    "geo_upazila_id = ?," +
                    "geo_city_corporation_id = ?," +
                    "geo_union_id = ?," +
                    "geo_municipality_id = ?," +
                    "geo_country_id = ?," +
                    "geo_city_corporation_ward_id = ?," +
                    "geo_municipality_ward_id = ?," +
                    "office_address = ?," +
                    "digital_nothi_code = ?," +
                    "office_code = ?," +
                    "office_phone = ?," +
                    "office_mobile = ?," +
                    "office_fax = ?," +
                    "office_email = ?," +
                    "office_web = ?," +
                    "reference_code = ?," +
                    "parent_office_id = ?," +
                    "modified_by = ?," +
                    "modified = ?"+
                    "WHERE "+
                    "id = ?";

            ps = con.prepareStatement(sql);
            int k=0;
            ps.setString(++k,officeDTO.getOfficeNameEng());
            ps.setString(++k,officeDTO.getOfficeNameBng());
            ps.setInt(++k,(officeDTO.getGeoDivisionId()<=0)?0:officeDTO.getGeoDivisionId());
            ps.setInt(++k,(officeDTO.getGeoDistrictId()<=0)?0:officeDTO.getGeoDistrictId());
            ps.setInt(++k,(officeDTO.getGeoThanaId()<=0)?0:officeDTO.getGeoThanaId());
            ps.setInt(++k,(officeDTO.getGeoPostofficeId()<=0)?0:officeDTO.getGeoPostofficeId());
            ps.setInt(++k,(officeDTO.getGeoUpazilaId()<=0)?0:officeDTO.getGeoUpazilaId());
            ps.setInt(++k,(officeDTO.getGeoCityCorporationId()<=0)?0:officeDTO.getGeoCityCorporationId());
            ps.setInt(++k,(officeDTO.getGeoUnionId()<=0)?0:officeDTO.getGeoUnionId());
            ps.setInt(++k,(officeDTO.getGeoMunicipalityId()<=0)?0:officeDTO.getGeoMunicipalityId());
            ps.setInt(++k,(officeDTO.getCountryId()<=0)?0:officeDTO.getCountryId());
            ps.setInt(++k,(officeDTO.getGeoCityCorporationWardId()<=0)?0:officeDTO.getGeoCityCorporationWardId());
            ps.setInt(++k,(officeDTO.getGeoMunicipalityWardId()<=0)?0:officeDTO.getGeoMunicipalityWardId());
            ps.setString(++k,officeDTO.getOfficeAddress());
            ps.setString(++k,officeDTO.getDigitalNothiCode());
            ps.setString(++k,officeDTO.getOfficeCode());
            ps.setString(++k,officeDTO.getOfficePhone());
            ps.setString(++k,officeDTO.getOfficeMobile());
            ps.setString(++k,officeDTO.getOfficeFax());
            ps.setString(++k,officeDTO.getOfficeEmail());
            ps.setString(++k,officeDTO.getOfficeWeb());
            ps.setString(++k,officeDTO.getReferenceCode());
            ps.setInt(++k,officeDTO.getParentOfficeId());
            ps.setInt(++k,officeDTO.getModifiedBy());
            ps.setTimestamp(++k,officeDTO.getModified());
            ps.setInt(++k,officeDTO.getId());


            System.out.println(ps);

            ps.executeUpdate();


            success =1;

        }
        catch (Exception ex){
            success =0;
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(ps!=null)ps.close();
        }
        return  success;
    }

    public int  deleteOffice(OfficeDTO officeDTO) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        Statement statement = null;
        int success =0;
        try{
            con = DatabaseManager.getInstance().getConnection();

            statement = con.createStatement();
            sql = "select * from office_units where status =1 and office_id = "+ officeDTO.getId()+" limit 0,1";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                success = 2;
                return success;
            }


            SQLJsonData js = new SQLJsonData();


            js.add("status",0);
            js.add("modified_by",officeDTO.getModifiedBy());
            js.add("modified",officeDTO.getModified());

            js.addtoConditionANDEquall("id",officeDTO.getId());
            sc.update(con,AllTable.TBL_OFFICES,js);
            success =1;
        }
        catch (Exception ex){
            success =0;
            ex.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return  success;
    }

    public ArrayList<OfficeDTO> officebyMinistryLayerOrigin(int ministry, int layer, int origin) throws Exception{
        ArrayList<OfficeDTO> officeDTOS =  null;
        Connection con = null;
        ResultSet resultSet = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        try{
            con= DatabaseManager.getInstance().getConnection();
            SQLJsonData data = new SQLJsonData();
            data.add("all","");
            data.addtoConditionANDEquall("status",1);
            data.addtoConditionANDEquall("office_ministry_id",ministry);
            data.addtoConditionANDEquall("office_layer_id",layer);
            data.addtoConditionANDEquall("office_origin_id",origin);
            resultSet = sc.select(con,AllTable.TBL_OFFICES, data);
            officeDTOS = autoFill(resultSet);

        }catch (Exception e){
            e.printStackTrace();
        } finally {
            if(con != null)con.close();
            if(sc.ps!=null)sc.ps.close();
        }
        return officeDTOS;
    }
}
