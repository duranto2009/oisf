package com.revesoft.springboot.web.datamigratortool.CrudManager;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by reve on 4/24/2018.
 */
public class CrudOperaorWithoutMapper implements CrudManager {

    private String[] constrain;
    final private Logger logger = LogManager.getLogger(CrudOperaorWithoutMapper.this);

    public ArrayList<String> updateListFilterdWithContrain(ArrayList<String> list){
        for(int i=0;i<constrain.length;i++){
            list.remove(constrain[i]);
        }
        return list;
    }

    @Override
    public JSONObject createInsertedUpdatedDataListStatement(Connection con,
                                                            Statement statement,
                                                            String sourceTableName,
                                                            String[] tableContrain,
                                                            PrintWriter writer,
                                                            String destinationTableName,
                                                            HashMap<Integer, JSONObject> sourceData,
                                                            HashMap<Integer, JSONObject> destinationData,
                                                            HashMap<Integer, Integer> SourceId_DestinationId,
                                                            HashMap<String, String> sameSameColumnMapping) {



        constrain = tableContrain;
        JSONObject result = new JSONObject();
        String db = "";
        try {
             db = con.getCatalog();
        } catch (SQLException e) {
            logger.error("error",e);
            e.printStackTrace();
        }


        HashMap<String,String> colunmNotInSourceButInDestination = new HashMap<>();
        HashMap<String,String> columnColunmType = new HashMap<>();

        try {
            Statement columnselection = con.createStatement();
            String sqlType = "SELECT  column_name, data_type \n" +
                    "  FROM information_schema.columns \n" +
                    "  WHERE (table_schema='"+ db+"' and table_name = '"+destinationTableName+"')\n" +
                    "  order by ordinal_position";
            System.out.println(sqlType);
            ResultSet resultSet = columnselection.executeQuery(sqlType);
            while (resultSet.next()){
                String colunmName = resultSet.getString("column_name");
                String type = "";
                if(!sameSameColumnMapping.containsValue(colunmName)){
                    type = resultSet.getString("data_type");
                    colunmNotInSourceButInDestination.put(colunmName,type);
                }
                columnColunmType.put(colunmName,resultSet.getString("data_type"));
            }
        } catch (SQLException e) {
            logger.error("error",e);
            e.printStackTrace();
        }
        System.out.println(colunmNotInSourceButInDestination);
        int totalSourceData = sourceData.size();
        int totalDestinationData = destinationData.size();
        System.out.println("#report--> source data:"+totalSourceData+" _ destination data:"+totalDestinationData);
        writer.println("#report--> source data:"+totalSourceData+" _ destination data:"+totalDestinationData);
        int insertQuery =0,updateQurery=0;
        for(Integer id:sourceData.keySet()){
            JSONObject sourceDataRow = sourceData.get(id);
            JSONObject destinationDataRow = destinationData.get(id);//searching into destination
            String insertSql = "";
            String updateSql = "";

            if(destinationDataRow == null){//if not found then new Data;

                 insertSql += " insert into "+destinationTableName+" ( ";
                //columnset

                for(String columnName:sameSameColumnMapping.keySet()){
                        insertSql +=sameSameColumnMapping.get(columnName)+" , ";
                }
                if(colunmNotInSourceButInDestination.size()>0){
                    for (String desColumn:colunmNotInSourceButInDestination.keySet()){
                        insertSql +=desColumn+" , ";
                    }
                    insertSql = insertSql.substring(0,insertSql.length()-3)+" ) values ( ";
                }
                else{
                    insertSql = insertSql.substring(0,insertSql.length()-3)+" ) values ( ";
                }

                //valueset


                for(String columnName:sameSameColumnMapping.keySet()){

                    Object obj = sourceDataRow.get(columnName);
                    if(obj == null){
//                        String columnType = columnColunmType.get(columnName).toUpperCase();
//                        if(columnType.contains("LONG")||columnType.contains("INT")||columnType.equals("TINY")||columnType.equals("FLOAT")||columnType.equals("DOUBLE")){
//                            insertSql += 0+", ";
//                        }
//                        else if(columnType.equals("CHAR")||columnType.equals("VARCHAR")||columnType.contains("TEXT")){
//                            insertSql += "'"+""+"', ";
//                        }
//                        else if(columnType.contains("DATE")||columnType.contains("TIME")){
//
//                            if(columnName.equals("joining_date")||columnName.equals("last_office_date")) insertSql += "null, ";
//                            else insertSql += "now(), ";//if i want to give now() just replace null with now()
//                        }
                        insertSql += "null, ";
                    }
                    else{
                        insertSql +=((sourceDataRow.get(columnName).getClass() == Integer.class)?(int)sourceDataRow.get(columnName):"'"+sourceDataRow.get(columnName).toString().replace("\\","\\\\").replace("'","\\'")+"'")+" , ";
                    }


                }
                if(colunmNotInSourceButInDestination.size()>0){
                    for (String desColumn:colunmNotInSourceButInDestination.keySet()){
                        String columnType = colunmNotInSourceButInDestination.get(desColumn).toUpperCase();
                        if(columnType.contains("LONG")||columnType.contains("INT")||columnType.equals("TINY")||columnType.equals("FLOAT")||columnType.equals("DOUBLE")){
                            insertSql += 0+", ";
                        }
                        else if(columnType.equals("CHAR")||columnType.equals("VARCHAR")||columnType.contains("TEXT")){
                            insertSql += "'"+""+"', ";
                        }
                        else if(columnType.contains("DATE")||columnType.contains("TIME")){
                            insertSql += "now(), ";
                        }



                    }
                    insertSql = insertSql.substring(0,insertSql.length()-2)+")";
                }
                else{
                    insertSql = insertSql.substring(0,insertSql.length()-2)+")";
                }

                writer.println(insertSql);
                insertQuery++;
             //   System.out.println(insertSql);

                try {
                    statement.addBatch(insertSql);
                } catch (SQLException e) {
                    logger.error("error",e);
                    e.printStackTrace();
                }


            }
            else{//if found check whether any value is modified or not
                ArrayList<String> modifiedColunmName = new ArrayList<>();



                try{
                    for (String columnName:sameSameColumnMapping.keySet()){
                            Object sourceColumnData = sourceDataRow.get(columnName);
//                            if((int)sourceDataRow.get("id")==82000){
//                                System.out.println("stop");
//                            }
                            if(sourceColumnData!=null) {
                                if ( (sourceDataRow.get(columnName).getClass() == Integer.class )) {
                                    Object destinationColumnData = destinationDataRow.get(sameSameColumnMapping.get(columnName));
                                    int value1 = (Integer)sourceColumnData;
                                    if(destinationColumnData == null){
                                        modifiedColunmName.add(columnName);
                                    }
                                    int value2 = (Integer)destinationColumnData;

                                    if ( value1!=value2) modifiedColunmName.add(columnName);
                                }
                                else {
                                    Object destinationColumnData = destinationDataRow.get(sameSameColumnMapping.get(columnName));
                                    if(destinationColumnData == null){
                                        modifiedColunmName.add(columnName);
                                    }
                                    else {
                                        if (!sourceColumnData.toString().replace("\\", "").equals(destinationColumnData.toString().replace("\\", "")))
                                            modifiedColunmName.add(columnName);
                                    }
                                }
                            }else{

                                    Object destinationColumnData = destinationDataRow.get(sameSameColumnMapping.get(columnName));
                                    if(destinationColumnData == null){
                                        continue;
                                    }
                                    modifiedColunmName.add(columnName);

                            }

                    }

                    modifiedColunmName = updateListFilterdWithContrain(modifiedColunmName);
//                    System.out.println(modifiedColunmName);
                    if(modifiedColunmName.size()==0)continue;


                    updateSql +="update "+sourceTableName+" set ";
                    for (int i=0;i<modifiedColunmName.size();i++){
                        String columnName = modifiedColunmName.get(i);
                        Object sourcedata = sourceDataRow.get(columnName);
                        if(columnName.equals("id"))continue;
                        else if(sourcedata == null){
//                            updateSql += sameSameColumnMapping.get(columnName) + " = "+((sourceDataRow.get(columnName)==null)?"null":"'"+sourceDataRow.get(columnName))+"'"+" , ";
                              updateSql += sameSameColumnMapping.get(columnName) + " = null , ";

                        }else {
                            updateSql += sameSameColumnMapping.get(columnName) + " = " + (( (sourceDataRow.get(columnName).getClass() == Integer.class)) ? (int) sourceDataRow.get(columnName) : "'" + sourceDataRow.get(columnName).toString().replace("\\","\\\\").replace("'","\\'") + "'") + " , ";
                        }
                    }
                    updateSql = updateSql.substring(0,updateSql.length()-2);
                    if(destinationDataRow.get("id") != null)updateSql +=" where id = "+destinationDataRow.get(sameSameColumnMapping.get("id"));
                    else continue;

                    statement.addBatch(updateSql);

                    writer.println(updateSql);
                    updateQurery++;
                  //  System.out.println(updateSql);

                }catch (Exception e){
                    logger.error("error",e);
                        e.printStackTrace();
                }

            }
        }


        System.out.println("#report--> insert query:"+insertQuery+" _ upadate query:"+updateQurery);
        writer.println("#report--> insert query:"+insertQuery+" _ upadate query:"+updateQurery);

        result.put("statement",statement);
        result.put("insert",insertQuery);
        result.put("update",updateQurery);
        result.put("db",db);

        return result;
    }

