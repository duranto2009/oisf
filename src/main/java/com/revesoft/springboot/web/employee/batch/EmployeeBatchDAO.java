package com.revesoft.springboot.web.employee.batch;

import com.revesoft.springboot.web.util.DBUtility;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@Repository
public class EmployeeBatchDAO {


    private static final String TBL_EMPLOYEE_BATCHES = "employee_batches";

    public ArrayList<EmployeeBatchDTO> getEmployeeBatchByPage(int page, int pageSize) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = null;
        ResultSet resultSet = null;
        ArrayList<EmployeeBatchDTO> data = new ArrayList<>();
        try {
            connection = DatabaseManager.getInstance().getConnection();
            sql = "select * from employee_batches WHERE status = 1 limit " + (page - 1) * pageSize + "," + pageSize;
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                EmployeeBatchDTO employeeBatchDTO = dtoSetter(resultSet);
                data.add(employeeBatchDTO);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;

    }

    private EmployeeBatchDTO dtoSetter(ResultSet resultSet) throws Exception {
        EmployeeBatchDTO employeeBatchDTO = new EmployeeBatchDTO();
        employeeBatchDTO.setId(resultSet.getInt("id"));
        employeeBatchDTO.setBatchNo(resultSet.getString("batch_no"));
        employeeBatchDTO.setBatchYear(resultSet.getString("batch_year"));
        employeeBatchDTO.setCreatedBy(resultSet.getInt("created_by"));
        employeeBatchDTO.setModifiedBy(resultSet.getInt("modified_by"));
        return employeeBatchDTO;

    }

    public void addEmployeeBatch(EmployeeBatchDTO employeeBatchDTO) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into " + TBL_EMPLOYEE_BATCHES + " (id,batch_no,batch_year) values(?,?,?)";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            long ID = DatabaseManager.getInstance().getNextSequenceId(TBL_EMPLOYEE_BATCHES);
            int increment = 1;
            preparedStatement.setLong(increment++, ID);
            preparedStatement.setString(increment++, employeeBatchDTO.getBatchNo());
            preparedStatement.setString(increment++, employeeBatchDTO.getBatchYear());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        }

    }

    public void updateEmployeeBatch(EmployeeBatchDTO employeeBatchDTO) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update " + TBL_EMPLOYEE_BATCHES + " set batch_no = ? , batch_year = ? where id = ? ";
        int i = 1;
        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(i++,employeeBatchDTO.getBatchNo());
            preparedStatement.setString(i++,employeeBatchDTO.getBatchYear());
            preparedStatement.setInt(i++,employeeBatchDTO.getId());
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
    public void deleteEmployeeBatch(int id) throws Exception{
        DBUtility.deleteTableData(TBL_EMPLOYEE_BATCHES,id);
    }



}
