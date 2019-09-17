package com.revesoft.springboot.web.user;

import com.revesoft.springboot.web.employee.records.EmployeeDAO;
import com.revesoft.springboot.web.util.AllTable;
import com.revesoft.springboot.web.util.DBUtility;
import com.revesoft.springboot.web.util.DateFormatter;
import com.revesoft.springboot.web.util.PasswordService;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Bony on 10/9/2017.
 */
@Repository
public class UserProfileDAO {

    private static final String TBL_SECURITY="security_question_template";
    private static final String TBL_USERS="users";
    private static final String TBL_EMPLOYEE_RECORDS="employee_records";
    private static final String TBL_EMPLOYEE_OFFICES="employee_offices";

    public String getSecurityQuestionAns(String userName) throws Exception {

        Connection c1 = null;
        PreparedStatement pr = null;
        String  securityAns="";
        ResultSet resultSet = null;
        UserProfileDTO userProfileDTO = new UserProfileDTO();
        long employee_id = -1;

        String sq = "SELECT security_question_ans_1 FROM " + TBL_USERS + " WHERE username=?";
        try {
            c1 = DatabaseManager.getInstance().getConnection();
            pr = c1.prepareStatement(sq);

            pr.setString(1, userName);
            resultSet = pr.executeQuery();
            if (resultSet.next()) {

                securityAns=resultSet.getString("security_question_ans_1") ;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            clearResources(c1,pr,resultSet);
        }
        return securityAns;
    }

    public void setUid(String uid,String userName,String email) throws Exception {

        Connection c1 = null;
        PreparedStatement pr = null;
        long employee_id = -1;

        String sq = "INSERT INTO "+ AllTable.TBL_USER_PASS_RECOVER+ " (username,uid,email) VALUES (?,?,?) ";
        try {
            c1 = DatabaseManager.getInstance().getConnection();
            pr = c1.prepareStatement(sq);


            pr.setString(1, userName);
            pr.setString(2,uid);
            pr.setString(3,email);
            pr.executeUpdate();


        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            clearResources(c1,pr,null);
        }
    }

    public UserPassRecoveryDTO getUserInfo(String uid) throws Exception {

        Connection c1 = null;
        PreparedStatement pr = null;
        long employee_id = -1;
        ResultSet rs=null;
        UserPassRecoveryDTO userPassRecoveryDTO=new UserPassRecoveryDTO();

        String sq = "Select * FROM "+ AllTable.TBL_USER_PASS_RECOVER+ " WHERE uid=? ";
        try {
            c1 = DatabaseManager.getInstance().getConnection();
            pr = c1.prepareStatement(sq);


            pr.setString(1,uid);
            rs=pr.executeQuery();
            while (rs.next()){
                userPassRecoveryDTO.setUsername(rs.getString("username"));
                userPassRecoveryDTO.setUid(rs.getString("uid"));
                userPassRecoveryDTO.setCreated(rs.getString("created"));
                userPassRecoveryDTO.setId(rs.getInt("id"));
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return userPassRecoveryDTO;
    }




    public String getSecurityQuestion(String userName) throws Exception {

        Connection c1 = null;
        PreparedStatement pr = null;
        String  security="";
        ResultSet resultSet = null;
        UserProfileDTO userProfileDTO = new UserProfileDTO();
        long employee_id = -1;
        String sq = "SELECT security_question_1 FROM " + TBL_USERS + " WHERE username=? ";
        try {
            c1 = DatabaseManager.getInstance().getConnection();
            pr = c1.prepareStatement(sq);

            pr.setString(1, userName);
            resultSet = pr.executeQuery();
            if (resultSet.next()) {

               security=resultSet.getString("security_question_1") ;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            clearResources(c1,pr,resultSet);
        }
        return security;
    }
    public String getEmail(String userName) throws Exception {

        Connection c1 = null;
        PreparedStatement pr = null;
        ResultSet resultSet = null;
        String email="";
        UserProfileDTO userProfileDTO = new UserProfileDTO();
        long employee_id = -1;
        String sq = "SELECT personal_email FROM " + AllTable.TBL_EMPLOYEE_RECORDS +
                " e INNER  JOIN " + AllTable.TBL_USERS+ " u on e.id=u.employee_record_id WHERE u.username=? ";
        try {
            c1 = DatabaseManager.getInstance().getConnection();
            pr = c1.prepareStatement(sq);
            pr.setString(1, userName);
            resultSet = pr.executeQuery();
            if (resultSet.next()) {
                email = resultSet.getString("personal_email");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            clearResources(c1,pr,resultSet);
        }
        return email;
    }


    private UserProfileDTO dtoSetter(ResultSet rs,UserProfileDTO userProfileDTO)throws Exception{
        userProfileDTO.setId(rs.getLong("id"));



        return userProfileDTO;
    }
    public long getEmployeeId(long userid) throws Exception {

        Connection c1=null;
        PreparedStatement pr=null;
        ResultSet resultSet=null;
        long employee_id=-1;
        String sq="SELECT employee_record_id from "+TBL_USERS+ " where id=? ";
        try {
            c1=DatabaseManager.getInstance().getConnection();
            pr=c1.prepareStatement(sq);
            pr.setLong(1,userid);
            resultSet=pr.executeQuery();
            if(resultSet.next()){
                employee_id=resultSet.getLong("employee_record_id");

            }

        }catch (Exception ex){
            ex.printStackTrace();

        }finally {
            clearResources(c1,pr,resultSet);
        }
        return employee_id;
    }

    public long getEmployeeId(String username) throws Exception {

        Connection c1=null;
        PreparedStatement pr=null;
        ResultSet resultSet=null;
        long employee_id=-100;
        String sq="SELECT employee_record_id from "+TBL_USERS+ " where username=? ";
        try {
            c1=DatabaseManager.getInstance().getConnection();
            pr=c1.prepareStatement(sq);
            pr.setString(1,username);
            resultSet=pr.executeQuery();
            if(resultSet.next()){
                employee_id=resultSet.getLong("employee_record_id");

            }

        }catch (Exception ex){
            ex.printStackTrace();

        }finally {
            clearResources(c1,pr,resultSet);
        }
        return employee_id;
    }

    public long getOrgId(long employeeId) throws Exception {

        Connection c1=null;
        PreparedStatement pr=null;
        PreparedStatement pr2=null;
        ResultSet resultSet=null;
        ResultSet resultSet2=null;
        long orgId=-1;
        String sq="SELECT id,office_unit_organogram_id from "+TBL_EMPLOYEE_OFFICES+ " where employee_record_id=? " +
                " and is_default_role=1  and (last_office_date is null or last_office_date ='0000-00-00') and status=1 ORDER BY id ASC LIMIT 1 ";

        String sq2="SELECT id,office_unit_organogram_id from "+TBL_EMPLOYEE_OFFICES+ " where employee_record_id=? " +
                "   and (last_office_date is null or last_office_date ='0000-00-00') and status=1 ORDER BY id ASC LIMIT 1 ";
        try {
            c1=DatabaseManager.getInstance().getConnection();
            pr=c1.prepareStatement(sq);
            pr2=c1.prepareStatement(sq2);
            pr.setLong(1,employeeId);
            pr2.setLong(1,employeeId);
            resultSet=pr.executeQuery();
            if(resultSet.next()){
                orgId=resultSet.getLong("office_unit_organogram_id");

            }else{
                resultSet2=pr2.executeQuery();
                if(resultSet2.next()){
                    orgId=resultSet2.getLong("office_unit_organogram_id");
                }
            }

        }catch (Exception ex){
            ex.printStackTrace();

        }finally {
            clearResources(c1,pr,resultSet);
            clearResources(null,pr2,resultSet2);
        }
        return orgId;
    }

    public UserProfileDTO getUser(long userid) throws Exception {

        Connection c1=null;
        PreparedStatement pr=null;
        ResultSet resultSet=null;
        UserProfileDTO userProfileDTO = new UserProfileDTO();
        long employee_id=-1;
        String sq="SELECT id,username,employee_record_id,security_question_1,security_question_ans_1,password from "+TBL_USERS+ " where id=? ";
        try {
            c1=DatabaseManager.getInstance().getConnection();
            pr=c1.prepareStatement(sq);
            pr.setLong(1,userid);
            resultSet=pr.executeQuery();
            if(resultSet.next()){
             employee_id=resultSet.getLong("employee_record_id");
             userProfileDTO.setSecurityQues(resultSet.getString("security_question_1"));
             userProfileDTO.setUsername(resultSet.getString("username"));
             userProfileDTO.setId(resultSet.getLong("id"));
             userProfileDTO.setSecurityQuesAns(resultSet.getString("security_question_ans_1"));
             userProfileDTO.setPassword(resultSet.getString("password"));
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }


        userProfileDTO.setEmployeeDTO(new EmployeeDAO().getEmployee(employee_id));

        PreparedStatement des=null;

        ResultSet desrs = null;

        String desig="Select designation from  "+TBL_EMPLOYEE_OFFICES+ " where employee_record_id=? ";
        try {

            int k=0;

            //logger.debug("executing query:" + sql);


            des=c1.prepareStatement(desig);
            des.setLong(1,employee_id);
            desrs=des.executeQuery();


            if(desrs.next()){
                userProfileDTO.setDesignation(desrs.getString("designation"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {

            clearResources(c1,pr,desrs);
        }


        return userProfileDTO;
    }
    public UserProfileDTO getUser(String userName) throws Exception {

        Connection c1=null;
        PreparedStatement pr=null;
        ResultSet resultSet=null;
        UserProfileDTO userProfileDTO = new UserProfileDTO();
        long employee_id=-1;
        String sq="SELECT id,username, employee_record_id,security_question_1,security_question_ans_1,security_question_2,security_question_ans_2,password from "+TBL_USERS+ " where username=? ";
        try {
            c1=DatabaseManager.getInstance().getConnection();
            pr=c1.prepareStatement(sq);
            pr.setString(1,userName);
            resultSet=pr.executeQuery();
            if(resultSet.next()){
                employee_id=resultSet.getLong("employee_record_id");
                userProfileDTO.setId(resultSet.getLong("id"));
                userProfileDTO.setUsername(resultSet.getString("username"));
                userProfileDTO.setSecurityQues(resultSet.getString("security_question_1"));
                userProfileDTO.setSecurityQuesAns(resultSet.getString("security_question_ans_1"));
                userProfileDTO.setSecurityQues2(resultSet.getString("security_question_2"));
                userProfileDTO.setSecurityQuesAns2(resultSet.getString("security_question_ans_2"));
                userProfileDTO.setPassword(resultSet.getString("password"));
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }


        userProfileDTO.setEmployeeDTO(new EmployeeDAO().getEmployee(employee_id));

        PreparedStatement des=null;

        ResultSet desrs = null;

        String desig="Select designation  ,office_unit_organogram_id from  "+TBL_EMPLOYEE_OFFICES+
                " where employee_record_id=? and is_default_role=1 and " +
                "(last_office_date is null or last_office_date ='0000-00-00') and status=1 ";
        try {

            int k=0;




            des=c1.prepareStatement(desig);
            des.setLong(1,employee_id);
            desrs=des.executeQuery();


            if(desrs.next()){
                userProfileDTO.setDesignation(desrs.getString("designation"));
                userProfileDTO.setDesignationId(desrs.getInt("office_unit_organogram_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {

            clearResources(c1,pr,desrs);
            if(des!=null)des.close();
        }


        return userProfileDTO;
    }

    public ArrayList<String> securityTemplate() throws Exception {

        Connection c1=null;
        ArrayList<String> securityQuestions=new ArrayList<>();
        PreparedStatement pr=null;
        ResultSet resultSet=null;
        long employee_id=-300;
        String sq="SELECT * from "+TBL_SECURITY;
        try {
            c1=DatabaseManager.getInstance().getConnection();
            pr=c1.prepareStatement(sq);
            resultSet=pr.executeQuery();
            while (resultSet.next()) {
                securityQuestions.add(resultSet.getString("question"));

            }

        }catch (Exception ex){
            ex.printStackTrace();
        }  finally {
            clearResources(c1,pr,resultSet);
        }



        return securityQuestions;
    }

    public void setSecurityQues(long userId,String securityQuestions,String ans,String securityQuestions2,String ans2) throws Exception {

        Connection cn=null;

        PreparedStatement ps=null;
        ResultSet rs=null;

        String sq=" Update "+ TBL_USERS+  " set security_question_1=? , security_question_ans_1=? ,security_question_2=? , security_question_ans_2=?   where id=? ";
            try {
            cn=DatabaseManager.getInstance().getConnection();
            ps=cn.prepareStatement(sq);
            ps.setString(1,securityQuestions);
            ps.setString(2,ans);
                ps.setString(3,securityQuestions2);
                ps.setString(4,ans2);
            ps.setLong(5,userId);
            ps.executeUpdate();



        }catch (Exception ex){
            ex.printStackTrace();
        }  finally {
            clearResources(cn,ps,rs);
        }




    }


    public void setImage(int userId,String path,int imageType) throws Exception {

        Connection cn=null;

        PreparedStatement ps=null;
        ResultSet rs=null;

//        long employeeId=getEmployeeId(userId);
        String fieldName="";

        if(imageType==1)
        {
            fieldName="image_file_name";
        }else {
            fieldName="e_sign";
        }

        String sq=" Update "+ TBL_EMPLOYEE_RECORDS+  " SET " +fieldName+ " = ?   where id=? ";
        try {
            cn=DatabaseManager.getInstance().getConnection();
            ps=cn.prepareStatement(sq);
            ps.setString(1,path);
            ps.setLong(2,userId);
            ps.executeUpdate();



        }catch (Exception ex){
            ex.printStackTrace();
        }  finally {
            clearResources(cn,ps,rs);
        }




    }

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

//   start of  code added by forhad
    public void updateUserInfo(long userId, String name,String value) throws Exception{
        //name bangla
        String columnName = "";
        if(name.equals("nameBng")){
            columnName = "name_bng";
        }



        //name english
       else if(name.equals("nameEng")){
            columnName = "name_eng";
        }
        else if(name.equals("spouseNameEng")){
            columnName = "spouse_name_eng";
        }
        else if(name.equals("spouseNameBng")){
            columnName = "spouse_name_bng";
        }



        //father name bangla
       else if(name.equals("fatherNameBng")){
            columnName = "father_name_bng";
        }


        //father name english
       else if(name.equals("fatherNameEng")){
           columnName = "father_name_eng";

        }


        //mother name bangla
      else  if(name.equals("motherNameBng")){
           columnName = "mother_name_bng";

        }


        //mother name english
       else if(name.equals("motherNameEng")){
            columnName = "mother_name_eng";

        }


        //date of birth
       else if(name.equals("dateOfBirth")){
        columnName = "date_of_birth";
        }


        //birth place
      else  if(name.equals("placeOfBirth")){
        columnName = "place_of_birth";
        }


        //nationality
      else  if(name.equals("nationality")){
          columnName = "nationality";
        }


        //nid
      else  if(name.equals("nid")){
          columnName = "nid";

        }


        //current address
      else  if(name.equals("presentAddress")){
          columnName = "present_address";
        }


        //permanent address
      else  if(name.equals("permanentAddress")){
          columnName = "permanent_address";

        }


        //profession
      else  if(name.equals("profession")){
          columnName = "occupation";
        }


        //educational qualification
      else  if(name.equals("qualification")){
          columnName = "";

        }


        //gender
       else if(name.equals("gender")){
          columnName = "gender";

        }


        //religion
       else if(name.equals("religion")){
           columnName = "religion";

        }


        //blood group
      else  if(name.equals("bloodGroup")){
            columnName = "blood_group";
        }


        //marital status
      else  if(name.equals("isMarried")){
          columnName = "marital_status";

        }


        //email
       else if(name.equals("personalEmail")){
          columnName = "personal_email";

        }


        //personal phone No
      else  if(name.equals("personalMobile")){
           columnName = "personal_mobile";

        }


//        Database Related Code
      Connection connection = null;
      PreparedStatement preparedStatement = null;
      ResultSet resultSet = null;
      String sql = "";

      try{

          sql = "UPDATE " + TBL_EMPLOYEE_RECORDS + " SET "  + columnName + " = ? WHERE id = ? " ;
          System.out.println("SQL: " + sql);

          connection = DatabaseManager.getInstance().getConnection();
          preparedStatement = connection.prepareStatement(sql);
          preparedStatement.setString(1,value);
          preparedStatement.setLong(2,userId);

          System.out.println("PreparedStatement : " + preparedStatement.toString());
          preparedStatement.executeUpdate();





      }catch (Exception e ){

      }finally {
          if(preparedStatement!= null) {
              preparedStatement.close();
          }
          if(connection!= null)connection.close();

      }
    }
    public void updateForgetPassword(String username ,String password) throws Exception {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "";

        try{

            sql = "UPDATE " + AllTable.TBL_USERS + " SET   password  = ? WHERE username = ? " ;

            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,password);
            preparedStatement.setString(2,username);

            System.out.println("PreparedStatement : " + preparedStatement.toString());
            preparedStatement.executeUpdate();





        }catch (Exception e ){

        }finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) connection.close();
        }

    }

    public void updatePassword(String username ,String password) throws Exception {
        DBUtility.updateTableData(
                TBL_USERS,
                new String[]{"password"},
                new String[]{PasswordService.getInstance().hashPassword(password)},
                new String[]{"username"},
                new String[] {username+""}
        );
    }

//    end of code added by forhad
}
