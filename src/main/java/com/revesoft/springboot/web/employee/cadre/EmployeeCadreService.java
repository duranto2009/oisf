package com.revesoft.springboot.web.employee.cadre;
import com.revesoft.springboot.web.model.SQLStatementCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by Bony on 11/2/2017.
 */
@Service
public class EmployeeCadreService {

    @Autowired
    EmployeeCadreDAO employeeCadreDAO;


    public int getSize(String employee_batches) {
        int size = 0;
        try {
            size = new SQLStatementCreator().tableDatacount("employee_cadres");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return size; 
        
    }


    public ArrayList<EmployeeCadreDTO> getEmpCadreByPage(int page, int pageSize) {
        ArrayList<EmployeeCadreDTO> data = new ArrayList<>();
        try {
            data = employeeCadreDAO.getEmployeeCadreByPage(page,pageSize);
        }catch (Exception e){
            e.printStackTrace();

        }
        return data;
    }

    public void addEmployeeCadre(EmployeeCadreDTO employeeCadreDTO) throws Exception{
        try{
            employeeCadreDAO.addEmployeeCadre(employeeCadreDTO);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void updateEmployeeCadre(EmployeeCadreDTO employeeCadreDTO) throws Exception{
        try {
            employeeCadreDAO.updateEmployeeCadre(employeeCadreDTO);

        } catch (Exception e) {

        }
    }

    public void deleteEmployeeCadre(int id) throws Exception{
        try{
            employeeCadreDAO.deleteEmployeeCadre(id); 
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
