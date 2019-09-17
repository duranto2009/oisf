package com.revesoft.springboot.web.menumanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;
@Service
public class PolicyGroupService {
    @Autowired
    PolicyGroupsDAO policyGroupsDAO;

    public ArrayList<PolicyGroupsDTO> getAll() {

        ArrayList<PolicyGroupsDTO> data=new ArrayList<>();
        try {
            data= policyGroupsDAO.getAll();
        }catch (Exception ex)
        {
             ex.printStackTrace();
        }
        return data;
    }
    public ArrayList<Integer> getSelectedGroup(long originOrgId)
    {
        ArrayList<Integer>leaf=new ArrayList<>();
        try {
            leaf=policyGroupsDAO.getSelectedGroup(originOrgId);

        }catch (Exception e){
            e.printStackTrace();
        }
        return leaf;
    }
}
