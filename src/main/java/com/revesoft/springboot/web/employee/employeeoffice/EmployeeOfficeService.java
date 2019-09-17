package com.revesoft.springboot.web.employee.employeeoffice;

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
public class EmployeeOfficeService {

    @Autowired
    EmployeeOfficeDAO employeeOfficeDAO;



    //-----------------------------------------------start Bishwajit Code ------------------------------------------------------------------------------

    public ArrayList<EmployeeOfficesDTO> getEmployeeOfficeByEmployeeRecordId(int employee_record_id) throws SQLException {
        ArrayList<EmployeeOfficesDTO> employeeOfficesDTOs = employeeOfficeDAO.getEmployeeOfficeByEmployeeRecordId(employee_record_id);
        return  employeeOfficesDTOs;
    }


    public  ArrayList<EmployeePOSTDTO> allPost(long officeId)throws Exception{
        ArrayList<EmployeePOSTDTO>data=new ArrayList<>();
        try {
            data=employeeOfficeDAO.allPost(officeId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return data;
    }

    public int assignEmployee(EmployeeOfficesDTO employeeOfficesDTO)
    {
        int result =0;
        try {
            result=employeeOfficeDAO.assignEmployee(employeeOfficesDTO);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return  result;
    }

    public int releaseEmployee(long id, String release_date)
    {
        int result =0;
        try {
            result=employeeOfficeDAO.releaseEmployee(id, release_date);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return  result;
    }

    //-----------------------------------------------end Bishwajit Code ------------------------------------------------------------------------------


}

