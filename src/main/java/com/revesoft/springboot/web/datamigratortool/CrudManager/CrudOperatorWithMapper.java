package com.revesoft.springboot.web.datamigratortool.CrudManager;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by reve on 4/24/2018.
 */
public class CrudOperatorWithMapper implements CrudManager {


    final private Logger logger  = LogManager.getLogger(CrudOperatorWithMapper.this);

    //incompleted
    @Override
    public JSONObject createInsertedUpdatedDataListStatement(Connection con,
                                                            Statement statement,
                                                            String sourceTableName,
                                                            String[] tableContrain,
                                                             PrintWriter writer,
                                                            String destinationTableName,
                                                            HashMap<Integer,JSONObject> sourceData,
                                                            HashMap<Integer,JSONObject> destinationData,
                                                            HashMap<Integer,Integer> SourceId_DestinationId,
                                                            HashMap<String, String> sameSameColumnMapping) {
        String insertSql="" ;
        //long ID;

        try {
//            con= ConnectionManager.connectToDatabaseTo();
//
//            con.setAutoCommit(false);
//            statement = con.createStatement();

            for(Integer id:sourceData.keySet())
            {
                if(SourceId_DestinationId.get(id) == null)
                {
                    if(sameSameColumnMapping.size()==0)continue;
                    //ID = ConnectionManager.nextId();
                    insertSql="insert into " + destinationTableName;
                    insertSql += " (" ;
                    for(String column:sameSameColumnMapping.keySet() )
                    {
                        insertSql += sameSameColumnMapping.get(column) + ",";
                    }

                    insertSql = insertSql.substring(0,insertSql.length()-1);

                    insertSql += ") VALUES (";
                    JSONObject row = (JSONObject) sourceData.get(id);
                    if(row == null)continue;
                    for(String column:sameSameColumnMapping.keySet() )
                    {
                        if(row.get(column)!=null) {
                            Class type = row.get(column).getClass();
                            if(type == Integer.class) {

                                insertSql += row.get(column) + ",";
                            }
                            else if(type == String.class) {

                                String value = (String)row.get(column);
                                if(value.contains("'"))
                                {
                                    value = value.replace("'","''");
                                    System.out.println(value);

                                }

                                insertSql += "'"+value + "',";

                            }
                            else{
                                insertSql += "'"+row.get(column) + "',";
                            }

                        }else {
                            if(column.equals("modified") || column.equals("created")) insertSql +=  "now(),";
                            else insertSql += row.get(column) + ",";

                        }
                    }
                    insertSql = insertSql.substring(0,insertSql.length()-1);
                    insertSql += ")";

                    //System.out.println(insertSql);
                    //System.out.println();
                    statement.addBatch(insertSql);

//                    String mappingTable= "formid_toid_mapping";
//                    ID = ConnectionManager.getnextIdofTo()
//                    String insertSqlForMapping = "insert into " + mappingTable + " "

                }

            }

            statement.executeBatch();
            con.commit();


        } catch (Exception e) {
            try {
                con.rollback();
            } catch (SQLException e1) {
                logger.error("error",e1);
                e1.printStackTrace();
            }
            logger.error("error",e);
            e.printStackTrace();
        }
        return null;
    }

    //completed
    @Override
    public JSONObject createDeletedDatalistStatement(Statement statement,
                                                    String sourceTableName,
                                                    String destinationTableName,
                                                    HashMap<Integer, JSONObject> sourceData,
                                                    HashMap<Integer, JSONObject> destinationData,
                                                    HashMap<Integer, Integer> sourceId_DestinationId) {
        ArrayList<Integer> deleteIdList = new ArrayList<>();
        for (Integer sourceIdFromMappedTable:sourceId_DestinationId.keySet()){
            JSONObject data = sourceData.get(sourceIdFromMappedTable);
            if(data == null)deleteIdList.add(sourceIdFromMappedTable);
        }
        for(int i=0;i<deleteIdList.size();i++){
            String deleteSqlFromDestinationTable = "delete from "+destinationTableName+" where id = "+sourceId_DestinationId.get(deleteIdList.get(i));
            String deleteSqlFromSourceIdtoDestinationMappingTable = "delete from fromid_toid_mapping where source_id = "+deleteIdList.get(i)+" and destination_table_name = '"+destinationTableName+"'";
            System.out.println(deleteSqlFromDestinationTable);
            System.out.println(deleteSqlFromSourceIdtoDestinationMappingTable);
            try {
                statement.addBatch(deleteSqlFromDestinationTable);
                statement.addBatch(deleteSqlFromSourceIdtoDestinationMappingTable);
            } catch (SQLException e) {
                logger.error("error",e);
                e.printStackTrace();
            }
        }
        return null;
    }



}
