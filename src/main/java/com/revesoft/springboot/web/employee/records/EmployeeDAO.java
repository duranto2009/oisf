package com.revesoft.springboot.web.employee.records;

import com.revesoft.springboot.web.geo.thana.ThanaDTO;
import com.revesoft.springboot.web.model.SQLJsonData;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.*;
import databasemanager.DatabaseManager;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Bony on 11/2/2017.
 */
@Repository
public class EmployeeDAO {

    private int  count=0;

    private static final String TBL_EMPLOYEE_RECORDS="employee_records";
    private static final String TBL_EMPLOYEE_OFFICES="employee_offices";
    private static final String TBL_USERNAME_LAST_iNDEX="username_last_index";
    private static final String TBL_USERS ="users";





    private EmployeeDTO dtoSetter(ResultSet rs, EmployeeDTO employeeDTO) throws Exception {
        employeeDTO.setId(rs.getInt("id"));
        employeeDTO.setNameEng(rs.getString("name_eng"));
        employeeDTO.setNameBng(rs.getString("name_bng"));

        employeeDTO.setFatherNameEng(rs.getString("father_name_eng"));
        employeeDTO.setFatherNameBng(rs.getString("father_name_bng"));
        employeeDTO.setMotherNameEng(rs.getString("mother_name_eng"));
        employeeDTO.setMotherNameBng(rs.getString("mother_name_bng"));

        String fullDate = rs.getString("date_of_birth");
        if (fullDate == null) {
            employeeDTO.setDateOfBirth(" ");
        } else {
            employeeDTO.setDateOfBirth(new DateFormatter().dateFormat(fullDate));
        }

//        Long millis=rs.getLong("date_of_birth");
//        SimpleDateFormat sdf = new SimpleDateFormat("yy/mm/mm");
//        Date date=new Date(millis);
//        //date= sdf.format(date);
//        employeeDTO.setDateOfBirth(sdf.format(date));

//        employeeDTO.setPlaceOfBirth(rs.getString("place_of_birth"));
//        employeeDTO.setNatioanality(rs.getString("nationality"));

//        employeeDTO.setPresentAddress(rs.getString("present_address"));
//        employeeDTO.setPermanentAddress(rs.getString("permanent_address"));

//        employeeDTO.setOccupation(rs.getString("occupation"));

        employeeDTO.setNid(rs.getString("nid"));
        employeeDTO.setNidValid(rs.getBoolean("nid_valid"));
        employeeDTO.setBcn(rs.getString("bcn"));
        employeeDTO.setPpn(rs.getString("ppn"));

//        if (rs.getInt("gender") == 1) {
//            employeeDTO.setGender("Male");
//        } else if (rs.getInt("gender") == 2) {
//            employeeDTO.setGender("Female");
//        } else {
//            employeeDTO.setGender("Other");
//        }

        employeeDTO.setGender(rs.getString("gender"));

        //religion by forhad
//        if (rs.getString("religion").equals("1")) {
//            employeeDTO.setReligion("Muslim");
//        } else if (rs.getString("religion").equals("2")) {
//            employeeDTO.setReligion("Hindu");
//        } else if (rs.getString("religion").equals("3")) {
//            employeeDTO.setReligion("Buddhist");
//        } else if (rs.getString("religion").equals("4")) {
//            employeeDTO.setReligion("Christianity");
//        } else if (rs.getString("religion").equals("8")) {
//            employeeDTO.setReligion("Refuse to disclose");
//        } else if (rs.getString("religion").equals("9")) {
//            employeeDTO.setReligion("Not a believer");
//        } else if (rs.getString("religion").equals("0")) {
//            employeeDTO.setReligion("Others");
//        } else employeeDTO.setReligion("Not Found");

        employeeDTO.setReligion(rs.getString("religion"));

        //blood group by forhad
//        if (rs.getString("blood_group").equals("1")) {
//            employeeDTO.setBloodGroup("O+");
//        } else if (rs.getString("blood_group").equals("2")) {
//            employeeDTO.setBloodGroup("O-");
//        } else if (rs.getString("blood_group").equals("3")) {
//            employeeDTO.setBloodGroup("A+");
//        } else if (rs.getString("blood_group").equals("4")) {
//            employeeDTO.setBloodGroup("A-");
//        } else if (rs.getString("blood_group").equals("5")) {
//            employeeDTO.setBloodGroup("B+");
//        } else if (rs.getString("blood_group").equals("6")) {
//            employeeDTO.setBloodGroup("B-");
//        } else if (rs.getString("blood_group").equals("7")) {
//            employeeDTO.setBloodGroup("AB+");
//        } else if (rs.getString("blood_group").equals("8")) {
//            employeeDTO.setBloodGroup("AB-");
//        } else employeeDTO.setBloodGroup(rs.getString("blood_group"));

        employeeDTO.setBloodGroup(rs.getString("blood_group"));

        //employeeDTO.setMaritalStatus(rs.getString("marital_status"));

//        String s = rs.getString("marital_status");
//        if (s.equals("2")) {
//            employeeDTO.setMaritalStatus("Married");
//            if(rs.getString("spouse_name_eng").equals(null)){
//                employeeDTO.setSpouseNameEng(rs.getString(" "));
//                employeeDTO.setSpouseNameBng(rs.getString(" "));
//            }else {
//                employeeDTO.setSpouseNameEng(rs.getString("spouse_name_eng"));
//                employeeDTO.setSpouseNameBng(rs.getString("spouse_name_bng"));
//            }
//        } else if (s.equals("1")) {
//
//            employeeDTO.setMaritalStatus("Unmarried");
//        } else if (s.equals("3")) {
//
//            employeeDTO.setMaritalStatus("Widowed");
//
//        } else if (s.equals("4")) {
//            employeeDTO.setMaritalStatus("Separated");
//
//        } else {
//            employeeDTO.setMaritalStatus("Divorced");
//        }


        employeeDTO.setSpouseNameEng(rs.getString("spouse_name_eng"));
        employeeDTO.setSpouseNameBng(rs.getString("spouse_name_bng"));

        employeeDTO.setMaritalStatus(rs.getString("marital_status"));

        employeeDTO.setPersonalEmail(rs.getString("personal_email"));
        employeeDTO.setPersonalMobile(rs.getString("personal_mobile"));
        employeeDTO.setAlternativeMobile(rs.getString("alternative_mobile"));
        employeeDTO.setIsCadre(rs.getByte("is_cadre"));
        employeeDTO.setEmployeeCadreId(rs.getInt("employee_cadre_id"));
        employeeDTO.setEmployeeBatchId(rs.getInt("employee_batch_id"));
        employeeDTO.setIdentityNo(rs.getString("identity_no"));
        employeeDTO.setAppointmentMemoNo(rs.getString("appointment_memo_no"));

//        employeeDTO.setImageFileName(rs.getString("image_file_name"));

        fullDate = rs.getString("joining_date");
        if (fullDate == null || fullDate.isEmpty()) {
            employeeDTO.setJoiningDate(" ");
        } else {
            employeeDTO.setJoiningDate(new DateFormatter().dateFormat(fullDate));
        }


        employeeDTO.setServiceRankId(rs.getInt("service_rank_id"));
        employeeDTO.setServiceGradeId(rs.getInt("service_grade_id"));
        employeeDTO.setServiceMinistryId(rs.getInt("service_grade_id"));

        employeeDTO.setCurrentOfficeMinistryId(rs.getInt("current_office_ministry_id"));
        employeeDTO.setCurrentOfficeLayerId(rs.getInt("current_office_layer_id"));
        employeeDTO.setCurrentOfficeId(rs.getInt("current_office_id"));
        employeeDTO.setCurrentOfficeUnitId(rs.getInt("current_office_unit_id"));
        employeeDTO.setCurrentOfficeJoiningDate(rs.getDate("current_office_joining_date"));
        employeeDTO.setCurrentOfficeDesignationId(rs.getInt("current_office_designation_id"));
        employeeDTO.setCurrentOfficeAddress(rs.getString("current_office_address"));
        employeeDTO.setESign(rs.getString("e_sign"));
        employeeDTO.setDSign(rs.getString("d_sign"));
        employeeDTO.setImageFileName(rs.getString("image_file_name"));
        employeeDTO.setStatus(rs.getBoolean("status"));
        employeeDTO.setCreatedBy(rs.getInt("created_by"));
        employeeDTO.setModifiedBy(rs.getInt("modified_by"));
        employeeDTO.setCreated(rs.getDate("created"));
        employeeDTO.setCreated(rs.getDate("modified"));
        return employeeDTO;
    }


