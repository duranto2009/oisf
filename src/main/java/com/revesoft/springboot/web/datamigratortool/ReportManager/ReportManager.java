package com.revesoft.springboot.web.datamigratortool.ReportManager;

import com.revesoft.springboot.web.datamigratortool.ConnectionManager.ConnectionManager;
import com.revesoft.springboot.web.datamigratortool.DatabaseTo.DatabaseToAnalyzer;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ReportManager {

    final private Logger logger = LogManager.getLogger(ReportManager.class);

    public Statement insertIntoReport(Connection con,
                                 Statement statement,
                                 String sourceTableName,
                                 String destinationTableName,
                                 int inserted,
                                 int deleted,
                                 int updated,
                                 int sourceTableRow,
                                 int destinationTableRow){

        String tableName= "reports";
        long ID = ConnectionManager.getnextIdofTo(tableName);
        String insertSql="insert into reports values(" + ID + ",'" + sourceTableName + "','" + destinationTableName + "'," + inserted + "," + deleted + "," + updated + "," + sourceTableRow + "," + destinationTableRow + ",now())";

        try {
            statement.addBatch(insertSql);
        } catch (SQLException e) {
            logger.error("error",e);
            e.printStackTrace();
        }

        return statement;

//        try {
//            statement.addBatch(insertSql);
//            statement.executeBatch();
//            con.commit();
//        } catch (SQLException e) {
//            try {
//                con.rollback();
//            } catch (SQLException e1) {
//                e1.printStackTrace();
//            }
//            e.printStackTrace();
//        }
    }

    public JSONObject[] getReport(String date, String time)
    {
        JSONObject[] dataList = new JSONObject[1000];
        dataList = new DatabaseToAnalyzer().getReport(date,time);

        return dataList;
    }

    public String[]  getTime(String date)
    {
        String[] dataList = new String[100];
        dataList = new DatabaseToAnalyzer().getTime(date);

        return dataList;
    }


}
