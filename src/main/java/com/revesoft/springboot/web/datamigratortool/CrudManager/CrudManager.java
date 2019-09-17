package com.revesoft.springboot.web.datamigratortool.CrudManager;

import org.jose4j.json.internal.json_simple.JSONObject;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;

/**
 * Created by reve on 4/24/2018.
 */
public interface CrudManager {


    public JSONObject createInsertedUpdatedDataListStatement(Connection con,
                                                             Statement statement,
                                                             String sourceTableName,
                                                             String[] tableContrain,
                                                             PrintWriter writer,
                                                             String destinationTableName,
                                                             HashMap<Integer, JSONObject> sourceData,
                                                             HashMap<Integer, JSONObject> destinationData,
                                                             HashMap<Integer, Integer> SourceId_DestinationId,
                                                             HashMap<String, String> sameSameColumnMapping);

    public JSONObject createDeletedDatalistStatement(Statement statement,
                                                     String sourceTableName,
                                                     String destinationTableName,
                                                     HashMap<Integer, JSONObject> sourceData,
                                                     HashMap<Integer, JSONObject> destinationData,
                                                     HashMap<Integer, Integer> sourceId_DestinationId);

}
