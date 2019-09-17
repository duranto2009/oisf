package com.revesoft.springboot.web.datamigratortool.ConnectionManager;

import databasemanager.DatabaseManager;
import databasemanager.DatabaseManagerSuccessful;
import org.apache.logging.log4j.LogManager;
import org.jdom.JDOMException;

import java.sql.Connection;
import java.sql.SQLException;


/**
 * Created by reve on 4/19/2018.
 */
public class ConnectionManager {



            public static synchronized Connection connectToDatabaseFrom() throws JDOMException, SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {

                return DatabaseManagerSuccessful.getInstance().getConnection();
            }

            public static synchronized int getnextIdofTo(String tableName){
                int id = -1;
                try {
                     Long longid = DatabaseManager.getInstance().getNextSequenceId(tableName);
                     id = longid.intValue();
                } catch (Exception e) {
                    LogManager.getLogger().error("error",e);
                    e.printStackTrace();
                }
                return id;
            }

            public static synchronized Connection connectToDatabaseTo() throws JDOMException, SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
                return DatabaseManager.getInstance().getConnection();
            }
}
