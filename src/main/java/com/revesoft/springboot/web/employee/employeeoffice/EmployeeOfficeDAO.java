package com.revesoft.springboot.web.employee.employeeoffice;

import com.revesoft.springboot.web.geo.postoffice.PostOfficeDTO;
import com.revesoft.springboot.web.office.OfficeUnitsDTO;
import com.revesoft.springboot.web.office.offices.OfficeDTO;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.DateFormatter;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import databasemanager.DatabaseManager;

import javax.json.JsonObject;

/**
 * Created by reve on 3/13/2018.
 */

@Repository
public class EmployeeOfficeDAO {

    //-----------------------------------------------start Bishwajit Code ------------------------------------------------------------------------------

    private EmployeeOfficesDTO dtoSetter(ResultSet rs, EmployeeOfficesDTO employeeOfficesDTO,Connection cn) throws Exception {
        employeeOfficesDTO.setId(rs.getInt("id"));
        employeeOfficesDTO.setEmployeeRecordId(rs.getInt("employee_record_id"));
        employeeOfficesDTO.setOfficeId(rs.getInt("office_id"));

        employeeOfficesDTO.setOfficeUnitId(rs.getInt("office_unit_id"));
        employeeOfficesDTO.setOfficeUnitOrganogramId(rs.getInt("office_unit_organogram_id"));
        employeeOfficesDTO.setDesignation(rs.getString("designation"));
        employeeOfficesDTO.setDesignationLevel(rs.getInt("designation_level"));

        employeeOfficesDTO.setDesignationSequence(rs.getInt("designation_sequence"));
        employeeOfficesDTO.setIsDefaultRole(rs.getByte("is_default_role"));
        employeeOfficesDTO.setJoiningDate(rs.getString("joining_date"));

//        String fullDate = rs.getString("joining_date");
//        if (fullDate == null || fullDate.isEmpty()) {
//            employeeOfficesDTO.setJoiningDate(" ");
//        } else {
//            employeeOfficesDTO.setJoiningDate(new DateFormatter().dateFormat(fullDate));
//        }

//        fullDate = rs.getString("last_office_date");
//        if (fullDate == null || fullDate.isEmpty()) {
//            employeeOfficesDTO.setLastOfficeDate(" ");
//        } else {
//            employeeOfficesDTO.setLastOfficeDate(new DateFormatter().dateFormat(fullDate));
//        }

        employeeOfficesDTO.setOffices(getOfficeByOfficeId(employeeOfficesDTO.getOfficeId(),cn));
        employeeOfficesDTO.setOfficeUnits(getOfficeUnitByOfficeUnitId(employeeOfficesDTO.getOfficeUnitId(),cn));

        return employeeOfficesDTO;
    }


    private OfficeDTO dtoSetterOffice(ResultSet rs, OfficeDTO OfficeDTO) throws Exception {
        OfficeDTO.setId(rs.getInt("id"));
        OfficeDTO.setOfficeNameEng(rs.getString("office_name_eng"));
        OfficeDTO.setOfficeNameBng(rs.getString("office_name_bng"));

        return OfficeDTO;
    }


    private OfficeUnitsDTO dtoSetterOfficeUnit(ResultSet rs, OfficeUnitsDTO officeUnitsDTO) throws Exception {
        officeUnitsDTO.setId(rs.getInt("id"));
        officeUnitsDTO.setUnitNameEng(rs.getString("unit_name_eng"));
        officeUnitsDTO.setUnitNameBng(rs.getString("unit_name_bng"));

        return officeUnitsDTO;
    }


    public ArrayList<EmployeeOfficesDTO> getEmployeeOfficeByEmployeeRecordId(int employee_record_id) throws SQLException {
        ArrayList<EmployeeOfficesDTO> employeeOfficesDTOs = new ArrayList<>();


        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        String sql = "select * from " + AllTable.TBL_EMPLOYEE_OFFICES + " where employee_record_id= ? and status=? ";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1,employee_record_id);
            ps.setInt(2,1);