    //-----------------------------------------------start Bishwajit Code ------------------------------------------------------------------------------



    private int generate_emp_id()throws Exception
    {
        long ID = DatabaseManager.getInstance().getNextSequenceId(TBL_EMPLOYEE_RECORDS);
        return (int) ID;
    }


    private PreparedStatement psSetter(PreparedStatement ps, EmployeeDTO employeeDTO) throws Exception {

        int k = 0;

        ps.setLong(++k, employeeDTO.getId());
        ps.setString(++k, employeeDTO.getNameBng());
        ps.setString(++k, employeeDTO.getNameEng());
        ps.setString(++k, employeeDTO.getFatherNameBng());
        ps.setString(++k, employeeDTO.getFatherNameEng());
        ps.setString(++k, employeeDTO.getMotherNameBng());
        ps.setString(++k, employeeDTO.getMotherNameEng());

//        SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yy");
//        Date date = sdf.parse(employeeDTO.getDateOfBirth());
//        long millis = date.getTime();
//        org.joda.time.format.DateTimeFormatter format = DateTimeFormat.forPattern("dd/mm/yy");
//        DateTime time = format.parseDateTime(employeeDTO.getDateOfBirth();
//        ps.setDate(++k, time);

        ps.setString(++k, employeeDTO.getDateOfBirth());
        ps.setString(++k, employeeDTO.getNid());
        ps.setString(++k, employeeDTO.getBcn());
        ps.setString(++k, employeeDTO.getPpn());
        ps.setString(++k, employeeDTO.getGender());
        ps.setString(++k, employeeDTO.getReligion());
        ps.setString(++k, employeeDTO.getBloodGroup());
        ps.setString(++k, employeeDTO.getMaritalStatus());
        ps.setString(++k, employeeDTO.getPersonalEmail());
        ps.setString(++k, employeeDTO.getPersonalMobile());
        ps.setString(++k, employeeDTO.getAlternativeMobile());
        ps.setInt(++k, employeeDTO.getIsCadre());
        ps.setInt(++k, employeeDTO.getEmployeeCadreId());
        ps.setInt(++k, employeeDTO.getEmployeeBatchId());
        ps.setString(++k, employeeDTO.getIdentityNo());
        ps.setString(++k, employeeDTO.getAppointmentMemoNo());
        ps.setString(++k, employeeDTO.getJoiningDate());
        return ps;

    }


