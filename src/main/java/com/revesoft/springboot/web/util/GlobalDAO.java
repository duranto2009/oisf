package com.revesoft.springboot.web.util;

import databasemanager.DatabaseManager;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@Repository

public class GlobalDAO {

    public ArrayList<Integer> checkChildCount(Connection cn, ArrayList<Integer> parentList, String sourceTable,  String sourceColumn) throws Exception {

        //PreparedStatement ps = null;
        ArrayList<Integer> noChild = new ArrayList<>();

        PreparedStatement ps = null;
        PreparedStatement insert = null;

        ResultSet rs = null;

        //String countQ=null;

        try {

            for (Integer parent : parentList) {

                String countQ = " select count(id) as cnt from " + sourceTable + " where " + sourceColumn + " = " + parent;
                ps = cn.prepareStatement(countQ);
                rs = ps.executeQuery();
                int size = 0;
                while (rs.next()) {
                    size = rs.getInt("cnt");


                }
                if (size >= 1) {
                    continue;

                } else {
//                    String sq = " Update " + parentTable + " set status= 0 where id = " + parent;
//                    insert = cn.prepareStatement(sq);
//                    insert.executeUpdate();
                    noChild.add(parent);
                }

            }
        } catch (Exception e) {

            cn.rollback();
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (insert != null) insert.close();
        }
        return noChild;

    }

    public void updateStatus(Connection cn, ArrayList<Integer> parentList, String parentTable) throws Exception {

        //PreparedStatement ps = null;

        PreparedStatement ps = null;
        PreparedStatement insert = null;

        ResultSet rs = null;

        //String countQ=null;
        for (Integer parent : parentList) {
            try {


                String sq = " Update " + parentTable + " set status= 0 where id = " + parent;
                ps = cn.prepareStatement(sq);
                ps.executeUpdate();


            } catch (Exception e) {

                cn.rollback();
                e.printStackTrace();
            } finally {
                if (ps != null) ps.close();
            }
        }


    }
}