            rs = ps.executeQuery();
            while (rs.next()) {
                EmployeeOfficesDTO employeeOfficesDTO = new EmployeeOfficesDTO();
                employeeOfficesDTO= dtoSetter(rs,employeeOfficesDTO,cn);
                employeeOfficesDTOs.add(employeeOfficesDTO) ;
            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
            if (cn != null) cn.close();
        }

        return  employeeOfficesDTOs;
    }


    public OfficeDTO getOfficeByOfficeId(int office_id, Connection cn) throws SQLException {
        OfficeDTO officeDTO = new OfficeDTO();

        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        String sql = "select * from " + AllTable.TBL_OFFICES + " where id= ?";


        try {
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1,office_id);

            rs = ps.executeQuery();
            while (rs.next()) {
                officeDTO= dtoSetterOffice(rs,officeDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
//            if (cn != null) cn.close();
        }

        return  officeDTO;
    }


    public OfficeUnitsDTO getOfficeUnitByOfficeUnitId(long office_unit_id , Connection cn) throws SQLException {
        OfficeUnitsDTO officeUnitsDTO = new OfficeUnitsDTO();

        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        String sql = "select * from " + AllTable.TBL_OFFICE_UNIT + " where id= ?";


        try {

            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setLong(1,office_unit_id);

            rs = ps.executeQuery();
            while (rs.next()) {
                officeUnitsDTO= dtoSetterOfficeUnit(rs,officeUnitsDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
//            if (cn != null) cn.close();
        }

        return  officeUnitsDTO;
    }


    private PreparedStatement psSetter(PreparedStatement ps, EmployeeOfficesDTO employeeOfficesDTO)
    {
        try {
            long ID = DatabaseManager.getInstance().getNextSequenceId(AllTable.TBL_EMPLOYEE_OFFICES);

            int k=1;
            ps.setLong(k++,ID);
            ps.setLong(k++,employeeOfficesDTO.getEmployeeRecordId());
            ps.setInt(k++,employeeOfficesDTO.getOfficeId());
            ps.setLong(k++,employeeOfficesDTO.getOfficeUnitId());
            ps.setLong(k++,employeeOfficesDTO.getOfficeUnitOrganogramId());
            ps.setString(k++,employeeOfficesDTO.getDesignation());
            ps.setInt(k++,employeeOfficesDTO.getDesignationLevel());
            ps.setInt(k++,employeeOfficesDTO.getDesignationSequence());
            ps.setString(k++,employeeOfficesDTO.getInchargeLabel());
            ps.setString(k++,employeeOfficesDTO.getJoiningDate());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return  ps;

    }


    public int  assignEmployee(EmployeeOfficesDTO employeeOfficesDTO) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        String sql = " INSERT INTO " + AllTable.TBL_EMPLOYEE_OFFICES +
                "(id,employee_record_id,office_id,office_unit_id,office_unit_organogram_id," +
                "designation,designation_level,designation_sequence,incharge_label,joining_date) VALUES (?,?,?,?,?, ?,?,?,?,?) ";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);

            ps = psSetter(ps, employeeOfficesDTO);

            ps.executeUpdate();
            cn.commit();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
            if (cn != null) cn.close();
        }

        return  1;
    }


    public int  releaseEmployee(long id, String release_date) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        String sql = " UPDATE " + AllTable.TBL_EMPLOYEE_OFFICES + " SEt status=?,last_office_date=? WHERE id=?";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);

            ps.setInt(1,0);
            ps.setString(2,release_date);
            ps.setLong(3,id);

            ps.executeUpdate();
            cn.commit();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
            if (cn != null) cn.close();
        }

        return  1;
    }


    //-----------------------------------------------end Bishwajit Code ------------------------------------------------------------------------------


    public  EmployeeOrgDTO isEmpty(Connection cn,long officeUnitOrgId,EmployeeOrgDTO employeeOrgDTO)throws Exception{

//        EmployeeOrgDTO data = new EmployeeOrgDTO();


        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        String sql = "select employee_record_id from " + AllTable.TBL_EMPLOYEE_OFFICES +
                "  where office_unit_organogram_id= ? and (last_office_date is null or last_office_date ='0000-00-00') and status=1 ";

        String sql2 = "select name_bng from " + AllTable.TBL_EMPLOYEE_RECORDS +
                "  where id= ?  ";


        try {

            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setLong(1,officeUnitOrgId);

            rs = ps.executeQuery();

            if (rs.next()) {

                int ID=rs.getInt("employee_record_id");
                par=cn.prepareStatement(sql2);
                par.setLong(1,ID);
                rs2=par.executeQuery();
                while (rs2.next()){

                    employeeOrgDTO.setEmployeeName(rs2.getString("name_bng"));
//                    employeeOrgDTO.setIdentity_no(rs2.getString("identity_no"));
                    employeeOrgDTO.setIsEmpty(0);

                }



            }
            else{
                employeeOrgDTO.setIsEmpty(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return  employeeOrgDTO;
    }



    public  ArrayList<EmployeeOrgDTO> allOrg(Connection cn,int officeUnitId)throws Exception{

        ArrayList <EmployeeOrgDTO> data = new ArrayList<>();


        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        String sql = "select * from " + AllTable.TBL_OFFICE_UNIT_ORG + "  where office_unit_id= ?";
//        String sql2="select  ouo.office_unit_id,ouo.id,ouo.designation_bng,ouo.designation_level,ouo.designation_sequence," +
//                " er.name_bng   from  office_unit_organograms ouo " +
//                " left join employee_offices eo on ouo.id = eo.office_unit_organogram_id " +
//                " left join employee_records er on eo.employee_record_id = er.id " +
//                " where ouo.office_unit_id = ? and ( eo.last_office_date is null or eo.last_office_date='0000-00-00' ) ";

        String sql2="select eo.last_office_date,  ouo.office_unit_id,ouo.id,ouo.designation_bng,ouo.designation_level,ouo.designation_sequence," +
                " er.name_bng   from  office_unit_organograms ouo " +
                " left join employee_offices eo on ouo.id = eo.office_unit_organogram_id " +
                " left join employee_records er on eo.employee_record_id = er.id " +
                " where ouo.office_unit_id = ? ";


        try {

            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql2);
            ps.setLong(1,officeUnitId);

            rs = ps.executeQuery();
            while (rs.next()) {

                EmployeeOrgDTO employeeOrgDTO=new EmployeeOrgDTO();
                employeeOrgDTO.setDesignationName(rs.getString("designation_bng"));
                employeeOrgDTO.setDesignationLevel(rs.getInt("designation_level"));
                employeeOrgDTO.setDesignationSequence(rs.getInt("designation_sequence"));
                employeeOrgDTO.setOrgId(rs.getInt("id"));

                employeeOrgDTO.setEmployeeName(rs.getString("name_bng"));

                if(rs.getString("name_bng")!=null && (rs.getString("last_office_date")==null)|| (rs.getString("last_office_date")=="0000-00-00")){

//                    employeeOrgDTO.setIdentity_no(rs2.getString("identity_no"));
                    employeeOrgDTO.setIsEmpty(0);
                }
                else {
                    employeeOrgDTO.setIsEmpty(1);
                }
//                try{
//                    isEmpty(cn,rs.getInt("id"),employeeOrgDTO);
//
//                }catch (Exception ex){
//                    ex.printStackTrace();
//                }
                data.add(employeeOrgDTO);


            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return  data;
    }

    public  ArrayList<EmployeePOSTDTO> allPost(long officeId)throws Exception{

        HashMap<Integer,JSONObject> units = new HashMap<>();
        HashMap <Integer,JSONObject> unitorgs = new HashMap<>();
        HashMap <Integer,JSONObject> emporgs = new HashMap<>();
        ArrayList <EmployeePOSTDTO> data = new ArrayList<>();

        Connection cn = null;
        ResultSet rs = null;
        Statement statement = null;

        String sql1 = "select id,unit_name_bng from " + AllTable.TBL_OFFICE_UNIT + " where office_id= "+officeId;
        String sql2 = "select id,designation_bng,office_unit_id from " + AllTable.TBL_OFFICE_UNIT_ORG  + " where office_id= "+officeId;
        String sql3 = "select eo.id,eo.office_unit_id,eo.office_unit_organogram_id,eo.joining_date,eo.last_office_date,er.name_bng from " + AllTable.TBL_EMPLOYEE_OFFICES  + " eo left join "+AllTable.TBL_EMPLOYEE_RECORDS+" er on  er.id = eo.employee_record_id where eo.status=1 and eo.office_id= "+officeId;


        try {
            cn = DatabaseManager.getInstance().getConnection();

            statement = cn.createStatement();

            System.out.println(sql1);
            rs = statement.executeQuery(sql1);
            while (rs.next()) {

                JSONObject js = new JSONObject();
                js.put("unit_name_bng",rs.getString("unit_name_bng"));
                js.put("id",rs.getInt("id"));
                units.put(rs.getInt("id"),js);

            }
            System.out.println(sql2);
            rs = statement.executeQuery(sql2);
            while (rs.next()) {
                JSONObject js = new JSONObject();
                js.put("designation_bng",rs.getString("designation_bng"));
                js.put("office_unit_id",rs.getInt("office_unit_id"));
                js.put("id",rs.getInt("id"));
                unitorgs.put(rs.getInt("id"),js);

            }

            System.out.println(sql3);
            rs = statement.executeQuery(sql3);
            while (rs.next()) {
                JSONObject js = new JSONObject();
                js.put("id",rs.getInt("id"));
                js.put("office_unit_id",rs.getInt("office_unit_id"));
//                js.put("office_unit_organogram_id",rs.getInt("office_unit_organogram_id"));
                js.put("office_unit_organogram_id",rs.getInt("office_unit_organogram_id"));
                js.put("joining_date",rs.getTimestamp("joining_date"));
                js.put("last_office_date",rs.getTimestamp("last_office_date"));
                js.put("namebng",rs.getString("name_bng"));
                emporgs.put(rs.getInt("office_unit_organogram_id"),js);

            }

            for (int unit :units.keySet()) {
                EmployeePOSTDTO employeePOSTDTO = new EmployeePOSTDTO();
                employeePOSTDTO.setUnitId(unit);
                employeePOSTDTO.setUnitName((String) ((JSONObject)units.get(unit)).get("unit_name_bng"));
                ArrayList<JSONObject> orgbyunit = new ArrayList<>();
                for(int org:unitorgs.keySet()){
                    JSONObject js = unitorgs.get(org);
                    if((int)js.get("office_unit_id")==unit){
                        orgbyunit.add(js);
                    }
                }

                ArrayList<EmployeeOrgDTO> resultbyunit = new ArrayList<>();
                for(int i=0;i<orgbyunit.size();i++){
                    JSONObject org = (JSONObject) orgbyunit.get(i);
                    JSONObject js = emporgs.get(org.get("id"));

                    EmployeeOrgDTO employeeOrgDTO=new EmployeeOrgDTO();
                    employeeOrgDTO.setDesignationName((String)org.get("designation_bng"));
                    employeeOrgDTO.setOrgId((int)org.get("id"));



                    if(js==null){
                        employeeOrgDTO.setEmployeeName("");
                        employeeOrgDTO.setIsEmpty(1);
                    }else{
                        employeeOrgDTO.setEmployeeName((String)js.get("namebng"));
                        employeeOrgDTO.setIsEmpty(0);
                    }
                    resultbyunit.add(employeeOrgDTO);
                }
                employeePOSTDTO.setEmployeeOrgDTO(resultbyunit);
                data.add(employeePOSTDTO);


            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (statement != null) statement.close();
            if (cn != null) cn.close();
        }

        return  data;
    }


//    public  ArrayList<EmployeePOSTDTO> allPost2(long officeId)throws Exception{
//
//        ArrayList <EmployeePOSTDTO> data = new ArrayList<>();
//
//        Connection cn = null;
//        PreparedStatement ps = null;
//        PreparedStatement par = null;
//        ResultSet rs = null;
//
//        String sql = "select id,unit_name_bng from " + AllTable.TBL_OFFICE_UNIT_ORG + " where office_id= ?";
//
//
//        try {
//            cn = DatabaseManager.getInstance().getConnection();
//            cn.setAutoCommit(false);
//            ps = cn.prepareStatement(sql);
//            ps.setLong(1,officeId);
//
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                EmployeePOSTDTO employeePOSTDTO=new EmployeePOSTDTO();
//                employeePOSTDTO.setUnitId(rs.getInt("id"));
//                employeePOSTDTO.setUnitName(rs.getString("unit_name_bng"));
//                employeePOSTDTO.setEmployeeOrgDTO(allOrg(cn,employeePOSTDTO.getUnitId()));
//                data.add(employeePOSTDTO);
//
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (ps != null) ps.close();
//            if (par != null) par.close();
//            if (cn != null) cn.close();
//        }
//
//        return  data;
//    }







    public boolean doesOrganogramHasEmployeeCheckedByUnits(int[] unitid)throws Exception{
        Connection con = null;
        PreparedStatement sc = null;
        boolean used =false;
        try{
            con= DatabaseManager.getInstance().getConnection();
            String s = "(";
            for(int i=0;i<unitid.length-1;i++){
                s += unitid[i]+",";
            }
            s+=unitid[unitid.length-1]+")";
            String sql = "select id,last_office_date from "+ AllTable.TBL_EMPLOYEE_OFFICES+" where office_unit_id in "+ s +" and (last_office_date = 0 or last_office_date is null)";
            sc = con.prepareStatement(sql);
            ResultSet res =sc.executeQuery();
            while (res.next()){
                used = true;
                break;
            }




        }catch (Exception e){

            e.printStackTrace();


        } finally {
            if(con != null)con.close();
            if(sc!=null)sc.close();
        }

        return used;
    }

    public boolean doesOrganogramHasEmployeeCheckedByUnit(int unitid)throws Exception{
        Connection con = null;
        PreparedStatement sc = null;
        boolean used =false;
        try{
            con= DatabaseManager.getInstance().getConnection();

            String sql = "select id,last_office_date from "+ AllTable.TBL_EMPLOYEE_OFFICES+" where office_unit_id = "+unitid +" and (last_office_date = 0 or last_office_date is null)";
            sc = con.prepareStatement(sql);
            ResultSet res =sc.executeQuery();
            while (res.next()){
                used = true;
                break;
            }




        }catch (Exception e){

            e.printStackTrace();


        } finally {
            if(con != null)con.close();
            if(sc!=null)sc.close();
        }

        return used;
    }

    public boolean doesOrganogramHasEmployeeCheckedByOrganograms(int[] organogramid) throws Exception{
        Connection con = null;
        PreparedStatement sc = null;
        boolean used =false;
        try{
            con= DatabaseManager.getInstance().getConnection();



            String s = "(";
            for(int i=0;i<organogramid.length-1;i++){
                s += organogramid[i]+",";
            }
            s+=organogramid[organogramid.length-1]+")";
            String sql = "select id,last_office_date from "+ AllTable.TBL_EMPLOYEE_OFFICES+" where office_unit_organogram_id in "+s +" and (last_office_date = 0 or last_office_date is null)";
            sc = con.prepareStatement(sql);
            ResultSet res =sc.executeQuery();
            while (res.next()){
                used = true;
                break;
            }




        }catch (Exception e){

            e.printStackTrace();


        } finally {
            if(con != null)con.close();
            if(sc!=null)sc.close();
        }

        return used;
    }


    public boolean doesOrganogramHasEmployeeCheckedByOrganogram(int organogramid) throws Exception{
        Connection con = null;
        PreparedStatement sc = null;
        boolean used =false;
        try{
            con= DatabaseManager.getInstance().getConnection();




            String sql = "select id,last_office_date from "+ AllTable.TBL_EMPLOYEE_OFFICES+" where office_unit_organogram_id = "+organogramid +" and (last_office_date = 0 or last_office_date is null)";
            sc = con.prepareStatement(sql);
            ResultSet res =sc.executeQuery();
            while (res.next()){
                used = true;
                break;
            }




        }catch (Exception e){

            e.printStackTrace();


        } finally {
            if(con != null)con.close();
            if(sc!=null)sc.close();
        }

        return used;
    }
}
