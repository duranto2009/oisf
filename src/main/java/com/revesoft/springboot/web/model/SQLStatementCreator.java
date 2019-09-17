package com.revesoft.springboot.web.model;

import databasemanager.DatabaseManager;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.springframework.stereotype.Service;

import javax.json.Json;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

/**
 * Created by reve on 10/30/2017.
 */
public class SQLStatementCreator {
    public PreparedStatement ps = null;
    String[]typePattern ;
    int[] interger;
    byte[] bytes;
    String[] strings ;
    Timestamp[] timestamps ;

    int ty,st,in,by,ti;

    public SQLStatementCreator() {
        typePattern = new String[100] ;
        interger = new int[100];
        bytes = new byte[100];
        strings = new String[100] ;
        timestamps = new Timestamp[100] ;
        ty =0;
        st =0;
        in =0;
        by =0;
        ti = 0;
    }

    String applyCondition(String sql, JSONObject data){
        JSONObject condition = (JSONObject)data.get("where");
        if(condition.size() != 0) {
            sql += " WHERE ";
            Set<String> wherefield = condition.keySet();
            for (String key : wherefield) {
                sql += key + "=? AND";
            }
            sql = sql.substring(0, sql.length() - 4);
        }
            return sql;
    }
    String applyAdvanceCondition(String sql,JSONObject data){
        JSONObject condition = (JSONObject)data.get("where");
        JSONObject or = (JSONObject)condition.get("or");
        JSONObject and = (JSONObject)condition.get("and");
        if(or.size()==0  && and.size() ==0)return  sql;
        if(condition.size()!=0) {
            sql += " WHERE ";
            JSONObject orField = (JSONObject)condition.get("or");
            if(orField.size()!=0) {
                Set<String> orFieldKey = orField.keySet();
                for (String key : orFieldKey) {
                    JSONObject orjson = (JSONObject) orField.get(key);
                    if (orjson.size() != 0) {
                        Integer check = (Integer) orjson.get("what");
                        if (check == 0){
                            JSONObject js = (JSONObject) orjson.get("orclause");
                            Set<String> orFieldActualKey = js.keySet();
                            sql += " ( ";
                            for (String akey : orFieldActualKey) {
                                sql += akey + " LIKE ? OR ";
                            }
                            sql = sql.substring(0, sql.length() - 3);
                            sql += ") AND";
                        }
                        else{
                            JSONObject js = (JSONObject) orjson.get("orclause");
                            Set<String> orFieldActualKey = js.keySet();
                            sql += " ( ";
                            for (String akey : orFieldActualKey) {
                                sql += akey + " = ? OR ";
                            }
                            sql = sql.substring(0, sql.length() - 3);
                            sql += ") AND";
                        }
                    }

                }

            }
            JSONObject andField =(JSONObject)condition.get("and");
            if(andField.size()!=0) {

                Set<String> andFieldKey = andField.keySet();
                for (String key : andFieldKey) {
                    JSONObject js = (JSONObject)andField.get(key);
                    Integer check = (Integer) js.get("what");
                    if(check == 1) sql += " " + key + "=? AND";
                    else sql += " " + key + " LIKE ? AND";
                }
                sql = sql.substring(0, sql.length() - 4);
            }
            else{
                sql = sql.substring(0, sql.length() - 3);
            }
        }
        return sql;
    }

