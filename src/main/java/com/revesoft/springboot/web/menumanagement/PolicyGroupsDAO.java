package com.revesoft.springboot.web.menumanagement;

import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
@Repository
public class PolicyGroupsDAO {

    public ArrayList<PolicyGroupsDTO> getAll() throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs=null;

        ArrayList<PolicyGroupsDTO> data = new ArrayList<>();
        String sql = " select * from " + AllTable.TBL_POLICY_GROUPS +
                " where status=1 ";

        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();


            while (rs.next()) {
                PolicyGroupsDTO policyGroupsDTO = new PolicyGroupsDTO();
                policyGroupsDTO.setNameBng(rs.getString("name_bng"));
                policyGroupsDTO.setNameEng(rs.getString("name_eng"));
                policyGroupsDTO.setId(rs.getInt("id"));
                data.add(policyGroupsDTO);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return data;
    }

    public ArrayList<Integer> getSelectedGroup(long originOrgId) throws SQLException {

        Connection cn = null;
        PreparedStatement ps = null;
        ArrayList<Integer> leaf = new ArrayList<>();
        ResultSet rs = null;
        String sql = " select p.id from " +AllTable.TBL_POLICY_GROUPS+
                " p inner join " +AllTable.TBL_POLICY_GROUP_ORGANOGRAM+
                " o on p.id=o.origin_organogram_id  where o.origin_organogram_id=? and p.status=1";


        try {
            cn = DatabaseManager.getInstance().getConnection();
            ps = cn.prepareStatement(sql);
            ps.setLong(1, originOrgId);
            rs = ps.executeQuery();


            while (rs.next()) {
                leaf.add(rs.getInt("id"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        }
        return leaf;
    }


}