    private PreparedStatement psSetterUpdate(PreparedStatement ps, EmployeeDTO employeeDTO) throws Exception {

        int k = 0;

        ps.setLong(++k, employeeDTO.getId());
        ps.setString(++k, employeeDTO.getNameBng());
        ps.setString(++k, employeeDTO.getNameEng());
        ps.setString(++k, employeeDTO.getFatherNameBng());
        ps.setString(++k, employeeDTO.getFatherNameEng());
        ps.setString(++k, employeeDTO.getMotherNameBng());
        ps.setString(++k, employeeDTO.getMotherNameEng());

        ps.setString(++k, employeeDTO.getDateOfBirth());
        ps.setString(++k, employeeDTO.getNid());
        ps.setString(++k, employeeDTO.getBcn());
        ps.setString(++k, employeeDTO.getPpn());
        ps.setString(++k, employeeDTO.getGender());
        ps.setString(++k, employeeDTO.getReligion());
        ps.setString(++k, employeeDTO.getBloodGroup());
        ps.setString(++k, employeeDTO.getMaritalStatus());
        ps.setString(++k, employeeDTO.getPersonalEmail());
        ps.setString(++k, employeeDTO.getPersonalMobile());
        ps.setString(++k, employeeDTO.getAlternativeMobile());
        ps.setInt(++k, employeeDTO.getIsCadre());
        ps.setInt(++k, employeeDTO.getEmployeeCadreId());
        ps.setInt(++k, employeeDTO.getEmployeeBatchId());
        ps.setString(++k, employeeDTO.getIdentityNo());
        ps.setString(++k, employeeDTO.getAppointmentMemoNo());
        ps.setString(++k, employeeDTO.getJoiningDate());

        ps.setLong(++k, employeeDTO.getId());
        return ps;

    }


