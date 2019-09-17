package com.revesoft.springboot.web.employee.records;

import com.revesoft.springboot.web.model.SQLStatementCreator;
import com.revesoft.springboot.web.util.userObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Bony on 11/2/2017.
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeDAO employeeDAO;

    public ArrayList<EmployeeDTO> getEmpByPage(int page,int pageSize)
    {
        ArrayList<EmployeeDTO> data=new ArrayList<>();
        try {
            data= employeeDAO.getEmployeeListbyPage(page,pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpOfficeByPage(int page,int pageSize,int officeId)
    {
        ArrayList<EmployeeDTO> data=new ArrayList<>();
        try {
            data= employeeDAO.getEmpOfficeByPage(page,pageSize,officeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpByPage(int page,int pageSize, String searchMsg)
    {
        ArrayList<EmployeeDTO> data=new ArrayList<>();
        try {
            data= employeeDAO.getEmployeeListbyPage(page,pageSize,searchMsg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpOfficeByPage(int page,int pageSize, String searchMsg,int officeId)
    {
        ArrayList<EmployeeDTO> data=new ArrayList<>();
        try {
            data= employeeDAO.getEmpOfficeByPage(page,pageSize,searchMsg,officeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpByPage(int page,int pageSize,String[] searchParam)
    {
        ArrayList<EmployeeDTO> data=new ArrayList<>();
        try {
            data= employeeDAO.getEmployeeListbyPage(page,pageSize,searchParam);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public ArrayList<EmployeeDTO> getEmpOfficeByPage(int page,int pageSize,String[] searchParam,int officeId)
    {
        ArrayList<EmployeeDTO> data=new ArrayList<>();
        try {
            data= employeeDAO.getEmpOfficeByPage(page,pageSize,searchParam,officeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public int getSize(String tableName){
        int size=0;
        try {
            size=new SQLStatementCreator().tableDatacount(tableName);
        }catch (Exception e){
            e.printStackTrace();
        }
        return size;
    }
    public int getCount() {

        return employeeDAO.getCount();
    }


    //-----------------------------------------------start Bishwajit Code ------------------------------------------------------------------------------
    public userObject addEmployee(EmployeeDTO employeeDTO) throws SQLException {
       return  employeeDAO.addEmployee(employeeDTO);
    }

    public void editEmployee(EmployeeDTO employeeDTO) throws SQLException {
        employeeDAO.editEmployee(employeeDTO);
    }

    public void deleteEmployee(String id) throws SQLException {
        employeeDAO.deleteEmployee(id);
    }


    public EmployeeDTO getEmployeeInfoByUsername(String username) throws SQLException {
        EmployeeDTO employeeDTO = employeeDAO.getEmployeeInfoByUsername(username);
       return  employeeDTO;
    }



    //-----------------------------------------------end Bishwajit Code ------------------------------------------------------------------------------
    public int officeId(long employeeId) throws Exception{
       return employeeDAO.officeId(employeeId);
    }

}
