package com.revesoft.springboot.web.employee.employeeoffice;

import com.revesoft.springboot.web.employee.records.EmployeeDTO;
import com.revesoft.springboot.web.employee.records.EmployeeService;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.ArrayList;
@RestController
public class EmployeeOfficeController {

    @Autowired
    EmployeeOfficeService employeeOfficeService;

    @RequestMapping(value="officeUnitAndOrganogramWithDesignation",method = RequestMethod.GET)
    public ArrayList<EmployeePOSTDTO> getAllPost(@RequestParam long office_id) throws Exception {
        return employeeOfficeService.allPost(office_id);
    }


    //-----------------------------------------------start Bishwajit Code ------------------------------------------------------------------------------

    @RequestMapping(value="assignEmployee",method = RequestMethod.POST)
    public int assignEmployee(@RequestParam int officeId,
                              @RequestParam long unitId,
                              @RequestParam long officeUnitOrganogramId,
                              @RequestParam String designationName,
                              @RequestParam int designationLevel,
                              @RequestParam int designationSequence,
                              @RequestParam long employeeRecordId,
                              @RequestParam String  inchargeLabel,
                              @RequestParam String joining_date) throws Exception {

        EmployeeOfficesDTO employeeOfficesDTO = new EmployeeOfficesDTO();
        employeeOfficesDTO.setOfficeId(officeId);
        employeeOfficesDTO.setOfficeUnitId(unitId);
        employeeOfficesDTO.setOfficeUnitOrganogramId(officeUnitOrganogramId);
        employeeOfficesDTO.setDesignation(designationName);
        employeeOfficesDTO.setDesignationLevel(designationLevel);
        employeeOfficesDTO.setDesignationSequence(designationSequence);
        employeeOfficesDTO.setEmployeeRecordId(employeeRecordId);
        employeeOfficesDTO.setInchargeLabel(inchargeLabel);
        employeeOfficesDTO.setJoiningDate(joining_date);


        return employeeOfficeService.assignEmployee(employeeOfficesDTO);
    }

    @RequestMapping(value = "releaseEmployee",method = RequestMethod.POST)
    public int releaseEmployee(@RequestParam long id,
                               @RequestParam String release_date)
    {
        return employeeOfficeService.releaseEmployee(id,release_date);
    }


    //-----------------------------------------------end Bishwajit Code ------------------------------------------------------------------------------

}
