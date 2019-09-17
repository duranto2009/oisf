package com.revesoft.springboot.web.util;

import java.sql.*;

import org.apache.log4j.Logger;

import databasemanager.DatabaseManager;

public class DBUtility {
    static Logger logger;

    public static void updateVBSequencer(String tableName) {
        logger = Logger.getLogger(DBUtility.class);

        Connection cn = null;
        PreparedStatement ps = null;

        try {
            cn = DatabaseManager.getInstance().getConnection();

            String query = "update vbSequencer set table_LastModificationTime=? where table_name=?";

            ps = cn.prepareStatement(query);
            ps.setLong(1, System.currentTimeMillis());
            ps.setString(2, tableName);

            ps.execute();
            ps.close();
        } catch (Exception e) {
            logger.fatal("DAO " + e.toString());
        } finally {
            try {
                if (cn != null) {
                    DatabaseManager.getInstance().freeConnection(cn);
                }
            } catch (Exception e) {
                logger.fatal("DAO finally :" + e.toString());
            }
        }
    }


    public static void closeDB(ResultSet resultSet, Statement stmt, Connection connection) {
        logger.debug("DAO finally : trying to close rs, stmt, cn");
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (connection != null) {
            try {
                DatabaseManager.getInstance().freeConnection(connection);
            } catch (Exception e) {
                logger.fatal(e);
            }
        }
    }

    public static void closeDB(ResultSet resultSet, Statement stmt, PreparedStatement pstmt, Connection connection) {
        logger.debug("DAO finally : trying to close rs, stmt, ps, cn");
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (connection != null) {
            try {
                DatabaseManager.getInstance().freeConnection(connection);
            } catch (Exception e) {
                logger.fatal(e);
            }
        }
    }

    public static void closeDB(ResultSet resultSet, PreparedStatement pstmt, Connection connection) {
//        logger.debug("DAO finally : trying to close rs, ps, cn");
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (connection != null) {
            try {
                DatabaseManager.getInstance().freeConnection(connection);
            } catch (Exception e) {
                logger.fatal(e);
            }
        }
    }

    public static void closeDB(PreparedStatement pstmt, Connection connection) {
        logger.debug("DAO finally : trying to close ps, cn");
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                logger.fatal(e);
            }
        }
        if (connection != null) {
            try {
                DatabaseManager.getInstance().freeConnection(connection);
            } catch (Exception e) {
                logger.fatal(e);
            }
        }
    }


    public static int dbFieldCount(String tableName, String[] conditions, String[] conditionsValue) throws Exception {
        int count = 0;
        //codes goes here...
        System.out.println("----> start: DBUtil.java - fieldCount() method called <----");
        logger.debug("FM: ---> start: DBUtil.java - fieldCount() method called <---");

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        cn = DatabaseManager.getInstance().getConnection();

        String sql;
        if (conditions.length < 1) {
            sql = "select * from " + tableName;
            ps = cn.prepareStatement(sql);

            //ps.setInt(1, 0);
        } else {
            String where = " where " + conditions[0] + "= ? ";
            for (int i = 1; i < conditions.length; i++) {
                where += "and " + conditions[i] + "= ? ";
            }

            sql = "SELECT * from " + tableName + where;
            ps = cn.prepareStatement(sql);
            System.out.println("Sql: " + sql);
            for (int i = 0; i < conditions.length; i++) {
//                System.out.println("conditionsvalue: " + conditionsValue[i] + "  where: " + conditions[i]);
                ps.setString(i + 1, conditionsValue[i]);
            }

        }
//        System.out.println(" prepared statement : " + ps.toString());
        rs = ps.executeQuery();
        int c = 0;
        while (rs.next()) {
            c++;
        }
        closeDB(rs, ps, cn);
//        System.out.println("COUNT : " + c);
//        System.out.println("----> e: DBUtil.java - fieldCount() method called <----");
//        logger.debug("FM: ---> e: DBUtil.java - fieldCount() method called <---");
        return c;
    }

    public static void addTableData() {
    }

    public static void updateTableData(
            String tableName,
            String columnName[],
            String columnValue[],
            String[] condition,
            String[] conditionValue
    ) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "update " + tableName + " set " + columnName[0] + " = ?";// + columnValue[0];
        for (int i = 1; i < columnName.length; i++) {
            sql+= ", " + columnName[i] + " = ?";// + columnValue[i];
        }
        String where = " where " + condition[0] + " = ?";// + conditionValue[0];
        for (int i = 1;i<condition.length; i++) {
            where += " and " + condition[i] + " = ?" ;//+ conditionValue[i];
        }
        try {
            System.out.println("sql :" + " " + sql + where);
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql + where);
            int i = 1;
            for (String clValue:
                 columnValue) {
                preparedStatement.setString(i++,clValue);
            }
            for(String cdValue: conditionValue){
                preparedStatement.setString(i++,cdValue);
            }
            preparedStatement.executeUpdate();
        } catch (Exception e) {

        } finally{
            closeDB(resultSet,preparedStatement,connection);
        }
    }

    public static void deleteTableData(String tableName, int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update " + tableName + " set status = ? where id = ?";
        int i = 1;
        try {
            connection = DatabaseManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(i++, 0);
            preparedStatement.setInt(i++, id);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB(preparedStatement, connection);
        }
    }

//    public static void main(String[] args) throws Exception {
//        String[] columnName = {"id","status"};
//        String[] columnValue = {"1","0"};
//        String[] conditions = {"approval", "usDepartment"};
//        String[] conditionsValue = {"0", "EEE"};
//
////        String[] conditions ={};
////        String[] conditionsValue={};
//
////        System.out.println("Count: " + dbFieldCount("vbmember", conditions, conditionsValue));
//        System.out.println("=================================================================");
//        updateTableData("user",columnName,columnValue,conditions,conditionsValue);
//        System.out.println("=================================================================");
//    }
}
