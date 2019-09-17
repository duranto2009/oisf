package com.revesoft.springboot.web.datamigratortool.DatabaseTo;

import com.revesoft.springboot.web.datamigratortool.ConnectionManager.ConnectionManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jdom.JDOMException;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

/**
 * Created by reve on 4/19/2018.
 */
public class DatabaseToAnalyzer {

   final private Logger logger = LogManager.getLogger(DatabaseToAnalyzer.this);
    //retrive table list

    public ArrayList<String> getTableList(){
        ArrayList<String> tableList = new ArrayList<>();
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseTo();
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
            con = ConnectionManager.connectToDatabaseTo();
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

    //table latest id

    public HashMap<Integer,Integer> getFromId_ToIdMapping(String tableName){
        HashMap<Integer,Integer> fromId_toId = new HashMap<>();

        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseTo();
            String sql = "select source_id,destination_id from fromid_toid_mapping  where destination_table_name = '"+tableName+"'";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
               fromId_toId.put(resultSet.getInt("source_id"),resultSet.getInt("destination_id"));
               return fromId_toId;
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
        return fromId_toId;
    }

    public HashMap<Integer,JSONObject> getTableData(String tableName){
        HashMap<Integer,JSONObject> dataList = new HashMap<>();
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseTo();

            String sql = "select * from "+tableName;
            System.out.println(sql);

            Statement statement = con.createStatement();
            ResultSet dataSet = statement.executeQuery(sql);
            ResultSetMetaData resultSetMetaData = dataSet.getMetaData();
            int totalColunm = resultSetMetaData.getColumnCount();

            while(dataSet.next()){

                JSONObject row = new JSONObject();
                int id = -1;

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


    public JSONObject[] getReport(String date, String time){
        JSONObject[] dataList = new JSONObject[1000];
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseTo();

            String sql = "select * from reports where time like '" + date + " " + time + "%' ";
            System.out.println(sql);

            Statement statement = con.createStatement();
            ResultSet dataSet = statement.executeQuery(sql);
            ResultSetMetaData resultSetMetaData = dataSet.getMetaData();
            int totalColunm = resultSetMetaData.getColumnCount();

            int ind=0;
            while(dataSet.next()){

                JSONObject row = new JSONObject();
                int id = -1;

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
                dataList[ind++]= row;
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


    public String[] getTime(String date){
        String[] dataList = new String[100];
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseTo();

            String sql = "select id,time from reports where time like '" + date + "%' ";
            System.out.println(sql);

            Statement statement = con.createStatement();
            ResultSet dataSet = statement.executeQuery(sql);

            int i=0;
            while(dataSet.next()){

                String time = dataSet.getString("time");

                time = time.substring(11,13);
                if(Arrays.asList(dataList).contains(time)) continue;
                else
                {
                    System.out.println(i + "     " + time);
                    dataList[i++] = time;
                }

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


    public void deleteDestinationContent(String tableName){
        Connection con = null;
        try {
            con = ConnectionManager.connectToDatabaseTo();
            Statement statement = con.createStatement();
            String tableNameCheckingSql = "select * from vbsequencer where table_name = '"+tableName+"'";
            System.out.println(tableNameCheckingSql);
            ResultSet resultSet = statement.executeQuery(tableNameCheckingSql);
            boolean updated = false;
            while (resultSet.next()){
                updated = true;
                //update
                String tableIdUpdateSql = "update vbsequencer set next_id = 1, table_LastModificationTime = now() where table_name = '"+tableName+"'";
                System.out.println(tableIdUpdateSql);
                statement.executeUpdate(tableIdUpdateSql);
            }
            if(!updated){
                //insert
                String tableElementSql = "insert into vbsequencer values('"+tableName+"',1,now())";
                System.out.println(tableElementSql);
                statement.executeUpdate(tableElementSql);
            }



            String sql = "delete  from "+tableName;
            System.out.println(sql);

            statement.executeUpdate(sql);


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
    }
}
