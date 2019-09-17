package com.revesoft.springboot.web.datamigratortool.DataMigrator;

import com.revesoft.springboot.web.datamigratortool.ConnectionManager.ConnectionManager;
import com.revesoft.springboot.web.datamigratortool.ConnectionManager.ResolveManager;
import com.revesoft.springboot.web.datamigratortool.CrudManager.CrudManager;
import com.revesoft.springboot.web.datamigratortool.CrudManager.CrudOperaorWithoutMapper;
import com.revesoft.springboot.web.datamigratortool.DatabaseFrom.DatabaseFromAnalyzer;
import com.revesoft.springboot.web.datamigratortool.DatabaseTo.DatabaseToAnalyzer;
import com.revesoft.springboot.web.datamigratortool.ReportManager.ReportManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

/**
 * Created by reve on 4/19/2018.
 */

@Service
public class DataMigrator {

    final Logger logger = LogManager.getLogger(DataMigrator.class);
    //data completion thread

    @Value("${scheduling.table}")
    String[] tableName;
    @Value("${scheduling.updateallowedcolumn}")
    String correspondingTableColumn;
    @Value("${scheduling.globalrestrictedcolumn}")
    String globalTableColunm;


    //data controller
    public void migrate() {
        try {

            correspondingTableColumn = correspondingTableColumn+",";
            String[] allowedPerTable = correspondingTableColumn.replace(" ","").replace("[","").split("],");
            HashMap<String,String[]> table_contrain = new HashMap<>();
            for (int i=0;i<tableName.length;i++){
                table_contrain.put(tableName[i],allowedPerTable[i].split(","));
            }
            String [] globalConstrain = globalTableColunm.replace("[","").replace("]","").split(",");

            PrintWriter writer = null;
            try {
                writer = new PrintWriter("/opt/tomcat8/webapps/migrationlog/SQLQuerylog"+new Timestamp(System.currentTimeMillis()).toString().replace(" ","_").replace(".","").replace("-","_").replace(":","_")+".txt", "UTF-8");
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            DatabaseFromAnalyzer databaseFromAnalyzer = new DatabaseFromAnalyzer();
            DatabaseToAnalyzer databaseToAnalyzer = new DatabaseToAnalyzer();
            ArrayList<String> sourceDBTableNameList = databaseFromAnalyzer.getTableList();
            ArrayList<String> destinationDBTableNameList = databaseToAnalyzer.getTableList();
            HashMap<String, String> sameSameTableMapper = getSameSameTableMapping(sourceDBTableNameList, destinationDBTableNameList);

            int counter = 0;
            String db = "";

            Connection con = ConnectionManager.connectToDatabaseTo();
            Connection secondaryCon = ConnectionManager.connectToDatabaseTo();
            con.setAutoCommit(false);
            secondaryCon.setAutoCommit(false);

            for (String sourceTableName : sameSameTableMapper.keySet()) {

                String destinationTableName = sameSameTableMapper.get(sourceTableName);


                HashMap<Integer, JSONObject> sourceData = databaseFromAnalyzer.getTableData(sourceTableName);
                HashMap<Integer, JSONObject> destinationData = databaseToAnalyzer.getTableData(destinationTableName);

                HashMap<String, String> sameSameColumnMapping = new ResolveManager().columnResolve(sourceTableName, destinationTableName);


                CrudManager crudManager = new CrudOperaorWithoutMapper();
//            Connection con =null;
                Statement statement = null;


                statement = con.createStatement();

                List<String> list1 = new ArrayList<String>(Arrays.asList((globalConstrain==null)?new String[0]:globalConstrain));
                List<String> list2 = new ArrayList<String>(Arrays.asList((table_contrain.get(sourceTableName)==null)?new String[0]:table_contrain.get(sourceTableName)));

                HashSet<String> set = new HashSet <String>();

                //add the lists in the set.
                set.addAll(list1);
                set.removeAll(list2);

                //convert it back to array.
                String[] tableContrain = set.toArray(new String[0]);

                System.out.print(sourceTableName +"--->");
                writer.print(sourceTableName +"--->");
                for (int i=0;i<tableContrain.length;i++){
                    System.out.print(tableContrain[i]+",");
                    writer.print(tableContrain[i]+",");
                }
                System.out.println("\n");
                writer.print("\n");

                JSONObject result = crudManager.createInsertedUpdatedDataListStatement(con, statement, sourceTableName,tableContrain,writer, destinationTableName, sourceData, destinationData, null, sameSameColumnMapping);
                //JSONObject result1= crudManager.createDeletedDatalistStatement((Statement)result.get("statement"),sourceTableName,destinationTableName,sourceData,destinationData,null);

                int insertQuery = (int) result.get("insert");
                int updateQuery = (int) result.get("update");
                statement = (Statement) result.get("statement");
                db = (String) result.get("db");


//            int deleteQuery = (int) result1.get("delete");
//            statement = (Statement) result1.get("statement");


                //reportManager will work here

//            if(!(insertQuery ==0&&updateQuery==0&&deleteQuery==0))
                statement = new ReportManager().insertIntoReport(con, statement, sourceTableName, destinationTableName, insertQuery, 0, updateQuery, sourceData.size(), destinationData.size() + insertQuery - 0);


                System.out.println("Table Counter:-->" + (++counter));
                writer.println("Table Counter:-->" + counter);
                try {
                    statement.executeBatch();
                    con.commit();
                } catch (SQLException e) {
                    try {
                        con.rollback();
//                    con.close();
                    } catch (SQLException e1) {

                        logger.error("error", e1);
                        e1.printStackTrace();
                    }
                    logger.error("error", e);
                    e.printStackTrace();
                } finally {
                    if (statement != null) statement.close();
//                if(con!=null)con.close();
                }


            }


            Statement vbUpdater = secondaryCon.createStatement();
            Statement sc = secondaryCon.createStatement();

            for (String source : sameSameTableMapper.keySet()) {
                String destination = sameSameTableMapper.get(source);
                String sql = "SELECT id FROM " + db + "." + destination + " ORDER BY id DESC LIMIT 0, 1";
                ResultSet resultSet = sc.executeQuery(sql);
                int maxId = 0;
                while (resultSet.next()) {
                    maxId = resultSet.getInt("id");
                }
                String updateSql = "update " + db + ".vbsequencer set next_id = " + (maxId + 3) + " where table_name = '" + destination + "'";

                System.out.println(updateSql);
                writer.println(updateSql);
                vbUpdater.addBatch(updateSql);
            }

            vbUpdater.executeBatch();
            secondaryCon.commit();

            writer.close();
        }catch (Exception e){
            logger.error("error",e);
            e.printStackTrace();
        }


    }

    public HashMap<String,String> getSameSameTableMapping(ArrayList<String> sourceDBTableNameList, ArrayList<String> destinationDBTableNameList) {
        HashMap<String,String> mapping = new HashMap<>();
        for(int i=0 ;i<sourceDBTableNameList.size();i++){
            String sourceTable = sourceDBTableNameList.get(i);
            for(int j=0;j<destinationDBTableNameList.size();j++){
                String destinationTable = destinationDBTableNameList.get(j);
                if(sourceTable.equals(destinationTable))mapping.put(sourceTable,destinationTable);
            }
        }
        return mapping;
    }




}