    private PreparedStatement psSetterUser(PreparedStatement ps,String username, String password, int employee_record_id) throws Exception {

        int k = 0;

        long ID = DatabaseManager.getInstance().getNextSequenceId(TBL_USERS);

        ps.setLong(++k, ID);
        ps.setString(++k, username);
        ps.setString(++k, password);
        ps.setString(++k, username);
        ps.setLong(++k, employee_record_id);

        return ps;

    }


    private String generateUsername(EmployeeDTO employeeDTO) throws SQLException {
        String username="";
        if(employeeDTO.getIsCadre()==1 || employeeDTO.getIsCadre()==5)
        {
            username += employeeDTO.getIdentityNo();
            int len=username.length();
            for(int i=0 ;i<11-len;i++)
            {
                username="0"+username;
            }
            username ="1"+username;
        }
        else
        {

            int last_index = 0;

            Connection con = null;
            PreparedStatement ps = null;
            String sql = null;
            ResultSet rs = null;
            SQLStatementCreator sc = new SQLStatementCreator();

            try {


                con = DatabaseManager.getInstance().getConnection();
                sql = " SELECT last_index from " + TBL_USERNAME_LAST_iNDEX + " where type=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1,employeeDTO.getIsCadre());


                rs = ps.executeQuery();
                while (rs.next()) {
                    last_index =rs.getInt("last_index");

                }

                last_index++;

                sql = " UPDATE " + TBL_USERNAME_LAST_iNDEX + " set LAST_index= "+ last_index +" where type=?";
                con.setAutoCommit(false);
                ps = con.prepareStatement(sql);

                ps.setInt(1,employeeDTO.getIsCadre());

                ps.executeUpdate();
                con.commit();


            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                if (ps != null) ps.close();
                if (con != null) con.close();
            }


            username += last_index;
            int len=username.length();
            for(int i=0 ;i<11-len;i++)
            {
                username="0"+username;
            }
            username =employeeDTO.getIsCadre()+username;

        }

        return username;
    }


    public userObject addEmployee(EmployeeDTO employeeDTO) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;
        Savepoint save1 = null;
        userObject user= new userObject();

        String sql = " INSERT INTO " + AllTable.TBL_EMPLOYEE_RECORDS +
                "(id,name_bng,name_eng,father_name_bng,father_name_eng,mother_name_bng," +
                "mother_name_eng,date_of_birth,nid,bcn,ppn,gender,religion,blood_group," +
                "marital_status,personal_email,personal_mobile,alternative_mobile," +
                "is_cadre,employee_cadre_id,employee_batch_id,identity_no,appointment_memo_no,joining_date) VALUES (?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?) ";

        //String sq2 = "  UPDATE " + TBL_EMPLOYEE_RECORDS + " SET url=? WHERE id =?";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);


            //save1 = cn.setSavepoint("savepoint1");
            ps = cn.prepareStatement(sql);

            employeeDTO.setId(generate_emp_id());
            ps = psSetter(ps, employeeDTO);

            ps.executeUpdate();


            //ps.addBatch();
            //ps.executeBatch();

            user.username= generateUsername(employeeDTO);
            user.password= new PasswordGenerator().getRandomPassword(8);
            String hashPassword= new PasswordService().hashPassword(user.password);

            String sql2 = " INSERT INTO " + TBL_USERS +
                    "(id,username,password,user_alias,employee_record_id) VALUES (?,?,?,?,?)";

            ps = cn.prepareStatement(sql2);

            ps = psSetterUser(ps, user.username,hashPassword,employeeDTO.getId());

            ps.executeUpdate();

