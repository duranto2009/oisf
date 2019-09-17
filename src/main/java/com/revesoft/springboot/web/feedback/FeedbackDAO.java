package com.revesoft.springboot.web.feedback;


import com.revesoft.springboot.web.util.AllTable;
import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@Repository
public class FeedbackDAO {

    public ArrayList<FeedbackDTO> getFeedback() throws Exception {
        ArrayList<FeedbackDTO> data = new ArrayList();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM " + AllTable.TBL_PORTAL_FEEDBACK + " WHERE action_taken=0 ";
        try {
            connection = DatabaseManager.getInstance().getConnection();
            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                FeedbackDTO feedbackDTO=new FeedbackDTO();
                feedbackDTO.setFrom(rs.getString("form"));
                feedbackDTO.setSubject(rs.getString("subject"));
                feedbackDTO.setMessage(rs.getString("message"));

                data.add(feedbackDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            clearResources(connection, stmt, rs);
        }
        return data;
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


}
