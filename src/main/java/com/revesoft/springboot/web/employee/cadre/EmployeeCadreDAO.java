package com.revesoft.springboot.web.employee.cadre;

import com.revesoft.springboot.web.util.DBUtility;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by Bony on 11/2/2017.
 */
@Repository
public class EmployeeCadreDAO {


    private static final String TBL_EMPLOYEE_CADRES = "employee_cadres";

    public ArrayList<EmployeeCadreDTO> getEmployeeCadreByPage(int page, int pageSize) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = null;
        ResultSet resultSet = null;
        ArrayList<EmployeeCadreDTO> data = new ArrayList<>();
        try{
            connection = DatabaseManager.getInstance().getConnection();
            sql = "select * from employee_cadres where status = 1 limit " + (page - 1) * pageSize +  "," + pageSize;
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                EmployeeCadreDTO employeeCadreDTO = dtoSetter(resultSet);
                data.add(employeeCadreDTO);
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return data;

    }

    private EmployeeCadreDTO dtoSetter(ResultSet resultSet) throws Exception{
        EmployeeCadreDTO employeeCadreDTO = new EmployeeCadreDTO();
        employeeCadreDTO.setId(resultSet.getInt("id"));
        employeeCadreDTO.setCadreNameBng(resultSet.getString("cadre_name_bng"));
        employeeCadreDTO.setCadreNameEng(resultSet.getString("cadre_name_eng"));
        employeeCadreDTO.setCreatedBy(resultSet.getInt("created_by"));
        employeeCadreDTO.setModifiedBy(resultSet.getInt("modified_by"));
        return employeeCadreDTO;

    }

    public void addEmployeeCadre(EmployeeCadreDTO employeeCadreDTO) throws Exception{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into " + TBL_EMPLOYEE_CADRES + " (id,cadre_name_eng,cadre_name_bng) values ( ? , ? ,? )";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            long ID = DatabaseManager.getInstance().getNextSequenceId(TBL_EMPLOYEE_CADRES);
            int i = 1;
            preparedStatement.setLong(i++, ID);
            preparedStatement.setString(i++, employeeCadreDTO.getCadreNameEng());
            preparedStatement.setString(i++, employeeCadreDTO.getCadreNameBng());
            preparedStatement.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();

        }finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

    }

    public void updateEmployeeCadre(EmployeeCadreDTO employeeCadreDTO) throws Exception{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update " + TBL_EMPLOYEE_CADRES + " set cadre_name_bng = ? , cadre_name_eng = ? where id = ? ";
        int i = 1;
        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(i++,employeeCadreDTO.getCadreNameBng());
            preparedStatement.setString(i++,employeeCadreDTO.getCadreNameEng());
            preparedStatement.setInt(i++,employeeCadreDTO.getId());
            preparedStatement.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();

        }finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

    }

    public void deleteEmployeeCadre(int id) throws Exception{
        DBUtility.deleteTableData(TBL_EMPLOYEE_CADRES,id);
    }
}