    String applyPagination(String sql,JSONObject data) {
        JSONObject page = (JSONObject)data.get("page");
        if(page.size()!=0) sql += " limit ?,?";
        typePattern[ty++]="i";
        typePattern[ty++]="i";
        Set<String> pageKey = page.keySet();
        for (String key : pageKey) {
            interger[in++] = (Integer) page.get(key);
        }
        return sql;
    }
    PreparedStatement completeAdvanceStatement(Connection con,PreparedStatement ps, String sql, JSONObject data ,String operationType) {
        try{
             ps = con.prepareStatement(sql);
            int k=0;
            if(!operationType.toUpperCase().equals("DELETE")) {
                Set<String> keys = data.keySet();

                for (String key : keys) {
                    if (!key.equals("where")&&!key.equals("page")) {

                        String type = data.get(key).getClass().getName();
                        if (type.contains("Integer")) {
                            Integer value = (Integer) data.get(key);
                            if (value != -99) ps.setInt(++k, value);
                        } else if (type.contains("String")) {
                            String value = (String) data.get(key);
                            if (!value.isEmpty()) ps.setString(++k, value);
                        } else if (type.contains("Timestamp")) {
                            Timestamp value = (Timestamp) data.get(key);
                            if (value != null) ps.setTimestamp(++k, value);
                        }
                        else if (type.contains("Byte")) {
                            Byte value = (Byte) data.get(key);
                            if (value != null) ps.setByte(++k, value);
                        }
                        else{
                            ps.setString(++k, "");
                        }
                    }
                }
            }
            if(!operationType.toUpperCase().equals("INSERT")) {
                JSONObject condition = (JSONObject) data.get("where");
                if(condition.size() != 0) {
                    JSONObject orField = (JSONObject)condition.get("or");
                    if(orField.size() != 0) {
                        Set<String> orFieldKey = orField.keySet();
                        for (String key : orFieldKey) {
                            JSONObject orjson = (JSONObject) orField.get(key);
                            if(orjson .size() != 0) {
                                JSONObject js = (JSONObject) orjson.get("orclause");
                                Set<String> orFieldActualKey = js.keySet();
                                for (String akey : orFieldActualKey) {
                                    String type = js.get(akey).getClass().getName();
                                    if (type.contains("Integer")) {
                                        Integer value = (Integer)  js.get(akey);
                                        if (value != -99) ps.setInt(++k, value);
                                    } else if (type.contains("String")) {
                                        String value = (String)  js.get(akey);
                                        if (!value.isEmpty()) ps.setString(++k, value);
                                    } else if (type.contains("Timestamp")) {
                                        Timestamp value = (Timestamp) js.get(akey);
                                        if (value != null) ps.setTimestamp(++k, value);
                                    }
                                    else if (type.contains("Byte")) {
                                        Byte value = (Byte) js.get(akey);
                                        if (value != null) ps.setByte(++k, value);
                                    }
                                    else{
                                        ps.setString(++k, "");
                                    }

                                }
                            }
                        }
                    }
                    JSONObject andField =(JSONObject)condition.get("and");
                    if(andField.size() != 0) {
                        Set<String> andFieldKey = andField.keySet();
                        for (String key : andFieldKey) {
                            JSONObject js = (JSONObject) andField.get(key);
                            String type = js.get("andclause").getClass().getName();
                            if (type.contains("Integer")) {
                                Integer value = (Integer) js.get("andclause");
                                if (value != -99) ps.setInt(++k, value);
                            } else if (type.contains("String")) {
                                String value = (String)  js.get("andclause");
                                if (!value.isEmpty()) ps.setString(++k, value);
                            } else if (type.contains("Timestamp")) {
                                Timestamp value = (Timestamp)  js.get("andclause");
                                if (value!=null) ps.setTimestamp(++k, value);
                            } else if (type.contains("Byte")) {
                                Byte value = (Byte)  js.get("andclause");
                                if (value!=null) ps.setByte(++k, value);
                            }else{
                                ps.setString(++k, "");
                            }

                        }
                    }
                }
            }
            JSONObject page = (JSONObject)data.get("page");
            if(page!=null&&page.size() != 0 && operationType.equals("PAGEALLOWED")) {
                Set<String> pageKey = page.keySet();
                for (String key : pageKey) {
                    String type = page.get(key).getClass().getName();
                    if (type.contains("Integer")) {
                        Integer value = (Integer) page.get(key);
                        if (value != -99) ps.setInt(++k, value);
                    } else if (type.contains("String")) {
                        String value = (String) page.get(key);
                        if (!value.isEmpty()) ps.setString(++k, value);
                    }else{
                        ps.setString(++k, "");
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error:problem SQLStatementCreator->create in select *");
        }
        return ps;
    }

    PreparedStatement completeStatement(Connection con,PreparedStatement ps, String sql, JSONObject data ,String operationType) {
        try{

            ps = con.prepareStatement(sql);
            int k=0;
            if(!operationType.toUpperCase().equals("DELETE")) {
                Set<String> keys = data.keySet();

                for (String key : keys) {
                    if (!key.equals("where")) {
                        String type = data.get(key).getClass().getName();
                        if (type.contains("Integer")) {
                            Integer value = (Integer) data.get(key);
                            if (value != -99) ps.setInt(++k, value);
                        } else if (type.contains("String")) {
                            String value = (String) data.get(key);
                            if (!value.isEmpty()) ps.setString(++k, value);
                        } else if (type.contains("Timestamp")) {
                            Timestamp value = (Timestamp) data.get(key);
                            if (value != null) ps.setTimestamp(++k, value);
                        }else{
                            ps.setString(++k, "");
                        }
                    }
                }
            }
            if(!operationType.toUpperCase().equals("INSERT")) {
                JSONObject condition = (JSONObject) data.get("where");
                if (condition != null) {
                    Set<String> wherefield = condition.keySet();
                    for (String key : wherefield) {
                        String type = condition.get(key).getClass().getName();
                        if (type.contains("Integer")) {
                            Integer value = (Integer) condition.get(key);
                            if (value != -99) ps.setInt(++k, value);
                        } else if (type.contains("String")) {
                            String value = (String) condition.get(key);
                            if (!value.isEmpty()) ps.setString(++k, value);
                        }else{
                            ps.setString(++k, "");
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error:problem SQLStatementCreator->create in select *");
        }
        return ps;
    }
    public PreparedStatement create(Connection con,String operationType, String tableName, JSONObject data) {
        String sql = null;
       // PreparedStatement ps = null;
        if(operationType.toUpperCase().equals("SELECT")){
            if(data.get("all")!=null){
                sql="SELECT * FROM "+tableName;
                sql=applyCondition(sql,data);
                ps = completeStatement(con,ps,sql,data,operationType);
                System.out.println(ps);

            }
            else{

                sql="SELECT ";
                Set<String> keys = data.keySet();
                for(String key : keys){
                    if(!key.equals("where"))sql += key+", ";
                }
                sql =sql.substring(0, sql.length() - 2);
                sql += " FROM "+tableName;

                sql=applyCondition(sql,data);
                ps = completeStatement(con,ps,sql,data,operationType);
                System.out.println(ps);



            }
        }
        else if(operationType.toUpperCase().equals("INSERT")){
                JSONObject condition = (JSONObject) data.get("where");
                if(condition != null) try {
                    throw new Exception("error:where is not permitted in insert operation");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                else {
                    sql = "INSERT INTO " + tableName + " ( ";
                    Set<String> keys = data.keySet();
                    for (String key : keys) {
                        sql += key + ", ";
                    }
                    sql = sql.substring(0, sql.length() - 2);
                    sql += " ) VALUES ( ";
                    for (String key : keys) {
                        sql += "?, ";
                    }
                    sql = sql.substring(0, sql.length() - 2);
                    sql += " )";
                    ps = completeStatement(con, ps, sql, data,operationType);
                    System.out.println(ps);
                }
        }
        else if(operationType.toUpperCase().equals("UPDATE")){

            if(data.get("created_by") != null || data.get("created") != null) try {
                throw new Exception("error:created_by or creared is not permitted in update operation");
            } catch (Exception e) {
                e.printStackTrace();
            }
            else {
                sql = "UPDATE " + tableName + " SET ";
                Set<String> keys = data.keySet();
                for (String key : keys) {
                    if (!key.equals("where")) sql += key + "= ?, ";
                }
                sql = sql.substring(0, sql.length() - 2);
                sql = applyCondition(sql, data);
                ps = completeStatement(con, ps, sql, data,operationType);
                System.out.println(ps);
            }
        }
        else if(operationType.toUpperCase().equals("DELETE")){
            sql = "DELETE FROM " + tableName ;
            sql = applyCondition(sql, data);
            ps = completeStatement(con, ps, sql, data,operationType);
        }
        System.out.println(ps);
        return ps;
    }

    public ResultSet select(Connection con, String tableName, SQLJsonData sqlData )throws Exception{
        sqlData.autoConfig();
        JSONObject data = sqlData.getData();
        String sql;
        ResultSet resultSet = null;
        String operationType = "PAGENOTALLOWED";

        if(data.get("all")!=null ){
            sql="SELECT * FROM "+tableName;
            sql = applyAdvanceCondition(sql,data);
            JSONObject page = (JSONObject)data.get("page");

            if(page!=null && page.size()!=0) {
                operationType = "PAGEALLOWED";

                sql = applyPagination(sql, data);
            }
            ps = completeAdvanceStatement(con,ps,sql,data,operationType);
            System.out.println(ps);
            try {
                resultSet = ps.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else{

            sql="SELECT ";
            Set<String> keys = data.keySet();
            for(String key : keys){
                if(!key.equals("where"))sql += key+", ";
            }
            sql =sql.substring(0, sql.length() - 2);
            sql += " FROM "+tableName;

            sql = applyAdvanceCondition(sql,data);
            JSONObject page = (JSONObject)data.get("page");

            if(page!=null && page.size()!=0) {
                operationType = "PAGEALLOWED";

                sql = applyPagination(sql, data);
            }
            ps = completeAdvanceStatement(con,ps,sql,data,operationType);
            System.out.println(ps);
            try {
                resultSet = ps.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return resultSet;
    }

    public void insert(Connection con, String tableName, SQLJsonData sqlData )throws Exception{
        sqlData.autoConfig();
        JSONObject data = sqlData.getData();
        String sql;

        String operationType = "INSERT";

            sql = "INSERT INTO " + tableName + " ( ";
            Set<String> keys = data.keySet();
            for (String key : keys) {
               if(!key.equals("where")) sql += key + ", ";
            }
            sql = sql.substring(0, sql.length() - 2);
            sql += " ) VALUES ( ";
            for (int i=0; i<keys.size()-1;i++) {
                sql += "?, ";
            }
            sql = sql.substring(0, sql.length() - 2);
            sql += " )";
            ps = completeAdvanceStatement(con, ps, sql, data,operationType);
            System.out.println(ps);
            try {
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }


    }


    public void update(Connection con, String tableName, SQLJsonData sqlData )throws Exception{
        sqlData.autoConfig();
        JSONObject data = sqlData.getData();
        String sql;
        String operationType = "UPDATE";
        if(data.get("created_by") != null || data.get("created") != null) try {
            throw new Exception("error:created_by or creared is not permitted in update operation");
        } catch (Exception e) {
            e.printStackTrace();
        }
        else {
            sql = "UPDATE " + tableName + " SET ";
            Set<String> keys = data.keySet();
            for (String key : keys) {
                if (!key.equals("where")) sql += key + "= ?, ";
            }
            sql = sql.substring(0, sql.length() - 2);
            sql = applyAdvanceCondition(sql, data);
            ps = completeAdvanceStatement(con, ps, sql, data,operationType);
            System.out.println(ps);
            try {
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public void delete(Connection con, String tableName, SQLJsonData sqlData )throws Exception{
        sqlData.autoConfig();
        JSONObject data = sqlData.getData();
        String sql;
        String operationType = "DELETE";
        sql = "DELETE FROM " + tableName ;
        sql = applyAdvanceCondition(sql, data);
        ps = completeAdvanceStatement(con, ps, sql, data,operationType);
        System.out.println(ps);
        try {
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
          //  if(ps != null)ps.close();
        }
    }

    public ResultSet select(Connection con, String tableName, SQLJsonData sqlData,String condition )throws Exception{

        sqlData.autoConfig();
        JSONObject data = sqlData.getData();
        String sql;
        ResultSet resultSet = null;
        String operationType = "PAGENOTALLOWED";

        if(data.get("all")!=null ){
            sql="SELECT * FROM "+tableName;
            sql = addCondition(sql,condition);
           // sql+=" and status=1 ";//added by bony
            JSONObject page = (JSONObject)data.get("page");

            if(page!=null && page.size()!=0) {
                sql = applyPagination(sql, data);
            }
            ps = completeStatement(con,ps,sql);
            System.out.println(ps);
            try {
                resultSet = ps.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else{

            sql="SELECT ";
            Set<String> keys = data.keySet();
            for(String key : keys){
                if(!key.equals("where"))sql += key+", ";
            }
            sql =sql.substring(0, sql.length() - 2);
            sql += " FROM "+tableName;

            sql = addCondition(sql,condition);
            JSONObject page = (JSONObject)data.get("page");

            if(page!=null && page.size()!=0) {
                sql = applyPagination(sql, data);
            }
            ps = completeStatement(con,ps,sql);
            System.out.println(ps);
            try {
                resultSet = ps.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return resultSet;
    }



    public int tableDatacount(String tableName)throws Exception
    {
        int size=0;
        Connection con = null;
        String sql = null;
        ResultSet rs=null;

        try{
            con = DatabaseManager.getInstance().getConnection();
            sql = "select count(id) as size  from "+tableName+" where status = 1";
            ps = con.prepareStatement(sql);
            // ps.setString(1,tableName);


            rs = ps.executeQuery();


            while (rs.next()) {
                size = rs.getInt("size");
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return size;
    }

    public int tempTableDatacount(Connection con, String sql)throws Exception
    {
        int size=0;
        ResultSet rs=null;

        try{
            con = DatabaseManager.getInstance().getConnection();
            ps = con.prepareStatement(sql);
            // ps.setString(1,tableName);


            rs = ps.executeQuery();


            while (rs.next()) {
                size = rs.getInt("size");
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(ps != null)ps.close();
            if(con != null)con.close();
        }
        return size;
    }


    public ResultSet search(Connection con, String tableName, SQLJsonData data)throws Exception{
        data.autoConfig();
        ResultSet resultSet =null;
        String sql = "SELECT * FROM ( SELECT * FROM "+tableName;
        JSONObject tdata = data.getData();
        sql=applyAdvanceCondition(sql,tdata);
        sql +=" ) As s";
        sql=applyPagination(sql,tdata);
        ps =completeAdvanceStatement(con,ps,sql,tdata,"PAGEALLOWED");
        System.out.println(ps);
        try {
            resultSet = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    public ResultSet search(Connection con, String tableName, SQLJsonData data, String condition)throws Exception{
        data.autoConfig();
        ResultSet resultSet =null;
        String sql = "SELECT * FROM ( SELECT * FROM "+tableName;
        JSONObject tdata = data.getData();
        sql=addCondition(sql,condition);
        sql +=" ) As s";
        sql=applyPagination(sql,tdata);
        ps =completeStatement(con,ps,sql);
        System.out.println(ps);
        try {
            resultSet = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    public int searchCount(Connection con, String tableName, SQLJsonData data) throws Exception{
        int size =0;
        data.autoConfig();
        ResultSet resultSet =null;
        String sql = "SELECT count(id) as size FROM ( SELECT * FROM "+tableName;
        JSONObject tdata = data.getData();
        sql=applyAdvanceCondition(sql,tdata);
        sql +=" ) As s";
        ps =completeAdvanceStatement(con,ps,sql,tdata,"PAGENOTALLOWED");
        System.out.println(ps);
        try {
            resultSet = ps.executeQuery();
            while (resultSet.next()) {
                size = resultSet.getInt("size");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return size;
    }
    public int searchCount(Connection con, String tableName, SQLJsonData data, String condition) throws Exception{
        int size =0;
        data.autoConfig();
        ResultSet resultSet =null;
        String sql = "SELECT count(id) as size FROM ( SELECT * FROM "+tableName;
        JSONObject tdata = data.getData();
        sql=addCondition(sql,condition);
        sql +=" ) As s";
        ps =completeStatement(con,ps,sql);
        System.out.println(ps);
        try {
            resultSet = ps.executeQuery();
            while (resultSet.next()) {
                size = resultSet.getInt("size");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return size;
    }

    String[] filter(String[] con){
        ArrayList<String> ss = new ArrayList<>();
        for(int i=0;i<con.length;i++){
            if(!con[i].isEmpty())ss.add(con[i]);
        }
        String[] finalss = new String[ss.size()];
        finalss= ss.toArray(finalss);
        return finalss;
    }

    public String addCondition(String sql,String condition ){
        sql += " "+"where";
        String[] term = condition.split(" ");
        term = filter(term);
        for(int i=0;i<term.length;i++){
            String s = term[i];
            if(s.contains(":")){
                String[] ss = s.split(":");
                typePattern[ty++]=ss[0];
                if(ss[0].equals("i"))interger[in++]=Integer.parseInt(term[i+2]);
                else if(ss[0].equals("b"))bytes[by++]=Byte.parseByte(term[i+2]);
                else if(ss[0].equals("s"))strings[st++]=term[i+2];
                else if(ss[0].equals("t"))timestamps[ti++]=Timestamp.valueOf(term[i+2]);
                sql +=" "+ss[1]+" "+term[i+1]+" ?";
                if(i+3<term.length)sql+=" "+term[i+3];
                i = i+3;
            }
            else if(s.equals("(")||s.equals(")"))sql +=s;
        }
        return sql;
    }
    public PreparedStatement completeStatement(Connection con,PreparedStatement ps, String sql)throws Exception{
        int k=0;
        int a=0,b=0,c=0,d=0;
        ps = con.prepareStatement(sql);
        for(int i=0;i<ty;i++){
            String type = typePattern[i];
            switch(type){
                case "i":
                    ps.setInt(++k,interger[a++]);
                    break;
                case "b":
                    ps.setByte(++k, bytes[b++]);
                    break;
                case "s":
                    ps.setString(++k,strings[c++]);
                    break;
                case "t":
                    ps.setTimestamp(++k,timestamps[d++]);
                    break;
            }
        }


        return ps;
    }

}