    @Override
    public JSONObject  createDeletedDatalistStatement(Statement statement,
                                                    String sourceTableName,
                                                    String destinationTableName,
                                                    HashMap<Integer, JSONObject> sourceData,
                                                    HashMap<Integer, JSONObject> destinationData,
                                                    HashMap<Integer, Integer> sourceId_DestinationId) {


        JSONObject result = new JSONObject();
        System.out.println("#report--> source data:"+sourceData.size()+" _ destination data:"+destinationData.size());
        //as sourceId is equal to destinationId
        ArrayList<Integer> deleteIdList = new ArrayList<>();
        for (Integer destinationId:destinationData.keySet()){
            JSONObject data = sourceData.get(destinationId);
            if(data == null)deleteIdList.add(destinationId);
        }
        System.out.println("#report--> delete query:"+deleteIdList.size());
        for(int i=0;i<deleteIdList.size();i++){
            String deleteSqlFromDestinationTable = "delete from "+destinationTableName+" where id = "+deleteIdList.get(i);
            System.out.println(deleteSqlFromDestinationTable);
            try {
                statement.addBatch(deleteSqlFromDestinationTable);
            } catch (SQLException e) {
                logger.error("error",e);
                e.printStackTrace();
            }
        }
        result.put("statement",statement);
        result.put("delete",deleteIdList.size());
        return result;
    }
}
