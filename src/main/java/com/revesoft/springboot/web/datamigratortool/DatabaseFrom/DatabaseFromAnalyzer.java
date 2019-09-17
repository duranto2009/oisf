package com.revesoft.springboot.web.datamigratortool.DatabaseFrom;

import com.revesoft.springboot.web.datamigratortool.ConnectionManager.ConnectionManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jdom.JDOMException;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by reve on 4/19/2018.
 */
public class DatabaseFromAnalyzer {
    final private Logger logger = LogManager.getLogger(DatabaseFromAnalyzer.this);
    //retrive table list
    public  ArrayList<String> getTableList(){
        ArrayList<String> tableList = new ArrayList<>();
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseFrom();
            DatabaseMetaData dbmd = con.getMetaData();
            String[] types = {"TABLE"};
            ResultSet rs = dbmd.getTables(null, null, "%", types);
            while (rs.next()) {
                String table_name = rs.getString("TABLE_NAME");
                tableList.add(table_name);
            }

        } catch (JDOMException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (SQLException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (InstantiationException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            logger.error("error",e);
            e.printStackTrace();
        }finally {
            if(con!=null) try {
                con.close();
            } catch (SQLException e) {
                logger.error("error",e);
                e.printStackTrace();
            }
        }
        return tableList;
    }

    //retrive table column
    public ArrayList<String> getColumnList(String tableName){
        ArrayList<String> columnList = new ArrayList<>();
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseFrom();
            DatabaseMetaData dbmd = con.getMetaData();
            ResultSet resultSet = dbmd.getColumns(null, null,tableName, null);
            while (resultSet.next()) {
                String col_name = resultSet.getString("COLUMN_NAME");
                columnList.add(col_name);
            }

        } catch (JDOMException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (SQLException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (InstantiationException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            logger.error("error",e);
            e.printStackTrace();
        }finally {
            if(con!=null) try {
                con.close();
            } catch (SQLException e) {
                logger.error("error",e);
                e.printStackTrace();
            }
        }
        return columnList;
    }

    //table data
    public HashMap<Integer,JSONObject> getTableData(String tableName){
        HashMap<Integer,JSONObject> dataList = new HashMap<>();
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseFrom();

            String sql = "select * from "+tableName;
            System.out.println(sql);

            Statement statement = con.createStatement();
            ResultSet dataSet = statement.executeQuery(sql);
            ResultSetMetaData resultSetMetaData = dataSet.getMetaData();
            int totalColunm = resultSetMetaData.getColumnCount();

            while(dataSet.next()){

                JSONObject row = new JSONObject();
                int   id = -1;

                for(int i=1;i<=totalColunm;i++){
                    String columnName = resultSetMetaData.getColumnName(i);
                    String columnType = resultSetMetaData.getColumnTypeName(i);
                    if(columnName.equals("id"))id = dataSet.getInt(columnName);
                    if(columnType.contains("LONG")||columnType.contains("INT")||columnType.equals("TINY")){
                        row.put(columnName,dataSet.getInt(columnName));
                    }
                    else if(columnType.equals("CHAR")||columnType.equals("VARCHAR")||columnType.contains("TEXT")){
                        row.put(columnName,dataSet.getString(columnName));
                    }
                    else if(columnType.contains("DATE")||columnType.contains("TIME")){
                        row.put(columnName,dataSet.getTimestamp(columnName));
                    }
                    else if(columnType.equals("FLOAT")||columnType.equals("DOUBLE")){
                        row.put(columnName,dataSet.getDouble(columnName));
                    }
                }
                if(id!=-1)dataList.put(id,row);
            }


        } catch (JDOMException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (SQLException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (InstantiationException e) {
            logger.error("error",e);
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            logger.error("error",e);
            e.printStackTrace();
        }finally {
            if(con!=null) try {
                con.close();
            } catch (SQLException e) {
                logger.error("error",e);
                e.printStackTrace();
            }
        }
        return dataList;
    }



}