            cn.commit();



        } catch (Exception e) {
            cn.rollback();
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
            if (cn != null) cn.close();
        }

        return user;
    }


    public void editEmployee(EmployeeDTO employeeDTO) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;


        String sql = " UPDATE " + TBL_EMPLOYEE_RECORDS + " SET id=?,name_bng=?,name_eng=?,father_name_bng=?,father_name_eng=?,mother_name_bng=?,mother_name_eng=?,date_of_birth=?,nid=?,bcn=?,ppn=?,gender=?,religion=?,blood_group=?,marital_status=?,personal_email=?,personal_mobile=?,alternative_mobile=?,is_cadre=?,employee_cadre_id=?,employee_batch_id=?,identity_no=?,appointment_memo_no=?,joining_date=? where id=?";

        //String sq2 = "  UPDATE " + TBL_EMPLOYEE_RECORDS + " SET url=? WHERE id =?";
        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps = psSetterUpdate(ps, employeeDTO);

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


    public void deleteEmployee(String id) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;


        String sql = " UPDATE " + TBL_EMPLOYEE_RECORDS + " SET status=? where id=?";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setInt(1,0);
            ps.setLong(2, Long.parseLong(id));


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



    public EmployeeDTO getEmployeeInfoByUsername(String username) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        PreparedStatement par = null;
        ResultSet rs = null;

        String sql = "select * from " + AllTable.TBL_EMPLOYEE_RECORDS + " where id= (select employee_record_id from "+ AllTable.TBL_USERS+ " where username = ?)";
        EmployeeDTO employeeDTO = new EmployeeDTO();

        try {
            cn = DatabaseManager.getInstance().getConnection();
            cn.setAutoCommit(false);
            ps = cn.prepareStatement(sql);
            ps.setString(1,username);

            rs = ps.executeQuery();
            while (rs.next()) {

                employeeDTO=  dtoSetter(rs,employeeDTO);

            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (par != null) par.close();
            if (cn != null) cn.close();
        }

        return employeeDTO;
    }

    //-----------------------------------------------end Bishwajit Code ------------------------------------------------------------------------------


    public ArrayList<EmployeeDTO> getEmployeeListbyPage(int page, int pageSize) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        ArrayList<EmployeeDTO> data = new ArrayList<>();
        try {



            count = sc.tempTableDatacount(con, "select count(id) as size from "+ AllTable.TBL_EMPLOYEE_RECORDS);

            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from employee_records where status=1 limit " + (page - 1) * pageSize + "," + pageSize;
            System.out.println(sql);
            ps = con.prepareStatement(sql);


            rs = ps.executeQuery();
            while (rs.next()) {
                EmployeeDTO employeeDTO = new EmployeeDTO();
                      employeeDTO=  dtoSetter(rs,employeeDTO);

                getDesignation(con, employeeDTO.getId(), employeeDTO);

                data.add(employeeDTO);

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpOfficeByPage(int page, int pageSize,int officeId) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        ArrayList<EmployeeDTO> data = new ArrayList<>();
        try {



//            count = sc.tempTableDatacount(con, "select count(id) as size from "+ AllTable.TBL_EMPLOYEE_OFFICES + " where office_id = "+ officeId) ;

            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from employee_records r INNER JOIN employee_offices e on r.id = e.employee_record_id where e.office_id =  " +officeId + "  limit " + (page - 1) * pageSize + "," + pageSize;
            ps = con.prepareStatement(sql);


            rs = ps.executeQuery();
            while (rs.next()) {
                EmployeeDTO employeeDTO = new EmployeeDTO();
                      employeeDTO=  dtoSetter(rs,employeeDTO);

                getDesignation(con, employeeDTO.getId(), employeeDTO);

                data.add(employeeDTO);

            }
            count = data.size();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return data;
    }

    public ArrayList<EmployeeDTO> getEmployeeListbyPage(int page, int pageSize, String searchMsg) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        //ResultSet rs = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        ArrayList<EmployeeDTO> data = new ArrayList<>();
        try {
            con = DatabaseManager.getInstance().getConnection();
            SQLJsonData js = new SQLJsonData();
            JSONObject or1 = new JSONObject();

            or1.put("name_eng","%"+searchMsg+"%");
            or1.put("name_bng","%"+searchMsg+"%");
            or1.put("personal_mobile","%"+searchMsg+"%");
            or1.put("personal_email","%"+searchMsg+"%");
            or1.put("nid","%"+searchMsg+"%");



            js.addtoConditionORLike("or1",or1);
            js.addtoConditionANDEquall("status",1);
            js.addPage("page",(page-1)*pageSize,pageSize);

            count = sc.searchCount(con,AllTable.TBL_EMPLOYEE_RECORDS,js);
            ResultSet rs=sc.search(con,AllTable.TBL_EMPLOYEE_RECORDS,js);
            while(rs.next()) {
                EmployeeDTO employeeDTO = new EmployeeDTO();
                employeeDTO = dtoSetter(rs,employeeDTO);
                getDesignation(con, employeeDTO.getId(), employeeDTO);
                data.add(employeeDTO);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpOfficeByPage(int page, int pageSize, String searchMsg,int officeId) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs = null;
        SQLStatementCreator sc = new SQLStatementCreator();

        ArrayList<EmployeeDTO> data = new ArrayList<>();
        try {
            con = DatabaseManager.getInstance().getConnection();
            String orQuery = "r.name_eng like " + "'%"+searchMsg+"%' or " +
                         "r.name_bng like " + "'%"+searchMsg+"%' or " +
                         "r.personal_mobile like " + "'%"+searchMsg+"%' or " +
                         "r.personal_email like " + "'%"+searchMsg+"%' or " +
                         "r.identity_no like " + "'%"+searchMsg+"%' " ;
            sql = "select * from employee_records r INNER JOIN employee_offices e on r.id = e.employee_record_id where e.office_id =  " + "?" +
                    " and " + orQuery  + "  limit " + (page - 1) * pageSize + "," + pageSize;
            ps = con.prepareStatement(sql);
            int i = 1;
            ps.setInt(i++,officeId);
            rs = ps.executeQuery();
            while(rs.next()) {
                EmployeeDTO employeeDTO = new EmployeeDTO();
                employeeDTO = dtoSetter(rs,employeeDTO);
                getDesignation(con, employeeDTO.getId(), employeeDTO);
                data.add(employeeDTO);
            }
            count = data.size();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return data;
    }

    public ArrayList<EmployeeDTO> getEmployeeListbyPage(int page, int pageSize, String[] searchParam) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs = null;
        SQLStatementCreator sc = new SQLStatementCreator();
        SQLJsonData js = new SQLJsonData();

        ArrayList<EmployeeDTO> data = new ArrayList<>();
        try {

            int searchParamSize = searchParam.length;
            js.addtoConditionANDEquall("status",1);
            for(int i=0;i<searchParamSize;i++){
                String s = searchParam[i];
                if(!s.equals("null") && !s.equals("-1") && !s.equals("")){

                    switch (i){
//
                        case 0:

                            js.addtoConditionANDEquall("nid",Integer.parseInt(searchParam[0]));
                            break;
                        case 1:
                            //   condition +=" geo_district_id LIKE '%"+searchParam[3]+"%' AND";
                            js.addtoConditionANDEquall("personal_mobile",searchParam[1]);
                            break;
                        case 2:
                            //  condition +=" geo_upazila_id LIKE '%"+searchParam[4]+"%' AND";
                            js.addtoConditionANDEquall("personal_email",searchParam[2]);
                            break;
                    }
                }
            }
            con = DatabaseManager.getInstance().getConnection();
           // sql = "select * from employee_records  limit " + (page - 1) * pageSize + "," + pageSize;
            //ps = con.prepareStatement(sql);

            js.addPage("page",(page-1)*pageSize,pageSize);

            count = sc.searchCount(con,AllTable.TBL_EMPLOYEE_RECORDS,js);







            rs = sc.search(con,AllTable.TBL_EMPLOYEE_RECORDS,js);
            while (rs.next()) {

                EmployeeDTO employeeDTO = new EmployeeDTO();
                employeeDTO = dtoSetter(rs,employeeDTO);
                getDesignation(con, employeeDTO.getId(), employeeDTO);
                data.add(employeeDTO);


            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpOfficeByPage(int page, int pageSize, String[] searchParam,int officeId) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
//        String sql = null;
        ResultSet rs = null;
//        SQLStatementCreator sc = new SQLStatementCreator();
//        SQLJsonData js = new SQLJsonData();
        ArrayList<EmployeeDTO> data = new ArrayList<>();
        String sql = "";
        String orQuery = "";
        try {

            int searchParamSize = searchParam.length;
//            js.addtoConditionANDEquall("status",1);
            for(int i=0;i<searchParamSize;i++){
                String s = searchParam[i];
                if(!s.equals("null") && !s.equals("-1") && !s.equals("") && !s.equals(" ")){
                    if(!orQuery.equals(""))orQuery+=" and " ;

                    switch (i){
//
                        case 0:
                            orQuery += "r.identity_no like " + "'%"+Integer.parseInt(searchParam[0])+"%' " ;

//                            js.addtoConditionANDEquall("identity_no",Integer.parseInt(searchParam[0]));
                            break;
                        case 1:
                            //   condition +=" geo_district_id LIKE '%"+searchParam[3]+"%' AND";
                            orQuery +=  "r.personal_mobile like " + "'%"+searchParam[1]+"%' ";
//                            js.addtoConditionANDEquall("personal_mobile",searchParam[1]);
                            break;
                        case 2:
                            orQuery +=  "r.personal_email like " + "'%"+searchParam[2]+"%' ";
                            //  condition +=" geo_upazila_id LIKE '%"+searchParam[4]+"%' AND";
//                            js.addtoConditionANDEquall("personal_email",searchParam[2]);
                            break;
                    }
                }
            }
            con = DatabaseManager.getInstance().getConnection();
            sql = "select * from employee_records r INNER JOIN employee_offices e on r.id = e.employee_record_id where e.office_id =  " + "?" +
                    " and " + orQuery  + "  limit " + (page - 1) * pageSize + "," + pageSize;
            ps = con.prepareStatement(sql);
            int i = 1;
            ps.setInt(i++,officeId);
            rs = ps.executeQuery();
            while(rs.next()) {
                EmployeeDTO employeeDTO = new EmployeeDTO();
                employeeDTO = dtoSetter(rs,employeeDTO);
                getDesignation(con, employeeDTO.getId(), employeeDTO);
                data.add(employeeDTO);
            }
            count = data.size();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return data;
    }

    public int getCount() {
        return count;
    }

    private EmployeeDTO getDesignation(Connection con, Integer id, EmployeeDTO employeeDTO) throws Exception {

        String sql = "SELECT designation,office_unit_id FROM " + AllTable.TBL_EMPLOYEE_OFFICES + " WHERE employee_record_id=? AND is_default_role=1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                employeeDTO.setDesignation(rs.getString("designation"));
                employeeDTO = setSection(con, rs.getInt("office_unit_id"), employeeDTO);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return employeeDTO;

    }

    private EmployeeDTO setSection(Connection con, int officeUnitId, EmployeeDTO employeeDTO) {
        String sql = "SELECT unit_name_bng FROM " + AllTable.TBL_OFFICE_UNIT + " WHERE id=? ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, officeUnitId);
            rs = ps.executeQuery();
            while (rs.next()) {
                employeeDTO.setSection(rs.getString("unit_name_bng"));

            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return employeeDTO;
    }

    public EmployeeDTO getEmployee(long employeeId) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + TBL_EMPLOYEE_RECORDS + " WHERE id=?";
        EmployeeDTO employeeDTO = new EmployeeDTO();

        ArrayList<EmployeeDTO> data = new ArrayList<>();
        try {
            con = DatabaseManager.getInstance().getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, employeeId);


            rs = ps.executeQuery();
            while (rs.next()) {
                employeeDTO = dtoSetter(rs,employeeDTO);


            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return employeeDTO;
    }

    public int officeId(long employeeId) throws Exception {
        int id = 0 ;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT office_id FROM " + TBL_EMPLOYEE_OFFICES + " WHERE employee_record_id=?";
//        EmployeeDTO employeeDTO = new EmployeeDTO();
//
//        ArrayList<EmployeeDTO> data = new ArrayList<>();
        try {
            con = DatabaseManager.getInstance().getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, employeeId);


            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("office_id");


            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
        return id;

    }





}
