package com.revesoft.springboot.web.employee.batch;

import com.revesoft.springboot.web.model.SQLStatementCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class EmployeeBatchService {

    @Autowired
    EmployeeBatchDAO employeeBatchDAO;


    public int getSize(String employee_batches) {
        int size = 0;
        try {
            size = new SQLStatementCreator().tableDatacount("employee_batches");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return size; 
        
    }


    public ArrayList<EmployeeBatchDTO> getEmpBatchByPage(int page, int pageSize) {
        ArrayList<EmployeeBatchDTO> data = new ArrayList<>();
        try {
            data = employeeBatchDAO.getEmployeeBatchByPage(page,pageSize);
        }catch (Exception e){
            e.printStackTrace();

        }
        return data;
    }

    public void addEmployeeBatch(EmployeeBatchDTO employeeBatchDTO) throws Exception {
        try {
            employeeBatchDAO.addEmployeeBatch(employeeBatchDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateEmployeeBatch(EmployeeBatchDTO employeeBatchDTO) throws Exception{
        try {
            employeeBatchDAO.updateEmployeeBatch(employeeBatchDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteEmployeeBatch(int id) {
        try {
            employeeBatchDAO.deleteEmployeeBatch(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
